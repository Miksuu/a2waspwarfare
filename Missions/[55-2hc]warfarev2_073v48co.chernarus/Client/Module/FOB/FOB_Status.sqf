/*
	Author: Marty
	Action: show the budget of the closest friendly FOB.
*/

Private ["_builder","_fob"];

_fob = [vehicle player, WFBE_C_FOB_RANGE] Call WFBE_CL_FNC_FOB_GetInRange;
if (isNull _fob) exitWith {};

_builder = _fob getVariable "wfbe_fob_builder";
if (isNil '_builder') then {_builder = "?"};

hint parseText Format ["<t color='#42b6ff' size='1.2' underline='1' shadow='1'>FOB</t><br /><br />Budget: <t color='#76F563'>$%1</t> / $%2<br />Built by: %3<br /><br />Unload a loaded supply truck within %4m to add funds (S 1 = $%5). Units and gear bought here are paid from the budget.", _fob Call WFBE_CL_FNC_FOB_GetCash, WFBE_C_FOB_CASH_MAX, _builder, WFBE_C_FOB_UNLOAD_RANGE, WFBE_C_FOB_SUPPLY_TO_CASH];
