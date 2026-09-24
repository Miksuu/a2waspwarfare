/*
	Author: Marty
	Support player action: unload the aimed supply truck into the closest friendly FOB budget.
*/

Private ["_fob","_result","_truck"];

if (WFBE_CL_VAR_FOB_BUSY) exitWith {};

_truck = cursorTarget;
if !(typeOf _truck in WFBE_C_FOB_SUPPLYTRUCK_TYPES) exitWith {};

_fob = [_truck, WFBE_C_FOB_UNLOAD_RANGE] Call WFBE_CL_FNC_FOB_GetInRange;
if (isNull _fob) exitWith {hint Format ["The supply truck must be within %1m of a friendly FOB.", WFBE_C_FOB_UNLOAD_RANGE]};
if ((_truck Call WFBE_CL_FNC_FOB_GetTruckSupply) <= 0) exitWith {hint "The supply truck is empty. Load supplies in a friendly town first."};

WFBE_CL_VAR_FOB_BUSY = true;
_result = ["fob-deposit", [_fob, _truck]] Call WFBE_CL_FNC_FOB_Request;
WFBE_CL_VAR_FOB_BUSY = false;

if (_result select 0) then {
	(_result select 1) Call GroupChatMessage;
	hint (_result select 1);
} else {
	hint parseText Format ["<t color='#F56363'>Cannot</t> unload supplies: %1", _result select 1];
};
