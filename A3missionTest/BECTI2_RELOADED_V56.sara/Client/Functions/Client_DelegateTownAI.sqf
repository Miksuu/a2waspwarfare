/*
	Create a delegation request.
	 Parameters:
		- Town
		- Side
		- Groups
		- Spawn positions
		- Teams
*/

Private ["_groups", "_positions", "_side", "_town", "_town_vehicles"];

_town = _this select 0;
_side = _this select 1;
_groups = _this select 2;
_positions = _this select 3;

["INFORMATION", Format["Client_DelegateTownAI.sqf: Received a town delegation request from the server for [%1] [%2].", _side, _town]] Call cti_CO_FNC_LogContent;

[_town, _side, _groups, _positions] spawn cti_CO_FNC_CreateTownUnits;
