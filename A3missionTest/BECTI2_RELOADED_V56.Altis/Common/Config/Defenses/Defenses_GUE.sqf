/*
	Defenses Definition, define the available defenses.
	(used for towndefense,buildmenu listed in in core_gue and structures_gue)
*/

Private ["_c","_f","_faction","_k","_n","_o","_side","_t"];

_side = "GUER";
_faction = "GUE";

_c = []; //--- Classname
_n = []; //--- Name. 					'' = auto generated.
_o = []; //--- Price.
_t = []; //--- Category
_k = []; //--- Kind (Used for town defenses)

//--- Defenses (Statics)

_c  pushBack  'CUP_I_M2StaticMG_RACS';
_n  pushBack  '';
_o  pushBack  150;
_t  pushBack  "Defense";
_k  pushBack  "CMG"; //camp mg


_c  pushBack  'cwr3_i_zu23';
_n  pushBack  '';
_o  pushBack  600;
_t  pushBack  "Defense";
_k  pushBack  "AA";


_c  pushBack  'pook_S60_base_IND';
_n  pushBack  '';
_o  pushBack  700;
_t  pushBack  "Defense";
_k  pushBack  "AT";



//--- Defenses management for towns.
if (isServer) then {[_side, _c, _k] Call Compile preprocessFile "Common\Config\Config_Defenses_Towns.sqf"};

//--- Fortitications and rest.

// [_faction, _c, _n, _o, _t] Call Compile preprocessFile "Common\Config\Config_Defenses.sqf";