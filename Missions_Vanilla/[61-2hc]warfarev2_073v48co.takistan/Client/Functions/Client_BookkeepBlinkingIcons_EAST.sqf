
private ["_blinkRed", "_timeBefore", "_timeAfter", "_dt", "_unitLFTB", "_vehicleLFTB"];

_blinkRed = true;

sleep 5;

while { !WFBE_GameOver } do {

    _timeBefore = time;
    
    {

        if (side _x != side player) exitWith {};

        private ["_groupArray"];
        _groupArray = [];
        _groupArray = units _x;

        private ["_isActive", "_groupLeader"];
        _isActive = leader _x getVariable "LFTB";
        _groupLeader = leader _x;
            
            if (player == _groupLeader) then {
                {
                    _unitIsActive = _x getVariable "LFTB";
                    if (!isNil { _unitIsActive }) then {
                        if (_unitIsActive) then {
                            if (BLINKING_UNITS_EAST find _x == -1) then {
                                [BLINKING_UNITS_EAST, _x] call BIS_fnc_arrayPush;
                            };
                        };
                    };
                } forEach _groupArray;
            };

            if (isPlayer _groupLeader && player != _groupLeader) then {
                if (!isNil { _isActive }) then {
                    if (_isActive) then {
                        if (BLINKING_UNITS_EAST find _groupLeader == -1) then {
                            [BLINKING_UNITS_EAST, _groupLeader] call BIS_fnc_arrayPush;
                        };
                    };
                };
            };

            if (player == _groupLeader) then {
                {
                    _unitLFTB = _x getVariable "LFTB";
                    if (!(isNil { _unitLFTB })) then {
                        if(!_unitLFTB) then {
                            BLINKING_UNITS_EAST = BLINKING_UNITS_EAST - [_x];
                        };
                    };
                    if (isNull _x) then {
                        BLINKING_UNITS_EAST = BLINKING_UNITS_EAST - [_x];
                    };
                } forEach _groupArray;
            };

            if (isPlayer _groupLeader && player != _groupLeader) then {
                _groupLeaderLFTB = _groupLeader getVariable "LFTB";
                if (!(isNil { _groupLeaderLFTB })) then {
                    if(!_groupLeaderLFTB) then {
                        BLINKING_UNITS_EAST = BLINKING_UNITS_EAST - [_groupLeader];
                    };
                };
                if (isNull _groupLeader) then {
                    BLINKING_UNITS_EAST = BLINKING_UNITS_EAST - [_groupLeader];
                };
            };

        {
            private ["_vehicleUnit", "_isActiveVehicle", "_justDisabled"];

            _vehicleUnit = vehicle _x;
            _isActiveVehicle = _vehicleUnit getVariable "LFTB";
            _justDisabled = _x getVariable "JustDisabled";

            if (vehicle _x != _x) then {

                if (!isNil { _isActiveVehicle }) then {
                    if (_isActiveVehicle && (vehicle player == _vehicleUnit) && (player == gunner _vehicleUnit) || (player == commander _vehicleUnit)) then {
                        if (BLINKING_VEHICLES_EAST find _vehicleUnit == -1) then {
                            [BLINKING_VEHICLES_EAST, _vehicleUnit] call BIS_fnc_arrayPush;
                        };
                        if (BLINKING_UNITS_EAST find _x == -1 && !_justDisabled) then {
                            [BLINKING_UNITS_EAST, _x] call BIS_fnc_arrayPush;
                        };
                    };
                    if (_isActiveVehicle && _vehicleUnit != _x) then {
                        if (BLINKING_VEHICLES_EAST find _vehicleUnit == -1) then {
                            [BLINKING_VEHICLES_EAST, _vehicleUnit] call BIS_fnc_arrayPush;
                        };
                    } else {
                        {
                            _vehicleLFTB = _vehicleUnit getVariable "LFTB";
                            if (!(isNil { _vehicleLFTB }) && !_vehicleLFTB) then {  
                                BLINKING_VEHICLES_EAST = BLINKING_VEHICLES_EAST - [_vehicleUnit];
                            };
                            if (isNull _x) then {
                                BLINKING_VEHICLES_EAST = BLINKING_VEHICLES_EAST - [_x];
                            };
                        } forEach BLINKING_VEHICLES_EAST;
                    };
                };
                
            _x setVariable ["JustDisabled", false, false];
            } else {
                if (!isNil { _justDisabled }) then {
                    if (_justDisabled) then {
                        _marker = _x getVariable "unitMarkerBlink";
                        _markerColor = _x getVariable "OriginalMarkerColor";
                        _marker setMarkerColorLocal _markerColor;
                        _x setVariable ["JustDisabled", false, false];
                    };
                };
            };

        } forEach _groupArray;
            
    sleep 0.02;

    } forEach clientTeams;

    {
        [_x, _blinkRed] call WFBE_CL_FNC_BlinkMapIcon;
    } forEach BLINKING_UNITS_EAST;

    {
        [_x, _blinkRed] call WFBE_CL_FNC_BlinkMapIcon;
    } forEach BLINKING_VEHICLES_EAST;

    _blinkRed = !_blinkRed;

    _timeAfter = time;
    _dt = _timeAfter - _timeBefore;

    if (_dt > 1) then {
        _dt = 1;
    };

    sleep (1 - _dt);

};
