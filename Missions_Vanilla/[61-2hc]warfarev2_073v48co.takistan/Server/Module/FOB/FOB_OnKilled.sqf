/*
	Author: Marty
	A FOB was destroyed, its cash budget is lost and the enemy player who destroyed it is rewarded.
	 Parameters:
		- FOB.
		- Killer.
*/

Private ["_cash","_fob","_fobs","_killer","_logic","_side","_sideID","_townName"];

_fob = _this select 0;
_killer = _this select 1;
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

//--- Destroyed from a vehicle: credit a player of its crew, gunner first.
if (!isNull _killer && !(_killer isKindOf "Man")) then {
	Private ["_crewPlayer"];
	_crewPlayer = objNull;
	{if (isPlayer _x) exitWith {_crewPlayer = _x}} forEach ([gunner _killer, commander _killer, driver _killer] + crew _killer);
	_killer = _crewPlayer;
};

if (WF_Debug) then {["DEBUG", Format ["FOB_OnKilled.sqf: killer:%1 isPlayer:%2 killerSide:%3 fobSide:%4", _killer, isPlayer _killer, side group _killer, _side]] Call WFBE_CO_FNC_LogContent};

//--- Bounty for the enemy player who destroyed it.
if (isNull _killer) exitWith {};
if !(isPlayer _killer) exitWith {};
if ((side group _killer) == _side || !((side group _killer) in [west, east])) exitWith {};

["INFORMATION", Format ["FOB_OnKilled.sqf: [%1] FOB near %2 destroyed by %3 [%4], awarded $%5.", str _side, _townName, name _killer, str (side group _killer), WFBE_C_FOB_DESTROY_BOUNTY]] Call WFBE_CO_FNC_LogContent;

[side group _killer, "HandleSpecial", ["fob-bounty", _killer, name _killer, WFBE_C_FOB_DESTROY_BOUNTY, _townName]] Call WFBE_CO_FNC_SendToClients;
