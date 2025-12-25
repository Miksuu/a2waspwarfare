
private ["_blinkRed", "_timeBefore", "_timeAfter", "_dt"];

_blinkRed = true;

while { !WFBE_GameOver } do {

    _timeBefore = time;
    {
        if (side _x == side player) then {
            private ["_isActive"];
            _isActive = (vehicle _x) getVariable "LFTB";

            if (!isNil { _isActive }) then {
                if (_isActive) then {
                    if (side player == west) then {
                        if (BLINKING_UNITS_WEST find vehicle _x == -1) then {
                            [BLINKING_UNITS_WEST, [vehicle _x]] call BIS_fnc_arrayPush;
                        };
                    } else {
                        if (side player == east) then {
                            if (BLINKING_UNITS_EAST find vehicle _x == -1) then {
                                [BLINKING_UNITS_EAST, [vehicle _x]] call BIS_fnc_arrayPush;
                            };
                        };
                    };
                } else {
                    if (side player == west) then {
                        if (BLINKING_UNITS_WEST find vehicle _x != -1) then {                           
                            BLINKING_UNITS_WEST = BLINKING_UNITS_WEST - [vehicle _x];
                        };
                    } else {
                        if (side player == east) then {
                            if (BLINKING_UNITS_EAST find vehicle _x != -1) then {
                                BLINKING_UNITS_EAST = BLINKING_UNITS_EAST - [vehicle _x];
                            };
                        };
                    };
                };
            };

            if (side player == west) then {
                {
                    [_x, _blinkRed] call WFBE_CL_FNC_BlinkMapIcon;
                    diag_log format ["Blinking west unit: %1", _x];
                } forEach BLINKING_UNITS_WEST;
            };

            if (side player == east) then {
                {
                    diag_log format ["Blinking east unit: %1", _x];
                    [_x, _blinkRed] call WFBE_CL_FNC_BlinkMapIcon;
                } forEach BLINKING_UNITS_EAST;
            };

            _blinkRed = !_blinkRed;
        };

    } forEach allUnits;
    _timeAfter = time;
    _dt = _timeAfter - _timeBefore;

    if (_dt >= 1) then {
        _dt = 0;
    };

    sleep (1 - _dt);
};


/*
private ["_blinkingActive", "_lastTimeFired", "_dt"];

while { !WFBE_GameOver } do {
    {
        diag_log "IS THIS EVEN RUNNING?";
        {
            if (side player == west) then {
                if (side (_x select 0) == west) then {

                    _lastTimeFired = (_x select 0) getVariable "LFT";
                    diag_log "_lastTimeFired:";
                    diag_log _lastTimeFired;
                    if (!isNil { _lastTimeFired }) then {
                        _dt = time - _lastTimeFired;
                        diag_log "_dt:";
                        diag_log _dt;
                        if (_dt >= FIRING_UNIT_BLINK_TIME) then {
                            if (ARRAY_UNITS_FIRING_WEST find (_x select 0) != -1) then {
                                ARRAY_UNITS_FIRING_WEST = ARRAY_UNITS_FIRING_WEST - _x;
                            };
                        };
                    } else {
                        if (ARRAY_UNITS_FIRING_WEST find (_x select 0) != -1) then {
                            ARRAY_UNITS_FIRING_WEST = ARRAY_UNITS_FIRING_WEST - _x;
                        };
                    }; 
                };
            };
            
        } forEach ARRAY_UNITS_FIRING_WEST;

    } else {
        {
            if (side player == east) then {
                if (side (_x select 0) == east) then {

                    _lastTimeFired = (_x select 0) getVariable "LFT";

                    if (!isNil { _lastTimeFired }) then {
                        _dt = time - _lastTimeFired;
                        
                        if (_dt >= FIRING_UNIT_BLINK_TIME) then {
                            if (ARRAY_UNITS_FIRING_WEST find (_x select 0) != -1) then {
                                ARRAY_UNITS_FIRING_WEST = ARRAY_UNITS_FIRING_WEST - _x;
                            };
                        };
                    } else {
                        if (ARRAY_UNITS_FIRING_WEST find (_x select 0) != -1) then {
                            ARRAY_UNITS_FIRING_WEST = ARRAY_UNITS_FIRING_WEST - _x;
                        };
                    }; 
                };
            };
            
        } forEach ARRAY_UNITS_FIRING_EAST;
    };
        
    sleep 0.02;
};
*/