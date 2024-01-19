Private['_args', '_request'];

_request = _this select 0;
_args = +_this;
_args deleteAt 0; //--- Strip the action request from the arguments.

switch (_request) do {
	case "action-perform": {_args spawn cti_CL_FNC_Perform_Action};
	case "commander-vote": {_args spawn cti_CL_FNC_Commander_VoteEnd};
	case "commander-vote-start": {_args spawn cti_CL_FNC_Commander_VoteStart};
	case "new-commander-assigned": {_args spawn cti_CL_FNC_Commander_Assigned};
	case "delegate-ai": {_args spawn cti_CL_FNC_DelegateAI};
	case "delegate-ai-static-defence": {_args spawn cti_CL_FNC_DelegateAIStaticDefence};
	case "endgame": {_args spawn cti_CL_FNC_EndGame};
	case "hq-setstatus": {_args spawn cti_CL_FNC_HQ_SetStatus};
	case "icbm-display": {_args spawn cti_CL_FNC_Display_ICBM};
	case "join-answer": {missionNamespace setVariable ['cti_P_CANJOIN', (_args select 0)]};
	case "uav-reveal": {_args spawn cti_CL_FNC_Reveal_UAV};
	case "upgrade-started": {_args spawn cti_CL_FNC_Upgrade_Started};
	case "upgrade-complete": {_args spawn cti_CL_FNC_Upgrade_Complete};
	case "set-hq-killed-eh": {if !(isServer) then {(_args select 0) addEventHandler ["killed", {
								["process-killed-hq", _this] remoteExecCall ["cti_SE_PVF_RequestSpecial",2]
							}]};};
	case "auto-wall-constructing-changed":{ isAutoWallConstructingEnabled = (_args select 0);};
	case "set-hq-lock-unlock-actions":{
        if !(isServer) then {
            if (!isNull(commanderTeam)) then {
            	if (commanderTeam == Group player) then {
            	    (_args select 0) addAction [localize "STR_WF_Unlock_MHQ","Client\Action\Action_ToggleLock.sqf", [], 95, false, true, '', 'alive _target && (locked _target == 2)'];
                    (_args select 0) addAction [localize "STR_WF_Lock_MHQ","Client\Action\Action_ToggleLock.sqf", [], 94, false, true, '', 'alive _target && (locked _target == 0)'];
            	};
            };
        };
    };
};