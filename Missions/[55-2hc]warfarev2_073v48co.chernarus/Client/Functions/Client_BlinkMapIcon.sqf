private ["_unitsFiring", "_markerColor", "_unit", "_marker", "_flashRed"];

_unitsFiring = _this select 0;
_flashRed = _this select 1;

{
    _unit = _x select 0;
    _marker = _x select 1;
    _markerColor = _x select 2;
    
    if (_flashRed) then {
        _marker setMarkerColorLocal "ColorRed";
        diag_log "Set icon color to red.";
    } else {
        _marker setMarkerColorLocal _markerColor;
        diag_log "Set icon color to original.";
    };
} forEach _unitsFiring;