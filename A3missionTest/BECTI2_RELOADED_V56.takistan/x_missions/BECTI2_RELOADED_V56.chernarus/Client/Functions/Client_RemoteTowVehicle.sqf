/*
  Client\Functions\Externals\RemoteContro\RemoteControlFunctions.sqf
  
  
  Modifications of functions already being used by players
  These functions have been modified to replace "player" with "CTI_P_Controlled", so that CTI_P_Controlleds can control
  their AI remotely and use them to perform logistics related tasks.
  Dependencies:
	Mods by duda:
		Advanced Slingloading (slingload not in use, simple a2 zeta cargo implemented now)
		Advanced Towing
		
		changed by OFPS Team for Remote AI using
		adapted by 0=1 to prevent vanilla lift using (added enableRopeAttach switches to prevent using vanilla lift)
		
*/

#define CTI_CL_FNC_EXT_SA_Find_Surface_ASL_Under_Position(_object,_positionAGL,_returnSurfaceASL,_canFloat) \
_objectASL = AGLToASL (_object modelToWorldVisual (getCenterOfMass _object)); \
_surfaceIntersectStartASL = [_positionAGL select 0, _positionAGL select 1, (_objectASL select 2) + 1]; \
_surfaceIntersectEndASL = [_positionAGL select 0, _positionAGL select 1, (_objectASL select 2) - 5]; \
_surfaces = lineIntersectsSurfaces [_surfaceIntersectStartASL, _surfaceIntersectEndASL, _object, objNull, true, 5]; \
_returnSurfaceASL = AGLToASL _positionAGL; \
{ \
	scopeName "surfaceLoop"; \
	if( isNull (_x select 2) ) then { \
		_returnSurfaceASL = _x select 0; \
		breakOut "surfaceLoop"; \
	} else { \
		if!((_x select 2) isKindOf "RopeSegment") then { \
			_objectFileName = str (_x select 2); \
			if((_objectFileName find " t_") == -1 && (_objectFileName find " b_") == -1) then { \
				_returnSurfaceASL = _x select 0; \
				breakOut "surfaceLoop"; \
			}; \
		}; \
	}; \
} forEach _surfaces; \
if(_canFloat && (_returnSurfaceASL select 2) < 0) then { \
	_returnSurfaceASL set [2,0]; \
}; \

#define CTI_CL_FNC_EXT_SA_Find_Surface_ASL_Under_Model(_object,_modelOffset,_returnSurfaceASL,_canFloat) \
CTI_CL_FNC_EXT_SA_Find_Surface_ASL_Under_Position(_object, (_object modelToWorldVisual _modelOffset), _returnSurfaceASL,_canFloat);
			
#define CTI_CL_FNC_EXT_SA_Find_Surface_AGL_Under_Model(_object,_modelOffset,_returnSurfaceAGL,_canFloat) \
CTI_CL_FNC_EXT_SA_Find_Surface_ASL_Under_Model(_object,_modelOffset,_returnSurfaceAGL,_canFloat); \
_returnSurfaceAGL = ASLtoAGL _returnSurfaceAGL;

#define CTI_CL_FNC_EXT_SA_Get_Cargo(_vehicle,_cargo) \
if( count (ropeAttachedObjects _vehicle) == 0 ) then { \
	_cargo = objNull; \
} else { \
	_cargo = ((ropeAttachedObjects _vehicle) select 0) getVariable ["SA_Cargo",objNull]; \
};



CTI_CL_FNC_EXT_SA_Simulate_Towing_Speed = {
	
	params ["_vehicle"];
	
	private ["_runSimulation","_currentCargo","_maxVehicleSpeed","_maxTowedVehicles","_vehicleMass"];
	
	_maxVehicleSpeed = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "maxSpeed");
	_vehicleMass = 1000 max (getMass _vehicle);
	_maxTowedCargo = missionNamespace getVariable ["SA_MAX_TOWED_CARGO",2];
	_runSimulation = true;
	
	private ["_currentVehicle","_totalCargoMass","_totalCargoCount","_findNextCargo","_towRopes","_ropeLength"];
	private ["_ends","_endsDistance","_currentMaxSpeed","_newMaxSpeed"];
	
	while {_runSimulation} do {
	
		// Calculate total mass and count of cargo being towed (only takes into account
		// cargo that's actively being towed (e.g. there's no slack in the rope)
		
		_currentVehicle = _vehicle;
		_totalCargoMass = 0;
		_totalCargoCount = 0;
		_findNextCargo = true;
		while {_findNextCargo} do {
			_findNextCargo = false;
			CTI_CL_FNC_EXT_SA_Get_Cargo(_currentVehicle,_currentCargo);
			if(!isNull _currentCargo) then {
				_towRopes = _currentVehicle getVariable ["SA_Tow_Ropes",[]];
				if(count _towRopes > 0) then {
					_ropeLength = ropeLength (_towRopes select 0);
					_ends = ropeEndPosition (_towRopes select 0);
					_endsDistance = (_ends select 0) distance (_ends select 1);
					if( _endsDistance >= _ropeLength - 2 ) then {
						_totalCargoMass = _totalCargoMass + (1000 max (getMass _currentCargo));
						_totalCargoCount = _totalCargoCount + 1;
						_currentVehicle = _currentCargo;
						_findNextCargo = true;
					};
				};
			};
		};
	
		_newMaxSpeed = _maxVehicleSpeed / (1 max ((_totalCargoMass /  _vehicleMass) * 2));
		_newMaxSpeed = (_maxVehicleSpeed * 0.75) min _newMaxSpeed;
		
		// Prevent vehicle from moving if trying to move more cargo than pre-defined max
		if(_totalCargoCount > _maxTowedCargo) then {
			_newMaxSpeed = 0;
		};
		
		_currentMaxSpeed = _vehicle getVariable ["SA_Max_Tow_Speed",_maxVehicleSpeed];
		
		if(_currentMaxSpeed != _newMaxSpeed) then {
			_vehicle setVariable ["SA_Max_Tow_Speed",_newMaxSpeed];
		};
		
		sleep 0.1;
		
	};
};

