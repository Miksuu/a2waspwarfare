/*
	Return a side's structures.
	 Parameters:
		- Side.
*/

switch (_this) do {
	case west: {cti_L_BLU getVariable "cti_structures"};
	case east: {cti_L_OPF getVariable "cti_structures"};
	case resistance: {cti_L_GUE getVariable "cti_structures"};
	default {objNull};
}