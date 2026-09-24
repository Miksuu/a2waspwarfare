/*
	Author: Marty
	Support player action: dismantle the closest friendly FOB.
	Uses the same animation loop as the light repair skill (Skill_LR.sqf) for WFBE_C_FOB_DISMANTLE_TIME seconds.
	The remaining FOB budget goes back to the side supply.
*/

Private ["_abort","_fob","_left","_result","_start"];

if (WFBE_CL_VAR_FOB_BUSY) exitWith {};
if (vehicle player != player) exitWith {hint "You must be on foot to dismantle a FOB."};

_fob = [player, WFBE_C_FOB_DISMANTLE_RANGE] Call WFBE_CL_FNC_FOB_GetInRange;
if (isNull _fob) exitWith {hint Format ["You must be within %1m of a friendly FOB to dismantle it.", WFBE_C_FOB_DISMANTLE_RANGE]};

WFBE_CL_VAR_FOB_BUSY = true;
_start = time;

//--- Abort when the player dies, gets in a vehicle, walks away or the FOB is gone.
_abort = {!alive player || vehicle player != player || !alive _fob || (player distance _fob) > WFBE_C_FOB_DISMANTLE_RANGE};

hint Format ["Dismantling FOB... %1s left.", WFBE_C_FOB_DISMANTLE_TIME];

while {time - _start < WFBE_C_FOB_DISMANTLE_TIME} do {
	sleep 0.5;
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 0.5;
	waitUntil {animationState player == "ainvpknlmstpslaywrfldnon_amovpknlmstpsraswrfldnon" || (Call _abort) || time - _start >= WFBE_C_FOB_DISMANTLE_TIME};
	if (Call _abort) exitWith {};

	_left = round (WFBE_C_FOB_DISMANTLE_TIME - (time - _start));
	if (_left > 0) then {hintSilent Format ["Dismantling FOB... %1s left.", _left]};
};

if (Call _abort) exitWith {
	WFBE_CL_VAR_FOB_BUSY = false;
	hint parseText "<t color='#F56363'>FOB dismantling interrupted.</t>";
};

_result = ["fob-dismantle", [_fob]] Call WFBE_CL_FNC_FOB_Request;

WFBE_CL_VAR_FOB_BUSY = false;

if (_result select 0) then {
	hint (_result select 1);
	WFBE_ForceUpdate = true;
} else {
	hint parseText Format ["<t color='#F56363'>Cannot</t> dismantle the FOB: %1", _result select 1];
};
