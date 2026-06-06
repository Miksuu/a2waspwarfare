/*
	Send town defense debug messages to clients.
	Author: Marty
*/

Private ["_message"];

if (!WF_Debug) exitWith {};

_message = _this select 0;
if (_message == "") exitWith {};

[nil, "HandleSpecial", ["town-debug-message", _message]] Call WFBE_CO_FNC_SendToClients;
