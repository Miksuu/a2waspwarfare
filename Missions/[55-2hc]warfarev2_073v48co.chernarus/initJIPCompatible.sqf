//--- Global Init, first file called.

//--- Define which 'part' of the game to run.
#include "version.sqf"

LOG_CONTENT_STATE = "";

//WF_LOG_CONTENT
#ifdef WF_LOG_CONTENT
	LOG_CONTENT_STATE = "ACTIVATED";
#else 
	LOG_CONTENT_STATE = "NOT ACTIVATED";
#endif

IS_naval_map = false;
#ifdef IS_NAVAL_MAP
	IS_naval_map = true; // if the map can support boats then global variable boolean is true.
#endif

startingDistance = STARTING_DISTANCE;

CBA_display_ingame_warnings = false;
publicVariable "CBA_display_ingame_warnings";

//--- Mission is starting.
for '_i' from 0 to 3 do {diag_log "################################"};
diag_log format ["## Island Name: [%1]", worldName];
diag_log format ["## Mission Name: [%1]", WF_MISSIONNAME];
diag_log format ["## Starting Distance: [%1]", startingDistance];
diag_log format ["## Max players Defined: [%1]", WF_MAXPLAYERS];
diag_log format ["## LOG CONTENT : [%1]", LOG_CONTENT_STATE];
for '_i' from 0 to 3 do {diag_log "################################"};

townModeSet = false;

WFBE_CO_FNC_LogContent = Compile preprocessFileLineNumbers "Common\Functions\Common_LogContent.sqf"; //--- Define the log function earlier.
WFBE_LogLevel = 0; //--- Logging level (0: Trivial, 1: Information, 2: Warnnings, 3: Errors).

["INITIALIZATION", "initJIPCompatible.sqf: Starting JIP Initialization"] Call WFBE_CO_FNC_LogContent;

//--- Versioning (determine if some script can be run or not). Note that the script will throw an error which can be ignored on version < 1.62 (or vanilla).
ARMA_VERSION = 1;
ARMA_RELEASENUMBER = 0;

execVM "Common\Init\Init_Version.sqf";

//--- As we handle the error in the file scope, we wait for the returned value
waitUntil {!isNil 'VERSION_SET'};
VERSION_SET = nil;

isHostedServer = if (!isMultiplayer || (isServer && !isDedicated)) then {true} else {false};
["DEBUG", Format ["initJIPCompatible.sqf: Debug info [isHostedServer] [%1]", isHostedServer]] Call WFBE_CO_FNC_LogContent;
isHeadLessClient = false;

//--- Headless Client?
isHeadLessClient = Call Compile preprocessFileLineNumbers "Headless\Functions\HC_IsHeadlessClient.sqf";
if (isHeadLessClient) then {["INITIALIZATION", "initJIPCompatible.sqf: Detected an headless client."] Call WFBE_CO_FNC_LogContent};
["DEBUG", Format ["initJIPCompatible.sqf: Debug info [isHeadLessClient] [%1]", isHeadLessClient]] Call WFBE_CO_FNC_LogContent;

if (isHeadLessClient) then {
	_civilianSlots = [];
	{
		if (side _x == civilian) then {
			_civilianSlots = _civilianSlots + [_x];
			["DEBUG", format ["initJIPCompatible.sqf: Added civilian slot [%1]", _x]] call WFBE_CO_FNC_LogContent;
		};
		["DEBUG", format ["initJIPCompatible.sqf: Looping through slot [%1]", _x]] call WFBE_CO_FNC_LogContent;
	} forEach allUnits;

	_freeCivilianSlots = [];
	{
		["DEBUG", Format ["initJIPCompatible.sqf: Debug info [typeOf _x] [%1]", typeOf _x]] Call WFBE_CO_FNC_LogContent;
		if (!local _x) then {
			_freeCivilianSlots = _freeCivilianSlots + [_x];
			["DEBUG", format ["initJIPCompatible.sqf: Added free civilian slot [%1]", _x]] call WFBE_CO_FNC_LogContent;
		};
	} forEach _civilianSlots;

	if (count _freeCivilianSlots > 0) then {
		_randomIndex = floor(random count _freeCivilianSlots);
		_randomUnit = _freeCivilianSlots select _randomIndex;
		selectPlayer _randomUnit;

		["DEBUG", format ["Client moved to slot [%1]", _randomIndex]] call WFBE_CO_FNC_LogContent;
	} else {
		["ERROR", "No free civilian slots available"] call WFBE_CO_FNC_LogContent;
	};
};

