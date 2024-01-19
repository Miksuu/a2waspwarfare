if (!isServer || time > 30) exitWith {
	diag_log Format["[WFBE (WARNING)][frameno:%1 | ticktime:%2] Init_Server: The server initialization cannot be called more than once.",diag_frameno,diag_tickTime]
};

["INITIALIZATION", Format ["Init_Server.sqf: Server initialization begins at [%1]", time]] Call cti_CO_FNC_LogContent;

//--- Allow resistance and civilian group to be spawned without a placeholder.
createCenter resistance;
createCenter civilian;

//--- MAke res forces not friendly to all playable sides.
resistance setFriend [west,0];
resistance setFriend [east,0];
resistance setFriend [civilian,1];
civilian setFriend [west, 0];
civilian setFriend [east, 0];
civilian setFriend [resistance, 1];

//--- Check AI set

if ((missionNamespace getVariable "cti_C_AI_SYSTEM") == 2) then {
GLX_Path = "GLX_System\";
execVM (GLX_Path+"GLX_Initialize.sqf");

};



/*
//hc part
//--- Client Functions.
cti_CL_FNC_DelegateTownAI = Compile preprocessFileLineNumbers "Client\Functions\Client_DelegateTownAI.sqf";
cti_CL_FNC_DelegateAI = Compile preprocessFileLineNumbers "Client\Functions\Client_DelegateAI.sqf";
cti_CL_FNC_DelegateBasePatrolAI = Compile preprocessFileLineNumbers "Client\Functions\Client_DelegateBasePatrolAI.sqf";
cti_CL_FNC_DelegateAIStaticDefence = Compile preprocessFileLineNumbers "Client\Functions\Client_DelegateAIStaticDefence.sqf";
cti_CL_FNC_HandleSpecial = Compile preprocessFileLineNumbers "Client\PVFunctions\HandleSpecial.sqf";
cti_CL_FNC_GetSideID = Compile preprocessFileLineNumbers "Common\Functions\Common_GetSideID.sqf";
*/




// PVF
cti_SE_PVF_RequestVehicleLock = Compile preprocessFileLineNumbers "Server\PVFunctions\RequestVehicleLock.sqf";
cti_SE_PVF_RequestChangeScore = Compile preprocessFileLineNumbers "Server\PVFunctions\RequestChangeScore.sqf";
cti_SE_PVF_RequestCommanderVote = Compile preprocessFileLineNumbers "Server\PVFunctions\RequestCommanderVote.sqf";
cti_SE_PVF_RequestNewCommander = Compile preprocessFileLineNumbers "Server\PVFunctions\RequestNewCommander.sqf";
cti_SE_PVF_RequestStructure = Compile preprocessFileLineNumbers "Server\PVFunctions\RequestStructure.sqf";
cti_SE_PVF_RequestDefense = Compile preprocessFileLineNumbers "Server\PVFunctions\RequestDefense.sqf";
cti_SE_PVF_RequestJoin = Compile preprocessFileLineNumbers "Server\PVFunctions\RequestJoin.sqf";
cti_SE_PVF_RequestMHQRepair = Compile preprocessFileLineNumbers "Server\PVFunctions\RequestMHQRepair.sqf";
cti_SE_PVF_RequestSpecial = Compile preprocessFileLineNumbers "Server\PVFunctions\RequestSpecial.sqf";
cti_SE_PVF_RequestTeamUpdate = Compile preprocessFileLineNumbers "Server\PVFunctions\RequestTeamUpdate.sqf";
cti_SE_PVF_RequestUpgrade = Compile preprocessFileLineNumbers "Server\PVFunctions\RequestUpgrade.sqf";
cti_SE_PVF_RequestAutoWallConstructinChange = Compile preprocessFileLineNumbers "Server\PVFunctions\RequestAutoWallConstructinChange.sqf";
// END OF PVF

