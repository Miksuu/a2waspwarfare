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

WFBE_CAM_FNC_Town_Captured = {
    Private ["_color","_town","_townMarker","_town_side_value","_town_side_value_new","_sv"];
    _town = _this select 0;
    _town_side_value = _this select 1;
    _town_side_value_new = _this select 2;

    // _message = Format [Localize "STR_WF_CHAT_Town_Captured", _location, _sideID, _newSID];
    // [_message, _side] Call SideChatMessage;
   
    _sv = _town getVariable "supplyValue";

    //--- Make sure that the client is concerned by the capture either by capturing or having a town captured.
    // if !(WFBE_Client_SideID in [_town_side_value,_town_side_value_new]) exitWith {};

    _side_captured = (_town_side_value_new) Call WFBE_CO_FNC_GetSideFromID;

    //--- Color the town depending on the side which captured.
    _color = missionNamespace getVariable (Format ["WFBE_C_%1_COLOR", _side_captured]);
    _townMarker = Format ["WFBE_%1_CityMarker", _town];
    _townMarker setMarkerColorLocal _color;

    // Todo: add sound for each of the sides

    switch (_side_captured) do {
        case west: {
            [Format[Localize "STR_WF_CHAT_Town_Captured", _town getVariable "name", _side_captured]] Call SideChatMessage;
        };
        case east: {
            [Format[Localize "STR_WF_CHAT_Town_Captured", _town getVariable "name", _side_captured]] Call CommandChatMessage;
        };
        case resistance: {
            [Format[Localize "STR_WF_CHAT_Town_Captured", _town getVariable "name", _side_captured]] Call GroupChatMessage;
        };
    };

    //--- Display a title message.
    // _side_label = switch (_side_captured) do {case west: {localize "STR_WF_PARAMETER_Side_West"}; case east: {localize "STR_WF_PARAMETER_Side_East"}; case resistance: {localize "STR_WF_Side_Resistance"};	default {"Civilian"}};
    // [Format[Localize "STR_WF_CHAT_Town_Captured", _town getVariable "name", _side_label]] Call TitleTextMessage;

    // //--- Task.
    // _task = _town getVariable 'taskLink';
    // _ptask = currentTask player;
    // if (isNil '_task') then {_task = objNull};

    //--- Taskman
    // ["TownUpdate", _town] Spawn TaskSystem;

    // //--- Client side capture.
    // if (_town_side_value_new == WFBE_Client_SideID) then {
        //--- Retrieve the closest unit of the town.
        // _closest = [_town, (units group player) Call WFBE_CO_FNC_GetLiveUnits] Call WFBE_CO_FNC_GetClosestEntity;
        
        //--- Client reward.
        // if !(isNull _closest) then {
        //     //--- Check if the closest unit of the town in in range.
        //     _distance = _closest distance _town;
            
        //     _bonus = -1;
        //     _score = -1;
        //     if (_distance <= (missionNamespace getVariable "WFBE_C_TOWNS_CAPTURE_RANGE")) then {
        //         //--- Capture
        //         // _bonus = if (_task == _ptask) then {missionNamespace getVariable "WFBE_C_PLAYERS_BOUNTY_CAPTURE_MISSION"} else {missionNamespace getVariable "WFBE_C_PLAYERS_BOUNTY_CAPTURE"};
        //         _bonus= 150*_sv;
        //         _score = missionNamespace getVariable "WFBE_C_PLAYERS_SCORE_CAPTURE";
        //     } else {
        //         //--- Is it an assist?.
        //         if (_distance <= (missionNamespace getVariable "WFBE_C_TOWNS_CAPTURE_ASSIST")) then {
        //             //--- Assist.
        //             // _bonus = if (_task == _ptask) then {missionNamespace getVariable "WFBE_C_PLAYERS_BOUNTY_CAPTURE_MISSION_ASSIST"} else {missionNamespace getVariable "WFBE_C_PLAYERS_BOUNTY_CAPTURE_ASSIST"};
        //             _bonus= 150*_sv;
        //             _score = missionNamespace getVariable "WFBE_C_PLAYERS_SCORE_CAPTURE_ASSIST";
        //         };
        //     };
            
            //--- Update the funds if necessary.
            // if (_bonus != -1) then {
            //     (_bonus) Call WFBE_CL_FNC_ChangeClientFunds;
            //     Format[Localize "STR_WF_CHAT_Town_Captured", _town getVariable "name", _side_captured] Call CommandChatMessage; --------------------- MOVED TO UP
            // };
            
            // //--- Update the score necessary.
            // if (_score != -1) then {["RequestChangeScore", [player,score player + _score]] Call WFBE_CO_FNC_SendToServer};
        // };
        
        // //--- Commander reward (if the player is the commander)
        // if !(isNull commanderTeam) then {
        //     if (commanderTeam == group player) then {
        //         _bonus = (_town getVariable "startingSupplyValue") * (missionNamespace getVariable "WFBE_C_PLAYERS_COMMANDER_BOUNTY_CAPTURE_COEF");
        //         (_bonus) Call WFBE_CL_FNC_ChangeClientFunds;
        //         ["RequestChangeScore", [player,score player + (missionNamespace getVariable "WFBE_C_PLAYERS_COMMANDER_SCORE_CAPTURE")]] Call WFBE_CO_FNC_SendToServer;
        //         Format[Localize "STR_WF_CHAT_Commander_Bounty_Town", _bonus, _town getVariable "name"] Call CommandChatMessage;
        //     };
        // };
        
        // //--- Taskman
        // if !(isNull _task) then {
        //     if (_ptask == _task) then {
        //         // ["TownAssignClosest"] Spawn TaskSystem;
        //     };
        // };
    // };
};