private["_lastCommanderTeam","_changeCommander","_timer"];

commanderTeam = (cti_Client_SideJoined) Call cti_CO_FNC_GetCommanderTeam;

_lastCommanderTeam = commanderTeam;
_changeCommander = false;

while {!cti_GameOver} do {
	
	commanderTeam = (cti_Client_SideJoined) Call cti_CO_FNC_GetCommanderTeam;
	if (IsNull commanderTeam && !IsNull _lastCommanderTeam) then {_changeCommander = true};
	if (!IsNull commanderTeam && IsNull _lastCommanderTeam) then {_changeCommander = true};
	if (!isNull commanderTeam && !isNull _lastCommanderTeam) then {
		if (commanderTeam != _lastCommanderTeam) then {_changeCommander = true};
	};

	if(_changeCommander) then {
		_changeCommander = false;
		_lastCommanderTeam = commanderTeam;
		_MHQ = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQ;

		if (IsNull commanderTeam) then {
			if (!IsNull _MHQ) then {
				_MHQ RemoveAction 0;
				_MHQ RemoveAction 1;
				_MHQ RemoveAction 2;
				_MHQ RemoveAction 3;
			};
			if (!isNil "HQAction") then {player removeAction HQAction};
			if (count (hcAllGroups player) > 0) then {HCRemoveAllGroups player};
		};

		if (!isNull(commanderTeam)) then {
			if (commanderTeam == Group player) then {
				if (!IsNull _MHQ) then {
					_MHQ addAction [localize "STR_WF_Unlock_MHQ","Client\Action\Action_ToggleLock.sqf", [], 95, false, true, '', 'alive _target && (locked _target == 2)'];
					_MHQ addAction [localize "STR_WF_Lock_MHQ","Client\Action\Action_ToggleLock.sqf", [], 94, false, true, '', 'alive _target && (locked _target == 0)'];
				};
				_deployed = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQDeployStatus;
				if (_deployed) then {
					[missionNamespace getVariable "cti_C_BASE_COIN_AREA_HQ_DEPLOYED",true,MCoin] Call Compile PreprocessFile "Client\Init\Init_Coin.sqf";
				} else {
					[missionNamespace getVariable "cti_C_BASE_COIN_AREA_HQ_UNDEPLOYED",false,MCoin] Call Compile PreprocessFile "Client\Init\Init_Coin.sqf";
				};
				HQAction = leader(group player) addAction [localize "STR_WF_BuildMenu","Client\Action\Action_Build.sqf", [_MHQ], 1000, false, true, "", "hqInRange && canBuildWHQ && (_target == player)"];
				Bulldozer = leader(group player) addAction ["<t color='#504315'>" + ('Bulldozer') + "</t>","Client\Action\Action_Bulldozer.sqf", [_MHQ], 995, false, true, "", "hqInRange && canBuildWHQ && (_target == player)"];
				//BuyHQ = leader(group player) addAction ["<t color='#FF0000'>"+ "RECOVER HQ" + "  " + str (missionNameSpace getVariable 'cti_C_BASE_HQ_REPAIR_PRICE_CASH') +"$" +"</t>", "Client\Action\Action_RepairMHQDepot.sqf", [], 1, false, true, "", "(!(alive ((cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQ)))&&(leader  (cti_Client_SideJoined call cti_CO_FNC_GetCommanderTeam) == leader (vehicle player))&&(typeOf cursorTarget in ['Fort_CAmp','cti_C_DEPOT'])&&(cursorTarget distance player < 100)"];

				
				
				[Localize "STR_WF_CHAT_PlayerCommander"] Call cti_CL_FNC_TitleTextMessage;
				["INFORMATION", Format ["Player %1 has become a new commander in %2 team).", name player, side player]] Call cti_CO_FNC_LogContent;
				//player addAction ["<t color='#FF0000'>"+ "RECOVER HQ" + "  " + str (missionNameSpace getVariable 'cti_C_BASE_HQ_REPAIR_PRICE_CASH') +"$" +"</t>", "Client\Action\Action_RepairMHQDepot.sqf", [], 1001, false, true, "", "(!(alive ((cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQ)))&&(leader  (cti_Client_SideJoined call cti_CO_FNC_GetCommanderTeam) == leader (vehicle player))&&(typeOf cursorTarget in ['Fort_CAmp','cti_C_DEPOT'])&&(cursorTarget distance player < 100)"];
			} else {
				if (!isNil "HQAction") then {player removeAction HQAction};
				if (!isNil "Bulldozer") then {player removeAction Bulldozer};
				if (!isNil "BuyHQ") then {player removeAction BuyHQ};
				
				if (count (hcAllGroups player) > 0) then {HCRemoveAllGroups player};
			};
		};
	};
	
	sleep 3;
};