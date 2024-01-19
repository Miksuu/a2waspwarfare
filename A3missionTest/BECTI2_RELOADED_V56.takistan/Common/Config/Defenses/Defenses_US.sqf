/*
	Defenses Definition, define the available defenses.
	(thats only for towndefense, statics defined in Core_US.sqf and Structures_US.sqf)
*/

Private ["_c","_f","_faction","_k","_n","_o","_side","_t"];

_side = "WEST";
_faction = "US";

_c = []; //--- Classname
_n = []; //--- Name. 					'' = auto generated.
_o = []; //--- Price.
_t = []; //--- Category
_k = []; //--- Kind (Used for town defenses)

//--- Defenses (Statics)
_c   pushBack 'CUP_B_M2StaticMG_USMC';
_n   pushBack '';
_o   pushBack 125;
_t   pushBack "Defense";
_k   pushBack "CMG";

_c   pushBack 'CUP_B_TOW_TriPod_USMC';
_n   pushBack '';
_o   pushBack 750;
_t   pushBack "Defense";
_k   pushBack "AT";

_c   pushBack 'CUP_B_Stinger_AA_pod_Base_USMC';
_n   pushBack '';
_o   pushBack 1350;
_t   pushBack "Defense";
_k   pushBack "AA";




//--- Defenses management for towns.
if (isServer) then {[_side, _c, _k] Call Compile preprocessFile "Common\Config\Config_Defenses_Towns.sqf"};

//--- Fortitications and rest.

// [_faction, _c, _n, _o, _t] Call Compile preprocessFile "Common\Config\Config_Defenses.sqf";