CTI_CL_FNC_EXT_SA_Simulate_Towing = {

	params ["_vehicle","_vehicleHitchModelPos","_cargo","_cargoHitchModelPos","_ropeLength"];

	private ["_lastCargoHitchPosition","_lastCargoVectorDir","_cargoLength","_maxDistanceToCargo","_lastMovedCargoPosition","_cargoHitchPoints"];
	private ["_vehicleHitchPosition","_cargoHitchPosition","_newCargoHitchPosition","_cargoVector","_movedCargoVector","_attachedObjects","_currentCargo"];
	private ["_newCargoDir","_lastCargoVectorDir","_newCargoPosition","_doExit","_cargoPosition","_vehiclePosition","_maxVehicleSpeed","_vehicleMass","_cargoMass","_cargoCanFloat"];	
	private ["_cargoCorner1AGL","_cargoCorner1ASL","_cargoCorner2AGL","_cargoCorner2ASL","_cargoCorner3AGL","_cargoCorner3ASL","_cargoCorner4AGL","_cargoCorner4ASL","_surfaceNormal1","_surfaceNormal2","_surfaceNormal"];
	private ["_cargoCenterASL","_surfaceHeight","_surfaceHeight2","_maxSurfaceHeight"];
	
	_maxVehicleSpeed = getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> "maxSpeed");
	_cargoCanFloat = if( getNumber (configFile >> "CfgVehicles" >> typeOf _cargo >> "canFloat") == 1 ) then { true } else { false };
	
	private ["_cargoCenterOfMassAGL","_cargoModelCenterGroundPosition"];
	CTI_CL_FNC_EXT_SA_Find_Surface_AGL_Under_Model(_cargo,getCenterOfMass _cargo,_cargoCenterOfMassAGL,_cargoCanFloat);
	_cargoModelCenterGroundPosition = _cargo worldToModelVisual _cargoCenterOfMassAGL;
	_cargoModelCenterGroundPosition set [0,0];
	_cargoModelCenterGroundPosition set [1,0];
	_cargoModelCenterGroundPosition set [2, (_cargoModelCenterGroundPosition select 2) - 0.05]; // Adjust height so that it doesn't ride directly on ground
	
	// Calculate cargo model corner points
	private ["_cargoCornerPoints"];
	_cargoCornerPoints = [_cargo] call CTI_CL_FNC_EXT_SA_Get_Corner_Points;
	_corner1 = _cargoCornerPoints select 0;
	_corner2 = _cargoCornerPoints select 1;
	_corner3 = _cargoCornerPoints select 2;
	_corner4 = _cargoCornerPoints select 3;
	
	
	// Try to set cargo owner if the towing client doesn't own the cargo
	if(local _vehicle && !local _cargo) then {
		[[_cargo, clientOwner],"CTI_CL_FNC_EXT_SA_Set_Owner"] call SA_RemoteExecServer;
	};
	
	_vehicleHitchModelPos set [2,0];
	_cargoHitchModelPos set [2,0];
	
	_lastCargoHitchPosition = _cargo modelToWorld _cargoHitchModelPos;
	_lastCargoVectorDir = vectorDir _cargo;
	_lastMovedCargoPosition = getPos _cargo;
	
	_cargoHitchPoints = [_cargo] call CTI_CL_FNC_EXT_SA_Get_Hitch_Points;
	_cargoLength = (_cargoHitchPoints select 0) distance (_cargoHitchPoints select 1);
	
	_vehicleMass = 1 max (getMass _vehicle);
	_cargoMass = getMass _cargo;
	if(_cargoMass == 0) then {
		_cargoMass = _vehicleMass;
	};
	
	_maxDistanceToCargo = _ropeLength;

	_doExit = false;
	
	// Start vehicle speed simulation
	[_vehicle] spawn CTI_CL_FNC_EXT_SA_Simulate_Towing_Speed;
	
	while {!_doExit} do {

		_vehicleHitchPosition = _vehicle modelToWorld _vehicleHitchModelPos;
		_vehicleHitchPosition set [2,0];
		_cargoHitchPosition = _lastCargoHitchPosition;
		_cargoHitchPosition set [2,0];
		
		_cargoPosition = getPos _cargo;
		_vehiclePosition = getPos _vehicle;
		
		if(_vehicleHitchPosition distance _cargoHitchPosition > _maxDistanceToCargo) then {
		
			// Calculated simulated towing position + direction
			_newCargoHitchPosition = _vehicleHitchPosition vectorAdd ((_vehicleHitchPosition vectorFromTo _cargoHitchPosition) vectorMultiply _ropeLength);
			_cargoVector = _lastCargoVectorDir vectorMultiply _cargoLength;
			_movedCargoVector = _newCargoHitchPosition vectorDiff _lastCargoHitchPosition;
			_newCargoDir = vectorNormalized (_cargoVector vectorAdd _movedCargoVector);
			//if(_isRearCargoHitch) then {
			//	_newCargoDir = _newCargoDir vectorMultiply -1;
			//};
			_lastCargoVectorDir = _newCargoDir;
			_newCargoPosition = _newCargoHitchPosition vectorAdd (_newCargoDir vectorMultiply -(vectorMagnitude (_cargoHitchModelPos)));
			
			CTI_CL_FNC_EXT_SA_Find_Surface_ASL_Under_Position(_cargo,_newCargoPosition,_newCargoPosition,_cargoCanFloat);
			
			// Calculate surface normal (up) (more realistic than surfaceNormal function)
			CTI_CL_FNC_EXT_SA_Find_Surface_ASL_Under_Model(_cargo,_corner1,_cargoCorner1ASL,_cargoCanFloat);
			CTI_CL_FNC_EXT_SA_Find_Surface_ASL_Under_Model(_cargo,_corner2,_cargoCorner2ASL,_cargoCanFloat);
			CTI_CL_FNC_EXT_SA_Find_Surface_ASL_Under_Model(_cargo,_corner3,_cargoCorner3ASL,_cargoCanFloat);
			CTI_CL_FNC_EXT_SA_Find_Surface_ASL_Under_Model(_cargo,_corner4,_cargoCorner4ASL,_cargoCanFloat);
			_surfaceNormal1 = (_cargoCorner1ASL vectorFromTo _cargoCorner3ASL) vectorCrossProduct (_cargoCorner1ASL vectorFromTo _cargoCorner2ASL);
			_surfaceNormal2 = (_cargoCorner4ASL vectorFromTo _cargoCorner2ASL) vectorCrossProduct (_cargoCorner4ASL vectorFromTo _cargoCorner3ASL);
			_surfaceNormal = _surfaceNormal1 vectorAdd _surfaceNormal2;
			
			if(missionNamespace getVariable ["SA_TOW_DEBUG_ENABLED", false]) then {
				if(isNil "sa_tow_debug_arrow_1") then {
					sa_tow_debug_arrow_1 = "Sign_Arrow_F" createVehicleLocal [0,0,0];
					sa_tow_debug_arrow_2 = "Sign_Arrow_F" createVehicleLocal [0,0,0];
					sa_tow_debug_arrow_3 = "Sign_Arrow_F" createVehicleLocal [0,0,0];
					sa_tow_debug_arrow_4 = "Sign_Arrow_F" createVehicleLocal [0,0,0];
				};
				sa_tow_debug_arrow_1 setPosASL _cargoCorner1ASL;
				sa_tow_debug_arrow_1 setVectorUp _surfaceNormal;
				sa_tow_debug_arrow_2 setPosASL _cargoCorner2ASL;
				sa_tow_debug_arrow_2 setVectorUp _surfaceNormal;
				sa_tow_debug_arrow_3 setPosASL _cargoCorner3ASL;
				sa_tow_debug_arrow_3 setVectorUp _surfaceNormal;
				sa_tow_debug_arrow_4 setPosASL _cargoCorner4ASL;
				sa_tow_debug_arrow_4 setVectorUp _surfaceNormal;
			};
			
			// Calculate adjusted surface height based on surface normal (prevents vehicle from clipping into ground)
			_cargoCenterASL = AGLtoASL (_cargo modelToWorldVisual [0,0,0]);
			_cargoCenterASL set [2,0];
			_surfaceHeight = ((_cargoCorner1ASL vectorAdd ( _cargoCenterASL vectorMultiply -1)) vectorDotProduct _surfaceNormal1) /  ([0,0,1] vectorDotProduct _surfaceNormal1);
			_surfaceHeight2 = ((_cargoCorner1ASL vectorAdd ( _cargoCenterASL vectorMultiply -1)) vectorDotProduct _surfaceNormal2) /  ([0,0,1] vectorDotProduct _surfaceNormal2);
			_maxSurfaceHeight = (_newCargoPosition select 2) max _surfaceHeight max _surfaceHeight2;
			_newCargoPosition set [2, _maxSurfaceHeight ];
 			
			_newCargoPosition = _newCargoPosition vectorAdd ( _cargoModelCenterGroundPosition vectorMultiply -1 );
			
			_cargo setVectorDir _newCargoDir;
			_cargo setVectorUp _surfaceNormal;
			_cargo setPosWorld _newCargoPosition;
			
			_lastCargoHitchPosition = _newCargoHitchPosition;
			_maxDistanceToCargo = _vehicleHitchPosition distance _newCargoHitchPosition;
			_lastMovedCargoPosition = _cargoPosition;

			_massAdjustedMaxSpeed = _vehicle getVariable ["SA_Max_Tow_Speed",_maxVehicleSpeed];		
			if(speed _vehicle > (_massAdjustedMaxSpeed)+0.1) then {
				_vehicle setVelocity ((vectorNormalized (velocity _vehicle)) vectorMultiply (_massAdjustedMaxSpeed/3.6));
			};
			
		} else {

			if(_lastMovedCargoPosition distance _cargoPosition > 2) then {
				_lastCargoHitchPosition = _cargo modelToWorld _cargoHitchModelPos;
				_lastCargoVectorDir = vectorDir _cargo;
			};
			
		};
		
		// If vehicle isn't local to the client, switch client running towing simulation
		if(!local _vehicle) then {
			[_this,"CTI_CL_FNC_EXT_SA_Simulate_Towing",_vehicle] call CTI_CL_FNC_EXT_SA_RemoteExec;
			_doExit = true;
		};
		
		// If the vehicle isn't towing anything, stop the towing simulation
		CTI_CL_FNC_EXT_SA_Get_Cargo(_vehicle,_currentCargo);
		if(isNull _currentCargo) then {
			_doExit = true;
		};
		
		sleep 0.01;
		
	};
};

