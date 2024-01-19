/*
	Return a side's HQ.
	 Parameters:
		- Side.
*/

switch (_this) do {
	case west: {cti_L_BLU getVariable "cti_upgrades"};
	case east: {cti_L_OPF getVariable "cti_upgrades"};
	case resistance: {cti_L_GUE getVariable "cti_upgrades"};
	default {objNull};
}