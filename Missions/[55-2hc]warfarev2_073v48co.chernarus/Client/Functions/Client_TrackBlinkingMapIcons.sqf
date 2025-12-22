while { !WFBE_GameOver } do {
    {
        if (side player == west) then {
            if (side _x == west) then {
                _blinkingActive = _x getVariable "LFTB";
                
                if (!(isNil "_blinkingActive") && _blinkingActive) then {
                    ARRAY_UNITS_FIRING_WEST = [ARRAY_UNITS_FIRING_WEST, _x] call BIS_fnc_arrayPush;
                };
            };
        } else {
            if (side player == east) then {
                if (side _x == east) then {
                    _blinkingActive = _x getVariable "LFTB";
                    
                    if (!(isNil "_blinkingActive") && _blinkingActive) then {
                        ARRAY_UNITS_FIRING_EAST = [ARRAY_UNITS_FIRING_EAST, _x] call BIS_fnc_arrayPush;
                    };
                };
            };
        };
        
        sleep 0.01;

    } forEach allUnits;

};