CTI_CL_FNC_EXT_SA_Get_Corner_Points = {
	params ["_vehicle"];
	private ["_centerOfMass","_bbr","_p1","_p2","_rearCorner","_rearCorner2","_frontCorner","_frontCorner2"];
	private ["_maxWidth","_widthOffset","_maxLength","_lengthOffset","_widthFactor","_lengthFactor"];
	
	// Correct width and length factor for air
	_widthFactor = 0.75;
	_lengthFactor = 0.75;
	if(_vehicle isKindOf "Air") then {
		_widthFactor = 0.3;
	};
	if(_vehicle isKindOf "Helicopter") then {
		_widthFactor = 0.2;
		_lengthFactor = 0.45;
	};
	
	_centerOfMass = getCenterOfMass _vehicle;
	_bbr = boundingBoxReal _vehicle;
	_p1 = _bbr select 0;
	_p2 = _bbr select 1;
	_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
	_widthOffset = ((_maxWidth / 2) - abs ( _centerOfMass select 0 )) * _widthFactor;
	_maxLength = abs ((_p2 select 1) - (_p1 select 1));
	_lengthOffset = ((_maxLength / 2) - abs (_centerOfMass select 1 )) * _lengthFactor;
	_rearCorner = [(_centerOfMass select 0) + _widthOffset, (_centerOfMass select 1) - _lengthOffset, _centerOfMass select 2];
	_rearCorner2 = [(_centerOfMass select 0) - _widthOffset, (_centerOfMass select 1) - _lengthOffset, _centerOfMass select 2];
	_frontCorner = [(_centerOfMass select 0) + _widthOffset, (_centerOfMass select 1) + _lengthOffset, _centerOfMass select 2];
	_frontCorner2 = [(_centerOfMass select 0) - _widthOffset, (_centerOfMass select 1) + _lengthOffset, _centerOfMass select 2];
	
	if(missionNamespace getVariable ["SA_TOW_DEBUG_ENABLED", false]) then {
		if(isNil "sa_tow_debug_arrow_1") then {
			sa_tow_debug_arrow_1 = "Sign_Arrow_F" createVehicleLocal [0,0,0];
			sa_tow_debug_arrow_2 = "Sign_Arrow_F" createVehicleLocal [0,0,0];
			sa_tow_debug_arrow_3 = "Sign_Arrow_F" createVehicleLocal [0,0,0];
			sa_tow_debug_arrow_4 = "Sign_Arrow_F" createVehicleLocal [0,0,0];
		};
		sa_tow_debug_arrow_1 setPosASL  AGLtoASL (_vehicle modelToWorldVisual _rearCorner);
		sa_tow_debug_arrow_2 setPosASL  AGLtoASL (_vehicle modelToWorldVisual _rearCorner2);
		sa_tow_debug_arrow_3 setPosASL  AGLtoASL (_vehicle modelToWorldVisual _frontCorner);
		sa_tow_debug_arrow_4 setPosASL  AGLtoASL (_vehicle modelToWorldVisual _frontCorner2);
	};
			
	[_rearCorner,_rearCorner2,_frontCorner,_frontCorner2];
};

