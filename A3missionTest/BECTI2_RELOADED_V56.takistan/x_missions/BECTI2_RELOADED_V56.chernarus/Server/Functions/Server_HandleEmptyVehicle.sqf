/*
	Handle a vehicle emptiness.
	 Parameters:
		- Vehicle.
		- {Delay override}.
*/

Private ["_delay", "_timer", "_vehicle"];

_vehicle = _this select 0;


//ECM not get a loop 
if (typeOf _vehicle in (missionNamespace getVariable Format['cti_%1ECMVEHICLE',str (side _vehicle)])) exitWith {};

//SPAWNPOD too,should be give better performance if much pods used
if (typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F") exitWith {};

_delay = if (count _this > 1) then {_this select 1} else {
    if (typeOf _vehicle in (missionNamespace getVariable Format['cti_%1AMBULANCES',str (side _vehicle)])) then {
        (missionNamespace getVariable "cti_C_UNITS_EMPTY_TIMEOUT")*2
    };
	
	//if (typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F") then {
    //    (missionNamespace getVariable "cti_C_UNITS_EMPTY_TIMEOUT")*20
    //};
	
};

if(isNil '_delay')then{
    _delay = missionNamespace getVariable "cti_C_UNITS_EMPTY_TIMEOUT";
};

_timer = 0;

while {alive _vehicle} do {
	sleep 20;
	
	_timer = if (({alive _x} count crew _vehicle) > 0) then {0} else {_timer + 20};
	if (_timer > _delay) exitWith {
	
	//maybe dead ai dont count,just be sure here
	//deleteVehicle _vehicle//2024_0227
	_vehicle call CTI_CO_FNC_DELETE
	
	};
};

_index = emptyQueu find _vehicle;
if(_index > -1)then{emptyQueu deleteAt _index};