private ["_unitsFiring", "_markerColor", "_unit", "_marker"];

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