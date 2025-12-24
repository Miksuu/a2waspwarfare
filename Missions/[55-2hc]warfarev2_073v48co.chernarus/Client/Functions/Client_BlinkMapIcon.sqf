private ["_unitsFiring", "_markerColor", "_unit", "_marker", "_flashRed"];

_unit = _this select 0;
_flashRed = _this select 1;

_markerColor = _unit getVariable "OriginalMarkerColor";
    
if (_flashRed) then {
    _marker setMarkerColorLocal "ColorRed";
} else {
    _marker setMarkerColorLocal _markerColor;
};