private ["_unitsFiring", "_markerColor", "_unit", "_marker"];

_markerColor = if (_this select 1 == false) then { _marker getMarkerColor } else { "ColorRed" };

{
    _unit = _x select 0;
    _marker = _x select 1;
    _markerColor = _x select 2;

    if (_markerColor == true) then {
        _marker setMarkerColorLocal "ColorRed";
    } else {
        _marker setMarkerColorLocal _markerColor;
    };
} forEach _unitsFiring;