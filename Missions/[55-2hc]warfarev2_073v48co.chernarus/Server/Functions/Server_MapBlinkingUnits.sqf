private ["_side", "_firedRecently", "_blinkingStopThreshold", "_netID"];

while { !WFBE_GameOver } do {
    {
        _blinkingStopThreshold = _x getVariable "LFTserverTime";
        _side = side _x;

        diag_log "_blinkingStopThreshold:";
        diag_log _blinkingStopThreshold;

        diag_log "_blinkingStopThreshold time diff > FIRING_UNIT_BLINK_TIME:";
        diag_log (time - _blinkingStopThreshold > FIRING_UNIT_BLINK_TIME);

        if (!(isNil "_blinkingStopThreshold")) then {
            if (time - _blinkingStopThreshold > FIRING_UNIT_BLINK_TIME) then {
            if (true) then {
                _x setVariable ["LFTB", false, true];
                
                if (_side == west) then {
                    // ARRAY_UNITS_FIRING_WEST = ARRAY_UNITS_FIRING_WEST - [netID _x];
                } else {
                    if (_side == east) then {
                        // ARRAY_UNITS_FIRING_EAST = ARRAY_UNITS_FIRING_EAST - [netID _x];
                    };
                };
            };
        } else {
            _x setVariable ["LFTserverTime", time, false];
        };

        _firedRecently = _x getVariable "LFTB";

        if (!(isNil "_firedRecently")) then {
            if (_firedRecently) then {
                if (_side == west) then {
                    // ARRAY_UNITS_FIRING_WEST = [netID _x] call BIS_fnc_arrayPush;
                } else {
                    if (_side == east) then {
                        // ARRAY_UNITS_FIRING_EAST = [netID _x] call BIS_fnc_arrayPush;
                    };
                };
            };
        };
        sleep 0.01;
    } forEach allUnits;
};