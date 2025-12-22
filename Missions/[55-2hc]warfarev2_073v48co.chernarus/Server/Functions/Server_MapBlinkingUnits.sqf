private ["_side", "_firedRecently", "_blinkingStopThreshold", "_netID"];

while { !WFBE_GameOver } do {
    {
        _blinkingStopThreshold = _x getVariable "LFTserverTime";
        _side = side _x;

        // diag_log "_blinkingStopThreshold:";
        //diag_log _blinkingStopThreshold;

        if (!(isNil "_blinkingStopThreshold")) then {
            // if (time - _blinkingStopThreshold > FIRING_UNIT_BLINK_TIME) then {
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
        };

        _firedRecently = _x getVariable "LFTB";
        diag_log "_firedRecently:";
        diag_log _firedRecently;

        if (!(isNil "_firedRecently")) then {
            if (_firedRecently) then {
                _x setVariable ["LFTserverTime", time, false];
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