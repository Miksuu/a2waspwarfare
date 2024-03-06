
/*todo
//seems like server dont get the slotvariables from mission.sqm,so we add it here for server too
if (isServer)then{
_allslots=playableUnits;//[o oteamleader1,...

OTeamleader1
OTeamleader2
OTeamleader3
OTeamleader4
OTeamleader5
OEngineer1
OEngineer2
OEngineer3
OEngineer4
OEngineer5



BTeamleader1,BTeamleader2,BTeamleader3,BTeamleader4,BTeamleader5,
						,BEngineer1,BEngineer2,BEngineer3,BEngineer4,BEngineer5,
		OMachinegunner1_1,OMachinegunner1_2,OMachinegunner2_1,OMachinegunner2_2,OMachinegunner3_1,OMachinegunner3_2,OMachinegunner4_1,OMachinegunner4_2,OMachinegunner5_1,OMachinegunner5_2,
		BMachinegunner1_1,BMachinegunner1_2,BMachinegunner2_1,BMachinegunner2_2,BMachinegunner3_1,BMachinegunner3_2,BMachinegunner4_1,BMachinegunner4_2,BMachinegunner5_1,BMachinegunner5_2,
		OMedic1,OMedic2,OMedic3,OMedic4,OMedic5,BMedic1,BMedic2,BMedic3,BMedic4,BMedic5,
		OSpecOps1,OSpecOps2,OSpecOps3,OSpecOps4,OSpecOps5,BSpecOps1,BSpecOps2,BSpecOps3,BSpecOps4,BSpecOps5

};

*/


//--- Define which 'part' of the game to run.
#include "version.sqf"

WF_Debug = false;




//if ((missionNamespace getVariable "cti_C_DEBUG") == 0) then {
//WF_Debug = true;
//}else{
//WF_Debug = false;
//};

#ifdef WF_DEBUG
	WF_Debug = true;
#endif





WF_Skip_Intro = true;
#ifdef WF_SKIP_INTRO
	WF_Skip_Intro = true;
#endif

WF_Camo = false;
#ifdef WF_CAMO
	WF_Camo = true;
#endif

//--- Global Init, first file called.
isHostedServer = if (isServer && !isDedicated) then {true} else {false};
isHeadLessClient = false;
//--- Headless Client?
isHeadLessClient = if (!hasInterface && !isDedicated)then{true}else{false};

if (isHostedServer || (!isHeadLessClient && !isDedicated)) then {
    12452 cutText [(localize 'STR_WF_Loading')+"...","BLACK IN",55555];
};

missionNamespace setVariable ["cti_MAXPLAYERS", WF_MAXPLAYERS];
missionNamespace setVariable ["cti_MISSIONNAME", WF_MISSIONNAME];
cti_CO_FNC_LogContent = Compile preprocessFileLineNumbers "Common\Functions\Common_LogContent.sqf"; //--- Define the log function earlier.
cti_LogLevel = 0; //--- Logging level (0: Trivial, 1: Information, 2: Warnnings, 3: Errors).

//--- Mission is starting.
for '_i' from 0 to 3 do {diag_log "################################"};
diag_log format ["## Island Name: [%1]", worldName];
diag_log format ["## Mission Name: [%1]", WF_MISSIONNAME];
diag_log format ["## Max players Defined: [%1]", WF_MAXPLAYERS];
for '_i' from 0 to 3 do {diag_log "################################"};

["INITIALIZATION", "initJIPCompatible.sqf: Starting JIP Initialization"] Call cti_CO_FNC_LogContent;
cti_Client_SideJoined = civilian;

if (isHeadLessClient) then {["INITIALIZATION", "initJIPCompatible.sqf: Detected an headless client."] Call cti_CO_FNC_LogContent};

//--- Server JIP Information
if ((isHostedServer || isDedicated) && !isHeadLessClient) then { //--- JIP Handler, handle connection & disconnection.
	cti_SE_FNC_OnPlayerConnected = Compile preprocessFileLineNumbers "Server\Functions\Server_OnPlayerConnected.sqf";
	cti_SE_FNC_OnPlayerDisconnected = Compile preprocessFileLineNumbers "Server\Functions\Server_OnPlayerDisconnected.sqf";

	onPlayerConnected {[_uid, _name, _id] Spawn cti_SE_FNC_OnPlayerConnected};
	onPlayerDisconnected {[_uid, _name, _id] Spawn cti_SE_FNC_OnPlayerDisconnected};
};

//--- Client initialization, either hosted or pure client. Part I
if (isHostedServer || (!isHeadLessClient && !isDedicated)) then {
	["INITIALIZATION", "initJIPCompatible.sqf: Client detected... waiting for non null result..."] Call cti_CO_FNC_LogContent;
	waitUntil {!isNull player};
	["INITIALIZATION", "initJIPCompatible.sqf: Client is not null..."] Call cti_CO_FNC_LogContent;
};

