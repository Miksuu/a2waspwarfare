/*
	Author: Marty
	Pay a unit or gear purchase from a FOB cash budget.
	 Parameters:
		- Player.
		- FOB.
		- Amount.
		- Request ID.
*/

Private ["_amount","_cash","_fob","_id","_ok","_player","_reason"];

_player = _this select 0;
_fob = _this select 1;
_amount = _this select 2;
_id = _this select 3;

if (isNull _player) exitWith {};

_reason = "";
if (isNil {_fob getVariable "wfbe_fob_sideid"}) then {_reason = "This is not a FOB."};
if (_reason == "" && !alive _fob) then {_reason = "The FOB is destroyed."};
if (_reason == "" && (_fob getVariable "wfbe_fob_sideid") != ((side (group _player)) Call GetSideID)) then {_reason = "This FOB does not belong to your side."};
if (_reason == "" && ((vehicle _player) distance _fob) > (WFBE_C_FOB_RANGE + 20)) then {_reason = "You are too far away from the FOB."};
if (_reason == "" && _amount < 0) then {_reason = "Invalid amount."};

if (_reason != "") exitWith {[_player, _id, false, _reason] Call WFBE_SE_FNC_FOB_Reply};

_ok = false;
_cash = 0;

//--- Check and withdraw in one go so two buyers can't spend the same cash.
isNil {
	_cash = _fob getVariable "wfbe_fob_cash";
	if (isNil '_cash') then {_cash = 0};
	if (_cash >= _amount) then {
		_cash = _cash - _amount;
		_fob setVariable ["wfbe_fob_cash", _cash, true];
		_ok = true;
	};
};

if (WF_Debug) then {["DEBUG", Format ["FOB_Withdraw.sqf: player:%1 fob:%2 amount:%3 ok:%4 cash:%5", name _player, _fob, _amount, _ok, _cash]] Call WFBE_CO_FNC_LogContent};

if (_ok) then {
	[_player, _id, true, Format ["$%1 paid from the FOB budget. FOB budget left: $%2.", _amount, _cash]] Call WFBE_SE_FNC_FOB_Reply;
} else {
	[_player, _id, false, Format ["The FOB budget is too low: $%1 needed, $%2 available.", _amount, _cash]] Call WFBE_SE_FNC_FOB_Reply;
};
