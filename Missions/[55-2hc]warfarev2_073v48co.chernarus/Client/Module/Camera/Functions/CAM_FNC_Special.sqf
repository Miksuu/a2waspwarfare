WFBE_CAM_FNC_Commander_Assigned = {
    Private["_commanderTeam", "_text", "_side"];
    _commanderTeam = _this select 0;
    _side = _this select 1;
    _text = Localize "STR_WF_CHAT_AI_Commander";

    diag_log format["WFBE_CAM_FNC_Commander_Assigned: _commanderTeam = %1, _side = %2, initial _text = %3", _commanderTeam, _side, _text];

    if (!isNull _commanderTeam) then {
        _text = Format[localize "STR_WF_CHAT_VoteForNewCommander_Spectator", name (leader _commanderTeam), _side];
        diag_log format["WFBE_CAM_FNC_Commander_Assigned: Commander team not null. New _text = %1", _text];
    } else {
        _logic = _side Call WFBE_CO_FNC_GetSideLogic;
        _logic setVariable ["wfbe_commander", _commanderTeam, true];
        diag_log format["WFBE_CAM_FNC_Commander_Assigned: Commander team is null. Set wfbe_commander for %1 to %2", _side, _commanderTeam];
    };

    if (_side == west) then {
        _text Call SideChatMessage;
        diag_log format["WFBE_CAM_FNC_Commander_Assigned: West side, calling SideChatMessage with text: %1", _text];
    } else {
        _text Call CommandChatMessage;
        diag_log format["WFBE_CAM_FNC_Commander_Assigned: Not west side, calling CommandChatMessage with text: %1", _text];
    };
};