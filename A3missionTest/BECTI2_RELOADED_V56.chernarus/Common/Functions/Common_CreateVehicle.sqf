Private ["_bounty", "_direction", "_global", "_locked", "_position", "_side", "_special", "_track", "_type", "_vehicle","_emptyVehicles"];

_type = _this select 0;
_position = _this select 1;
_side = _this select 2;
_direction = _this select 3;
_locked = _this select 4;
_bounty = if (count _this > 5) then { if(!(isnil {_this select 5})) then {_this select 5} else { true }; } else {true};
_global = if (count _this > 6) then { if(!(isnil {_this select 6})) then {_this select 6} else { true }; } else {true};
_special = if (count _this > 7) then { if(!(isnil {_this select 7})) then {_this select 7} else {"FORM"}; } else {"FORM"};
_description = if (count _this > 8) then { if(!(isnil {_this select 8})) then {_this select 8} else {""}; } else {""};
_skin = if (count _this > 9) then { if(!(isnil {_this select 9})) then {_this select 9} else { 0 }; } else { 0 };

if (typeName _position == "OBJECT") then {_position = getPos _position};
if (typeName _side == "SIDE") then {_side = (_side) Call cti_CO_FNC_GetSideID};

_vehicle = createVehicle [_type, _position, [], 7, _special];



_vehicle  spawn {_this allowDamage false; sleep 10; _this allowDamage true};
_velocity = velocity _vehicle;
_vehicle setVectorUp surfaceNormal position _vehicle;


	


_vehicle call cti_CO_FNC_BalanceInit;
_vehicle call cti_CO_FNC_Change_Vehicle_Texture;


//[_vehicle] execVM "Client\Module\IgiLoad\IgiLoad.sqf";

if(_skin > 0) then {
	_colorConfigs = "true" configClasses (configfile >> "CfgVehicles" >> _type >> "textureSources");	
			
	if(count _colorConfigs > 0) then {
		if(_skin <= count _colorConfigs) then {
			//_colorTextures pushback (getArray (configfile >> "CfgVehicles" >> _type >> "textureSources" >> configName (_colorConfigs select (lbCurSel 20015)) >> "textures"));
			
			_txtIndex = 0;
			{					
				_vehicle setObjectTextureGlobal [_txtIndex, _x];
				_txtIndex = _txtIndex + 1;
			}	forEach (getArray (configfile >> "CfgVehicles" >> _type >> "textureSources" >> configName (_colorConfigs select _skin) >> "textures"));
		};
	};
};

//--Check the need for vehicle re-equip--
for "_x" from 0 to ((count cti_C_AIR_VEHICLE_TO_REQUIP) - 1) do
{	
	_currentElement = cti_C_AIR_VEHICLE_TO_REQUIP select _x;
	if ((typeOf _vehicle) in _currentElement || _description in _currentElement) exitWith {		
		[_vehicle, _currentElement select 1] call cti_CO_FNC_Requip_AIR_VEH;
	};	
};

if (_special != "FLY") then {
	_vehicle setVelocity [0,0,-1];
} else {
	_vehicle setVelocity [50 * (sin _direction), 50 * (cos _direction), 0];
};
_vehicle setDir _direction;

_vehicle setVectorUp surfaceNormal (getposATL _vehicle);


if (_locked) then {_vehicle lock _locked};
if (_bounty) then {
	_vehicle addEventHandler ["killed", Format ['[_this select 0,_this select 1,%1] Spawn cti_CO_FNC_OnUnitKilled', _side]];
	_vehicle addEventHandler ["hit", {_this Spawn cti_CO_FNC_OnUnitHit}];
};
/*unused, i changed weapons to centurion radar weapon
if(typeOf _vehicle in ['CUP_O_2S6M_RU','RHS_M6']) then {
	_vehicle addeventhandler ['Fired',{_this spawn HandleAAMissiles;}];
};
*/

if(typeOf _vehicle in cti_C_COMBAT_JETS_WITH_BOMBS) then {
	_vehicle addeventhandler ['Fired',{_this spawn cti_CO_FNC_HandleBombs}];
};

if (_global) then {
	if (_side != cti_DEFENDER_ID || cti_ISTHREEWAY) then {
		[[[_vehicle,_side], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", true, true] call BIS_fnc_MP;
	};
};

//disable vanilla lift (not working, must be disabled for cargo.but this disable towing too)
//if (typeOf _vehicle isKindOf "Helikopter") then{_vehicle enableRopeAttach false;};
//_vehicle enableRopeAttach false;

//ADD DAMAGEHANDLER FOR RES TOO + DISABLE VANILLA LIFT
if (_side == cti_DEFENDER_ID) then {
_vehicle 	addEventHandler ["HandleDamage", {  
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"]; 
	
	_damage =_damage * SCALE_DAMAGE_COEFF; 
	
	_damage 
	  }];


//if (typeOf _vehicle isKindOf "Helikopter") then{_vehicle enableRopeAttach false;};
	  
_vehicle enableRopeAttach false;	  
};




//UAV FIX
if (typeOf _vehicle in cti_C_IS_UAV)then {
_vehicle lock 0;
createVehicleCrew _vehicle;
_vehicle enableUAVWaypoints true;
player enableUAVConnectability [_vehicle,true];
player connectTerminalToUAV _vehicle;
};



if(isHeadLessClient)then{
    _emptyVehicles = (WF_Logic getVariable "emptyVehicles");
    _emptyVehicles pushBack _vehicle;
    WF_Logic setVariable ["emptyVehicles",_emptyVehicles,true]
};

["INFORMATION", Format ["Common_CreateVehicle.sqf: [%1] Vehicle [%2] was created at [%3].", _side Call cti_CO_FNC_GetSideFromID, _type, _position]] Call cti_CO_FNC_LogContent;

_vehicle