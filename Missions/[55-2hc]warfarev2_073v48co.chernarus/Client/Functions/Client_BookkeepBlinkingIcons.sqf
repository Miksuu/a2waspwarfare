
private ["_blinkRed", "_timeBefore", "_timeAfter", "_dt", "_vehicleUnit"];

_blinkRed = true;

while { !WFBE_GameOver } do {

    _timeBefore = time;
    {
        if (side _x == side player) then {
            private ["_isActiveVehicle", "_isActive", "_vehicleUnit"];
            _isActive = _x getVariable "LFTB";
            _vehicleUnit = vehicle _x;
            _isActiveVehicle = _vehicleUnit getVariable "LFTB";
            
            if (!isNil { _isActive }) then {
                diag_log format ["BLINKING_UNITS_WEST before update: %1", BLINKING_UNITS_WEST];
                diag_log format ["BLINKING_VEHICLES_WEST before update: %1", BLINKING_VEHICLES_WEST];
                if (_isActive) then {
                    if (side player == west) then {
                        if (BLINKING_UNITS_WEST find _x == -1) then {
                            [BLINKING_UNITS_WEST, _x] call BIS_fnc_arrayPush;
                        };
                    } else {
                        if (side player == east) then {
                            if (BLINKING_UNITS_EAST find _x == -1) then {
                                [BLINKING_UNITS_EAST, _x] call BIS_fnc_arrayPush;
                            };
                        };
                    };
                } else {
                    if (side player == west) then {
                        if (BLINKING_UNITS_WEST find _x != -1) then {                           
                            BLINKING_UNITS_WEST = BLINKING_UNITS_WEST - [_x];
                            diag_log format ["Removed unit %1 from BLINKING_UNITS_WEST", _x];
                            diag_log format ["BLINKING_UNITS_WEST now: %1", BLINKING_UNITS_WEST];
                        };
                    } else {
                        if (side player == east) then {
                            if (BLINKING_UNITS_EAST find _x != -1) then {
                                BLINKING_UNITS_EAST = BLINKING_UNITS_EAST - [_x];
                                diag_log format ["Removed unit %1 from BLINKING_UNITS_EAST", _x];
                            };
                        };
                    };
                };
            };

            if (!isNil { _isActiveVehicle }) then {
                if (_isActiveVehicle && _vehicleUnit != _x) then {
                    if (side player == west) then {
                        if (BLINKING_VEHICLES_WEST find _vehicleUnit == -1) then {
                            _vehicleUnit setVariable ["ACTIVE", true, true];
                            [BLINKING_VEHICLES_WEST, _vehicleUnit] call BIS_fnc_arrayPush;
                        };
                    };

                    if (side player == east) then {
                        if (BLINKING_VEHICLES_EAST find _vehicleUnit == -1) then {
                            _vehicleUnit setVariable ["ACTIVE", true, true];
                            [BLINKING_VEHICLES_EAST, _vehicleUnit] call BIS_fnc_arrayPush;
                        };
                    };
                } else {
                    if (side player == west) then {
                        {
                            _vehicleLFTB = _x getVariable "LFTB";
                            if (!(isNil { _vehicleLFTB }) && !_vehicleLFTB) then {                       
                                BLINKING_VEHICLES_WEST = BLINKING_VEHICLES_WEST - [_x];
                                diag_log format ["Removed unit %1 from BLINKING_VEHICLES_WEST", _x];
                                diag_log format ["BLINKING_VEHICLES_WEST now: %1", BLINKING_VEHICLES_WEST];
                            };
                        } forEach BLINKING_VEHICLES_WEST;
                    } else {
                        if (side player == east) then {
                            {
                                _vehicleLFTB = _x getVariable "LFTB";
                                        
                                if (!(isNil { _vehicleLFTB }) && !_vehicleLFTB) then {  
                                    BLINKING_VEHICLES_EAST = BLINKING_VEHICLES_EAST - [_x];
                                    diag_log format ["Removed unit %1 from BLINKING_VEHICLES_EAST", _x];
                                };
                            } forEach BLINKING_VEHICLES_EAST;
                        };
                    };
            };

            diag_log format ["BLINKING_UNITS_WEST after update: %1", BLINKING_UNITS_WEST];
            diag_log format ["BLINKING_VEHICLES_WEST after update: %1", BLINKING_VEHICLES_WEST];
            };
        };

    } forEach allUnits;

    if (side player == west) then {
        {
            [_x, _blinkRed] call WFBE_CL_FNC_BlinkMapIcon;
        } forEach BLINKING_UNITS_WEST;

        {
            [vehicle _x, _blinkRed] call WFBE_CL_FNC_BlinkMapIcon;
        } forEach BLINKING_VEHICLES_WEST;
    };

    if (side player == east) then {
        {
            [_x, _blinkRed] call WFBE_CL_FNC_BlinkMapIcon;
            if (vehicle _x != _x) then {
                [vehicle _x, _blinkRed] call WFBE_CL_FNC_BlinkMapIcon;
            };
        } forEach BLINKING_UNITS_EAST;

        {
            [vehicle _x, _blinkRed] call WFBE_CL_FNC_BlinkMapIcon;
        } forEach BLINKING_VEHICLES_EAST;
    };

    _blinkRed = !_blinkRed;

    _timeAfter = time;
    _dt = _timeAfter - _timeBefore;

    if (_dt >= 1) then {
        _dt = 0;
    };

    sleep (1 - _dt);
};