CTI_CL_FNC_EXT_SA_Get_Hitch_Points = {
	params ["_vehicle"];
	private ["_cornerPoints","_rearCorner","_rearCorner2","_frontCorner","_frontCorner2","_rearHitchPoint"];
	private ["_frontHitchPoint","_sideLeftPoint","_sideRightPoint"];
	_cornerPoints = [_vehicle] call CTI_CL_FNC_EXT_SA_Get_Corner_Points;
	_rearCorner = _cornerPoints select 0;
	_rearCorner2 = _cornerPoints select 1;
	_frontCorner = _cornerPoints select 2;
	_frontCorner2 = _cornerPoints select 3;
	_rearHitchPoint = ((_rearCorner vectorDiff _rearCorner2) vectorMultiply 0.5) vectorAdd  _rearCorner2;
	_frontHitchPoint = ((_frontCorner vectorDiff _frontCorner2) vectorMultiply 0.5) vectorAdd  _frontCorner2;
	//_sideLeftPoint = ((_frontCorner vectorDiff _rearCorner) vectorMultiply 0.5) vectorAdd  _frontCorner;
	//_sideRightPoint = ((_frontCorner2 vectorDiff _rearCorner2) vectorMultiply 0.5) vectorAdd  _frontCorner2;
	[_frontHitchPoint,_rearHitchPoint];
};