cti_SE_FNC_AIMoveTo = Compile preprocessFile "Server\AI\Orders\AI_MoveTo.sqf";
cti_SE_FNC_AIPatrol = Compile preprocessFile "Server\AI\Orders\AI_Patrol.sqf";
cti_SE_FNC_AITownPatrol = Compile preprocessFile "Server\AI\Orders\AI_TownPatrol.sqf";
cti_SE_FNC_AIWPAdd = Compile preprocessFile "Server\AI\Orders\AI_WPAdd.sqf";
cti_SE_FNC_AIWPRemove = Compile preprocessFile "Server\AI\Orders\AI_WPRemove.sqf";
cti_SE_FNC_BuildingDamaged = Compile preprocessFile "Server\Functions\Server_BuildingDamaged.sqf";
cti_SE_FNC_BuildingHandleDamages = Compile preprocessFile "Server\Functions\Server_BuildingHandleDamages.sqf";
cti_SE_FNC_BuildingKilled = Compile preprocessFile "Server\Functions\Server_BuildingKilled.sqf";
cti_SE_FNC_CanUpdateTeam = Compile preprocessFile "Server\Functions\Server_CanUpdateTeam.sqf";
cti_SE_FNC_ChangeAICommanderFunds = Compile preprocessFile "Server\Functions\Server_ChangeAICommanderFunds.sqf";
cti_SE_FNC_ConstructDefense = Compile preprocessFile "Server\Construction\Construction_StationaryDefense.sqf";
cti_SE_FNC_CreateDefenseTemplate = Compile preprocessFile "Server\Functions\Server_CreateDefenseTemplate.sqf";
cti_SE_FNC_GetAICommanderFunds = Compile preprocessFile "Server\Functions\Server_GetAICommanderFunds.sqf";
cti_SE_FNC_HandleBuildingDamage = Compile preprocessFile "Server\Functions\Server_HandleBuildingDamage.sqf";
cti_SE_FNC_HandleDefense = Compile preprocessFile "Server\Functions\Server_HandleDefense.sqf";
cti_SE_FNC_HandleSpecial = Compile preprocessFile "Server\Functions\Server_HandleSpecial.sqf";
cti_SE_FNC_MHQRepair = Compile preprocessFile "Server\Functions\Server_MHQRepair.sqf";
cti_SE_FNC_SideMessage = Compile preprocessFile "Server\Functions\Server_SideMessage.sqf";
cti_SE_FNC_SetTownPatrols = compile preprocessfilelinenumbers "Server\FSM\server_patrols.sqf";
cti_SE_FNC_UpdateTeam = Compile preprocessFile "Server\Functions\Server_UpdateTeam.sqf";

//--- Support Functions.
KAT_ParaAmmo = Compile preprocessFile "Server\Support\Support_ParaAmmo.sqf";
KAT_Paratroopers = Compile preprocessFile "Server\Support\Support_Paratroopers.sqf";
KAT_ParaVehicles = Compile preprocessFile "Server\Support\Support_ParaVehicles.sqf";
KAT_UAV = Compile preprocessFile "Server\Support\Support_UAV.sqf";

cti_SE_FNC_AI_SetTownAttackPath = Compile preprocessFileLineNumbers "Server\Functions\Server_AI_SetTownAttackPath.sqf";
cti_SE_FNC_AI_SetTownAttackPath_PathIsSafe = Compile preprocessFileLineNumbers "Server\Functions\Server_AI_SetTownAttackPath_PathIsSafe.sqf";
cti_SE_FNC_AI_SetTownAttackPath_PosIsSafe = Compile preprocessFileLineNumbers "Server\Functions\Server_AI_SetTownAttackPath_PosIsSafe.sqf";
cti_SE_FNC_AI_Com_Upgrade = Compile preprocessFileLineNumbers "Server\Functions\Server_AI_Com_Upgrade.sqf";
cti_SE_FNC_GetTownGroups = Compile preprocessFileLineNumbers "Server\Functions\Server_GetTownGroups.sqf";
cti_SE_FNC_GetTownGroupsDefender = Compile preprocessFileLineNumbers "Server\Functions\Server_GetTownGroupsDefender.sqf";
cti_SE_FNC_GetTownPatrol = Compile preprocessFileLineNumbers "Server\Functions\Server_GetTownPatrol.sqf";
cti_SE_FNC_HandleEmptyVehicle = Compile preprocessFileLineNumbers "Server\Functions\Server_HandleEmptyVehicle.sqf";
cti_SE_FNC_HandlePVF = Compile preprocessFileLineNumbers "Server\Functions\Server_HandlePVF.sqf";
cti_SE_FNC_ManageTownDefenses = Compile preprocessFileLineNumbers "Server\Functions\Server_ManageTownDefenses.sqf";
cti_SE_FNC_OnHQKilled = Compile preprocessFileLineNumbers "Server\Functions\Server_OnHQKilled.sqf";
cti_SE_FNC_OperateTownDefensesUnits = Compile preprocessFileLineNumbers "Server\Functions\Server_OperateTownDefensesUnits.sqf";
cti_SE_FNC_ProcessUpgrade = Compile preprocessFileLineNumbers "Server\Functions\Server_ProcessUpgrade.sqf";
cti_SE_FNC_SetCampsToSide = Compile preprocessFileLineNumbers "Server\Functions\Server_SetCampsToSide.sqf";
//unused
//cti_SE_FNC_SetLocalityOwner = Compile preprocessFileLineNumbers "Server\Functions\Server_SetLocalityOwner.sqf";

