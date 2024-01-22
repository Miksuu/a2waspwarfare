/*
	The client or an AI attempt to repair a camp.
	  todo, action can be reused after x time.
*/

Private ["_camp","_camp_sideID","_camps","_delay","_range","_temp","_townModel","_vehicle"];

_vehicle = _this select 0;

_range = missionNamespace getVariable "cti_C_CAMPS_REPAIR_RANGE";

//--- Attempt to get a nearby camp.
_camps = (_vehicle) nearEntities [cti_Logic_Camp, _range];

//--- Only get the "real" camps, remove the possible undefined ones.
_temp = _camps;
{
	if (isNil {_x getVariable 'sideID'}) then {_camps deleteAt _forEachIndex};
} forEach _temp;

//--- Make sure that there is at least one camp nearby, abort otherwise.
if (count _camps == 0) exitWith {hint (parseText(localize "STR_WF_Repair_Camp_None"))};

//--- Now, we need to check if one of those camp is destroyed at least, remove the living ones.
_temp = _camps;
{
	if (alive (_x getVariable 'cti_camp_bunker')) then {_camps deleteAt _forEachIndex};
} forEach _temp;

//--- If we have no repairable camps in range, abort with a message.
if (count _camps == 0) exitWith {hint (parseText(localize "STR_WF_Repair_Camp_None_Dead"))};

//--- Check if the repair is free or if it need to be paid.
if ((missionNamespace getVariable "cti_C_CAMPS_REPAIR_PRICE") > 0) then {
	//--- Check that the player has enough funds for a repair.
	if ((Call cti_CL_FNC_GetPlayerFunds) < (missionNamespace getVariable "cti_C_CAMPS_REPAIR_PRICE")) exitWith {hint Format [parseText(localize "STR_WF_Repair_Camp_NoFunds"), (missionNamespace getVariable "cti_C_CAMPS_REPAIR_PRICE") - (Call cti_CL_FNC_GetPlayerFunds)]};

	//--- Purchase a repair.
	-(missionNamespace getVariable "cti_C_CAMPS_REPAIR_PRICE") Call cti_CL_FNC_ChangePlayerFunds;
};
	
//--- Get the closest camp then.
_camp = [_vehicle, _camps] Call cti_CO_FNC_GetClosestEntity;

hint (parseText(localize "STR_WF_Repair_Camp_IsBeingRepaired"));

//--- Begin the repair.
_delay = missionNamespace getVariable "cti_C_CAMPS_REPAIR_DELAY";

while {_delay > 0} do {
    _vehicle playMove "AinvPknlMstpSlayWrflDnon_medic";
	if (!alive _vehicle || alive (_camp getVariable 'cti_camp_bunker') || (_vehicle distance _camp > _range)) exitWith {};
	
	sleep 1;
	_delay = _delay - 1;
}; 

if (!(alive _vehicle) || (_vehicle distance _camp > _range)) exitWith {hint (parseText(localize "STR_WF_Repair_TooFar"))};
if (alive (_camp getVariable 'cti_camp_bunker')) exitWith {
	hint (parseText(localize "STR_WF_Repair_Camp_IsAlive"));
	
	//--- Refunds the player.
	(missionNamespace getVariable "cti_C_CAMPS_REPAIR_PRICE") Call cti_CL_FNC_ChangePlayerFunds;
};

//--- Repair order is sent to the server.
["repair-camp", _camp, cti_Client_SideID] remoteExecCall ["cti_SE_PVF_RequestSpecial",2];

sleep 4;

hint (parseText(localize "STR_WF_Repair_Camp_IsRepaired"));