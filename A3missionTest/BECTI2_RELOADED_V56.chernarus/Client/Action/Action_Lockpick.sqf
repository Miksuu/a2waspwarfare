/*
	Script: Spec Ops Skill System by Benny.
	Description: Add special skills to the defined spec ops unit.
*/
Private ['_min','_ran','_vehicle','_vehicles','_z'];

_vehicles = player nearEntities [["Car","Motorcycle","Tank","Ship","Air"],5];
if (count _vehicles < 1) exitWith {};

if (isNil "cti_SK_V_LockpickChance") then {
	//--- Some units will have less troubles lockpicking than the others, negative means more chance
	cti_SK_V_LockpickChance = switch (cti_SK_V_Type) do {
		case WSW_SPECOPS: {-20};
		default {0};
	};
};

//if (vehicle player != player)exitWith {};

_vehicle = [player,_vehicles] Call cti_CO_FNC_GetClosestEntity;

if (locked _vehicle == 0) exitWith {};

cti_SK_V_LastUse_Lockpick = time;

for [{_z = 0},{_z < 5},{_z = _z + 1}] do {
	player playMove "Acts_carFixingWheel";
	sleep 5;
};

_min = 51;
switch (typeOf _vehicle) do {
	case "Motorcycle": {_min = 45};
	case "Car": {_min = 52};
	case "Tank": {_min = 53};
	case "Ship": {_min = 25};
	case "Air": {_min = 65};
};
_ran = ((random 100)- cti_SK_V_LockpickChance);

if (_ran >= _min) then {
	//--- Unlocked, gain experience.
	if (cti_SK_V_LockpickChance > -51) then {cti_SK_V_LockpickChance = cti_SK_V_LockpickChance - 1};
	[_vehicle, false] remoteExecCall ["cti_SE_PVF_RequestVehicleLock",2];
	
	hint (localize "STR_WF_INFO_Lockpick_Succeed");
} else {
	hint (localize "STR_WF_INFO_Lockpick_Failed");
};