setObjectViewDistance 3000; //--- Server & Client default View Distance.
setViewDistance 3000;
[] spawn {enableEnvironment false;};

clientInitComplete = false;
commonInitComplete = false;
serverInitComplete = false;
serverInitFull = false;
cti_GameOver = false;
townInitServer = false;
townInit = false;
towns = [];

if (isMultiplayer) then {Call Compile preprocessFileLineNumbers "Common\Init\Init_Parameters.sqf"}; //--- In MP, we get the parameters.
cti_Parameters_Ready = true; //--- All parameters are set and ready.

Call Compile preprocessFileLineNumbers "Common\Init\Init_CommonConstants.sqf"; //--- Set the constants and the parameters, skip the params if they're already defined.




if ((missionNamespace getVariable "cti_C_DEBUG") == 0) then {//not catches all in this way but votingtime 40s is ok for now.most of debugstuff works
WF_Debug = true;
};




if (WF_Debug) then { //--- Debug.
	missionNamespace setVariable ["cti_C_GAMEPLAY_UPGRADES_CLEARANCE", 7];
	//missionNamespace setVariable ["cti_C_TOWNS_OCCUPATION", 1];
	//missionNamespace setVariable ["cti_C_TOWNS_DEFENDER", 2];
	//missionNamespace setVariable ["cti_C_TOWNS_STARTING_MODE", 2];
	missionNamespace setVariable ["cti_C_ECONOMY_SUPPLY_START_EAST", 999999];
	missionNamespace setVariable ["cti_C_ECONOMY_SUPPLY_START_WEST", 999999];
	missionNamespace setVariable ["cti_C_ECONOMY_FUNDS_START_EAST", 999999];
	missionNamespace setVariable ["cti_C_ECONOMY_FUNDS_START_WEST", 999999];
	missionNamespace setVariable ["cti_C_MODULE_cti_EASA", 1];
	missionNamespace setVariable ["cti_DEBUG_DISABLE_TOWN_INIT", 0];  // 0 -> disabled, 1 -> enabled
	WSW_AdvDebugger = player;
}else{
    WSW_AdvDebugger = objNull;
};

publicVariable "WSW_AdvDebugger";

["INITIALIZATION", "initJIPCompatible.sqf: Headless client is supported."] Call cti_CO_FNC_LogContent;

//--- Apply the time-environment (don't halt).
[] Spawn {
	waitUntil {time > 0}; //--- Await for the mission to start / JIP.
	setDate [(date select 0),(missionNamespace getVariable "cti_C_ENVIRONMENT_STARTING_MONTH"),(date select 2),(missionNamespace getVariable "cti_C_ENVIRONMENT_STARTING_HOUR"),(date select 4)]; //--- Apply the date and time.
	if (local player) then {skipTime (time / 3600)}; //--- If we're dealing with a client, he may have JIP half way through the game. Sync him via skipTime with the mission time.
	sleep 2;
};

ExecVM "Common\Init\Init_Common.sqf"; //--- Execute the common files.
ExecVM "Common\Init\Init_Towns.sqf"; //--- Execute the towns file.

//--- Server initialization.
if (isHostedServer || isDedicated) then { //--- Run the server's part.
	["INITIALIZATION", "initJIPCompatible.sqf: Executing the Server Initialization."] Call cti_CO_FNC_LogContent;
	ExecVM "Server\Init\Init_Server.sqf";
};

//--- Client initialization, either hosted or pure client. Part II
if (isHostedServer || (!isHeadLessClient && !isDedicated)) then {
	waitUntil {!isNil 'cti_PRESENTSIDES'}; //--- Await for teams to be set before processing the client init.
	{
		_logik = (_x) Call cti_CO_FNC_GetSideLogic;
		waitUntil {!isNil {_logik getVariable "cti_teams"}};
		missionNamespace setVariable [Format["cti_%1TEAMS",_x], _logik getVariable "cti_teams"];
	} forEach cti_PRESENTSIDES;

	["INITIALIZATION", "initJIPCompatible.sqf: Executing the Client Initialization."] Call cti_CO_FNC_LogContent;

	execVM "Client\Init\Init_Client.sqf";
	waitUntil {clientInitComplete};
	if!(WF_Skip_Intro)then{
	    [] spawn cti_CL_FNC_MissionIntro;
        waitUntil {WSW_EndIntro};
	}else{
	    12452 cutText [(localize 'STR_WF_Loading')+"...","BLACK IN",5];
	};
};

//--- Run the headless client initialization.
//if (isHeadLessClient) then { execVM "Headless\Init\Init_HC.sqf"; };



//diag_log "Attempting to initialize Towing Script...";
//[] execVM "core\initTowing.sqf";
[] execVM "Client\Functions\Client_TowVehicle.sqf";

