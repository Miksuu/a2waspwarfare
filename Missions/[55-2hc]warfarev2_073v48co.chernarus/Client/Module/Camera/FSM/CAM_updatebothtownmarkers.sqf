private["_tcarm","_canCollectSupply"];

diag_log "TOWNMARKER: Starting town marker update loop";
_selectedCamera = KEGscameras select KEGs_cameraIdx;
while {!gameOver} do {

	{
		_town = _x;
		_visible = true;
		
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