CTI_CL_FNC_EXT_SA_Attach_Tow_Ropes = {
	params ["_cargo","_CTI_P_Controlled"];
	_vehicle = _CTI_P_Controlled getVariable ["]SA_Tow_Ropes_Vehicle", objNull];
	
	_cargo enableRopeAttach true;
	
	if(!isNull _vehicle) then {
		if(local _vehicle) then {
			private ["_towRopes","_vehicleHitch","_cargoHitch","_objDistance","_ropeLength"];
			_towRopes = _vehicle getVariable ["]SA_Tow_Ropes",[]];
			if(count _towRopes == 1) then {
			
				/*
				private ["_cargoHitchPoints","_distanceToFrontHitch","_distanceToRearHitch","_isRearCargoHitch"];
				_cargoHitchPoints = [_cargo] call CTI_CL_FNC_EXT_SA_Get_Hitch_Points;
				_distanceToFrontHitch = CTI_P_Controlled distance (_cargo modelToWorld (_cargoHitchPoints select 0));
				_distanceToRearHitch = CTI_P_Controlled distance (_cargo modelToWorld (_cargoHitchPoints select 1));
				if( _distanceToFrontHitch < _distanceToRearHitch ) then {
					_cargoHitch = _cargoHitchPoints select 0;
					_isRearCargoHitch = false;
				} else {
					_cargoHitch = _cargoHitchPoints select 1;
					_isRearCargoHitch = true;
				};
				*/
				
				_cargoHitch = ([_cargo] call CTI_CL_FNC_EXT_SA_Get_Hitch_Points) select 0;
				
				_vehicleHitch = ([_vehicle] call CTI_CL_FNC_EXT_SA_Get_Hitch_Points) select 1;
				_ropeLength = (ropeLength (_towRopes select 0));
				_objDistance = ((_vehicle modelToWorld _vehicleHitch) distance (_cargo modelToWorld _cargoHitch));
				if( _objDistance > _ropeLength ) then {
					[["The tow ropes are too short. Move vehicle closer.", false],"CTI_CL_FNC_EXT_SA_Hint",_CTI_P_Controlled] call CTI_CL_FNC_EXT_SA_RemoteExec;
				} else {		
					[_vehicle,_CTI_P_Controlled] call CTI_CL_FNC_EXT_SA_Drop_Tow_Ropes;
					_helper = "Land_Can_V2_F" createVehicle position _cargo;
					_helper attachTo [_cargo, _cargoHitch];
					_helper setVariable ["SA_Cargo",_cargo,true];
					hideObject _helper;
					[[_helper],"CTI_CL_FNC_EXT_SA_Hide_Object_Global"] call SA_RemoteExecServer;
					[_helper, [0,0,0], [0,0,-1]] ropeAttachTo (_towRopes select 0);
					[_vehicle,_vehicleHitch,_cargo,_cargoHitch,_ropeLength] spawn CTI_CL_FNC_EXT_SA_Simulate_Towing;
				};
			};
		} else {
			[_this,"CTI_CL_FNC_EXT_SA_Attach_Tow_Ropes",_vehicle,true] call CTI_CL_FNC_EXT_SA_RemoteExec;
		};
	};
};

CTI_CL_FNC_EXT_SA_Take_Tow_Ropes = {
	params ["_vehicle","_CTI_P_Controlled"];
	if(local _vehicle) then {
		diag_log format ["Take Tow Ropes Called %1", _this];
		private ["_existingTowRopes","_hitchPoint","_rope"];
		_existingTowRopes = _vehicle getVariable ["]SA_Tow_Ropes",[]];
		if(count _existingTowRopes == 0) then {
			_hitchPoint = [_vehicle] call CTI_CL_FNC_EXT_SA_Get_Hitch_Points select 1;
			_rope = ropeCreate [_vehicle, _hitchPoint, 10];
			_vehicle setVariable ["]SA_Tow_Ropes",[_rope],true];
			_this call CTI_CL_FNC_EXT_SA_Pickup_Tow_Ropes;
		};
	} else {
		[_this,"CTI_CL_FNC_EXT_SA_Take_Tow_Ropes",_vehicle,true] call CTI_CL_FNC_EXT_SA_RemoteExec;
	};
};

CTI_CL_FNC_EXT_SA_Pickup_Tow_Ropes = {
	params ["_vehicle","_CTI_P_Controlled"];
	if(local _vehicle) then {
		private ["_attachedObj","_helper"];
		{
			_attachedObj = _x;
			{
				_attachedObj ropeDetach _x;
			} forEach (_vehicle getVariable ["]SA_Tow_Ropes",[]]);
			deleteVehicle _attachedObj;
		} forEach ropeAttachedObjects _vehicle;
		_helper = "Land_Can_V2_F" createVehicle position _CTI_P_Controlled;
		{
			[_helper, [0, 0, 0], [0,0,-1]] ropeAttachTo _x;
			_helper attachTo [_CTI_P_Controlled, [-0.1, 0.1, 0.15], "Pelvis"];
		} forEach (_vehicle getVariable ["]SA_Tow_Ropes",[]]);
		hideObject _helper;
		[[_helper],"CTI_CL_FNC_EXT_SA_Hide_Object_Global"] call SA_RemoteExecServer;
		_CTI_P_Controlled setVariable ["]SA_Tow_Ropes_Vehicle", _vehicle,true];
		_CTI_P_Controlled setVariable ["]SA_Tow_Ropes_Pick_Up_Helper", _helper,true];
	} else {
		[_this,"CTI_CL_FNC_EXT_SA_Pickup_Tow_Ropes",_vehicle,true] call CTI_CL_FNC_EXT_SA_RemoteExec;
	};
};

CTI_CL_FNC_EXT_SA_Drop_Tow_Ropes = {
	params ["_vehicle","_CTI_P_Controlled"];
	if(local _vehicle) then {
		private ["_helper"];
		_helper = (_CTI_P_Controlled getVariable ["]SA_Tow_Ropes_Pick_Up_Helper", objNull]);
		if(!isNull _helper) then {
			{
				_helper ropeDetach _x;
			} forEach (_vehicle getVariable ["]SA_Tow_Ropes",[]]);
			detach _helper;
			deleteVehicle _helper;
		};
		_CTI_P_Controlled setVariable ["]SA_Tow_Ropes_Vehicle", nil,true];
		_CTI_P_Controlled setVariable ["]SA_Tow_Ropes_Pick_Up_Helper", nil,true];
	} else {
		[_this,"CTI_CL_FNC_EXT_SA_Drop_Tow_Ropes",_vehicle,true] call CTI_CL_FNC_EXT_SA_RemoteExec;
	};
};

