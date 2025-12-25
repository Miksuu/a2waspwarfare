private ["_unit", "_hasFired", "_dt"];

_unit = _this;
_unit = vehicle _unit;

_hasFired = _unit getVariable "LFTB";

if (!isNil { _LFTB }) then {
    if (!_LFTB) then {
        _unit setVariable ["LFTB", true, true];
        _unit setVariable ["Blinks", 0, false];
    }
} else {
    _unit setVariable ["LFTB", true, true];
    _unit setVariable ["Blinks", 0, false];
};