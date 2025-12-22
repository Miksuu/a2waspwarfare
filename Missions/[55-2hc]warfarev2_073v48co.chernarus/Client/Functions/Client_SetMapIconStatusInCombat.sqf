private ["_unit", "_lastTime", "_dt"];

_unit = _this select 0;

_lastTime = _unit getVariable "LFT";

if (!isNil { _lastTime }) then {
    _dt = time - _lastTime;
    if (_dt >= FIRING_UNIT_BLINK_TIME) then {
        diag_log "LFTB = TRUE";
        _unit setVariable ["LFT", time, false];
        _unit setVariable ["LFTB", true, true];
    };
} else {
    diag_log "LFTB = TRUE (first time)";
    _unit setVariable ["LFT", time, false];
    _unit setVariable ["LFTB", true, true];
};


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