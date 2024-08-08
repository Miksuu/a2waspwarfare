// Prompt:
// Transform this function to use the new CommandChatMessage and SideChatMessage functions with side parameter, just like in the following functions: WFBE_CAM_FNC_Commander_Assigned, WFBE_CAM_FNC_Building_Started. It should have different sounds for each side too, for each of the items.

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

WFBE_CAM_FNC_Building_Started = {
	Private ["_building", "_localisedBuilding", "_side"];
	_building = _this select 0;
	_side = _this select 1;

	_localisedBuilding = "";

	switch (_building) do {
		case "Barracks": {
			_localisedBuilding = localize "RB_Barracks";
			if (_side == west) then {
				// playSound ["westBarracksBuildSound", true];
			} else {
				// playSound ["eastBarracksBuildSound", true];
			};
		};
		case "Light": {
			_localisedBuilding = localize "RB_Light_Factory";
			if (_side == west) then {
				// playSound ["westLightFactoryBuildSound", true];
			} else {
				// playSound ["eastLightFactoryBuildSound", true];
			};
		};
		case "CommandCenter": {
			_localisedBuilding = localize "RB_Command_Center";
			if (_side == west) then {
				// playSound ["westCommandCenterBuildSound", true];
			} else {
				// playSound ["eastCommandCenterBuildSound", true];
			};
		};
		case "Heavy": {
			_localisedBuilding = localize "RB_Heavy_Factory";
			if (_side == west) then {
				// playSound ["westHeavyFactoryBuildSound", true];
			} else {
				// playSound ["eastHeavyFactoryBuildSound", true];
			};
		};
		case "Aircraft": {
			_localisedBuilding = localize "RB_Aircraft_factory";
			if (_side == west) then {
				// playSound ["westAircraftFactoryBuildSound", true];
			} else {
				// playSound ["eastAircraftFactoryBuildSound", true];
			};
		};
		case "ServicePoint": {
			_localisedBuilding = localize "RB_Service_Point";
			if (_side == west) then {
				// playSound ["westServicePointBuildSound", true];
			} else {
				// playSound ["eastServicePointBuildSound", true];
			};
		};
		case "AARadar": {
			_localisedBuilding = localize "STR_WF_UPGRADE_AntiAirRadar";
			if (_side == west) then {
				// playSound ["westAARadarBuildSound", true];
			} else {
				// playSound ["eastAARadarBuildSound", true];
			};
		};
		default {
			_localisedBuilding = "Unknown";
		};
	};

	if (_localisedBuilding != "Unknown") then {
		["DEBUG (Client_FNC_Special.sqf)", Format ["Building: %1 for side %2", _localisedBuilding, _side]] Call WFBE_CO_FNC_LogContent;
		_message = Format[Localize "STR_WF_CHAT_Building_Started_Message_Spectator", _localisedBuilding];
		if (_side == west) then {
			[_message, _side] Call SideChatMessage;
		} else {
			[_message, _side] Call CommandChatMessage;
		};
	};
};

WFBE_CAM_FNC_Upgrade_Started = {
	Private ["_upgrade", "_level", "_side"];
	_upgrade = _this select 0;
	_level = _this select 1;
	_side = _this select 2;

	_message = Format [Localize "STR_WF_CHAT_Upgrade_Started_Message_Spectator", (missionNamespace getVariable "WFBE_C_UPGRADES_LABELS") select _upgrade, _level];
	
    // TODO: Add sound for each of the upgrades
	if (_side == west) then {
		[_message, _side] Call SideChatMessage;
		//playSound ["westUpgradeStartedSound", true];
	} else {
		[_message, _side] Call CommandChatMessage;
		//playSound ["eastUpgradeStartedSound", true];
	};
};

WFBE_CAM_FNC_Upgrade_Complete = {
	Private ["_upgrade", "_level", "_side"];
	_upgrade = _this select 0;
	_level = _this select 1;
	_side = _this select 2;

	_message = Format [Localize "STR_WF_CHAT_Upgrade_Complete_Message_Spectator", (missionNamespace getVariable "WFBE_C_UPGRADES_LABELS") select _upgrade, _level];

    // TODO: Add sound for each of the upgrades

	if (_side == west) then {
		[_message, _side] Call SideChatMessage;
		// switch (_upgrade) do {
		// 	case WFBE_UP_BARRACKS: { playSound ["westBarracksUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_LIGHT: { playSound ["westLightUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_HEAVY: { playSound ["westHeavyUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_AIR: { playSound ["westAirUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_PARATROOPERS: { playSound ["westParatroopersUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_UAV: { playSound ["westUAVUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_SUPPLYRATE: { playSound ["westSupplyRateUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_RESPAWNRANGE: { playSound ["westRespawnRangeUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_ARTYTIMEOUT: { playSound ["westArtyTimeoutUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_ICBM: { playSound ["westICBMUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_GEAR: { playSound ["westGearUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_AMMOCRATE: { playSound ["westAmmoCrateUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_EASA: { playSound ["westEASAUpgradeCompleteSound", true]; };
		// 	default { playSound ["westDefaultUpgradeCompleteSound", true]; };
		// };
	} else {
		[_message, _side] Call CommandChatMessage;
		// switch (_upgrade) do {
		// 	case WFBE_UP_BARRACKS: { playSound ["eastBarracksUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_LIGHT: { playSound ["eastLightUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_HEAVY: { playSound ["eastHeavyUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_AIR: { playSound ["eastAirUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_PARATROOPERS: { playSound ["eastParatroopersUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_UAV: { playSound ["eastUAVUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_SUPPLYRATE: { playSound ["eastSupplyRateUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_RESPAWNRANGE: { playSound ["eastRespawnRangeUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_ARTYTIMEOUT: { playSound ["eastArtyTimeoutUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_ICBM: { playSound ["eastICBMUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_GEAR: { playSound ["eastGearUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_AMMOCRATE: { playSound ["eastAmmoCrateUpgradeCompleteSound", true]; };
		// 	case WFBE_UP_EASA: { playSound ["eastEASAUpgradeCompleteSound", true]; };
		// 	default { playSound ["eastDefaultUpgradeCompleteSound", true]; };
		// };
	};
};
