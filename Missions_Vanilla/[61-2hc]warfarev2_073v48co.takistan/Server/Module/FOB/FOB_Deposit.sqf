/*
	Author: Marty
	Unload supplies from a supply truck into a FOB cash budget (supply * WFBE_C_FOB_SUPPLY_TO_CASH).
	Only the supply that fits under WFBE_C_FOB_CASH_MAX is taken, the rest stays in the truck.
	 Parameters:
		- Player.
		- FOB.
		- Supply truck.
		- Request ID.
*/

Private ["_added","_cash","_fob","_id","_player","_reason","_space","_supply","_supplyNeeded","_truck","_used"];

_player = _this select 0;
_fob = _this select 1;
_truck = _this select 2;
_id = _this select 3;

if (isNull _player) exitWith {};

_reason = "";
if (isNil {_fob getVariable "wfbe_fob_sideid"}) then {_reason = "This is not a FOB."};
if (_reason == "" && !alive _fob) then {_reason = "The FOB is destroyed."};
if (_reason == "" && !alive _truck) then {_reason = "The supply truck is destroyed."};
if (_reason == "" && (_fob getVariable "wfbe_fob_sideid") != ((side (group _player)) Call GetSideID)) then {_reason = "This FOB does not belong to your side."};
if (_reason == "" && (_truck distance _fob) > WFBE_C_FOB_UNLOAD_RANGE) then {_reason = Format ["The supply truck must be within %1m of the FOB.", WFBE_C_FOB_UNLOAD_RANGE]};
if (_reason == "" && (_player distance _fob) > (WFBE_C_FOB_UNLOAD_RANGE + 20)) then {_reason = "You are too far away from the FOB."};

if (_reason != "") exitWith {[_player, _id, false, _reason] Call WFBE_SE_FNC_FOB_Reply};

_added = 0;
_used = 0;
_supply = 0;
_cash = 0;

//--- Read and write the truck and FOB values in one go so two unload requests can't overlap.
isNil {
	_supply = _truck getVariable "SupplyAmount";
	if (isNil '_supply') then {_supply = 0};
	_cash = _fob getVariable "wfbe_fob_cash";
	if (isNil '_cash') then {_cash = 0};

	_space = WFBE_C_FOB_CASH_MAX - _cash;
	if (_supply > 0 && _space > 0) then {
		_supplyNeeded = ceil (_space / WFBE_C_FOB_SUPPLY_TO_CASH);
		_used = _supply min _supplyNeeded;
		_added = (_used * WFBE_C_FOB_SUPPLY_TO_CASH) min _space;
		_cash = _cash + _added;
		_supply = _supply - _used;

		_fob setVariable ["wfbe_fob_cash", _cash, true];
		_truck setVariable ["SupplyAmount", _supply, true];
		if (_supply <= 0) then {_truck setVariable ["SupplyFromTown", objNull, true]};
	};
};

if (WF_Debug) then {["DEBUG", Format ["FOB_Deposit.sqf: player:%1 fob:%2 truck:%3 used:%4 added:%5 cash:%6 truckLeft:%7", name _player, _fob, _truck, _used, _added, _cash, _supply]] Call WFBE_CO_FNC_LogContent};

if (_used <= 0) exitWith {
	if (_supply <= 0) then {
		[_player, _id, false, "The supply truck is empty. Load supplies in a friendly town first."] Call WFBE_SE_FNC_FOB_Reply;
	} else {
		[_player, _id, false, Format ["The FOB budget is full ($%1).", WFBE_C_FOB_CASH_MAX]] Call WFBE_SE_FNC_FOB_Reply;
	};
};

["INFORMATION", Format ["FOB_Deposit.sqf: %1 unloaded S %2 into a FOB for $%3 (FOB cash: $%4, truck left: S %5).", name _player, _used, _added, _cash, _supply]] Call WFBE_CO_FNC_LogContent;

//--- Same score reward as a regular supply mission.
[_player, (score _player) + (round ((_used / 100) * WFBE_SUPPLY_MISSION_SCORE_COEF))] Spawn SRVFNCRequestChangeScore;

[_player, _id, true, Format ["Unloaded S %1 into the FOB: +$%2. FOB budget: $%3 / $%4. Supply left in truck: S %5.", _used, _added, _cash, WFBE_C_FOB_CASH_MAX, _supply]] Call WFBE_SE_FNC_FOB_Reply;