//--- Server JIP Information
if ((isHostedServer || isDedicated) && !isHeadLessClient) then { //--- JIP Handler, handle connection & disconnection.
	WFBE_SE_FNC_OnPlayerConnected = Compile preprocessFileLineNumbers "Server\Functions\Server_OnPlayerConnected.sqf";
	WFBE_SE_FNC_OnPlayerDisconnected = Compile preprocessFileLineNumbers "Server\Functions\Server_OnPlayerDisconnected.sqf";

	onPlayerConnected {[_uid, _name, _id] Spawn WFBE_SE_FNC_OnPlayerConnected};
	onPlayerDisconnected {[_uid, _name, _id] Spawn WFBE_SE_FNC_OnPlayerDisconnected};
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_SE_FNC_OnPlayerConnected] [%1]", WFBE_SE_FNC_OnPlayerConnected]] Call WFBE_CO_FNC_LogContent;
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_SE_FNC_OnPlayerDisconnected] [%1]", WFBE_SE_FNC_OnPlayerDisconnected]] Call WFBE_CO_FNC_LogContent;
};

//--- Client initialization, either hosted or pure client. Part I
if (isHostedServer || (!isHeadLessClient && !isDedicated)) then {
	["INITIALIZATION", "initJIPCompatible.sqf: Client detected... waiting for non null result..."] Call WFBE_CO_FNC_LogContent;
	waitUntil {!isNull player};
	["INITIALIZATION", "initJIPCompatible.sqf: Client is not null..."] Call WFBE_CO_FNC_LogContent;
	//--- Client Init - Begin the blackout on Layer 12452.
	12452 cutText [(localize 'STR_WF_Loading')+"...","BLACK FADED",50000];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [12452 cutText] [%1]", (localize 'STR_WF_Loading')+"..."]] Call WFBE_CO_FNC_LogContent;
};

setViewDistance 6000; //--- Server & Client default View Distance.
["DEBUG", Format ["initJIPCompatible.sqf: Debug info [setViewDistance] [%1]", 6000]] Call WFBE_CO_FNC_LogContent;

clientInitComplete = false;
commonInitComplete = false;
serverInitComplete = false;
serverInitFull = false;
gameOver = false;
WFBE_GameOver = false;
townInitServer = false;
townInit = false;
modACE = false;
towns = [];

WF_A2_Vanilla = false;
#ifdef VANILLA
	WF_A2_Vanilla = true;
#endif

WF_A2_Arrowhead = false;
#ifdef ARROWHEAD
	WF_A2_Arrowhead = true;
#endif

WF_A2_CombinedOps = false;
#ifdef COMBINEDOPS
	WF_A2_CombinedOps = true;
#endif

WF_Debug = false;
#ifdef WF_DEBUG
	WF_Debug = true;
#endif

IS_chernarus_map_dependent = false;
#ifdef IS_CHERNARUS_MAP_DEPENDENT
	IS_chernarus_map_dependent = true; // if the map content depend on chernarus feature then global variable boolean is true.
#endif

IS_mod_map_dependent = false;
#ifdef IS_MOD_MAP_DEPENDENT
	IS_mod_map_dependent = true; // if the map content depend on modded vehicles then global variable boolean is true.
#endif

if (isMultiplayer) then {Call Compile preprocessFileLineNumbers "Common\Init\Init_Parameters.sqf"}; //--- In MP, we get the parameters.
["DEBUG", Format ["initJIPCompatible.sqf: Debug info [isMultiplayer] [%1]", isMultiplayer]] Call WFBE_CO_FNC_LogContent;

Call Compile preprocessFileLineNumbers "Common\Init\Init_CommonConstants.sqf"; //--- Set the constants and the parameters, skip the params if they're already defined.

IS_air_war_event = false;
_airEventEnabledFromParameters = missionNamespace getVariable "WFBE_AIR_EVENT_ENABLED";

switch (_airEventEnabledFromParameters) do {
	case 0: {
		#ifdef IS_AIR_WAR_EVENT
			IS_air_war_event = true;
		#endif
	};
	case 1: { 
		IS_air_war_event = false; 
	};
	case 2: { 
		IS_air_war_event = true; 
	};
};
["DEBUG", Format ["initJIPCompatible.sqf: Debug info [IS_air_war_event] [%1]", IS_air_war_event]] Call WFBE_CO_FNC_LogContent;

