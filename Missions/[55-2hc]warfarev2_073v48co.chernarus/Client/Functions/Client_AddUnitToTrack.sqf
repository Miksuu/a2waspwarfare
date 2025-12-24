private ["_unit", "_unitMarker", "_markerColor"];

_unit = _this select 0;
_unitMarker = _this select 1;
_markerColor = _this select 2;

if (side _unit == side player) then {
    if (side _unit == west) then {
        ARRAY_UNITS_FIRING_WEST = [ARRAY_UNITS_FIRING_WEST, [_unit, _unitMarker, _markerColor]] call BIS_fnc_arrayPush;
    } else {
        if (side _unit == east) then {
            ARRAY_UNITS_FIRING_EAST = [ARRAY_UNITS_FIRING_EAST, [_unit, _unitMarker, _markerColor]] call BIS_fnc_arrayPush;
        };
    };
};