cti_SE_FNC_SpawnTownDefense = Compile preprocessFileLineNumbers "Server\Functions\Server_SpawnTownDefense.sqf";
cti_SE_FNC_VoteForCommander = Compile preprocessFileLineNumbers "Server\Functions\Server_VoteForCommander.sqf";
cti_SE_FNC_AssignForCommander = Compile preprocessFileLineNumbers "Server\Functions\Server_AssignNewCommander.sqf";
cti_SE_FNC_CreateObjectsFromArray = Compile preprocessFileLineNumbers "Server\Functions\Server_CreateObjectsFromArray.sqf";
//cti_SE_FNC_Server_RunWeatherEnvironment = Compile preprocessFileLineNumbers "Server\Functions\Server_RunWeatherEnvironment.sqf";

cti_SE_FNC_Server_Construction_HQSite = Compile preprocessFileLineNumbers "Server\Construction\Construction_HQSite.sqf";
cti_SE_FNC_Server_Construction_MediumSite = Compile preprocessFileLineNumbers "Server\Construction\Construction_MediumSite.sqf";
cti_SE_FNC_Server_Construction_SmallSite = Compile preprocessFileLineNumbers "Server\Construction\Construction_SmallSite.sqf";

cti_SE_FNC_Server_ResBuyUnit = Compile preprocessFile "Server\Functions\Server_ResBuyUnit.sqf";

//--- Define Headless Client functions (server ones).
cti_SE_FNC_DelegateAITownHeadless = Compile preprocessFileLineNumbers "Server\Functions\Server_DelegateAITownHeadless.sqf";
cti_SE_FNC_DelegateAIHeadless = Compile preprocessFileLineNumbers "Server\Functions\Server_DelegateAIHeadless.sqf";
cti_SE_FNC_DelegateAIStaticDefenceHeadless = Compile preprocessFileLineNumbers "Server\Functions\Server_DelegateAIStaticDefenceHeadless.sqf";


if ((missionNamespace getVariable "cti_C_RESISTANCE_BASES_SWITCH") == 1) then {

cti_SE_FNC_CreateBaseComposition = Compile preprocessFileLineNumbers "Server\Functions\Server_CreateBaseComposition.sqf";
cti_SE_FNC_ManningOfResBaseDefense = Compile preprocessFileLineNumbers "Server\Functions\Server_ManningOfResBaseDefense.sqf";
cti_SE_FNC_InitResLight = Compile preprocessFileLineNumbers "Server\FSM\server_init_res_light.sqf";
cti_SE_FNC_InitResHeavy = Compile preprocessFileLineNumbers "Server\FSM\server_init_res_heavy.sqf";
cti_SE_FNC_InitResAir = Compile preprocessFileLineNumbers "Server\FSM\server_init_res_air.sqf";
cti_SE_FNC_ResVehTeam = Compile preprocessFileLineNumbers "Server\FSM\res_veh_team.sqf";
cti_SE_FNC_ResTeam = Compile preprocessFileLineNumbers "Server\FSM\res_team.sqf";

};


//--- Headless Clients.
missionNamespace setVariable ["cti_HEADLESSCLIENTS_ID", []];


//--- create custom radio channels




if (isServer) then
{
	 
radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "RU TEAM 1", "%UNIT_NAME", [OTeamleader1,OMedic1,OEngineer1,OSpecOps1,OMachinegunner1_1,OMachinegunner1_2]];
radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "RU TEAM 2", "%UNIT_NAME", [OTeamleader2,OMedic2,OEngineer2,OSpecOps2,OMachinegunner2_1,OMachinegunner2_2]];
radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "RU TEAM 3", "%UNIT_NAME", [OTeamleader3,OMedic3,OEngineer3,OSpecOps3,OMachinegunner3_1,OMachinegunner3_2]];
radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "RU TEAM 4", "%UNIT_NAME", [OTeamleader4,OMedic4,OEngineer4,OSpecOps4,OMachinegunner4_1,OMachinegunner4_2]];
radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "RU TEAM 5", "%UNIT_NAME", [OTeamleader5,OMedic5,OEngineer5,OSpecOps5,OMachinegunner5_1,OMachinegunner5_2]];
	
radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "US TEAM 1", "%UNIT_NAME", [BTeamleader1,BMedic1,BEngineer1,BSpecOps1,BMachinegunner1_1,BMachinegunner1_2]];
radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "US TEAM 2", "%UNIT_NAME", [BTeamleader2,BMedic2,BEngineer2,BSpecOps2,BMachinegunner2_1,BMachinegunner2_2]];
radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "US TEAM 3", "%UNIT_NAME", [BTeamleader3,BMedic3,BEngineer3,BSpecOps3,BMachinegunner3_1,BMachinegunner3_2]];
radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "UK TEAM 1", "%UNIT_NAME", [BTeamleader4,BMedic4,BEngineer4,BSpecOps4,BMachinegunner4_1,BMachinegunner4_2]];
radioChannelCreate [[0.96, 0.34, 0.13, 0.8], "UK TEAM 2", "%UNIT_NAME", [BTeamleader5,BMedic5,BEngineer5,BSpecOps5,BMachinegunner5_1,BMachinegunner5_2]];
	


	//if (_channelID == 0) exitWith {diag_log format ["Custom channel '%1' creation failed!", _channelName]};
	//[_channelID, {_this radioChannelAdd [player]}] remoteExec ["call", [0, -2] select isDedicated, _channelName];
};






//--- Server Init is now complete.
serverInitComplete = true;
["INITIALIZATION", "Init_Server.sqf: Functions are loaded."] Call cti_CO_FNC_LogContent;

//--- Getting all locations.
startingLocations = [0,0,0] nearEntities ["LocationArea_F", 100000];
["INITIALIZATION", "Init_Server.sqf: Initializing starting locations."] Call cti_CO_FNC_LogContent;

//--- Waiting for the common part to be executed.
waitUntil {commonInitComplete && townInit};


//--- Side logics.
_present_west = missionNamespace getVariable "cti_WEST_PRESENT";
_present_east = missionNamespace getVariable "cti_EAST_PRESENT";
_present_res = missionNamespace getVariable "cti_GUER_PRESENT";

[] Call Compile preprocessFile 'Server\Init\Init_Defenses.sqf';

//--- Weather.
[] spawn cti_SE_FNC_Server_RunWeatherEnvironment;
if(cti_C_ENVIRONMENT_WEATHER_SNOWFLAKES > 0) then {
	null = [80,660,false,0,false,true,true,false,false,false] spawn cti_SE_FNC_Server_AL_SNOW;
};

["INITIALIZATION", "Init_Server.sqf: Weather module is loaded."] Call cti_CO_FNC_LogContent;

//--- Static defenses groups in main towns.
{
	missionNamespace setVariable [Format ["cti_%1_DefenseTeam", _x], createGroup [_x, true]];
	(missionNamespace getVariable Format ["cti_%1_DefenseTeam", _x]) setVariable ["cti_persistent", true];
} forEach [west,east,resistance];

//--- Select whether the spawn restriction is enabled or not.
_locationLogics = [];
if ((missionNamespace getVariable "cti_C_BASE_START_TOWN") > 0) then {
	{
		_nearLogics = _x nearEntities[["LocationArea_F"],2000];
		if (count _nearLogics > 0) then {{if !(_x in _locationLogics) then {_locationLogics pushBack _x;}} forEach _nearLogics};
	} forEach towns;
	if (count _locationLogics < 3) then {_locationLogics = startingLocations;};
	["INITIALIZATION", Format ["Init_Server.sqf: Spawn locations were refined [%1].",count _locationLogics]] Call cti_CO_FNC_LogContent;
} else {
	_locationLogics = startingLocations;
};

WF_Logic setVariable ["cti_spawnpos", _locationLogics];

Private ["_i", "_maxAttempts", "_minDist", "_rPosE", "_rPosW", "_setEast", "_setGuer", "_setWest", "_startE", "_startW"];
_i = 0;
_maxAttempts = 2000;
_minDist = missionNamespace getVariable 'cti_C_BASE_STARTING_DISTANCE';
_startW = [0,0,0];
_startE = [0,0,0];
_rPosW = [0,0,0];
_rPosE = [0,0,0];
_setWest = if (_present_west) then {true} else {false};
_setEast = if (_present_east) then {true} else {false};
_setGuer = if (_present_res) then {true} else {false};
_total = count _locationLogics;

_use_random = false;

_spawn_north = objNull;
_spawn_south = objNull;
_spawn_central = objNull;
_skip_w = false;
_skip_e = false;
{
	if (!isNil {_x getVariable "cti_spawn"}) then {
		switch (_x getVariable "cti_spawn") do {
			case "north": {_spawn_north = _x;};
			case "south": {_spawn_south = _x;};
			case "central": {_spawn_central = _x;};
		};
	};
} forEach startingLocations;

