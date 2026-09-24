/*
	Author: Marty
	Send the result of a FOB request back to the requesting player.
	 Parameters:
		- Player.
		- Request ID.
		- Success (Boolean).
		- Message (String).
*/

Private ["_id","_message","_ok","_player"];

_player = _this select 0;
_id = _this select 1;
_ok = _this select 2;
_message = _this select 3;

if (isNull _player) exitWith {};

if (WF_A2_Vanilla) then {
	[getPlayerUID _player, "HandleSpecial", ["fob-result", _id, _ok, _message]] Call WFBE_CO_FNC_SendToClients;
} else {
	[_player, "HandleSpecial", ["fob-result", _id, _ok, _message]] Call WFBE_CO_FNC_SendToClient;
};
