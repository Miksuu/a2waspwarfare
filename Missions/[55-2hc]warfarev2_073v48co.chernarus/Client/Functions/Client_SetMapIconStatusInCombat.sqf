private ["_unit", "_hasFired", "_dt"];

_unit = _this;
_vehicleUnit = vehicle _unit;

_hasFired = _unit getVariable "LFTB";
_hasFiredVehicle = _vehicleUnit getVariable "LFTB";

if (!isNil { _hasFired }) then {
    if (!_hasFired) then {
        _unit setVariable ["LFTB", true, true];
        _unit setVariable ["Blinks", 0, false];
    }
} else {
    _unit setVariable ["LFTB", true, true];
    _unit setVariable ["Blinks", 0, false];
};

if (!isNil { _hasFiredVehicle }) then {
    if (!_hasFiredVehicle) then {
        _vehicleUnit setVariable ["LFTB", true, true];
        _vehicleUnit setVariable ["Blinks", 0, false];
    }
} else {
    _vehicleUnit setVariable ["LFTB", true, true];
    _vehicleUnit setVariable ["Blinks", 0, false];
};