switch (missionNamespace getVariable "cti_C_BASE_STARTING_MODE") do {
	case 0: {
		//--- West north, east south.
		if (isNull _spawn_north || isNull _spawn_south) then {
			_use_random = true;
		} else {
			_startE = _spawn_south;
			_startW = _spawn_north;
			if (cti_ISTHREEWAY) then {_skip_w = true; _skip_e = true; _setWest = false; _setEast = false; _use_random = true;};
		};
	};
	case 1: {
		//--- West south, east north.
		if (isNull _spawn_north || isNull _spawn_south) then {
			_use_random = true;
		} else {
			_startE = _spawn_north;
			_startW = _spawn_south;
			if (cti_ISTHREEWAY) then {_skip_w = true; _skip_e = true; _setWest = false; _setEast = false; _use_random = true;};
		};
	};
	case 2: {
		_use_random = true;
	};
};

if (_use_random) then {
	while {true} do {
		if (!_setWest && !_setEast && !_setGuer) exitWith {["INITIALIZATION", "Init_Server.sqf : All sides were placed [Random]."] Call cti_CO_FNC_LogContent};

		//--- Determine west starting location if necessary.
		if (_setWest) then {
			_rPosW = _locationLogics select floor(random _total);
			if (_rPosW distance _startE > _minDist) then {_startW = _rPosW; _setWest = false;};
		};

		// --- Determine west starting location if necessary.
		if (_setEast) then {
			_rPosE = _locationLogics select floor(random _total);
			if (_rPosE distance _startW > _minDist) then {_startE = _rPosE; _setEast = false;};
		};

		_i = _i + 1;

		if (_i >= _maxAttempts) exitWith {
			//--- Get the default locations.
			Private ["_eastDefault", "_westDefault"];
			_eastDefault = objNull;
			_westDefault = objNull;

			{
				if (!isNil {_x getVariable "cti_default"}) then {
					switch (_x getVariable "cti_default") do {
						case west: {_westDefault = _x;};
						case east: {_eastDefault = _x;};
					};
				};
			} forEach startingLocations;

			// --- Ensure that everything is set, otherwise we randomly set the spawn.
			if (isNull _eastDefault || isNull _westDefault) then {
				Private ["_tempWork"];
				_tempWork = +(startingLocations) - [_westDefault, _eastDefault];
				if (isNull _eastDefault && _present_east) then {_eastDefault = _tempWork select floor(random _total); _tempWork = _tempWork - [_eastDefault];};
				if (isNull _westDefault && _present_west) then {_westDefault = _tempWork select floor(random _total); _tempWork = _tempWork - [_westDefault];};
			};

			if (_present_east && !_skip_e) then {_startE = _eastDefault;};
			if (_present_west && !_skip_w) then {_startW = _westDefault;};

			["INITIALIZATION", "Init_Server.sqf : All sides were placed by force after that the attempts limit was reached."] Call cti_CO_FNC_LogContent;
		};
	};
};

["INITIALIZATION", Format ["Init_Server.sqf: Starting location mode is on [%1].",missionNamespace getVariable "cti_C_BASE_STARTING_MODE"]] Call cti_CO_FNC_LogContent;

emptyQueu = [];

