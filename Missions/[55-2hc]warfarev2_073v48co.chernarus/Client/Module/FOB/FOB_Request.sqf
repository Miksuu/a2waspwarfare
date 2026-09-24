/*
	Author: Marty
	Send a FOB request to the server and wait for its answer. Must be called from a scheduled script.
	 Parameters:
		- Request ("fob-construct", "fob-deposit", "fob-withdraw").
		- Request parameters (Array), the player and request ID are added here.
	 Returns:
		- [Success (Boolean), Message (String)]
*/

Private ["_action","_deadline","_id","_params","_result","_var"];

_action = _this select 0;
_params = _this select 1;

WFBE_CL_VAR_FOB_REQUEST_COUNT = WFBE_CL_VAR_FOB_REQUEST_COUNT + 1;
_id = WFBE_CL_VAR_FOB_REQUEST_COUNT;
_var = Format ["WFBE_CL_VAR_FOB_RESULT_%1", _id];
missionNamespace setVariable [_var, nil];

["RequestSpecial", [_action, player] + _params + [_id]] Call WFBE_CO_FNC_SendToServer;

_deadline = time + 10;
waitUntil {sleep 0.1; !isNil {missionNamespace getVariable _var} || time > _deadline};

_result = missionNamespace getVariable _var;
missionNamespace setVariable [_var, nil];

if (isNil '_result') then {
	["WARNING", Format ["FOB_Request.sqf: No server answer for [%1] request [%2].", _action, _id]] Call WFBE_CO_FNC_LogContent;
	_result = [false, "The server did not answer the FOB request, please try again."];
};

if (WF_Debug) then {["DEBUG", Format ["FOB_Request.sqf: [%1] id:%2 params:%3 result:%4", _action, _id, _params, _result]] Call WFBE_CO_FNC_LogContent};

_result
