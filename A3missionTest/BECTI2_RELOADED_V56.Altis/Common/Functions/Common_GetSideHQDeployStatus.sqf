/*
	Return a side HQ deloy status.
	 Parameters:
		- Side.
*/

switch (_this) do {
	case west: {cti_L_BLU getVariable "cti_hq_deployed"};
	case east: {cti_L_OPF getVariable "cti_hq_deployed"};
	case resistance: {cti_L_GUE getVariable "cti_hq_deployed"};
	default {objNull};
}