//--- Global sides initialization.
{
	Private["_side","_wasptmpFun"];
	_side = _x select 1;
	_wasptmpFun = compile preprocessFile "Wasp\unsort\StartVeh.sqf";
	//--- Only use those variable if the side logic is present in the editor.
	if (_x select 0) then {
		_pos = _x select 2;
		_logik = (_side) Call cti_CO_FNC_GetSideLogic;
		_sideID = (_side) Call cti_CO_FNC_GetSideID;

		//--- HQ init.
		_hq = [missionNamespace getVariable Format["cti_%1MHQNAME", _side], [1,1,1], _sideID, getDir _pos, true, false, true] Call cti_CO_FNC_CreateVehicle;
		
		_hq  spawn {_this allowDamage false; sleep 10; _this allowDamage true};
		_hq setPos (getPos _pos);
		_hq setVariable ["cti_Taxi_Prohib", true];
		_hq setVariable ["cti_side", _side];
		_hq setVariable ["cti_trashable", false];
		_hq setVariable ["cti_structure_type", "Headquarters"];
		_hq addEventHandler ['killed', {_this Spawn cti_SE_FNC_OnHQKilled}];
		_hq addEventHandler ["hit",{_this Spawn cti_SE_FNC_BuildingDamaged}];
       
		//--- HQ Friendly Fire handler.
		_hq addEventHandler ['handleDamage',{[_this select 0,_this select 2,_this select 3] Call BuildingHandleDamages}];

		//--- Get upgrade clearance for side.
		_clearance = missionNamespace getVariable "cti_C_GAMEPLAY_UPGRADES_CLEARANCE";
		_upgrades = false;
		if (_clearance != 0) then {
			_upgrades = switch (true) do {
				case (_clearance in [1,4,5,7] && _side == west): {true};
				case (_clearance in [2,4,6,7] && _side == east): {true};
				case (_clearance in [3,5,6,7] && _side == resistance): {true};
				default {false};
			};
		};

		if !(_upgrades) then {
			_upgrades = [];
			for '_i' from 0 to count(missionNamespace getVariable Format["cti_C_UPGRADES_%1_LEVELS", _side])-1 do {_upgrades pushBack 0};
		} else {
			_upgrades = missionNamespace getVariable Format["cti_C_UPGRADES_%1_LEVELS", _side];
		};

		//--- Logic init.
		_logik setVariable ["cti_commander", objNull, true];
		_logik setVariable ["cti_hq", _hq, true];
		_logik setVariable ["cti_hq_deployed", false, true];
		_logik setVariable ["cti_hq_repair_count", 1, true];
		_logik setVariable ["cti_hq_repairing", false, true];
		_logik setVariable ["cti_startpos", _pos, true];
		_logik setVariable ["cti_structure_lasthit", 0];
		_logik setVariable ["cti_structures", [], true];
		_logik setVariable ["cti_aicom_running", false];
		_logik setVariable ["cti_aicom_funds", round((missionNamespace getVariable Format ['cti_C_ECONOMY_FUNDS_START_%1', _side])*1.5)];
		_logik setVariable ["cti_upgrades", _upgrades, true];
		_logik setVariable ["cti_upgrading", false, true];
		_logik setVariable ["cti_votetime", missionNamespace getVariable "cti_C_GAMEPLAY_VOTE_TIME", true];
		_logik setVariable ["cti_hqinuse",false];

		WF_Logic setVariable [Format["%1UnitsCreated",_side],0,true];
		WF_Logic setVariable [Format["%1Casualties",_side],0,true];
		WF_Logic setVariable [Format["%1VehiclesCreated",_side],0,true];
		WF_Logic setVariable [Format["%1VehiclesLost",_side],0,true];

		//--- Parameters specific.
		if ((missionNamespace getVariable "cti_C_BASE_AREA") > 0) then {_logik setVariable ["cti_basearea", [], true]};
		
		_logik setVariable ["cti_supply", missionNamespace getVariable Format ["cti_C_ECONOMY_SUPPLY_START_%1", _side], true];
		//_logik setVariable ["cti_commander_percent", if ((missionNamespace getVariable "cti_C_ECONOMY_INCOME_PERCENT_MAX") >= 50 && (missionNamespace getVariable "cti_C_ECONOMY_INCOME_PERCENT_MAX") <= 100) then {missionNamespace getVariable "cti_C_ECONOMY_INCOME_PERCENT_MAX"} else {100}, true];
		missionNamespace setVariable ["cti_commander_percent", if ((missionNamespace getVariable "cti_C_ECONOMY_INCOME_PERCENT_MAX") >= 50 && (missionNamespace getVariable "cti_C_ECONOMY_INCOME_PERCENT_MAX") <= 100) then { missionNamespace getVariable "cti_C_ECONOMY_INCOME_PERCENT_MAX"} else {100}, true];
		

		//--- Structures limit (live).
		_str = [];
		for '_i' from 0 to count(missionNamespace getVariable Format["cti_%1STRUCTURES",_side])-2 do {_str set [_i, 0]};
		_logik setVariable ["cti_structures_live", _str, true];

		//--- Radio: Initialize the announcers entities.
		_radio_hq1 = (createGroup sideLogic) createUnit ["Logic",[0,0,0],[],0,"NONE"];
		_radio_hq2 = (createGroup sideLogic) createUnit ["Logic",[0,0,0],[],0,"NONE"];
		[_radio_hq1] joinSilent (createGroup _side);
		[_radio_hq2] joinSilent (createGroup _side);
		_logik setVariable ["cti_radio_hq", _radio_hq1, true];
		_logik setVariable ["cti_radio_hq_rec", _radio_hq2];

		//--- Radio: Pick a random announcer.
		_announcers = missionNamespace getVariable Format ["cti_%1_RadioAnnouncers", _side];
		_radio_hq_id = (_announcers) select floor(random (count _announcers));

		//--- Radio: Apply an identity.
		_radio_hq1 setIdentity _radio_hq_id;
		_radio_hq1 setRank 'COLONEL';
		_radio_hq1 setGroupId ["HQ"];
		_radio_hq1 kbAddTopic [_radio_hq_id, "Client\kb\hq.bikb","Client\kb\hq.fsm", {call compile preprocessFileLineNumbers "Client\kb\hq.sqf"}];
		_logik setVariable ["cti_radio_hq_id", _radio_hq_id, true];

		//--- Starting vehicles.
		{
			_pos = [getPosATL _hq, 60] call cti_CO_FNC_GetSafePlace;
			_vehicle = [_x, _pos, _sideID, 0, false] Call cti_CO_FNC_CreateVehicle;
			_vehicle setVariable ["cti_Taxi_Prohib", true];
			(_vehicle) call cti_CO_FNC_ClearVehicleCargo;
			emptyQueu pushback _vehicle;
			[_vehicle] spawn cti_SE_FNC_HandleEmptyVehicle;
		} forEach (missionNamespace getVariable Format ['cti_%1STARTINGVEHICLES', _side]);

		//--- spawn of additional vehicles
		switch _side do{
			case west: {
				call _wasptmpFun;
				_tVeh = WEST_StartVeh select floor(random (count WEST_StartVeh));
				_pos = [getPosATL _hq, 60] call cti_CO_FNC_GetSafePlace;
				_vehicle = [_tVeh,_pos, west, 0, false] Call cti_CO_FNC_CreateVehicle;
				_vehicle setVariable ["cti_Taxi_Prohib", true];
				clearWeaponCargoGlobal _vehicle;
				clearMagazineCargoGlobal _vehicle;
				emptyQueu pushBack _vehicle;
				[_vehicle] Spawn cti_SE_FNC_HandleEmptyVehicle;
				if ((missionNamespace getVariable "cti_C_UNITS_BALANCING") > 0) then {(_vehicle) Call cti_CO_FNC_BalanceInit};
				
				if({(_vehicle isKindOf _x)} count ["Tank","Wheeled_APC"] !=0) then {_vehicle addeventhandler ['Engine',{_this execVM "Client\Module\Engines\Engine.sqf"}];
				
				_vehicle addAction ["<t color='"+"#00E4FF"+"'>STEALTH ON</t>","Client\Module\Engines\Stopengine.sqf", [], 7,false, true,"","alive _target &&(isEngineOn _target)"];};
			};
			case east:{
				call _wasptmpFun;
				_tVeh = EAST_StartVeh select floor(random (count EAST_StartVeh));
				_pos = [getPosATL _hq, 60] call cti_CO_FNC_GetSafePlace;
				_vehicle = [_tVeh, _pos, east, 0, false] Call cti_CO_FNC_CreateVehicle;
				_vehicle setVariable ["cti_Taxi_Prohib", true];
				clearWeaponCargoGlobal _vehicle;
				clearMagazineCargoGlobal _vehicle;
				emptyQueu pushBack _vehicle;
				[_vehicle] Spawn cti_SE_FNC_HandleEmptyVehicle;
				if ((missionNamespace getVariable "cti_C_UNITS_BALANCING") > 0) then {(_vehicle) Call cti_CO_FNC_BalanceInit};

				if({(_vehicle isKindOf _x)} count ["Tank","Wheeled_APC"] !=0) then {_vehicle addeventhandler ['Engine',{_this execVM "Client\Module\Engines\Engine.sqf"}];
				
				_vehicle addAction ["<t color='"+"#00E4FF"+"'>STEALTH ON</t>","Client\Module\Engines\Stopengine.sqf", [], 7,false, true,"","alive _target &&(isEngineOn _target)"];};
			};
		};

		//--- Groups init.
		_teams = [];
		{
			if !(isNil '_x') then {
				if (_x isKindOf "Man") then {
					Private ["_group"];
					_group = group _x;
					_teams pushBack _group;

					if (isNil {_group getVariable "cti_funds"}) then {_group setVariable ["cti_funds", missionNamespace getVariable Format ["cti_C_ECONOMY_FUNDS_START_%1", _side], true]};
					_group setVariable ["cti_side", _side];
					_group setVariable ["cti_persistent", true];
					_group setVariable ["cti_queue", []];
					_group setVariable ["cti_vote", -1, true];
					
					[_group, ""] Call cti_CO_FNC_SetTeamRespawn;
					[_group, -1] Call cti_CO_FNC_SetTeamType;
					[_group, "towns"] Call cti_CO_FNC_SetTeamMoveMode;
					[_group, [0,0,0]] Call cti_CO_FNC_SetTeamMovePos;
					(leader _group) enableSimulationGlobal true;

					["INITIALIZATION", Format["Init_Server.sqf: [%1] Team [%2] was initialized.", _side, _group]] Call cti_CO_FNC_LogContent;
				};

			};
		} forEach (synchronizedObjects _logik);

		_logik setVariable ["cti_teams", _teams, true];
		_logik setVariable ["cti_teams_count", count _teams];
	};
} forEach [[_present_east, east, _startE],[_present_west, west, _startW]];

