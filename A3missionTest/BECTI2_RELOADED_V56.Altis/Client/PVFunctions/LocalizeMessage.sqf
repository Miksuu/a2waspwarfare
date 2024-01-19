Private["_localize","_txt"];

_localize = _this select 0;
_commandChat = true;
_txt = "";
switch (_localize) do {
	case "BuildingTeamkill": {_txt = Format [Localize "STR_WF_CHAT_Teamkill_Building",_this select 1, _this select 2, [_this select 3, 'displayName'] Call cti_CO_FNC_GetConfigInfo]};
	case "Teamswap": {_txt = Format [Localize "STR_WF_CHAT_Teamswap",_this select 1, _this select 2, _this select 3, _this select 4]};
	case "Teamstack": {_txt = Format [Localize "STR_WF_CHAT_Teamstack",_this select 1, _this select 2, _this select 3, _this select 4]};
	case "CommanderDisconnected": {_txt = Localize "strwfcommanderdisconnected"};
	case "TacticalLaunch": {_txt = Localize "STR_WF_CHAT_ICBM_Launch"};
	case "Teamkill": {_txt = Format [Localize "STR_WF_CHAT_Teamkill",(missionNamespace getVariable "cti_C_PLAYERS_PENALTY_TEAMKILL")]; -(missionNamespace getVariable "cti_C_PLAYERS_PENALTY_TEAMKILL") Call cti_CL_FNC_ChangePlayerFunds};
	case "FundsTransfer": {_txt = Format [Localize "STR_WF_CHAT_FundsTransfer",_this select 1,_this select 2];_commandChat = false;};
	case "StructureSold": {_txt = Format [Localize "STR_WF_CHAT_Structure_Sold",([_this select 1,'displayName'] Call cti_CO_FNC_GetConfigInfo)]};
	case "StructureSell": {_txt = Format [Localize "STR_WF_CHAT_Structure_Sell",([_this select 1,'displayName'] Call cti_CO_FNC_GetConfigInfo),_this select 2]};
	case "SecondaryAward": {_txt = Format [Localize "STR_WF_CHAT_Secondary_Award",_this select 1, _this select 2];(_this select 2) Call cti_CL_FNC_ChangePlayerFunds};
	case "StructureTK": {_txt = Format [Localize "STR_WF_CHAT_SatchelTK",_this select 1, _this select 2, [_this select 3, 'displayName'] Call cti_CO_FNC_GetConfigInfo, _this select 4]};


    case "HeadHunterReceiveBounty":
    {
        _killer_name = _this select 1; // _killer
        _bounty = _this select 2;
        _structure_kind = _this select 3;
        _structure_side = _this select 4;

        if ((name player) == _killer_name) then
        {
            _txt = format [localize "STR_WF_HeadHunterReceiveBounty", _bounty, ([_structure_kind, "displayName"] call cti_CO_FNC_GetConfigInfo)];
            _bounty call cti_CL_FNC_ChangePlayerFunds;
            _commandChat = false;
        }
        else
        {
            if ((side player) == _structure_side) then
            {
                _txt = format [localize "STR_WF_HeadHunterReceiveBountyFriendly", _killer_name, _bounty, ([_structure_kind, "displayName"] call cti_CO_FNC_GetConfigInfo)];
            }
            else
            {
                _txt = format [localize "STR_WF_HeadHunterReceiveBountyEnemy", _killer_name, _bounty, ([_structure_kind, "displayName"] call cti_CO_FNC_GetConfigInfo)];
            };
            _commandChat = true;
        };
    };
    case "HeadHunterReceiveBountyInSupplies":{
        _side_killer = _this select 1;
        _structure_kind = _this select 2;
        _supplies_bounty = _this select 3;
        _structure_side = _this select 4;
        if (_side_killer != _structure_side) then{
            if(_supplies_bounty > 0)then{
                _txt = format [localize "STR_WF_HeadHunterReceiveSuppliesEnemy", _side_killer, _supplies_bounty, ([_structure_kind, "displayName"] call cti_CO_FNC_GetConfigInfo)];
                _commandChat = true;
            };
        }

    };

    case "BuildingKilledByError":
    {
        _structure_kind = _this select 1;
        _structure_side = _this select 2;

        if ((side player) == _structure_side) then
        {
            _txt = format [localize "STR_WF_BuildingKilledByErrorFriendly", ([_structure_kind, "displayName"] call cti_CO_FNC_GetConfigInfo)];
        }
        else
        {
            _txt = format [localize "STR_WF_BuildingKilledByErrorEnemy", ([_structure_kind, "displayName"] call cti_CO_FNC_GetConfigInfo)];
        };
        _commandChat = true;
    };
};
if (_commandChat) then {
	_txt Call cti_CL_FNC_CommandChatMessage;
} else {
	_txt Call cti_CL_FNC_GroupChatMessage;
};