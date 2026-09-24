/*
	Author: Marty
	Forward Operating Base (FOB) client initialization.
	Support players build a FOB (a regular service point object), fill its cash budget with supply trucks,
	and anyone on the side can buy Barracks/Light/Heavy units and gear next to it using that budget.
*/

WFBE_CL_FNC_FOB_GetList = Compile preprocessFileLineNumbers "Client\Module\FOB\FOB_GetList.sqf";
WFBE_CL_FNC_FOB_GetInRange = Compile preprocessFileLineNumbers "Client\Module\FOB\FOB_GetInRange.sqf";
WFBE_CL_FNC_FOB_GetCash = Compile preprocessFileLineNumbers "Client\Module\FOB\FOB_GetCash.sqf";
WFBE_CL_FNC_FOB_GetTruckSupply = Compile preprocessFileLineNumbers "Client\Module\FOB\FOB_GetTruckSupply.sqf";
WFBE_CL_FNC_FOB_Request = Compile preprocessFileLineNumbers "Client\Module\FOB\FOB_Request.sqf";
WFBE_CL_FNC_FOB_HandleResult = Compile preprocessFileLineNumbers "Client\Module\FOB\FOB_HandleResult.sqf";

WFBE_CL_VAR_FOB_REQUEST_COUNT = 0;
WFBE_CL_VAR_FOB_MARKER_COUNT = 0;
WFBE_CL_VAR_FOB_BUSY = false;

//--- Updated by the available actions FSM.
fobInRange = false;
WFBE_CL_VAR_FOB_NEAR = objNull; //--- Closest friendly FOB within WFBE_C_FOB_RANGE.
WFBE_CL_VAR_FOB_GEAR = objNull; //--- Set when the FOB is the only reason gear can be bought, so the FOB pays for it.
