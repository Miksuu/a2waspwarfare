/*
	Author: Marty
	A FOB was destroyed, its cash budget is lost.
	 Parameters:
		- FOB.
*/

Private ["_cash","_fob","_fobs","_logic","_side","_sideID","_townName"];

_fob = _this;
_sideID = _fob getVariable "wfbe_fob_sideid";
if (isNil '_sideID') exitWith {};

_side = (_sideID) Call GetSideFromID;
_logic = (_side) Call WFBE_CO_FNC_GetSideLogic;
_cash = _fob getVariable "wfbe_fob_cash";
_townName = ([_fob, towns] Call WFBE_CO_FNC_GetClosestEntity) getVariable "name";

_fobs = _logic getVariable "wfbe_fobs";
if (isNil '_fobs') then {_fobs = []};
_fobs = _fobs - [_fob, objNull];
_logic setVariable ["wfbe_fobs", _fobs, true];

_fob setVariable ["wfbe_fob_cash", 0, true];

["INFORMATION", Format ["FOB_OnKilled.sqf: [%1] FOB near %2 was destroyed, $%3 budget lost.", str _side, _townName, _cash]] Call WFBE_CO_FNC_LogContent;

[_side, "HandleSpecial", ["fob-message", Format ["Our FOB near %1 has been destroyed! Its $%2 budget is lost.", _townName, _cash]]] Call WFBE_CO_FNC_SendToClients;
