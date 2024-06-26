/*
	Client Special Handled events (HandleSpecial.sqf)
	 Scope: Client.
*/

WFBE_CL_FNC_Commander_Assigned = {
	Private["_commanderTeam","_text"];
	_commanderTeam = _this select 0;
	_text = Localize "STR_WF_CHAT_AI_Commander";

	if (!isNull _commanderTeam) then {
		_text = Format[localize "STR_WF_CHAT_VoteForNewCommander",name (leader _commanderTeam)];
		if (group player == _commanderTeam) then {_text = localize "STR_WF_CHAT_PlayerCommanderTitleText"};
	}else{
		_logic = (side group player) Call WFBE_CO_FNC_GetSideLogic;
		_logic setVariable ["wfbe_commander", _commanderTeam, true];
	};

	[_text] Call TitleTextMessage;
};


WFBE_CL_FNC_Commander_VoteEnd = {
	Private["_commanderTeam","_text"];
	_commanderTeam = _this select 0;
	_text = Localize "STR_WF_CHAT_AI_Commander";

	if (!isNull _commanderTeam) then {
		_text = Format[localize "STR_WF_CHAT_VoteForNewCommander",name (leader _commanderTeam)];
		if (group player == _commanderTeam) then {_text = localize "STR_WF_CHAT_PlayerCommanderTitleText"};
	};

	[_text] Call TitleTextMessage;
};

WFBE_CL_FNC_Commander_VoteStart = {
	Private ["_name"];
	_name = _this select 0;

	if (votePopUp) then {
		waitUntil {!isNil {WFBE_Client_Logic getVariable "wfbe_votetime"}};
		if ((WFBE_Client_Logic getVariable "wfbe_votetime") > 0 && !voted) then {
			createDialog "WFBE_VoteMenu"
		};
		if (voted) then {voted = false};
	};

	if (isMultiplayer) then {[Format[localize "STR_WF_CHAT_HasVotedForNewCommander", _name]] Call TitleTextMessage};
};

WFBE_CL_FNC_Display_ICBM = {
	Private ["_cruise", "_obj"];
	_obj = _this select 0;
	_cruise = _this select 1;

	waitUntil {!alive _cruise};

	[_obj] Spawn Nuke;
};

WFBE_CL_FNC_EndGame = {
	Private["_sideValue"];
	_sideValue = _this select 0;
	gameOver = true;
	WFBE_GameOver = true;

	(_sideValue Call WFBE_CO_FNC_GetSideFromID) ExecVM "Client\Client_EndGame.sqf";
};

WFBE_CL_FNC_HQ_SetStatus = {
	if (_this select 0) then {
		[missionNamespace getVariable "WFBE_C_BASE_COIN_AREA_HQ_DEPLOYED",true,MCoin] Call Compile preprocessFile "Client\Init\Init_Coin.sqf";
	} else {
		[missionNamespace getVariable "WFBE_C_BASE_COIN_AREA_HQ_UNDEPLOYED",false,MCoin] Call Compile preprocessFile "Client\Init\Init_Coin.sqf";
	};
};

WFBE_CL_FNC_Perform_Action = {
	Private ['_action','_from','_unit'];
	_unit = _this select 0;
	_action = _this select 1;
	_from = _this select 2;

	_unit action [_action, _from];

	switch (_action) do {
		case "EJECT": {unassignVehicle _unit};
	};
};

WFBE_CL_FNC_Reveal_UAV = {
	Private ['_marker','_size','_target','_uav'];
	_uav = _this select 0;
	_target = _this select 1;

	if (typeName _uav != 'OBJECT' || typeName _target != 'OBJECT') exitWith {["ERROR", Format ["uav-reveal: An object is expected for both parameters given (UAV: [%1]  Target: [%2]).",_uav,_target]] Call WFBE_CO_FNC_LogContent};

	_size = round((_uav distance _target) / 16);
	_marker = Format["WFBE_UAV_SPOTTED_%1",unitMarker];
	unitMarker = unitMarker + 1;
	createMarkerLocal [_marker,[(getPos _target select 0) - random(_size) + random(_size),(getPos _target select 1) - random(_size) + random(_size),0]];
	_marker setMarkerShapeLocal "Ellipse";
	_marker setMarkerColorLocal "ColorOrange";
	_marker setMarkerSizeLocal [_size,_size];

	sleep ((missionNamespace getVariable "WFBE_C_PLAYERS_UAV_SPOTTING_DELAY")*3);

	deleteMarkerLocal _marker;
};

WFBE_CL_FNC_Upgrade_Started = {
	Private ["_upgrade","_level"];
	_upgrade = _this select 0;
	_level = _this select 1;

	(Format [Localize "STR_WF_CHAT_Upgrade_Started_Message",(missionNamespace getVariable "WFBE_C_UPGRADES_LABELS") select _upgrade, _level]) Call CommandChatMessage;
};

WFBE_CL_FNC_Building_Started = {
	Private ["_building", "_localisedBuilding"];
	_building = _this select 0;

	_localisedBuilding = "";

	switch (_building) do {
		case "Barracks": {
			_localisedBuilding = localize "RB_Barracks";
			playSound ["barracksBuildSound",true];
		};
		case "Light": {
			_localisedBuilding = localize "RB_Light_Factory";
			playSound ["lightFactoryBuildSound",true];
		};
		case "CommandCenter": {
			_localisedBuilding = localize "RB_Command_Center";
			playSound ["commandCenterBuildSound",true];
		};
		case "Heavy": {
			_localisedBuilding = localize "RB_Heavy_Factory";
			playSound ["heavyFactoryBuildSound",true];
		};
		case "Aircraft": {
			_localisedBuilding = localize "RB_Aircraft_factory";
			playSound ["aircraftFactoryBuildSound",true];
		};
		case "ServicePoint": {
			_localisedBuilding = localize "RB_Service_Point";
			playSound ["servicePointBuildSound",true];
		};
		case "AARadar": {
			_localisedBuilding = localize "STR_WF_UPGRADE_AntiAirRadar";
			playSound ["aaRadarBuildSound",true];
		};
		default {
			_localisedBuilding = "Unknown";
		};
	};

	if (_localisedBuilding != "Unknown") then {
		["DEBUG (Client_FNC_Special.sqf)", Format ["Building: %1", _localisedBuilding]] Call WFBE_CO_FNC_LogContent;
		Format[Localize "STR_WF_CHAT_Building_Started_Message", _localisedBuilding] Call CommandChatMessage;
	};
};

WFBE_CL_FNC_Upgrade_Complete = {
	Private ["_upgrade","_level"];
	_upgrade = _this select 0;
	_level = _this select 1;

	(Format [Localize "STR_WF_CHAT_Upgrade_Complete_Message",(missionNamespace getVariable "WFBE_C_UPGRADES_LABELS") select _upgrade, _level]) Call CommandChatMessage;

	if !(isNull commanderTeam) then { //--- Commander reward (if the player is the commander)
		if (commanderTeam == group player) then {
			["RequestChangeScore", [player, score player + (missionNamespace getVariable "WFBE_C_PLAYERS_COMMANDER_SCORE_UPGRADE")]] Call WFBE_CO_FNC_SendToServer;
		};
	};
};