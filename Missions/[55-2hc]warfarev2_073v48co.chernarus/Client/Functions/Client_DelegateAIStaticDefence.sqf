/*
	Create a delegation request.
	 Parameters:
		- Side
		- Groups
		- Spawn positions
		- Teams
		- defence
		- Move In Gunner immidietly or not
*/

Private ["_groups", "_positions", "_side", "_teams", "_town_vehicles"];

_side = _this select 0;
_groups = _this select 1;
_positions = _this select 2;
_team = _this select 3;
_defence = _this select 4;
_moveInGunner = _this select 5;

["INFORMATION", Format["Client_DelegateAIStaticDefence.sqf: Received a delegation request from the server for [%1].", _side]] Call WFBE_CO_FNC_LogContent;

sleep (random 1); //--- Delay a bit to prevent a bandwidth congestion.

_retVal = [_side, _groups, _positions, _team, _defence, _moveInGunner] call WFBE_CO_FNC_CreateUnitForStaticDefence;
_teams = _retVal select 0;

//["RequestSpecial", ["update-delegation-static_defence", _teams]] Call WFBE_CO_FNC_SendToServer;

{
	// Marty: Static gunners can leave dead bodies in their group; cleanup locally after no living unit remains.
	[_x, "delegated_static_defense", Format ["side:%1;defense:%2;moveIn:%3", _side, typeOf _defence, _moveInGunner]] Spawn WFBE_CO_FNC_DeleteGroupWhenDrained;
} forEach _teams; //--- Delete the group client-sided.
