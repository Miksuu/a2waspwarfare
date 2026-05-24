private["_marker","_perfDistanceChecks","_perfStart","_perfTextWrites","_perfTowns","_perfUnits","_perfVisible","_range","_tcarm","_town","_townSupplyMissionCoolDownEnabled","_units","_visible","_canCollectSupply"];

_tcarm = missionNamespace getVariable "WFBE_C_PLAYERS_MARKER_TOWN_RANGE";

while {!gameOver} do {
	// Marty: Performance Audit timing for local town marker visibility and text refresh.
	_perfStart = diag_tickTime;
	_perfTowns = 0;
	_perfVisible = 0;
	_perfTextWrites = 0;
	_perfDistanceChecks = 0;
	_units = (Units Group player) Call GetLiveUnits;
	_perfUnits = count _units;

	{
	
		_town = _x;
		_perfTowns = _perfTowns + 1;
		_range = (_town getVariable "range") * _tcarm;
		_visible = false;
		
		if ((_town getVariable "sideID") == sideID) then {_visible = true} else {{_perfDistanceChecks = _perfDistanceChecks + 1;if (_town distance _x < _range) then {_visible = true}} forEach _units};
		_marker = Format ["WFBE_%1_CityMarker", str _town];
		
		if (_visible) then {
			_perfVisible = _perfVisible + 1;

			_townSupplyMissionCoolDownEnabled = _town getVariable "supplyMissionCoolDownEnabled";
			
			if (!_townSupplyMissionCoolDownEnabled) then {
				waitUntil { !(isNil "WFBE_SK_V_Type") };
				if (WFBE_SK_V_Type == 'SpecOps') then {
					_marker setMarkerTextLocal Format["  SV: %1/%2  [+SUPPLY]",_town getVariable "supplyValue",_town getVariable "maxSupplyValue"];
					_perfTextWrites = _perfTextWrites + 1;
				} else {
					_marker setMarkerTextLocal Format["  SV: %1/%2  [+]",_town getVariable "supplyValue",_town getVariable "maxSupplyValue"];
					_perfTextWrites = _perfTextWrites + 1;
				};
			} else {
				_marker setMarkerTextLocal Format["  SV: %1/%2",_town getVariable "supplyValue",_town getVariable "maxSupplyValue"];
				_perfTextWrites = _perfTextWrites + 1;
			};
		} else {_marker setMarkerTextLocal "";_perfTextWrites = _perfTextWrites + 1};
	
	} forEach towns;

	if !(isNil "PerformanceAudit_Record") then {
		["updatetownmarkers", diag_tickTime - _perfStart, Format["towns:%1;groupUnits:%2;visible:%3;textWrites:%4;distanceChecks:%5;map:%6;gps:%7", _perfTowns, _perfUnits, _perfVisible, _perfTextWrites, _perfDistanceChecks, visibleMap, shownGPS], "CLIENT"] Call PerformanceAudit_Record;
	};
	
	sleep 5;
};
