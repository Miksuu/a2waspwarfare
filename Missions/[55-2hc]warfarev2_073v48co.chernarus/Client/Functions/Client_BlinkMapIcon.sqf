private ["_unitsFiring", "_markerColor", "_unit", "_marker", "_flashRed", "_blinks"];

_unit = _this select 0;
_flashRed = _this select 1;
_marker = _unit getVariable "unitMarker";
diag_log format ["Blinking icon for unit: %1", _unit];
_markerColor = _unit getVariable "OriginalMarkerColor";
_blinks = _unit getVariable "Blinks";

if (isNil "_blinks") then {
    _blinks = 0;
    _unit setVariable ["Blinks", _blinks, true];
};

if (_flashRed) then {
    _marker setMarkerColorLocal "ColorRed";
    _blinks = _blinks + 1;
    // test if variable assignment works without global flag set to true
    _unit setVariable ["Blinks", _blinks, false];
} else {
    _marker setMarkerColorLocal _markerColor;
    _blinks = _blinks + 1;
    // test if variable assignment works without global flag set to true
    _unit setVariable ["Blinks", _blinks, false];
};

if (_blinks >= (missionNamespace getVariable "WFBE_C_PLAYERS_MARKER_BLINKS")) then {
    _unit setVariable ["LFTB", false, true];
    _unit setVariable ["Blinks", 0, true];
};