private ["_blinkingActive"];

while { !WFBE_GameOver } do {
    {
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
                    }; 
                };
            };
            
        } forEach ARRAY_UNITS_FIRING_EAST;
    };
        
    sleep 0.02;
};