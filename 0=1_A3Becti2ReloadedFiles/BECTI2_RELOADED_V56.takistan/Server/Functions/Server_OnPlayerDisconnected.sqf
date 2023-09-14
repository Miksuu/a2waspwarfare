/*
	Event Handler triggered everytime a player disconnect from the server, this file handle all the players disconnection.
	 Parameters:
		- User ID
		- User Name
*/

Private ['_buildings','_commander','_funds','_get','_hq','_id','_name','_old_unit','_old_unit_group','_respawnLoc','_side','_team','_units','_uid'];
_uid = _this select 0;
_name = _this select 1;
_id = _this select 2;

sleep 0.5;

//--- Wait for a proper common & server initialization before going any further.
waitUntil {commonInitComplete && serverInitFull};

if (_name == '__SERVER__' || _uid == '' || local player) exitWith {};

["INFORMATION", Format ["Server_PlayerDisconnected.sqf: Player [%1] [%2] has left the game", _name, _uid]] Call cti_CO_FNC_LogContent;

//--- Headless Clients disconnection?.
_get = missionNamespace getVariable Format["cti_HEADLESS_%1", _uid];
if !(isNil '_get') then {
	missionNamespace setVariable ["cti_HEADLESSCLIENTS_ID", (missionNamespace getVariable "cti_HEADLESSCLIENTS_ID") - [_get]];
	missionNamespace setVariable [Format["cti_HEADLESS_%1", _uid], nil];
};

//--- Player had any objects created?
_get = missionNamespace getVariable Format ["cti_CLIENT_%1_OBJECTS", _uid];
if !(isNil '_get') then {
	{if !(isNil '_x') then {deleteVehicle _x}} forEach _get;
	missionNamespace setVariable [Format ["cti_CLIENT_%1_OBJECTS", _uid], nil];
};

//--- We attempt to get the player information in case that he joined before.
_get = missionNamespace getVariable format["cti_JIP_USER%1",_uid];
if (isNil '_get') exitWith {["INFORMATION", Format ["Server_PlayerDisconnected.sqf: Player [%1] [%2] don't have any information stored", _name, _uid]] Call cti_CO_FNC_LogContent};

//--- Determine the root team.
_side = _get select 3;

_team = grpNull;
{
	{
		if !(isNil {_x getVariable "cti_uid"}) then {if ((_x getVariable "cti_uid") == _uid) then {_team = _x}};
		if !(isNull _team) exitWith {};
	} forEach ((_x Call cti_CO_FNC_GetSideLogic) getVariable "cti_teams");
	if !(isNull _team) exitWith {};
} forEach cti_PRESENTSIDES;

if (isNull _team) exitWith {["WARNING", Format ["Server_PlayerDisconnected.sqf: Player [%1] [%2] team is null", _name, _uid]] Call cti_CO_FNC_LogContent};

//[[[_team,_side,false], "Common\Functions\Common_UpdateClientTeams.sqf"], "BIS_fnc_execVM", true, true] call BIS_fnc_MP;
_logik = (_side) Call cti_CO_FNC_GetSideLogic;
_teams = _logik getVariable "cti_teams";

_teams = _teams - [_team];
_teams = _teams - [grpNull];
_logik synchronizeObjectsRemove [leader _team];
_logik setVariable ["cti_teams", _teams, true];
_logik setVariable ["cti_teams_count", count _teams];
//--- We attempt to fetch the client old unit, we need to check if it's group is the right one (on the fly group swapping).
_old_unit = _team getVariable "cti_teamleader";
if (isNil '_old_unit') then {
	_old_unit = objNull;
} else {
	if !(alive _old_unit) then {_old_unit = objNull};
};

if (isNull _old_unit) then {
	_old_unit = leader _team;
	["INFORMATION", Format ["Server_PlayerDisconnected.sqf: Player [%1] [%2] current team leader is dead or nil, using original team leader [%3].", _name, _uid, _team]] Call cti_CO_FNC_LogContent;
};
_old_unit_group = group _old_unit;

//--- We force the unit out of it's vehicle.
if !(isNull(assignedVehicle _old_unit)) then {
	unassignVehicle _old_unit;
	[_old_unit] orderGetIn false;
	[_old_unit] allowGetIn false;
};

//--- Eject the unit if it's in the HQ.
_hq = (_side) Call cti_CO_FNC_GetSideHQ;
if (vehicle _old_unit == _hq) then {_old_unit action ["EJECT", _hq]};
deleteVehicle _old_unit;

//--- If we choose not to keep the current units during this session, then we simply remove them.
["INFORMATION", Format ["Server_PlayerDisconnected.sqf: Player [%1] [%2] units are now being removed for AI Team [%3].", _name, _uid, _team]] Call cti_CO_FNC_LogContent;
_units = units _team;
_units = _units + ([_team,false] Call cti_CO_FNC_GetTeamVehicles) - [_hq];
{if (!isPlayer _x && !(_x in playableUnits)) then {deleteVehicle _x}} forEach _units;


//--- We save the disconnect client funds.
_funds = _team Call cti_CO_FNC_GetTeamFunds;
_get set [1,_funds];

//_response = ["GET_PLAYER_FROM_CURRENT_GAME_MATCH", format["[game_guid=%1,GAME_MATCH_id=%2]",_uid,PERSISTANCE_CURRENT_MATCH_ID]] call persistent_fnc_callDatabase;
//_dataRead = _response select 0;

//if (count _dataRead > 0 && _funds > 0) then {
//	_player_id = parseNumber (_dataRead select 0);
//	["UPDATE_PLAYER_MONEY", format["[player_id=%1,money=%2]",_uid,_funds]] call persistent_fnc_callDatabase;
//};

//--- Update the new informations.
missionNamespace setVariable [format["cti_JIP_USER%1",_uid], _get];

_get = missionNamespace getVariable format["cti_JIP_USER%1",_uid];

//--- Release the UID.
_team setVariable ["cti_uid", nil];
_team setVariable ["cti_teamleader", nil];

//--- If the player was the commander, we warn the team and sanitize the commander informations.
_commander = (_side) Call cti_CO_FNC_GetCommanderTeam;
if !(isNull (_commander)) then {
	if (_team == _commander) then {
		_logik setVariable ["cti_commander", objNull, true];
		['CommanderDisconnected'] remoteExecCall ["cti_CL_FNC_LocalizeMessage", _side];
	};
};

