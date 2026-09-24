/*
	Author: Marty
	Support player action: construct a FOB 15m in front of the player, next to a supply truck.
*/

Private ["_dir","_flat","_pos","_result","_trucks"];

if (WFBE_CL_VAR_FOB_BUSY) exitWith {};
if (vehicle player != player) exitWith {hint "You must be on foot to construct a FOB."};

_trucks = player nearEntities [WFBE_C_FOB_SUPPLYTRUCK_TYPES, 25];
if (count _trucks == 0) exitWith {hint "You need a supply truck within 25m to construct a FOB."};

if ((Call GetPlayerFunds) < WFBE_C_FOB_COST) exitWith {hint parseText Format ["<t color='#F56363'>Cannot</t> construct a FOB, it costs $%1 and you have $%2.", WFBE_C_FOB_COST, Call GetPlayerFunds]};
if (count (Call WFBE_CL_FNC_FOB_GetList) >= WFBE_C_FOB_MAX_PER_SIDE) exitWith {hint Format ["Your side already has the maximum of %1 FOBs.", WFBE_C_FOB_MAX_PER_SIDE]};

_dir = getDir player;
_pos = player modelToWorld [0, 15, 0];
_pos set [2, 0];

if (surfaceIsWater _pos) exitWith {hint "You can't construct a FOB on water."};

//--- Service point needs a clear, rather flat area.
_flat = _pos isFlatEmpty [7, 0, 0.6, 8, 0, false, player];
if (count _flat == 0) exitWith {hint "Not enough flat and empty ground 15m in front of you to construct a FOB."};

WFBE_CL_VAR_FOB_BUSY = true;
hint "Constructing FOB...";

_result = ["fob-construct", [_pos, _dir]] Call WFBE_CL_FNC_FOB_Request;

WFBE_CL_VAR_FOB_BUSY = false;

if (_result select 0) then {
	-(WFBE_C_FOB_COST) Call ChangePlayerFunds;
	hint parseText Format ["<t color='#76F563'>FOB constructed</t> for $%1.<br /><br />Unload supply trucks next to it to fill its budget (S 1 = $%2, max $%3). Units and gear bought at the FOB are paid from that budget.", WFBE_C_FOB_COST, WFBE_C_FOB_SUPPLY_TO_CASH, WFBE_C_FOB_CASH_MAX];
	WFBE_ForceUpdate = true;
} else {
	hint parseText Format ["<t color='#F56363'>Cannot</t> construct a FOB: %1", _result select 1];
};
