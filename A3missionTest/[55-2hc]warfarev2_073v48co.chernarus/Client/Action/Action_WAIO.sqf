// WAIO (WHATEVER ALTITUDE INSTANT OPENING) I USE THIS BUGGY SCRIPTPARAMETER BECAUSE THATS A PERFECT BUG

Private ["_act","_caller","_vehicle"];




_vehicle = _this select 0;
_caller = _this select 1;
_act = _this select 2;

_caller action ["EJECT",_vehicle];
_caller setVelocity [0,0,0];
//original
//[_caller,true,true] call cti_CL_FNC_HALO_JUMP;

[_caller,true,false] call cti_CL_FNC_HALO_JUMP;

/*

Parameters:
0: UNIT - (object) the unit that will be doing the HALO
1: (optional) AUTOOPEN -(boolean) true to auto open parachute at 20m
2: (optional) SAVELOADOUT - (boolean) true to save backpack and its contents, and add a "fake" backpack to the front of the unit.->must be false buggy function atm
*/
