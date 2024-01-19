/*
	Handle a vehicle emptiness.
	 Parameters:
		- Vehicle.
		- {Delay override}.
*/

Private ["_delay", "_timer", "_vehicle"];

_vehicle = _this select 0;




_delay = if (count _this > 1) then {_this select 1} else {
    if (typeOf _vehicle in (missionNamespace getVariable Format['cti_%1AMBULANCES',str (side _vehicle)])) then {
        (missionNamespace getVariable "cti_C_UNITS_EMPTY_TIMEOUT")*2
    };
	
	if (typeOf _vehicle == "Land_Pod_Heli_Transport_04_medevac_F") then {
        (missionNamespace getVariable "cti_C_UNITS_EMPTY_TIMEOUT")*20
    };
	
};

if(isNil '_delay')then{
    _delay = missionNamespace getVariable "cti_C_UNITS_EMPTY_TIMEOUT";
};

_timer = 0;

while {alive _vehicle} do {
	sleep 20;
	
	_timer = if (({alive _x} count crew _vehicle) > 0) then {0} else {_timer + 20};
	if (_timer > _delay) exitWith {deleteVehicle _vehicle};
};

_index = emptyQueu find _vehicle;
if(_index > -1)then{emptyQueu deleteAt _index};