if (IS_air_war_event) then {
	missionNamespace setVariable ["WFBE_C_ECONOMY_SUPPLY_START_EAST", 50000];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_ECONOMY_SUPPLY_START_EAST] [%1]", 50000]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_ECONOMY_SUPPLY_START_WEST", 50000];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_ECONOMY_SUPPLY_START_WEST] [%1]", 50000]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_ECONOMY_FUNDS_START_EAST", 13370000];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_ECONOMY_FUNDS_START_EAST] [%1]", 13370000]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_ECONOMY_FUNDS_START_WEST", 13370000];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_ECONOMY_FUNDS_START_WEST] [%1]", 13370000]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_TOWNS_STARTING_MODE", 1];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_TOWNS_STARTING_MODE] [%1]", 1]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_GAMEPLAY_UPGRADES_CLEARANCE", 7];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_GAMEPLAY_UPGRADES_CLEARANCE] [%1]", 7]] Call WFBE_CO_FNC_LogContent;
};

if (WF_Debug) then { //--- Debug.
	missionNamespace setVariable ["WFBE_C_GAMEPLAY_UPGRADES_CLEARANCE", 7];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_GAMEPLAY_UPGRADES_CLEARANCE] [%1]", 7]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_TOWNS_OCCUPATION", 1];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_TOWNS_OCCUPATION] [%1]", 1]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_TOWNS_DEFENDER", 2];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_TOWNS_DEFENDER] [%1]", 2]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_AI_DELEGATION", 2];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_AI_DELEGATION] [%1]", 2]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_TOWNS_STARTING_MODE", 2];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_TOWNS_STARTING_MODE] [%1]", 2]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_ECONOMY_SUPPLY_START_EAST", 999999];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_ECONOMY_SUPPLY_START_EAST] [%1]", 999999]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_ECONOMY_SUPPLY_START_WEST", 999999];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_ECONOMY_SUPPLY_START_WEST] [%1]", 999999]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_ECONOMY_FUNDS_START_EAST", 999999];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_ECONOMY_FUNDS_START_EAST] [%1]", 999999]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_ECONOMY_FUNDS_START_WEST", 999999];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_ECONOMY_FUNDS_START_WEST] [%1]", 999999]] Call WFBE_CO_FNC_LogContent;
	missionNamespace setVariable ["WFBE_C_MODULE_WFBE_EASA", 1];
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_MODULE_WFBE_EASA] [%1]", 1]] Call WFBE_CO_FNC_LogContent;
};

//--- Disable headless client if it is not supported.
if (ARMA_VERSION >= 162 && ARMA_RELEASENUMBER >= 101334 || ARMA_VERSION > 162) then {
	["INITIALIZATION", "initJIPCompatible.sqf: Headless client is supported."] Call WFBE_CO_FNC_LogContent
} else {
	if ((missionNamespace getVariable "WFBE_C_AI_DELEGATION") == 2) then {
		missionNamespace setVariable ["WFBE_C_AI_DELEGATION", 0];
		["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_C_AI_DELEGATION] [%1]", 0]] Call WFBE_CO_FNC_LogContent;
		["INITIALIZATION", "initJIPCompatible.sqf: Headless client is not supported."] Call WFBE_CO_FNC_LogContent
	};
};

//--- Apply the time-environment (don't halt).
[] Spawn {
	waitUntil {time > 0}; //--- Await for the mission to start / JIP.

	setDate [(date select 0),(missionNamespace getVariable "WFBE_C_ENVIRONMENT_STARTING_MONTH"),(date select 2),(missionNamespace getVariable "WFBE_C_ENVIRONMENT_STARTING_HOUR"),(date select 4)]; //--- Apply the date and time.

	if (local player) then {skipTime (time / 3600)}; //--- If we're dealing with a client, he may have JIP half way through the game. Sync him via skipTime with the mission time.
	sleep 2;
};

WFBE_Parameters_Ready = true; //--- All parameters are set and ready.
["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_Parameters_Ready] [%1]", WFBE_Parameters_Ready]] Call WFBE_CO_FNC_LogContent;

ExecVM "Common\Init\Init_Common.sqf"; //--- Execute the common files.
ExecVM "Common\Init\Init_Towns.sqf"; //--- Execute the towns file.

