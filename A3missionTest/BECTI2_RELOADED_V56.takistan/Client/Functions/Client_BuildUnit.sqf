Private ["_building","_cpt","_commander","_crew","_currentUnit","_unitdescription","_unitlogo","_direction","_distance","_driver","_extracrew","_factory","_factoryPosition","_factoryType","_group","_gunner","_index","_init","_isArtillery","_isMan","_locked","_longest","_position","_queu","_queu2","_ret","_show","_soldier","_waitTime","_txt","_type","_upgrades","_unique","_unit","_vehi","_vehicle","_emptyVehicles"];
_building = _this select 0;
_unit = _this select 1;
_vehi = _this select 2;
_factory = _this select 3;
_cpt = _this select 4;

_isMan = if (_unit isKindOf "Man") then {true} else {false};

unitQueu = unitQueu + _cpt;

_distance = 0;
_direction = 0;
_longest = 0;
_position = 0;
_waitTime = 0;
_factoryType = "";
_unitdescription = "";
_unitlogo = "";
_unitskin = 0;

_currentUnit = missionNamespace getVariable _unit;
_waitTime = _currentUnit select QUERYUNITTIME;
_unitdescription = _currentUnit select QUERYUNITLABEL;
_unitlogo = _currentUnit select 1;

if((count _currentUnit) > 10) then { _unitskin = _currentUnit select 10 };