CTI_CL_FNC_EXT_SA_Put_Away_Tow_Ropes = {
	params ["_vehicle","_CTI_P_Controlled"];
	
	//need disable cargo too for prevent vanilla airlift abuse	
	_catchKinds=["Tank","Car","Ship","Air"];
	_disablelist=[];
	{
	_disablelistT=(position _vehicle nearObjects [_x, 35]);
	_disablelist=_disablelist + _disablelistT;	
	} forEach _catchKinds;	
	{_x enableRopeAttach false;} forEach _disablelist;
	_vehicle enableRopeAttach false;
	
	
	
	
	if(local _vehicle) then {
		private ["_existingTowRopes","_hitchPoint","_rope"];
		_existingTowRopes = _vehicle getVariable ["]SA_Tow_Ropes",[]];
		if(count _existingTowRopes > 0) then {
			_this call CTI_CL_FNC_EXT_SA_Pickup_Tow_Ropes;
			_this call CTI_CL_FNC_EXT_SA_Drop_Tow_Ropes;
			{
				ropeDestroy _x;
			} forEach _existingTowRopes;
			_vehicle setVariable ["]SA_Tow_Ropes",nil,true];
		};
	} else {
		[_this,"CTI_CL_FNC_EXT_SA_Put_Away_Tow_Ropes",_vehicle,true] call CTI_CL_FNC_EXT_SA_RemoteExec;
	};
};

CTI_CL_FNC_EXT_SA_Attach_Tow_Ropes_Action = {
	private ["_vehicle","_cargo","_canBeTowed"];
	_cargo = cursorTarget;
	_vehicle = CTI_P_Controlled getVariable ["]SA_Tow_Ropes_Vehicle", objNull];
	if([_vehicle,_cargo] call CTI_CL_FNC_EXT_SA_Can_Attach_Tow_Ropes) then {
		
		_canBeTowed = true;
		
		if!(missionNamespace getVariable ["SA_TOW_LOCKED_VEHICLES_ENABLED",false]) then {
			if( locked _cargo > 1 ) then {
				["Cannot attach tow ropes to locked vehicle",false] call CTI_CL_FNC_EXT_SA_Hint;
				_canBeTowed = false;
			};
		};
		
		if!(missionNamespace getVariable ["SA_TOW_IN_EXILE_SAFEZONE_ENABLED",false]) then {
			if(!isNil "ExilePlayerInSafezone") then {
				if( ExilePlayerInSafezone ) then {
					["Cannot attach tow ropes in safe zone",false] call CTI_CL_FNC_EXT_SA_Hint;
					_canBeTowed = false;
				};
			};
		};
	
		if(_canBeTowed) then {
			[_cargo,CTI_P_Controlled] call CTI_CL_FNC_EXT_SA_Attach_Tow_Ropes;
		};
		
	};
};

CTI_CL_FNC_EXT_SA_Attach_Tow_Ropes_Action_Check = {
	private ["_vehicle","_cargo"];
	_vehicle = CTI_P_Controlled getVariable ["]SA_Tow_Ropes_Vehicle", objNull];
	_cargo = cursorTarget;
	[_vehicle,_cargo] call CTI_CL_FNC_EXT_SA_Can_Attach_Tow_Ropes;
};

CTI_CL_FNC_EXT_SA_Can_Attach_Tow_Ropes = {
	params ["_vehicle","_cargo"];
	if(!isNull _vehicle && !isNull _cargo) then {
		[_vehicle,_cargo] call CTI_CL_FNC_EXT_SA_Is_Supported_Cargo && vehicle CTI_P_Controlled == CTI_P_Controlled && CTI_P_Controlled distance _cargo < 10 && _vehicle != _cargo;
	} else {
		false;
	};
};

CTI_CL_FNC_EXT_SA_Take_Tow_Ropes_Action = {
	private ["_vehicle","_canTakeTowRopes"];
	_vehicle = cursorTarget;
	
	_vehicle enableRopeAttach true;
	if([_vehicle] call CTI_CL_FNC_EXT_SA_Can_Take_Tow_Ropes) then {
	
		_canTakeTowRopes = true;
		
		if!(missionNamespace getVariable ["SA_TOW_LOCKED_VEHICLES_ENABLED",false]) then {
			if( locked _vehicle > 1 ) then {
				["Cannot take tow ropes from locked vehicle",false] call CTI_CL_FNC_EXT_SA_Hint;
				_canTakeTowRopes = false;
			};
		};
		
		if!(missionNamespace getVariable ["SA_TOW_IN_EXILE_SAFEZONE_ENABLED",false]) then {
			if(!isNil "ExilePlayerInSafezone") then {
				if( ExilePlayerInSafezone ) then {
					["Cannot take tow ropes in safe zone",false] call CTI_CL_FNC_EXT_SA_Hint;
					_canTakeTowRopes = false;
				};
			};
		};
	
		if(_canTakeTowRopes) then {
			[_vehicle,CTI_P_Controlled] call CTI_CL_FNC_EXT_SA_Take_Tow_Ropes;
		};
	
	};
};

CTI_CL_FNC_EXT_SA_Take_Tow_Ropes_Action_Check = {
	[cursorTarget] call CTI_CL_FNC_EXT_SA_Can_Take_Tow_Ropes;
};

CTI_CL_FNC_EXT_SA_Can_Take_Tow_Ropes = {
	params ["_vehicle"];
	if([_vehicle] call CTI_CL_FNC_EXT_SA_Is_Supported_Vehicle) then {
		private ["_existingVehicle","_existingTowRopes"];
		_existingTowRopes = _vehicle getVariable ["]SA_Tow_Ropes",[]];
		_existingVehicle = CTI_P_Controlled getVariable ["]SA_Tow_Ropes_Vehicle", objNull];
		vehicle CTI_P_Controlled == CTI_P_Controlled && CTI_P_Controlled distance _vehicle < 10 && (count _existingTowRopes) == 0 && isNull _existingVehicle;
	} else {
		false;
	};
};