_selected_pos_array = [];
_start_position_array = [];
serverInitFull = true;

//--- Town starting mode.
if((missionNamespace getVariable "cti_DEBUG_DISABLE_TOWN_INIT") == 0)then{
	waitUntil{count towns == totalTowns};
};
// run one global server town script to process supply updates in each town
[] Spawn {[] execVM 'Server\FSM\server_town.sqf'};



[] Spawn {
	if ((missionNamespace getVariable "cti_C_TOWNS_DEFENDER") > 0 || (missionNamespace getVariable "cti_C_TOWNS_OCCUPATION") > 0) then {
		[] execVM 'Server\FSM\server_town_ai.sqf'; // for occupation forces (spawn/despawn mode)
	};
};

if ((missionNamespace getVariable "cti_C_TOWNS_STARTING_MODE") != 0) then {
	[] Call Compile preprocessFile "Server\Init\Init_Towns.sqf"
} else {
	townInitServer = true;
};


//--- Pre-initialization of the Garbage Collector & Empty vehicle collector.
WF_Logic setVariable ["emptyVehicles",[],true];

//--- Don't pause the server init script.
[] Spawn {
	waitUntil {townInit};
		[] execVM "Server\FSM\server_victory_threeway.sqf";
		["INITIALIZATION", "Init_Server.sqf: Victory Condition FSM is initialized."] Call cti_CO_FNC_LogContent;

	[] ExecVM "Server\FSM\updateresources.sqf";
	["INITIALIZATION", "Init_Server.sqf: Resources FSM is initialized."] Call cti_CO_FNC_LogContent;
};

