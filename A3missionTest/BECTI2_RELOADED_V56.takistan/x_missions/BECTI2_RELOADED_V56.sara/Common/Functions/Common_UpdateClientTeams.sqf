Private["_team","_side","_teams", "_sideJoined", "_logic", "_needToAdd"];
//on connect
//[[[_team,_sideJoined,_uid,true], "Common\Functions\Common_UpdateClientTeams.sqf"], "BIS_fnc_execVM", true, true] call BIS_fnc_MP;

//buggy disconnect
//[[[_team,_side,false], "Common\Functions\Common_UpdateClientTeams.sqf"], "BIS_fnc_execVM", true, true] call BIS_fnc_MP;


//new add
//[[[_team,_sideJoined,_uid,true], "Common\Functions\Common_UpdateClientTeams.sqf"], "BIS_fnc_execVM", true, true] call BIS_fnc_MP;


//new cleanup
//[[[_team,_side,false,false], "Common\Functions\Common_UpdateClientTeams.sqf"], "BIS_fnc_execVM", true, true] call BIS_fnc_MP;


_team 			= _this select 0;
_side 			= _this select 1;
_uid			= _this select 2;
_isteamAdding 	= _this select 3; 
_sideJoined 	= side player;
_logic 			= nil;

if(isNil "commonInitComplete")then{commonInitComplete = false};
waitUntil {commonInitComplete};

if(_sideJoined == _side)then{
	while {isNil "_logic"} do {
		_logic = _sideJoined Call cti_CO_FNC_GetSideLogic; 
		if (isNil "_logic") then {sleep 1};
	};
	
	if (_isteamAdding)then{_logic synchronizeObjectsAdd [leader _team];};
	_teams = _logic getVariable "cti_teams";
	{
		if !(isNil '_x') then {
			if (_x isKindOf "Man") then {
				Private ["_group"];
				_group = group _x;
				if (_isteamAdding)then{
				if(_team == _group)then{
					_group setVariable ["cti_side", _side];
					_group setVariable ["cti_persistent", true];
					_group setVariable ["cti_queue", []];
					_group setVariable ["cti_vote", -1, true];
					[_group, ""] Call cti_CO_FNC_SetTeamRespawn;
					[_group, -1] Call cti_CO_FNC_SetTeamType;
					[_group, "towns"] Call cti_CO_FNC_SetTeamMoveMode;
					[_group, [0,0,0]] Call cti_CO_FNC_SetTeamMovePos;
					_group setVariable ["cti_uid", _uid];
					_group setVariable ["cti_teamleader", leader _group];	
				};};
				
				if !(_isteamAdding)then{
				if(_team == _group)then{
					_group setVariable ["cti_side", nil];
					_group setVariable ["cti_persistent", nil];
					_group setVariable ["cti_queue",nil];
					_group setVariable ["cti_vote", nil];
					//[_group, ""] Call cti_CO_FNC_SetTeamRespawn;
					//[_group, -1] Call cti_CO_FNC_SetTeamType;
					//[_group, "towns"] Call cti_CO_FNC_SetTeamMoveMode;
					//[_group, [0,0,0]] Call cti_CO_FNC_SetTeamMovePos;
					_group setVariable ["cti_uid", nil];
					_group setVariable ["cti_teamleader",nil];	
					_logic synchronizeObjectsRemove [leader _team];
					
				};};
				
				
			};
		};
	} forEach (synchronizedObjects _logic);
	_teams = _teams - [grpNull];
	_logic setVariable ["cti_teams", _teams, true];
	_logic setVariable ["cti_teams_count", count _teams];
	
	//missionNamespace setVariable [Format["cti_%1TEAMS",_sideJoined], _logic getVariable "cti_teams"];
	//cti_Client_Teams = missionNamespace getVariable Format['cti_%1TEAMS',_sideJoined];
	
	missionNamespace setVariable [Format["cti_%1TEAMS",str _sideJoined], _logic getVariable "cti_teams"];
	cti_Client_Teams = missionNamespace getVariable Format['cti_%1TEAMS',str _sideJoined];
	
	cti_Client_Teams_Count = count cti_Client_Teams;
};