CTI_CL_FNC_EXT_SA_Put_Away_Tow_Ropes_Action = {
	private ["_vehicle","_canPutAwayTowRopes"];
	_vehicle = cursorTarget;
	if([_vehicle] call CTI_CL_FNC_EXT_SA_Can_Put_Away_Tow_Ropes) then {
	
		_canPutAwayTowRopes = true;
		
		if!(missionNamespace getVariable ["SA_TOW_LOCKED_VEHICLES_ENABLED",false]) then {
			if( locked _vehicle > 1 ) then {
				["Cannot put away tow ropes in locked vehicle",false] call CTI_CL_FNC_EXT_SA_Hint;
				_canPutAwayTowRopes = false;
			};
		};
		
		if!(missionNamespace getVariable ["SA_TOW_IN_EXILE_SAFEZONE_ENABLED",false]) then {
			if(!isNil "ExilePlayerInSafezone") then {
				if( ExilePlayerInSafezone ) then {
					["Cannot put away tow ropes in safe zone",false] call CTI_CL_FNC_EXT_SA_Hint;
					_canPutAwayTowRopes = false;
				};
			};
		};
	
		if(_canPutAwayTowRopes) then {
			[_vehicle,CTI_P_Controlled] call CTI_CL_FNC_EXT_SA_Put_Away_Tow_Ropes;
		};
		
	};
};

CTI_CL_FNC_EXT_SA_Put_Away_Tow_Ropes_Action_Check = {
	[cursorTarget] call CTI_CL_FNC_EXT_SA_Can_Put_Away_Tow_Ropes;
};

CTI_CL_FNC_EXT_SA_Can_Put_Away_Tow_Ropes = {
	params ["_vehicle"];
	private ["_existingTowRopes"];
	if([_vehicle] call CTI_CL_FNC_EXT_SA_Is_Supported_Vehicle) then {
		_existingTowRopes = _vehicle getVariable ["]SA_Tow_Ropes",[]];
		vehicle CTI_P_Controlled == CTI_P_Controlled && CTI_P_Controlled distance _vehicle < 10 && (count _existingTowRopes) > 0;
	} else {
		false;
	};
};


CTI_CL_FNC_EXT_SA_Drop_Tow_Ropes_Action = {
	private ["_vehicle"];
	_vehicle = CTI_P_Controlled getVariable ["]SA_Tow_Ropes_Vehicle", objNull];
	if([] call CTI_CL_FNC_EXT_SA_Can_Drop_Tow_Ropes) then {
		[_vehicle, CTI_P_Controlled] call CTI_CL_FNC_EXT_SA_Drop_Tow_Ropes;
	};
};

CTI_CL_FNC_EXT_SA_Drop_Tow_Ropes_Action_Check = {
	[] call CTI_CL_FNC_EXT_SA_Can_Drop_Tow_Ropes;
};

CTI_CL_FNC_EXT_SA_Can_Drop_Tow_Ropes = {
	!isNull (CTI_P_Controlled getVariable ["]SA_Tow_Ropes_Vehicle", objNull]) && vehicle CTI_P_Controlled == CTI_P_Controlled;
};



CTI_CL_FNC_EXT_SA_Pickup_Tow_Ropes_Action = {
	private ["_nearbyTowVehicles","_canPickupTowRopes","_vehicle"];
	_nearbyTowVehicles = missionNamespace getVariable ["CTI_CL_FNC_EXT_SA_Nearby_Tow_Vehicles",[]];
	if([] call CTI_CL_FNC_EXT_SA_Can_Pickup_Tow_Ropes) then {
	
		_vehicle = _nearbyTowVehicles select 0;
		_canPickupTowRopes = true;
		
		if!(missionNamespace getVariable ["SA_TOW_LOCKED_VEHICLES_ENABLED",false]) then {
			if( locked _vehicle > 1 ) then {
				["Cannot pick up tow ropes from locked vehicle",false] call CTI_CL_FNC_EXT_SA_Hint;
				_canPickupTowRopes = false;
			};
		};
		
		if!(missionNamespace getVariable ["SA_TOW_IN_EXILE_SAFEZONE_ENABLED",false]) then {
			if(!isNil "ExilePlayerInSafezone") then {
				if( ExilePlayerInSafezone ) then {
					["Cannot pick up tow ropes in safe zone",false] call CTI_CL_FNC_EXT_SA_Hint;
					_canPickupTowRopes = false;
				};
			};
		};
	
		if(_canPickupTowRopes) then {
			[_nearbyTowVehicles select 0, CTI_P_Controlled] call CTI_CL_FNC_EXT_SA_Pickup_Tow_Ropes;
		};
	
	};
};

CTI_CL_FNC_EXT_SA_Pickup_Tow_Ropes_Action_Check = {
	[] call CTI_CL_FNC_EXT_SA_Can_Pickup_Tow_Ropes;
};

CTI_CL_FNC_EXT_SA_Can_Pickup_Tow_Ropes = {
	isNull (CTI_P_Controlled getVariable ["]SA_Tow_Ropes_Vehicle", objNull]) && count (missionNamespace getVariable ["CTI_CL_FNC_EXT_SA_Nearby_Tow_Vehicles",[]]) > 0 && vehicle CTI_P_Controlled == CTI_P_Controlled;
};

CTI_CL_FNC_EXT_SA_TOW_SUPPORTED_VEHICLES = [
	"Tank", "Car", "Ship"
];

