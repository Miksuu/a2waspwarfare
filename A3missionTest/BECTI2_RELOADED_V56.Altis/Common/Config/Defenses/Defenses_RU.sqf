/*
	Defenses Definition, define the available defenses.
*/

Private ["_c","_f","_faction","_k","_n","_o","_side","_t"];

_side = "EAST";
_faction = "RU";

_c = []; //--- Classname
_n = []; //--- Name. 					'' = auto generated.
_o = []; //--- Price.
_t = []; //--- Category
_k = []; //--- Kind (Used for town defenses)

//--- Defenses (Statics)


_c  pushBack  'CUP_O_KORD_high_RU_M_BeigeDigital';
_n  pushBack  '';
_o  pushBack  130;
_t  pushBack  "Defense";
_k  pushBack  "CMG";

_c  pushBack  'CUP_O_Kornet_RU';
_n  pushBack  '';
_o  pushBack  825;
_t  pushBack  "Defense";
_k  pushBack  "AT";


_c  pushBack  'CUP_O_Igla_AA_pod_RU';
_n  pushBack  '';
_o  pushBack  1250;
_t  pushBack  "Defense";
_k  pushBack  "AA";




//--- Defenses management for towns.
if (isServer) then {[_side, _c, _k] Call Compile preprocessFile "Common\Config\Config_Defenses_Towns.sqf"};

//--- Fortitications and rest.

// [_faction, _c, _n, _o, _t] Call Compile preprocessFile "Common\Config\Config_Defenses.sqf";