//--- Server initialization.
if (isHostedServer || isDedicated) then { //--- Run the server's part.
	["INITIALIZATION", "initJIPCompatible.sqf: Executing the Server Initialization."] Call WFBE_CO_FNC_LogContent;
	ExecVM "Server\Init\Init_Server.sqf";
};

//--- Client initialization, either hosted or pure client. Part II
if (isHostedServer || (!isHeadLessClient && !isDedicated)) then {
	waitUntil {!isNil 'WFBE_PRESENTSIDES'}; //--- Await for teams to be set before processing the client init.
	{
		_logik = (_x) Call WFBE_CO_FNC_GetSideLogic;
		waitUntil {!isNil {_logik getVariable "wfbe_teams"}};
		missionNamespace setVariable [Format["WFBE_%1TEAMS",_x], _logik getVariable "wfbe_teams"];
		["DEBUG", Format ["initJIPCompatible.sqf: Debug info [WFBE_%1TEAMS] [%2]", _x, _logik getVariable "wfbe_teams"]] Call WFBE_CO_FNC_LogContent;
	} forEach WFBE_PRESENTSIDES;

	["INITIALIZATION", "initJIPCompatible.sqf: Executing the Client Initialization."] Call WFBE_CO_FNC_LogContent;
	execVM "Client\Init\Init_Client.sqf";
};

//--- Run the headless client initialization based on client name.
if (isHeadLessClient) then {
	switch (name player) do {
		case "hc_AIdelegation": {
			execVM "Headless\Init\Init_AIdelegation.sqf";
		};
		case "hc_TownAIdelegation": {
			execVM "Headless\Init\Init_TownAIdelegation.sqf";
		};
		case "hc_StaticDefenceAIdelegation": {
			execVM "Headless\Init\Init_StaticDefenceAIdelegation.sqf";
		};
		case "hc_HandlePVFdelegation": {
			execVM "Headless\Init\Init_HandlePVFdelegation.sqf";
		};
		default {
			["ERROR", format ["initJIPCompatible.sqf: Unknown headless client name '%1'.", name player]] Call WFBE_CO_FNC_LogContent;
		};
	};
};

//// Wasp part
WASP_procInitComm=Compile PreprocessFile "WASP\common\procInitComm.sqf";
if(local player)then{ExecVM "WASP\Init_Client.sqf"};

/* Marty : Creation of global variable than can be used everywhere to determine the faction on the map. */
// If the map running is chernarus then east faction must be russian and NOT takistanish (useful to customize audio sounds and so on). West faction is always american whatever the map :
IS_Takistan_Faction_On_This_Map = false;
IS_Russian_Faction_On_This_Map  = false;
IS_American_Faction_on_this_map = false; 

// If map is chernarus dependent :
if (IS_chernarus_map_dependent) then 
{
	IS_Russian_Faction_On_This_Map = true  ;
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [IS_Russian_Faction_On_This_Map] [%1]", IS_Russian_Faction_On_This_Map]] Call WFBE_CO_FNC_LogContent;
	IS_Takistan_Faction_On_This_Map = false;
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [IS_Takistan_Faction_On_This_Map] [%1]", IS_Takistan_Faction_On_This_Map]] Call WFBE_CO_FNC_LogContent;
	IS_American_Faction_on_this_map = true ; // for west side it is always american faction on every maps.
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [IS_American_Faction_on_this_map] [%1]", IS_American_Faction_on_this_map]] Call WFBE_CO_FNC_LogContent;
};

// If map is takistant dependent (= not chernarus dependant) :
if !(IS_chernarus_map_dependent) then  
{
	IS_Russian_Faction_On_This_Map  = false;
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [IS_Russian_Faction_On_This_Map] [%1]", IS_Russian_Faction_On_This_Map]] Call WFBE_CO_FNC_LogContent;
	IS_Takistan_Faction_On_This_Map = true ;
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [IS_Takistan_Faction_On_This_Map] [%1]", IS_Takistan_Faction_On_This_Map]] Call WFBE_CO_FNC_LogContent;
	IS_American_Faction_on_this_map = true ; // for west side it is always american faction on every maps.
	["DEBUG", Format ["initJIPCompatible.sqf: Debug info [IS_American_Faction_on_this_map] [%1]", IS_American_Faction_on_this_map]] Call WFBE_CO_FNC_LogContent;
};