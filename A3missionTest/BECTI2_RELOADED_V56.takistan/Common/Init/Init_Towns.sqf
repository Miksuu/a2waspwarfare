Private ["_towns"];

//--- Get all of the city logics.
_towns = [0,0,0] nearEntities [["LocationLogicDepot"], 100000];

//--- Await for a proper initialization.
{
	waitUntil {!isNil {_x getVariable "sideID"} || !isNil {_x getVariable "cti_inactive"}};
} forEach _towns;

townInit = true;

["INITIALIZATION", "Init_Towns.sqf: Towns initialization is done."] Call cti_CO_FNC_LogContent;