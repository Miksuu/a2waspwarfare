private ["_unit", "_hasFired", "_dt"];

_unit = _this;
_unit = vehicle _unit;

_hasFired = _unit getVariable "LFTB";

if (!isNil { _LFTB }) then {
    if (!_LFTB) then {
        _unit setVariable ["LFTB", true, true];
        _unit setVariable ["Blinks", 0, true];
    }
} else {
    _unit setVariable ["LFTB", true, true];
    _unit setVariable ["Blinks", 0, true];
};

/*
if ((leader _unit) == player) then {
    _unit setVariable ["OriginalMarkerColor", "ColorOrange", true];
};
*/


/*
private ["_unit", "_lastFired"];

if (time - BLINK_LAST_TIME_CALLED < 5) exitWith {BLINK_LAST_TIME_CALLED = time;};

_unit = _this select 0;

_unit setVariable ["WASP_LastFiredTime", time, true];

while {!WFBE_gameover} do {

    if (side _unit != side player) exitWith {};  // stop if no longer relevant locally

    _lastFired = (_unit getVariable ["WASP_LastFiredTime", 0]);

    if ((time - _lastFired) > 5) exitWith {
        _unit setVariable ["WASP_FlashMapIconInCombat", false, true];
    };

    _unit setVariable ["WASP_FlashMapIconInCombat", true, true];

    sleep 6;
};
*/