CTI_CL_FNC_EXT_SA_Is_Supported_Vehicle = {
	params ["_vehicle","_isSupported"];
	_isSupported = false;
	if(not isNull _vehicle) then {
		{
			if(_vehicle isKindOf _x) then {
				_isSupported = true;
			};
		} forEach (missionNamespace getVariable ["SA_TOW_SUPPORTED_VEHICLES_OVERRIDE",SA_TOW_SUPPORTED_VEHICLES]);
	};
	_isSupported;
};

CTI_CL_FNC_EXT_SA_TOW_RULES = [
	["Tank","CAN_TOW","Tank"],
	["Tank","CAN_TOW","Car"],
	["Tank","CAN_TOW","Ship"],
	["Tank","CAN_TOW","Air"],
	["Car","CAN_TOW","Tank"],
	["Car","CAN_TOW","Car"],
	["Car","CAN_TOW","Ship"],
	["Car","CAN_TOW","Air"],
	["Ship","CAN_TOW","Ship"]
];

CTI_CL_FNC_EXT_SA_Is_Supported_Cargo = {
	params ["_vehicle","_cargo"];
	private ["_canTow"];
	_canTow = false;
	if(not isNull _vehicle && not isNull _cargo) then {
		{
			if(_vehicle isKindOf (_x select 0)) then {
				if(_cargo isKindOf (_x select 2)) then {
					if( (toUpper (_x select 1)) == "CAN_TOW" ) then {
						_canTow = true;
					} else {
						_canTow = false;
					};
				};
			};
		} forEach (missionNamespace getVariable ["SA_TOW_RULES_OVERRIDE",SA_TOW_RULES]);
	};
	_canTow;
};

CTI_CL_FNC_EXT_SA_Hint = {
    params ["_msg",["_isSuccess",true]];
    if(!isNil "ExileClient_gui_notification_event_addNotification") then {
		if(_isSuccess) then {
			["Success", [_msg]] call ExileClient_gui_notification_event_addNotification; 
		} else {
			["Whoops", [_msg]] call ExileClient_gui_notification_event_addNotification; 
		};
    } else {
        hint _msg;
    };
};

CTI_CL_FNC_EXT_SA_Hide_Object_Global = {
	params ["_obj"];
	if( _obj isKindOf "Land_Can_V2_F" ) then {
		hideObjectGlobal _obj;
	};
};

CTI_CL_FNC_EXT_SA_Set_Owner = {
	params ["_obj","_client"];
	_obj setOwner _client;
};

CTI_CL_FNC_EXT_SA_Add_Player_Tow_Actions = {
	
	CTI_P_Controlled addAction ["Deploy Tow Ropes", { 
		[] call CTI_CL_FNC_EXT_SA_Take_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call CTI_CL_FNC_EXT_SA_Take_Tow_Ropes_Action_Check"];

	CTI_P_Controlled addAction ["Put Away Tow Ropes", { 
		[] call CTI_CL_FNC_EXT_SA_Put_Away_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call CTI_CL_FNC_EXT_SA_Put_Away_Tow_Ropes_Action_Check"];

	CTI_P_Controlled addAction ["Attach To Tow Ropes", { 
		[] call CTI_CL_FNC_EXT_SA_Attach_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call CTI_CL_FNC_EXT_SA_Attach_Tow_Ropes_Action_Check"];

	CTI_P_Controlled addAction ["Drop Tow Ropes", { 
		[] call CTI_CL_FNC_EXT_SA_Drop_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call CTI_CL_FNC_EXT_SA_Drop_Tow_Ropes_Action_Check"];

	CTI_P_Controlled addAction ["Pickup Tow Ropes", { 
		[] call CTI_CL_FNC_EXT_SA_Pickup_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call CTI_CL_FNC_EXT_SA_Pickup_Tow_Ropes_Action_Check"];

	/*CTI_P_Controlled addEventHandler ["Respawn", {
		CTI_P_Controlled setVariable ["SA_Tow_Actions_Loaded",false];
	}];*/
	
};

CTI_CL_FNC_EXT_SA_Find_Nearby_Tow_Vehicles = {
	private ["_nearVehicles","_nearVehiclesWithTowRopes","_vehicle","_ends","_end1","_end2"];
	_nearVehicles = [];
	{
		_nearVehicles append  (position CTI_P_Controlled nearObjects [_x, 30]);
	} forEach (missionNamespace getVariable ["SA_TOW_SUPPORTED_VEHICLES_OVERRIDE",SA_TOW_SUPPORTED_VEHICLES]);
	_nearVehiclesWithTowRopes = [];
	{
		_vehicle = _x;
		{
			_ends = ropeEndPosition _x;
			if(count _ends == 2) then {
				_end1 = _ends select 0;
				_end2 = _ends select 1;
				if(((position CTI_P_Controlled) distance _end1) < 5 || ((position CTI_P_Controlled) distance _end2) < 5 ) then {
					_nearVehiclesWithTowRopes pushBack _vehicle;
				}
			};
		} forEach (_vehicle getVariable ["]SA_Tow_Ropes",[]]);
	} forEach _nearVehicles;
	_nearVehiclesWithTowRopes;
};



/*if(!isDedicated) then {
	[] spawn {
		while {true} do {
			if(!isNull CTI_P_Controlled && isPlayer CTI_P_Controlled) then {
				if!( CTI_P_Controlled getVariable ["SA_Tow_Actions_Loaded",false] ) then {
					[] call CTI_CL_FNC_EXT_SA_Add_Player_Tow_Actions;
					CTI_P_Controlled setVariable ["SA_Tow_Actions_Loaded",true];
				};
			};
			missionNamespace setVariable ["CTI_CL_FNC_EXT_SA_Nearby_Tow_Vehicles", (call CTI_CL_FNC_EXT_SA_Find_Nearby_Tow_Vehicles)];
			sleep 2;
		};
	};
};*/