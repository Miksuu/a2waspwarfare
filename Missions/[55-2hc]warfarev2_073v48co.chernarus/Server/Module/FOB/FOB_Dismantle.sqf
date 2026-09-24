/*
	Author: Marty
	Dismantle a FOB. The remaining budget goes back to the side supply (cash / WFBE_C_FOB_SUPPLY_TO_CASH).
	 Parameters:
		- Player.
		- FOB.
		- Request ID.
*/

Private ["_cash","_fob","_fobs","_id","_logic","_player","_reason","_side","_supply","_townName"];

_player = _this select 0;
_fob = _this select 1;
_id = _this select 2;

if (isNull _player) exitWith {};

_reason = "";
if (isNil {_fob getVariable "wfbe_fob_sideid"}) then {_reason = "This is not a FOB."};
if (_reason == "" && !alive _fob) then {_reason = "The FOB is destroyed."};
if (_reason == "" && (_fob getVariable "wfbe_fob_sideid") != ((side (group _player)) Call GetSideID)) then {_reason = "This FOB does not belong to your side."};
if (_reason == "" && (_player distance _fob) > (WFBE_C_FOB_DISMANTLE_RANGE + 10)) then {_reason = "You are too far away from the FOB."};

if (_reason != "") exitWith {[_player, _id, false, _reason] Call WFBE_SE_FNC_FOB_Reply};

_side = side (group _player);
_logic = (_side) Call WFBE_CO_FNC_GetSideLogic;
_cash = 0;

//--- Empty the budget in one go so no purchase can be paid while the FOB is removed.
isNil {
	_cash = _fob getVariable "wfbe_fob_cash";
	if (isNil '_cash') then {_cash = 0};
	_fob setVariable ["wfbe_fob_cash", 0, true];
	_fob setVariable ["wfbe_fob_sideid", nil, true];
};

_fobs = _logic getVariable "wfbe_fobs";
if (isNil '_fobs') then {_fobs = []};
_fobs = _fobs - [_fob, objNull];
_logic setVariable ["wfbe_fobs", _fobs, true];

_townName = ([_fob, towns] Call WFBE_CO_FNC_GetClosestEntity) getVariable "name";
_supply = floor (_cash / WFBE_C_FOB_SUPPLY_TO_CASH);
if (_supply > 0) then {
	[_side, _supply, Format ["FOB near %1 dismantled by %2, $%3 budget returned as S %4.", _townName, name _player, _cash, _supply], false] Call ChangeSideSupply;
};

deleteVehicle _fob;

["INFORMATION", Format ["FOB_Dismantle.sqf: [%1] FOB near %2 dismantled by %3, $%4 budget returned as S %5.", str _side, _townName, name _player, _cash, _supply]] Call WFBE_CO_FNC_LogContent;

[_player, _id, true, Format ["FOB dismantled. Its $%1 budget was returned to your side as S %2.", _cash, _supply]] Call WFBE_SE_FNC_FOB_Reply;
[_side, "HandleSpecial", ["fob-message", Format ["%1 has dismantled the FOB near %2 (S %3 returned to supply).", name _player, _townName, _supply]]] Call WFBE_CO_FNC_SendToClients;