_type = typeOf _building;
_index = (missionNamespace getVariable Format ["cti_%1STRUCTURENAMES",cti_Client_SideJoinedText]) find _type;
if (_index != -1) then {
	_distance = (missionNamespace getVariable Format ["cti_%1STRUCTUREDISTANCES",cti_Client_SideJoinedText]) select _index;
	_direction = (missionNamespace getVariable Format ["cti_%1STRUCTUREDIRECTIONS",cti_Client_SideJoinedText]) select _index;
	_factoryType = (missionNamespace getVariable Format ["cti_%1STRUCTURES",cti_Client_SideJoinedText]) select _index;
	



if (_factoryType isEqualTo 	"Barracks")then{
	//--- Place Infantry on marker if available

	private _pad_man = "Land_PedestrianCrossing_01_6m_6str_F";
	private _pads = _building nearObjects [_pad_man, 250];
	private _free = [];
	private _dir = 0;
	if (count _pads > 0) then {
		for "_i" from 0 to (count _pads - 1) do {
			private _no = getpos (_pads select _i) nearEntities [["Man","Car","Motorcycle","Tank","Ship","Air","StaticWeapon"], 0.5];
			private _double = _pad_man countType _no;
			_dir = getDir (_pads select _i);
			if (_no isEqualTo [_pads select _i] || _double isEqualTo count _no) then {_free = _free + [[getpos (_pads select _i), _dir]];};
		};
	};
	if (count _free > 0) then {
		private _selpad = selectRandom _free;

		
		_position = [_selpad#0#0,_selpad#0#1,_selpad#1];
		_position set [2, .5];
		
	}else{
	_position = _building modelToWorld [(sin _direction * _distance), (cos _direction * _distance), 0];
	_position set [2, .5];};



};


if(_factoryType isEqualTo "Light")then{
	
	//--- Place Wheeled vehicles on Pads if avaiable.
	_pad_man = "Land_HelipadSquare_F";
	
	
	private _pads = _building nearObjects [_pad_man, 250];
	private _free = [];
	private _dir = 0;
	if (count _pads > 0) then {
		for "_i" from 0 to (count _pads - 1) do {
			private _no = getpos (_pads select _i) nearEntities [["Man","Car","Motorcycle","Tank","Ship","Air","StaticWeapon"], 0.5];
			private _double = _pad_man countType _no;
			_dir = getDir (_pads select _i);
			if (_no isEqualTo [_pads select _i] || _double isEqualTo count _no) then {_free = _free + [[getpos (_pads select _i), _dir]];};
		};
	};
	if (count _free > 0) then {
		private _selpad = selectRandom _free;

		
		_position = [_selpad#0#0,_selpad#0#1,_selpad#1];
		_position set [2, .5];
	}else{
	_position = _building modelToWorld [(sin _direction * _distance), (cos _direction * _distance), 0];
	_position set [2, .5];};



	
	
};
		
if(_factoryType isEqualTo "Heavy")then{
		
		//--- Place Tracked vehicles on Pads if avaiable.
		_pad_man = "Land_HelipadRescue_F";
	
	private _pads = _building nearObjects [_pad_man, 250];
	private _free = [];
	private _dir = 0;
	if (count _pads > 0) then {
		for "_i" from 0 to (count _pads - 1) do {
			private _no = getpos (_pads select _i) nearEntities [["Man","Car","Motorcycle","Tank","Ship","Air","StaticWeapon"], 0.5];
			private _double = _pad_man countType _no;
			_dir = getDir (_pads select _i);
			if (_no isEqualTo [_pads select _i] || _double isEqualTo count _no) then {_free = _free + [[getpos (_pads select _i), _dir]];};
		};
	};
	if (count _free > 0) then {
		private _selpad = selectRandom _free;

		
		_position = [_selpad#0#0,_selpad#0#1,_selpad#1];
		_position set [2, .5];
	}else{
	_position = _building modelToWorld [(sin _direction * _distance), (cos _direction * _distance), 0];
	_position set [2, .5];};
		
		
};
if(_factoryType isEqualTo "Aircraft")then{
			
		_pad_man='Land_HelipadCivil_F';
	private _pads = _building nearObjects [_pad_man, 250];
	private _free = [];
	private _dir = 0;
	if (count _pads > 0) then {
		for "_i" from 0 to (count _pads - 1) do {
			private _no = getpos (_pads select _i) nearEntities [["Man","Car","Motorcycle","Tank","Ship","Air","StaticWeapon"], 0.5];
			private _double = _pad_man countType _no;
			_dir = getDir (_pads select _i);
			if (_no isEqualTo [_pads select _i] || _double isEqualTo count _no) then {_free = _free + [[getpos (_pads select _i), _dir]];};
		};
	};
	if (count _free > 0) then {
		private _selpad = selectRandom _free;
		
		
		_position = [_selpad#0#0,_selpad#0#1,_selpad#1];
		_position set [2, .5];
	}else{
	_position = _building modelToWorld [(sin _direction * _distance), (cos _direction * _distance), 0];
	_position set [2, .5];};
};
			


	
	//_position = _building modelToWorld [(sin _direction * _distance), (cos _direction * _distance), 0];
	//_position set [2, .5];
	_longest = missionNamespace getVariable Format ["cti_LONGEST%1BUILDTIME",_factoryType];
} else {
	if (_type == cti_Logic_Depot) then {
		_distance = missionNamespace getVariable "cti_C_DEPOT_BUY_DISTANCE";
		_direction = missionNamespace getVariable "cti_C_DEPOT_BUY_DIR";
		_factoryType = "Depot";
	};
	if (_type == cti_Logic_Airfield) then {
		_distance = missionNamespace getVariable "cti_C_HANGAR_BUY_DISTANCE";
		_direction = missionNamespace getVariable "cti_C_HANGAR_BUY_DIR";
		_factoryType = "Airport";
	};
	//_position = [getPos _building,_distance,getDir _building + _direction] Call cti_CO_FNC_GetPositionFrom;
	_position = _building modelToWorld [(sin _direction * _distance), (cos _direction * _distance), 0];
	_position set [2, .5];
	_longest = missionNamespace getVariable Format ["cti_LONGEST%1BUILDTIME",_factoryType];
};

_unique = varQueu;
varQueu = random(10)+random(100)+random(1000);
_queu = _building getVariable "queu";
if (isNil "_queu") then {_queu = []};
_queu = _queu + [_unique];
_building setVariable ["queu",_queu,true];

_ret = 0;
_queu2 = [0];

if (count _queu > 0) then {_queu2 = _building getVariable "queu"};

_show = false;
while {_unique != _queu select 0 && alive _building && !isNull _building} do {
	sleep 4;
	_show = true;
	_ret = _ret + 4;
	_queu = _building getVariable "queu";

	if (_queu select 0 == _queu2 select 0) then {
		if (_ret > _longest) then {
			if (count _queu > 0) then {
				_queu = _building getVariable "queu";
				_index = _queu find (_queu select 0);
				if(_index > -1)then{_queu deleteAt _index};
				_building setVariable ["queu",_queu,true];
			};
		};
	};
	if (count _queu != count _queu2) then {
		_ret = 0;
		_queu2 = _building getVariable "queu";
	};
};

if (_show) then {hint(parseText(Format [localize "STR_WF_INFO_BuyEffective",_unitdescription]))};

sleep _waitTime;

_queu = _building getVariable "queu";
_index = _queu find _unique;
if(_index > -1)then{_queu deleteAt _index};
_building setVariable ["queu",_queu,true];

_group = group player;
if (!alive _building || isNull _building) exitWith {
	unitQueu = unitQueu - _cpt;
	missionNamespace setVariable [Format["cti_C_QUEUE_%1",_factory],(missionNamespace getVariable Format["cti_C_QUEUE_%1",_factory])-1];
};

if (_isMan) then {
	_soldier = [_unit,_group,_position,cti_Client_SideID] Call cti_CO_FNC_CreateUnit;
	
	//--- Make sure that our unit is supposed to have a backpack.
	if (getText(configFile >> 'CfgVehicles' >> _unit >> 'backpack') != "") then {
		//--- Retrieve the unit gear config.
		_gear_config = (_unit) Call cti_CO_FNC_GetUnitConfigGear;
		_gear_backpack = _gear_config select 2;
		_gear_backpack_content = _gear_config select 3;

		//--- Backpack handling.
		if (_gear_backpack != "") then {[_soldier, _gear_backpack, _gear_backpack_content] Call cti_CO_FNC_EquipBackpack};
	};

	[cti_Client_SideJoinedText,'UnitsCreated',1] Call cti_CO_FNC_UpdateStatistics;
} else {
	_driver = _vehi select 0;
	_gunner = _vehi select 1;
	_commander = _vehi select 2;
	_extracrew = _vehi select 3;
	_locked = _vehi select 4;

	_factoryPosition = getPos _building;
	_direction = -((((_position select 1) - (_factoryPosition select 1)) atan2 ((_position select 0) - (_factoryPosition select 0))) - 90);//--- model to world that later on.
	
	_vehicle = [_unit, _position, sideID, _direction, _locked, nil, nil, nil, _unitdescription, _unitskin] Call cti_CO_FNC_CreateVehicle;
	
	cti_Client_Team reveal _vehicle;
	
	
	//UAV FILTER
	if !(typeOf _vehicle in cti_C_IS_UAV)  then {
	
    _emptyVehicles = (WF_Logic getVariable "emptyVehicles");
    _emptyVehicles pushBack _vehicle;
	WF_Logic setVariable ["emptyVehicles",_emptyVehicles,true];
	
	};
	
	
	if (isHostedServer) then {_vehicle setVariable ["cti_Taxi_Prohib", true]};

	//--- Clear the vehicle.	
	(_vehicle) call cti_CO_FNC_ClearVehicleCargo;
	
	/* Section: Local Init (Client Only) */

	//--- Lock / Unlock.
	_vehicle addAction [localize "STR_WF_Unlock","Client\Action\Action_ToggleLock.sqf", [], 95, false, true, '', 'alive _target && (locked _target == 2)'];
	_vehicle addAction [localize "STR_WF_Lock","Client\Action\Action_ToggleLock.sqf", [], 94, false, true, '', 'alive _target && (locked _target == 0)'];

	//--- Salvage Truck.
	if (_unit in (missionNamespace getVariable Format['cti_%1SALVAGETRUCK',cti_Client_SideJoinedText])) then {[_vehicle] spawn cti_CL_FNC_Update_Salvage};

	//--- Are we dealing with an artillery unit.
	_isArtillery = [_unit,cti_Client_SideJoinedText] Call cti_CO_FNC_IsArtillery;
	
	//systemchat str _vehicle;
	
	if (_isArtillery != -1) then {[_vehicle,_isArtillery,cti_Client_SideJoinedText] Call cti_CO_FNC_EquipArtillery;};	

	

	/* Section: Creation */

	[cti_Client_SideJoinedText,'VehiclesCreated',1] Call cti_CO_FNC_UpdateStatistics;
	
	_built = 0;
	_group addVehicle _vehicle;

_vehicle allowCrewInImmobile true;

if({(_vehicle isKindOf _x)} count ["Tank","Wheeled_APC"] !=0) then {_vehicle addeventhandler ['Engine',{_this execVM "Client\Module\Engines\Engine.sqf"}];
     _vehicle addAction ["<t color='"+"#00E4FF"+"'>STEALTH ON</t>","Client\Module\Engines\Stopengine.sqf", [], 7,false, true,"","alive _target &&(isEngineOn _target)"];};
	
	
	
	
	//UAV FILTER + POD FILTER
	if (!(typeOf _vehicle in cti_C_IS_UAV) &&!(typeOf _vehicle in ['Land_Pod_Heli_Transport_04_medevac_F','Land_Device_slingloadable_F'])) then {
	
	//--- Empty Vehicle.
	if (!_driver && !_gunner && !_commander) exitWith {};




	//--- Crew Management.
	_crew = missionNamespace getVariable Format ["cti_%1SOLDIER",cti_Client_SideJoinedText];
	if (_unit isKindOf "Tank") then {_crew = missionNamespace getVariable Format ["cti_%1CREW",cti_Client_SideJoinedText]};
	if (_unit isKindOf "Air") then {
		_crew = missionNamespace getVariable Format ["cti_%1PILOT",cti_Client_SideJoinedText];
	};

	//--- Driver.
	if (_driver) then {
		_soldier = [_crew,_group,_position,cti_Client_SideID] Call cti_CO_FNC_CreateUnit;
		//// add eventhandler

		[_soldier] allowGetIn true;
		_soldier moveInDriver _vehicle;
	};
	
	//--- Gunner.
	if (_gunner) then {
		_soldier = [_crew,_group,_position,cti_Client_SideID] Call cti_CO_FNC_CreateUnit;
		[_soldier] allowGetIn true;
		_soldier moveInGunner _vehicle;
	};
	
	//--- Commander.
	if (_commander) then {
		_soldier = [_crew,_group,_position,cti_Client_SideID] Call cti_CO_FNC_CreateUnit;
		[_soldier] allowGetIn true;
		_soldier moveInCommander _vehicle;
	};
	
	//--- Extra vehicle turrets.
	if (_extracrew) then {
		Private ["_turrets"];
		//_turrets = _currentUnit select QUERYUNITTURRETS;
		
		_turrets = [];
		_config = configFile >> "CfgVehicles" >> typeOf _vehicle >> "turrets";
		_count_config = count _config;
		
		if(_count_config > 2) then{ _count_config = 2 };
		//diag_log format ["_count_config: %1",_count_config];
		for '_i' from 0 to _count_config-1 do {
			_turret_main = _config select _i;
			_turrets pushBack [_i];
			
			_config_sub = _turret_main >> "turrets";
			_config_sub_count = count _config_sub;
			
			if(_config_sub_count > 2) then{ _config_sub_count = 2 };
			for '_j' from 0 to _config_sub_count -1 do {
				_turret_sub = _config_sub select _j;
				_turrets pushBack [_i, _j];
			};
		};
		//diag_log format ["_turrets: %1",_turrets];
		{
			if (isNull (_vehicle turretUnit _x)) then {
				_soldier = [_crew,_group,_position,cti_Client_SideID] Call cti_CO_FNC_CreateUnit;
				[_soldier] allowGetIn true;
				_soldier moveInTurret [_vehicle, _x];
			};
		} forEach _turrets;		
	};

	};

	[cti_Client_SideJoinedText,'UnitsCreated',_cpt] Call cti_CO_FNC_UpdateStatistics;
};

unitQueu = unitQueu - _cpt;

missionNamespace setVariable [Format["cti_C_QUEUE_%1",_factory],(missionNamespace getVariable Format["cti_C_QUEUE_%1",_factory])-1];
hint parseText(Format [localize "STR_WF_INFO_Build_Complete",_unitdescription, _unitlogo]);