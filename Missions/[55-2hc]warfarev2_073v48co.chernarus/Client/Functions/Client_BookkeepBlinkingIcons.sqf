
private ["_blinkRed", "_timeBefore", "_timeAfter", "_dt"];

_blinkRed = true;

while { !WFBE_GameOver } do {

    _timeBefore = time;
    {
        if (side _x == side player) then {
            private ["_isActive"];
            _isActive = (vehicle _x) getVariable "LFTB";

            if (!isNil { _isActive }) then {
                diag_log format ["BLINKING_UNITS_WEST before update: %1", BLINKING_UNITS_WEST];
                if (_isActive) then {
                    if (side player == west) then {
                        if (BLINKING_UNITS_WEST find vehicle _x == -1) then {
                            [BLINKING_UNITS_WEST, _x] call BIS_fnc_arrayPush;
                        };
                    } else {
                        if (side player == east) then {
                            if (BLINKING_UNITS_EAST find vehicle _x == -1) then {
                                [BLINKING_UNITS_EAST, _x] call BIS_fnc_arrayPush;
                            };
                        };
                    };
                } else {
                    if (side player == west) then {
                        if (BLINKING_UNITS_WEST find vehicle _x != -1 || BLINKING_UNITS_WEST find _x != -1) then {                           
                            BLINKING_UNITS_WEST = BLINKING_UNITS_WEST - [vehicle _x];
                            diag_log format ["Removed unit %1 from BLINKING_UNITS_WEST", vehicle _x];
                            BLINKING_UNITS_WEST = BLINKING_UNITS_WEST - [_x];
                            diag_log format ["Removed unit %1 from BLINKING_UNITS_WEST", _x];
                            diag_log format ["BLINKING_UNITS_WEST now: %1", BLINKING_UNITS_WEST];
                        };
                    } else {
                        if (side player == east) then {
                            if (BLINKING_UNITS_EAST find vehicle _x != -1 || BLINKING_UNITS_EAST find _x != -1) then {
                                BLINKING_UNITS_EAST = BLINKING_UNITS_EAST - [vehicle _x];
                                diag_log format ["Removed unit %1 from BLINKING_UNITS_EAST", vehicle _x];
                                BLINKING_UNITS_EAST = BLINKING_UNITS_EAST - [_x];
                                diag_log format ["Removed unit %1 from BLINKING_UNITS_EAST", _x];
                            };
                        };
                    };
                };
                diag_log format ["BLINKING_UNITS_WEST after update: %1", BLINKING_UNITS_WEST];
            };
        };
    } forEach allUnits;

    if (side player == west) then {
        {
            diag_log format ["FOREACH BLINKING_UNITS_WEST: Blinking unit (west): %1", _x];
            [_x, _blinkRed] call WFBE_CL_FNC_BlinkMapIcon;
        } forEach BLINKING_UNITS_WEST;
    };

    if (side player == east) then {
        {
            [_x, _blinkRed] call WFBE_CL_FNC_BlinkMapIcon;
        } forEach BLINKING_UNITS_EAST;
    };

    _blinkRed = !_blinkRed;

    _timeAfter = time;
    _dt = _timeAfter - _timeBefore;

    if (_dt >= 1) then {
        _dt = 0;
    };

    sleep (1 - _dt);
};