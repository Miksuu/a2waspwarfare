/*
	Send a PVF to spectators.
	Parameters:
		- Spectator PVF.
*/

Private ["_func", "_pvf"];

_pvf = _this;
// diag_log format ["CAM_SendToSpectators: _pvf = %1", _pvf];

_func = _pvf select 1;
// diag_log format ["CAM_SendToSpectators: _func = %1", _func];

_pvf set [1, Format["CAMFNC%1", _func]];
// diag_log format ["CAM_SendToSpectators: _pvf after modification = %1", _pvf];

if (!isHostedServer) then {
	// diag_log "CAM_SendToSpectators: Not hosted server, compiling and publishing variable";
	Call Compile Format ["WFBE_PVF_SPEC_%1 = _pvf; publicVariable 'WFBE_PVF_SPEC_%1';", _func];
	// diag_log format ["CAM_SendToSpectators: Published variable WFBE_PVF_SPEC_%1", _func];
} else {
	// diag_log "CAM_SendToSpectators: Hosted server, spawning WFBE_CL_FNC_HandlePVF";
	_pvf Spawn WFBE_CL_FNC_HandlePVF;
	if (isMultiplayer) then {
		// diag_log "CAM_SendToSpectators: Multiplayer detected, compiling and publishing variable";
		Call Compile Format ["WFBE_PVF_SPEC_%1 = _pvf; publicVariable 'WFBE_PVF_SPEC_%1';", _func];
		// diag_log format ["CAM_SendToSpectators: Published variable WFBE_PVF_SPEC_%1", _func];
	};
};
// diag_log "CAM_SendToSpectators: Function completed";