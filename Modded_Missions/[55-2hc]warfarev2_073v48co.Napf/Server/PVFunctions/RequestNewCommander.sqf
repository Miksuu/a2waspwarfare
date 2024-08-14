Private["_commanderTeam","_logik","_name","_side","_team"];

_side = _this select 0;
_assigned_commander = _this select 1;

//diag_log format ["RequestNewCommander: Received parameters - Side: %1, Assigned Commander: %2", _side, _assigned_commander];

_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

//diag_log format ["RequestNewCommander: Side Logic obtained - %1", _logik];

if ((_logik getVariable "wfbe_votetime") <= 0) then {
	_team = -1;

	//diag_log format ["RequestNewCommander: Vote time is 0 or less, proceeding with commander assignment"];

	//--- Set the commander
	_logik setVariable ["wfbe_commander", _assigned_commander, true];
	//diag_log format ["RequestNewCommander: Set new commander for %1 side: %2", _side, _assigned_commander];

	[_side, _assigned_commander] Spawn WFBE_SE_FNC_AssignForCommander;
	//diag_log format ["RequestNewCommander: Spawned WFBE_SE_FNC_AssignForCommander with parameters - Side: %1, Assigned Commander: %2", _side, _assigned_commander];

	[_side, "HandleSpecial", ["new-commander-assigned", _assigned_commander]] Call WFBE_CO_FNC_SendToClients;
	//diag_log format ["RequestNewCommander: Sent 'new-commander-assigned' message to clients - Side: %1, Assigned Commander: %2", _side, _assigned_commander];

};

//diag_log "RequestNewCommander: Function execution completed";