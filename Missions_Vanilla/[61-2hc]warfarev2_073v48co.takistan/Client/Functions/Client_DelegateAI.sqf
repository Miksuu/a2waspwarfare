/*
	Create a delegation request.
	 Parameters:
		- Side
		- Groups
		- Spawn positions
		- Teams
*/

Private ["_cleanupGroup", "_groups", "_positions", "_side", "_teams", "_town_vehicles"];

_side = _this select 0;
_unitType = (_this select 1) select 0;
_position = (_this select 2) select 0;
_team = (_this select 3) select 0;


["INFORMATION", Format["Client_DelegateAI.sqf: Received a delegation request from the server for [%1].", _side]] Call WFBE_CO_FNC_LogContent;

sleep (random 1); //--- Delay a bit to prevent a bandwidth congestion.

_retVal = [_side, _unitType, _position, _team] call WFBE_CO_FNC_CreateUnitsForResBases;
_teams = _retVal select 0;

{
	_cleanupGroup = if ((typeName _x) == "ARRAY") then {_x select 0} else {_x};
	// Marty: Delegated resistance-base groups must be cleaned where they are local after all live units are gone.
	[_cleanupGroup, "delegated_resbase_ai", Format ["side:%1;unit:%2", _side, _unitType]] Spawn WFBE_CO_FNC_DeleteGroupWhenDrained;
} forEach _teams; //--- Delete the group client-sided.
