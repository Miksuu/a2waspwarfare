private ["_unitsFiring", "_markerColor", "_unit", "_marker", "_flashRed", "_blinks"];

_unit = _this select 0;
_flashRed = _this select 1;
_marker = _unit getVariable "unitMarker";
_markerColor = _unit getVariable "OriginalMarkerColor";
_blinks = _unit getVariable "Blinks";

if (isNil "_blinks") then {
    _blinks = 0;
    _unit setVariable ["Blinks", 0, false];
};

if (_flashRed) then {
    _marker setMarkerColorLocal "ColorRed";    
    // test if variable assignment works without global flag set to true
    _blinks = _blinks + 1;
    _unit setVariable ["Blinks", _blinks, false];
} else {
    _marker setMarkerColorLocal _markerColor;
    _blinks = _blinks + 1;
    // test if variable assignment works without global flag set to true
    _unit setVariable ["Blinks", _blinks, false];
};

diag_log format ["Unit %1 has blinked %2 times", _unit, _blinks];
diag_log format ["_blinks: %1, _unit setVariable Blinks: %2", _blinks, (_unit getVariable "Blinks")];

if ((_unit getVariable "Blinks") > (missionNamespace getVariable "WFBE_C_PLAYERS_MARKER_BLINKS")) then {
    _unit setVariable ["LFTB", false, true];
    diag_log format ["Unit %1 has exceeded max blinks, stopping blinking. LFTB: %2", _unit, (_unit getVariable "LFTB")];
    _unit setVariable ["Blinks", 0, false];
};