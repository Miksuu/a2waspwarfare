Private ["_commanderTeam","_direction","_hq","_HQName","_logik","_MHQ","_position","_side","_sideID","_sideText"];

_side = _this select 0;
_sideText = str _side;
_sideID = (_side) Call GetSideID;

_hq = (_side) Call WFBE_CO_FNC_GetSideHQ;
_position = getPos _hq;
_direction = getDir _hq;

_commanderTeam = (_side) Call WFBE_CO_FNC_GetCommanderTeam;
_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;
if !(isNull _commanderTeam) then {
	if (isPlayer (leader _commanderTeam)) then {
		if (WF_A2_Vanilla) then {
			[getPlayerUID(leader _commanderTeam), "HandleSpecial", ["hq-setstatus", false]] Call WFBE_CO_FNC_SendToClients;
		} else {
			[leader _commanderTeam, "HandleSpecial", ["hq-setstatus", false]] Call WFBE_CO_FNC_SendToClient;
		};
	};
};

_logik setVariable ['wfbe_hq_repairing',true, true];


_MHQ = [missionNamespace getVariable Format["WFBE_%1MHQNAME", _sideText], _position, _sideID, _direction, true, false] Call WFBE_CO_FNC_CreateVehicle;
if (_side == west && !(IS_chernarus_map_dependent)) then {
	_MHQ setVehicleInit "this setObjectTexture [0,""Textures\lavbody_coD.paa""]";
	_MHQ setVehicleInit "this setObjectTexture [1,""Textures\lavbody2_coD.paa""]";
	_MHQ setVehicleInit "this setObjectTexture [2,""Textures\lav_hq_coD.paa""]";
	processinitcommands;
	};
_MHQ setVariable ["WFBE_Taxi_Prohib", true];
_MHQ setVariable ["wfbe_trashed", false];
_MHQ setVariable ["wfbe_side", _side];
_MHQ setVariable ["wfbe_structure_type", "Headquarters"];
_MHQ addEventHandler ['killed', {_this Spawn WFBE_SE_FNC_OnHQKilled}];
_MHQ setVelocity [0,0,-1];
_MHQ setVariable ["wfbe_trashable", false];
_MHQ addEventHandler ["hit",{_this Spawn BuildingDamaged}];
_logik setVariable ['wfbe_hq', _MHQ, true];
// if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_HANDLE_FRIENDLYFIRE") > 0) then {_MHQ addEventHandler ['handleDamage',{[_this select 0,_this select 2,_this select 3] Call BuildingHandleDamages}]};
if (isMultiplayer) then {[_side, "HandleSpecial", ["set-hq-killed-eh", _mhq]] Call WFBE_CO_FNC_SendToClients}; //--- Since the Killed EH fires localy, we send the information to the existing clients, JIP clients need to have the event in init_client.sqf (if !deployed).


_logik setVariable ['wfbe_hq_deployed', false, true];
_logik setVariable ['wfbe_hq_repairing',false, true];
_logik setVariable ['wfbe_hq_repair_count', (_logik getVariable "wfbe_hq_repair_count") + 1, true];
//--- [>1.62] Set the HQ to be local to the commander.
 _commanderTeam = (_side) Call WFBE_CO_FNC_GetCommanderTeam;
[leader _commanderTeam, "SetMHQLock", _MHQ] Call WFBE_CO_FNC_SendToClient;	
[_side,"Mobilized", ["Base", _MHQ]] Spawn SideMessage;
deleteVehicle _hq;	

// Marty : Remove mark HQ wreck on map and broadcast boolean when HQ west is repaired
_marker_name = "HQ_WRECK_" + str(_side) ;
[_marker_name, 0]call WFBE_CL_FNC_Delete_Marker;	

// Marty : these public variables below are used globaly in case a client join after the game has already begin:
if (_side == west) then 
{
	missionNamespace setVariable ["IS_WEST_HQ_ALIVE", true];
	publicVariable "IS_WEST_HQ_ALIVE"; 
};

if (_side == east) then 
{
	missionNamespace setVariable ["IS_EAST_HQ_ALIVE", true];
	publicVariable "IS_EAST_HQ_ALIVE"; 
};
// Marty : end.

["INFORMATION", Format ["Server_MHQRepair.sqf: [%1] MHQ has been repaired.", _sideText]] Call WFBE_CO_FNC_LogContent;