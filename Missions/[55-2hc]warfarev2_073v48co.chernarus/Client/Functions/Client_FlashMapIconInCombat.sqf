private ["_unit", "_lastFired", "_timePassed", "_blinkIcon"];

_unit = _this select 0;

if (side _unit != side player) exitWith {};

_lastFiredTime = _unit getVariable ["WASP_LastFiredTime", 0];
_timePassed = time - _lastFiredTime;
_blinkIcon = false;

if (isPlayer (leader _unit)) then {
    if ((isNil "_lastFiredTime")) then {
        _unit setVariable ["WASP_LastFiredTime", time, true];
        _timePassed = 0;
    } else {
        _timePassed = time - _lastFiredTime;
        _unit setVariable ["WASP_LastFiredTime", time, true];
    };

    if (_timePassed >= 10) then {
        _unit setVariable ["BLINK_ICON", false, true]; 
    } else {
         _unit setVariable ["BLINK_ICON", true, true];  
    };
};