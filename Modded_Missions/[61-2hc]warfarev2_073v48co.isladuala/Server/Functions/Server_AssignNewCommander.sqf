Private ["_logic", "_side", "_commander"];

_side = _this select 0;
_commander = _this select 1;
_logic = (_side) Call WFBE_CO_FNC_GetSideLogic;

// diag_log format ["Server_AssignNewCommander: Side: %1, Commander: %2, Logic: %3", _side, _commander, _logic];

//--- Notify the clients.
[_side, "HandleSpecial", ["new-commander-assigned", _commander]] Call WFBE_CO_FNC_SendToClients;
if (TOURNAMENT_MODE_ENABLED) then {
	// diag_log format ["CAM: new-commander-assigned: %1", _commander];
    [civilian, "HandleSpecialSpectators", ["cam_new-commander-assigned", _commander, _side]] Call WFBE_CO_FNC_SendToSpectators;
};

//--- Process the AI Commander FSM if it's not running.
if !(isNull _commander) then {
    if (_logic getVariable "wfbe_aicom_running") then {_logic setVariable ["wfbe_aicom_running", false]};
};