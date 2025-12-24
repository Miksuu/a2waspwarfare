while { !WFBE_GameOver } do {

    {
        if (side _x == side player) then {
            _lastFired = (_x getVariable "LFT");

            if (!isNil { _lastFired }) then {
                if (_lastFired) then {
                    [_x, true] call WFBE_CL_FNC_BlinkMapIcon;
                };
            };
        };

        sleep 0.01;
    } forEach allUnits;
    sleep 0.1;
};

/*
while { !WFBE_GameOver } do {
    if (side player == west) then {
        [ARRAY_UNITS_FIRING_WEST, true] call WFBE_CL_FNC_BlinkMapIcon;
        sleep 1;
        [ARRAY_UNITS_FIRING_WEST, false] call WFBE_CL_FNC_BlinkMapIcon;
        sleep 1;
    } else {
        if (side player == east) then {
            [ARRAY_UNITS_FIRING_EAST, true] call WFBE_CL_FNC_BlinkMapIcon;
            sleep 1;
            [ARRAY_UNITS_FIRING_EAST, false] call WFBE_CL_FNC_BlinkMapIcon;
            sleep 1;
        };
    };
};
*/