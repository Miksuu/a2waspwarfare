/*
	Return the numeric value of a side.
	 Parameters:
		- Side.
*/

switch (_this) do {
	case west: {cti_C_WEST_ID};
	case east: {cti_C_EAST_ID};
	case resistance: {cti_C_GUER_ID};
	case civilian: {cti_C_CIV_ID};
	default {-1};
};

