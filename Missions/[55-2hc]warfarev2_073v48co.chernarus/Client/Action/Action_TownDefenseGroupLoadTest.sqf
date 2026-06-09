/*
	Author: Marty
	Request an HC-side artificial group load test from a debug mouse wheel action.
*/

Private ["_args","_count","_mode","_sideName"];

_args = _this select 3;
_mode = _args select 0;
_sideName = _args select 1;
_count = _args select 2;

if !(WF_Debug) exitWith {};

["RequestSpecial", ["td-group-load-test", _mode, _sideName, _count, player]] Call WFBE_CO_FNC_SendToServer;
systemChat Format ["TD Test requested: %1 %2 groups on HC", _mode, _sideName];