[] ExecVM "Server\FSM\server_collector_garbage.sqf";
["INITIALIZATION", "Init_Server.sqf: Garbage Collector is defined."] Call cti_CO_FNC_LogContent;
[] ExecVM "Server\FSM\emptyvehiclescollector.sqf";
["INITIALIZATION", "Init_Server.sqf: Empty Vehicle Collector is defined."] Call cti_CO_FNC_LogContent;

/////////////////////////////////////////////////////////////////////////////////// map cleaners

// object cleaner on map
[] ExecVM "Server\FSM\cleaners\Server_ObjectCleaner.sqf";
["INITIALIZATION", "Server_ObjectCleaner.sqf: cleaner for dropped items is defined."] Call cti_CO_FNC_LogContent;


/////////////////////////////////////////////////////////////////////////////////// end of map cleaners

//--- Base Area (grouped base)
if ((missionNamespace getVariable "cti_C_BASE_AREA") > 0) then {[] execVM "Server\FSM\basearea.sqf"};


if ((missionNamespace getVariable "cti_C_RESISTANCE_BASES_SWITCH") == 1) then {
//// Resistance base spawning
[] Call Compile preprocessFile "Server\Config\Config_GUE.sqf";
_start_location_array = [0,0,0] nearEntities [["LocationOutpost_F"], 100000];

_lfResBasePositions = [];
_hfResBasePositions = [];
_afResBasePositions = [];
for [{_c = 0;},{_c < (count _start_location_array)},{_c = _c + 1;}] do {
	_resBaseLocation = _start_location_array select _c;
	_structureType = _resBaseLocation getVariable 'StructureType';

	switch (_structureType) do {
	    case 'LF': {_lfResBasePositions pushBack [_resBaseLocation];};
	    case 'HF': {_hfResBasePositions pushBack [_resBaseLocation];};
	    case 'AF': {_afResBasePositions pushBack [_resBaseLocation];};
	};
};

[0, _lfResBasePositions, _hfResBasePositions, _afResBasePositions] spawn cti_SE_FNC_CreateBaseComposition;

};


["INITIALIZATION", Format ["Init_Server.sqf: Server initialization ended at [%1]", time]] Call cti_CO_FNC_LogContent;

//--- Waiting until that the game is launched.
waitUntil {time > 0};







//sleep 25;
FPS_SWITCH = 2;
[] execVM "Server\FSM\SERVER_FPS.sqf";
[] execVM "Server\FSM\Artyrequestloop.sqf";
sleep 2;
[] execVM "Server\FSM\Artyrequestloop_OPF.sqf";
sleep 2;
[] execVM "Server\FSM\Artyrequestloop_BLU.sqf";


[] execVM "Server\FSM\HQwreckkeeper.sqf";





{_x Spawn cti_SE_FNC_VoteForCommander} forEach cti_PRESENTSIDES;