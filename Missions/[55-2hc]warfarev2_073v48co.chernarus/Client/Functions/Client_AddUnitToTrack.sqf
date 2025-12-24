private ["_unit", "_unitMarker", "_markerColor"];

_unit = _this select 0;
_unitMarker = _this select 1;
_markerColor = getMarkerColor _unitMarker;

if (side _unit == side player) then {
    if (side _unit == west) then {
        ARRAY_UNITS_FIRING_WEST = [ARRAY_UNITS_FIRING_WEST, [_unit, _unitMarker, _markerColor]] call BIS_fnc_arrayPush;
    } else {
        if (side _unit == east) then {
            ARRAY_UNITS_FIRING_EAST = [ARRAY_UNITS_FIRING_EAST, [_unit, _unitMarker, _markerColor]] call BIS_fnc_arrayPush;
        };
    };
};

diag_log "ARRAY_UNITS_FIRING_WEST:";
{
    diag_log format ["Unit: %1, Marker: %2", _x select 0, _x select 1];
} forEach ARRAY_UNITS_FIRING_WEST;

diag_log "ARRAY_UNITS_FIRING_EAST:";
{
    diag_log format ["Unit: %1, Marker: %2", _x select 0, _x select 1];
} forEach ARRAY_UNITS_FIRING_EAST;