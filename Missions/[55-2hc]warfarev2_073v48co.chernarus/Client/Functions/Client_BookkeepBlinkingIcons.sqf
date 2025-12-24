private ["_blinkingActive"];

while { !WFBE_GameOver } do {
    {
        {
            if (side player == east) then {
                if (side (_x select 0) == east) then {

                    _blinkingActive = (_x select 0) getVariable "LFTB";
                    
                    if (isNil "_blinkingActive") then {
                        if (!_blinkingActive) then {
                            if (ARRAY_UNITS_FIRING_WEST find (_x select 0) != -1) then {
                                ARRAY_UNITS_FIRING_WEST = ARRAY_UNITS_FIRING_WEST - _x;
                            };
                        };
                    }; 
                };
            };
            
        } forEach ARRAY_UNITS_FIRING_WEST;

    } else {
        {
            if (side player == east) then {
                if (side (_x select 0) == east) then {

                    _blinkingActive = (_x select 0) getVariable "LFTB";
                    
                    if (isNil "_blinkingActive") then {
                        if (!_blinkingActive) then {
                            if (ARRAY_UNITS_FIRING_EAST find (_x select 0) != -1) then {
                                ARRAY_UNITS_FIRING_EAST = ARRAY_UNITS_FIRING_EAST - _x;
                            };
                        };
                    }; 
                };
            };
            
        } forEach ARRAY_UNITS_FIRING_EAST;
    };
        
    sleep 0.02;
};