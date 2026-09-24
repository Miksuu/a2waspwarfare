/*
	Author: Marty
	Receive the server answer of a FOB request (see FOB_Request.sqf).
	 Parameters:
		- Request ID (Number).
		- Success (Boolean).
		- Message (String).
*/

missionNamespace setVariable [Format ["WFBE_CL_VAR_FOB_RESULT_%1", _this select 0], [_this select 1, _this select 2]];
