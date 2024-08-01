private["_tcarm","_canCollectSupply"];

diag_log "TOWNMARKER: Starting town marker update loop";
_selectedCamera = KEGscameras select KEGs_cameraIdx;
diag_log format["TOWNMARKER: Selected camera: %1", _selectedCamera];

while {!gameOver} do {
    diag_log "TOWNMARKER: Starting new iteration of marker update loop";

    {
        _town = _x;
        _visible = true;
        
        _marker = Format ["WFBE_%1_CityMarker", str _town];
        diag_log format["TOWNMARKER: Processing town %1 with marker %2", _town, _marker];
        
        if (_visible) then {
            _townSupplyMissionCoolDownEnabled = _town getVariable "supplyMissionCoolDownEnabled";
            diag_log format["TOWNMARKER: Town %1 supply mission cooldown enabled: %2", _town, _townSupplyMissionCoolDownEnabled];
            
            if (!_townSupplyMissionCoolDownEnabled) then {
                _supplyValue = _town getVariable "supplyValue";
                _maxSupplyValue = _town getVariable "maxSupplyValue";
                _marker setMarkerTextLocal Format["  SV: %1/%2  [+]", _supplyValue, _maxSupplyValue];
                diag_log format["TOWNMARKER: Set regular marker for town %1. Supply: %2/%3", _town, _supplyValue, _maxSupplyValue];
            } else {
                _supplyValue = _town getVariable "supplyValue";
                _maxSupplyValue = _town getVariable "maxSupplyValue";
                _marker setMarkerTextLocal Format["  SV: %1/%2", _supplyValue, _maxSupplyValue];
                diag_log format["TOWNMARKER: Set cooldown marker for town %1. Supply: %2/%3", _town, _supplyValue, _maxSupplyValue];
            };
        } else {
            _marker setMarkerTextLocal "";
            diag_log format["TOWNMARKER: Cleared marker for town %1", _town];
        };
    
    } forEach towns;
    
    diag_log "TOWNMARKER: Finished updating all town markers";
    diag_log "TOWNMARKER: Sleeping for 5 seconds before next update";
    sleep 5;
};

diag_log "TOWNMARKER: Exiting town marker update loop";