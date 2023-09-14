/*
	Return a side's HQ.
	 Parameters:
		- Side.
*/

switch (_this) do {
	case west: {cti_L_BLU getVariable "cti_hq"};
	case east: {cti_L_OPF getVariable "cti_hq"};
	case resistance: {cti_L_GUE getVariable "cti_hq"};
	default {objNull};
}