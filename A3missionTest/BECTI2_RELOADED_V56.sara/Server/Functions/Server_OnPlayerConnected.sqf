/*
	Event Handler triggered everytime a player connect to the server, this file handle the first connection along with the JIP connections of a player.
	 Parameters:
		- User ID
		- User Name
*/

Private ['_funds','_get','_id','_max','_name','_sideJoined','_sideOrigin','_team','_uid','_units'];
_uid = _this select 0;
_name = _this select 1;
_id = _this select 2;

//--- Wait for a proper common & server initialization before going any further.
waitUntil {commonInitComplete && serverInitFull};

["INFORMATION", Format ["Server_PlayerConnected.sqf: Player [%1] [%2] has joined the game", _name, _uid]] Call cti_CO_FNC_LogContent;

//--- Skip this script if the server is trying to run this.
if (_name == '__SERVER__' || _uid == '' || local player) exitWith {};

//--- We try to get the player and it's group from the playableUnits.
_team = grpNull;
_sideJoined = nil;

while {isNull _team} do {
	{
		if ((getPlayerUID _x) == _uid) exitWith {
			_team = group _x;
			_sideJoined = side (leader _team);
		};
	} forEach playableUnits;

	if (isNull _team) then {sleep 0.5};
};

_logic = _sideJoined Call cti_CO_FNC_GetSideLogic;
_teams = _logic getVariable "cti_teams";


_logic synchronizeObjectsAdd [leader _team];

{
	if !(isNil '_x') then {
		if (_x isKindOf "Man") then {
			Private ["_group"];
			_group = group _x;
			
			if((_teams pushBackUnique _group) != -1)then{
				if (isNil {_group getVariable "cti_funds"}) then {_group setVariable ["cti_funds", missionNamespace getVariable Format ["cti_C_ECONOMY_FUNDS_START_%1", _sideJoined], true]};
				_group setVariable ["cti_side", _sideJoined];
				_group setVariable ["cti_persistent", true];
				_group setVariable ["cti_queue", []];
				_group setVariable ["cti_vote", -1, true];
				
				[_group, ""] Call cti_CO_FNC_SetTeamRespawn;
				[_group, -1] Call cti_CO_FNC_SetTeamType;
				[_group, "towns"] Call cti_CO_FNC_SetTeamMoveMode;
				[_group, [0,0,0]] Call cti_CO_FNC_SetTeamMovePos;
				(leader _group) enableSimulationGlobal true;

				["INITIALIZATION", Format["Init_Server.sqf: [%1] Team [%2] was initialized.", _sideJoined, _group]] Call cti_CO_FNC_LogContent;
			};
		};
	};
} forEach (synchronizedObjects _logic);

_logic setVariable ["cti_teams", _teams, true];
_logic setVariable ["cti_teams_count", count _teams];

[[[_team,_sideJoined,_uid,true], "Common\Functions\Common_UpdateClientTeams.sqf"], "BIS_fnc_execVM", true, true] call BIS_fnc_MP;
//--- We attempt to get the player informations in case that he joined before.
_get = missionNamespace getVariable format["cti_JIP_USER%1",_uid];

//--- If we choose not to keep the current units during this session, then we simply remove them.
["INFORMATION", Format ["Server_PlayerConnected.sqf: Team [%1] units are now being removed for player [%1] [%2].", _team, _name, _uid]] Call cti_CO_FNC_LogContent;
_units = units _team;
_units = _units + ([_team,false] Call cti_CO_FNC_GetTeamVehicles);
{if (!isPlayer _x && !(_x in playableUnits)) then {deleteVehicle _x}} forEach _units;


//--- We 'Sanitize' the player, we remove the waypoints and we heal him.
_team Call cti_CO_FNC_WaypointsRemove;
(leader _team) setDammage 0;


//--- We store the player UID over the group, this allows us to easily fetch the disconnecting client original group.
_team setVariable ["cti_uid", _uid];
_team setVariable ["cti_teamleader", leader _team];

//--- The player has joined for the first time.
if (isNil '_get') exitWith {
	/*
		UID | Cash | Side | Current Side | flag of first connect on a session
		The JIP system store the main informations about a client, the UID is used to track the player all along the session.
	*/
	missionNamespace setVariable [format["cti_JIP_USER%1",_uid], [_uid, 0, _sideJoined, _sideJoined,0]];

	_team setVariable ["cti_funds", missionNamespace getVariable format ["cti_C_ECONOMY_FUNDS_START_%1", _sideJoined], true];
	["INFORMATION", Format ["Server_PlayerConnected.sqf: Team [%1] Leader [%2] JIP Information have been stored for the first time.", _team, _uid]] Call cti_CO_FNC_LogContent;
};

//--- The player has already joined the session previously, we just need to update the informations.
_get set [3, _sideJoined];

_sideOrigin = _get select 2;
_get set [4,1];
//--- Update the new informations.
missionNamespace setVariable [format["cti_JIP_USER%1",_uid], _get];

//--- Get saved funds.
_funds = _get select 1;
if (_sideOrigin != _sideJoined) then {
	_funds = missionNamespace getVariable Format ["cti_C_ECONOMY_FUNDS_START_%1", _sideJoined];
}else{
	if(_funds <= 0)then{
		_funds = missionNamespace getVariable Format ["cti_C_ECONOMY_FUNDS_START_%1", side (leader _team)];
	};
};

//--- Set the current player funds.
_team setVariable ["cti_funds", _funds, true];

//--- Insert player's data into DB
//_puid = _uid;
//_pname = _name;

//_pposition = [getPosATL (leader _team), "write"] call persistent_fnc_convertFormat;

// If Player found in DB then read in data else initialise player
//_response = ["GET_PLAYER_FROM_CURRENT_GAME_MATCH", format["[game_guid=%1,GAME_MATCH_id=%2]",_puid,PERSISTANCE_CURRENT_MATCH_ID]] call persistent_fnc_callDatabase;
//_dataRead = _response select 0;

//_procedureName = "INSERT_PLAYER_IN_GLOBAL_LIST";
//_parameters = format["[nickname=%1,game_guid=%2]",_pname,_puid];
//[_procedureName,_parameters] call persistent_fnc_callDatabase;

//if (count _dataRead > 0) then {
//	_funds = parseNumber (_dataRead select 6);

//	if(_funds > 0) then{
//		_team setVariable ["cti_funds", _funds, true]
//	};
//}else{
//	_procedureName = "INSERT_PLAYER";
//	_parameters = format["[nickname=%1,game_guid=%2,current_position_in_match=%3,side=%4,money=%5,GAME_MATCH_id=%6]",_pname,_puid,_pposition,_sideJoined,_funds,PERSISTANCE_CURRENT_MATCH_ID];
//	[_procedureName,_parameters] call persistent_fnc_callDatabase;
//};