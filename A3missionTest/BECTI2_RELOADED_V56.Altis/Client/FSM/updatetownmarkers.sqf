private["_tcarm","_units"];

_tcarm = missionNamespace getVariable "cti_C_PLAYERS_MARKER_TOWN_RANGE";

while {!cti_GameOver} do {
	_units = (Units Group player) Call cti_CO_FNC_GetLiveUnits;

	{
		_town = _x;
		_range = (_town getVariable "range") * _tcarm;
		_visible = false;
		if ((_town getVariable "sideID") == sideID) then {_visible = true} else {{if (_town distance _x < _range) then {_visible = true}} forEach _units};
		_marker = Format ["cti_%1_CityMarker", str _town];
		if (_visible) then {
		    _marker setMarkerTextLocal Format["%1 SV: %2/%3",_x getVariable "name", _town getVariable "supplyValue",_town getVariable "maxSupplyValue"]
		} else {
		    _marker setMarkerTextLocal (_x getVariable "name")
		};
	} forEach towns;
	sleep 5;
};