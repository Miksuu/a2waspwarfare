private["_tcarm","_units","_canCollectSupply"];

_tcarm = missionNamespace getVariable "WFBE_C_PLAYERS_MARKER_TOWN_RANGE";

diag_log "TOWNMARKER: Starting town marker update loop";

while {!gameOver} do {
	_units = (Units Group player) Call GetLiveUnits;
	diag_log format["TOWNMARKER: Found %1 live units in player's group", count _units];

	{
		_town = _x;
		_range = (_town getVariable "range") * _tcarm;
		_visible = true;
		
		// if ((_town getVariable "sideID") == sideID) then {
		// 	_visible = true;
		// 	diag_log format["TOWNMARKER: Town %1 is owned by player's side", _town];
		// } else {
		// 	{if (_town distance _x < _range) exitWith {_visible = true}} forEach _units;
		// 	if (_visible) then {
		// 		diag_log format["TOWNMARKER: Town %1 is visible to player's units", _town];
		// 	};
		// };
		
		_marker = Format ["WFBE_%1_CityMarker", str _town];
		
		if (_visible) then {
			_townSupplyMissionCoolDownEnabled = _town getVariable "supplyMissionCoolDownEnabled";
			
			if (!_townSupplyMissionCoolDownEnabled) then {
				waitUntil { !(isNil "WFBE_SK_V_Type") };
				if (WFBE_SK_V_Type == 'SpecOps') then {
					_marker setMarkerTextLocal Format["  SV: %1/%2  [+SUPPLY]",_town getVariable "supplyValue",_town getVariable "maxSupplyValue"];
					diag_log format["TOWNMARKER: Set SpecOps marker for town %1", _town];
				} else {
					_marker setMarkerTextLocal Format["  SV: %1/%2  [+]",_town getVariable "supplyValue",_town getVariable "maxSupplyValue"];
					diag_log format["TOWNMARKER: Set regular marker for town %1", _town];
				};
			} else {
				_marker setMarkerTextLocal Format["  SV: %1/%2",_town getVariable "supplyValue",_town getVariable "maxSupplyValue"];
				diag_log format["TOWNMARKER: Set cooldown marker for town %1", _town];
			};
		} else {
			_marker setMarkerTextLocal "";
			diag_log format["TOWNMARKER: Cleared marker for town %1", _town];
		};
	
	} forEach towns;
	
	diag_log "TOWNMARKER: Finished updating all town markers";
	sleep 5;
};

diag_log "TOWNMARKER: Exiting town marker update loop";