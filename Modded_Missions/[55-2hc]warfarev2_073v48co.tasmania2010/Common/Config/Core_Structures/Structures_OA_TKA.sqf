Private ['_c','_count','_d','_dir','_dis','_n','_s','_side','_t','_v'];

_side = _this;

/* Root Definition */
_MHQ = "BMP2_HQ_TK_EP1";
_HQ = "BMP2_HQ_TK_unfolded_EP1";
_BAR = "TK_WarfareBBarracks_EP1";
_LVF = "TK_WarfareBLightFactory_EP1";
_CC = "TK_WarfareBUAVterminal_EP1";
_HEAVY = "TK_WarfareBHeavyFactory_EP1";
_AIR = "TK_WarfareBAircraftFactory_EP1";
_SP = "TK_WarfareBVehicleServicePoint_EP1";
_AAR = "TK_WarfareBAntiAirRadar_EP1";

/* Mash used after being deployed */
missionNamespace setVariable [Format["WFBE_%1FARP", _side], 'CampEast_EP1'];

/* Construction Crates */
missionNamespace setVariable [Format["WFBE_%1CONSTRUCTIONSITE", _side], 'TK_WarfareBContructionSite_EP1'];

/* Structures */
_v			= ["Headquarters"];
_n			= [_HQ];
_d			= [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
_c			= [missionNamespace getVariable "WFBE_C_STRUCTURES_HQ_COST_DEPLOY"];
_t			= [if (WF_Debug) then {1} else {30}];
_s			= ["HQSite"];
_dis		= [15];
_dir		= [0];

_v = _v		+ ["Barracks"];
_n = _n		+ [_BAR];
_d = _d		+ [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
_c = _c		+ [200];
_t = _t		+ [if (WF_Debug) then {1} else {60}];
_s = _s		+ ["SmallSite"];
_dis = _dis	+ [18];
_dir = _dir	+ [90];

_v = _v		+ ["Light"];
_n = _n		+ [_LVF];
_d = _d		+ [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
_c = _c		+ [600];
_t = _t		+ [if (WF_Debug) then {1} else {60}];
_s = _s		+ ["MediumSite"];
_dis = _dis	+ [25];
_dir = _dir	+ [90];

_v = _v		+ ["CommandCenter"];
_n = _n		+ [_CC];
_d = _d		+ [localize "STR_WF_CommandCenter"];
_c = _c		+ [1200];
_t = _t		+ [if (WF_Debug) then {1} else {60}];
_s = _s		+ ["SmallSite"];
_dis = _dis	+ [20];
_dir = _dir	+ [90];

_v = _v		+ ["Heavy"];
_n = _n		+ [_HEAVY];
_d = _d		+ [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
_c = _c		+ [2800];
_t = _t		+ [if (WF_Debug) then {1} else {60}];
_s = _s		+ ["MediumSite"];
_dis = _dis	+ [25];
_dir = _dir	+ [90];

_v = _v		+ ["Aircraft"];
_n = _n		+ [_AIR];
_d = _d		+ [localize "STR_WF_AircraftFactory"];
_c = _c		+ [4400];
_t = _t		+ [if (WF_Debug) then {1} else {60}];
_s = _s		+ ["SmallSite"];
_dis = _dis	+ [31];
_dir = _dir	+ [90];

_v = _v		+ ["ServicePoint"];
_n = _n		+ [_SP];
_d = _d		+ [localize "STR_WF_MAIN_ServicePoint"];
_c = _c		+ [700];
_t = _t		+ [if (WF_Debug) then {1} else {60}];
_s = _s		+ ["SmallSite"];
_dis = _dis	+ [21];
_dir = _dir	+ [90];

if ((missionNamespace getVariable "WFBE_C_STRUCTURES_ANTIAIRRADAR") > 0) then {
	_v = _v		+ ["AARadar"];
	_n = _n		+ [_AAR];
	_d = _d		+ [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
	_c = _c		+ [3200];
	_t = _t		+ [if (WF_Debug) then {1} else {60}];
	_s = _s		+ ["MediumSite"];
	_dis = _dis	+ [21];
	_dir = _dir	+ [90];
};

for [{_count = count _v - 1},{_count >= 0},{_count = _count - 1}] do {
	missionNamespace setVariable [Format["WFBE_%1%2TYPE",_side,_v select _count],_count];
};

{
	missionNamespace setVariable [Format ["%1%2",_side, _x select 0], _x select 1];
} forEach [["HQ",_HQ],["BAR",_BAR],["LVF",_LVF],["CC",_CC],["HEAVY",_HEAVY],["AIR",_AIR],["SP",_SP],["AAR",_AAR]];

missionNamespace setVariable [Format["WFBE_%1MHQNAME", _side], _MHQ];
missionNamespace setVariable [Format["WFBE_%1STRUCTURES", _side], _v];
missionNamespace setVariable [Format["WFBE_%1STRUCTURENAMES", _side], _n];
missionNamespace setVariable [Format["WFBE_%1STRUCTUREDESCRIPTIONS", _side], _d];
missionNamespace setVariable [Format["WFBE_%1STRUCTURECOSTS", _side], _c];
missionNamespace setVariable [Format["WFBE_%1STRUCTURETIMES", _side], _t];
missionNamespace setVariable [Format["WFBE_%1STRUCTUREDISTANCES", _side], _dis];
missionNamespace setVariable [Format["WFBE_%1STRUCTUREDIRECTIONS", _side], _dir];
missionNamespace setVariable [Format["WFBE_%1STRUCTURESCRIPTS", _side], _s];

/* Defenses */
_n			= ["WarfareBMGNest_PK_TK_EP1"];
_n = _n		+ ["SearchLight_TK_EP1"];
_n = _n		+ ["KORD_TK_EP1"];
_n = _n		+ ["KORD_high_TK_EP1"];
_n = _n		+ ["AGS_TK_EP1"];
_n = _n		+ ["SPG9_TK_INS_EP1"];
_n = _n		+ ["Metis_TK_EP1"];
_n = _n		+ ["Igla_AA_pod_TK_EP1"];
_n = _n		+ ["ZU23_TK_EP1"];
_n = _n		+ ["2b14_82mm_TK_EP1"];
_n = _n		+ ["D30_TK_EP1"];
_n = _n		+ ["Land_HBarrier3"];
_n = _n		+ ["Land_HBarrier5"];
_n = _n		+ ["Land_HBarrier_large"];
_n = _n		+ ["TK_WarfareBBarrier5x_EP1"];
_n = _n		+ ["TK_WarfareBBarrier10x_EP1"];
_n = _n		+ ["TK_WarfareBBarrier10xTall_EP1"];
_n = _n		+ ["MASH_EP1"];
_n = _n		+ ["Land_fort_bagfence_long"];
_n = _n		+ ["Land_fort_bagfence_corner"];
_n = _n		+ ["Land_fort_bagfence_round"];
_n = _n		+ ["Land_fortified_nest_small_EP1"];
_n = _n		+ ["Land_fort_rampart_EP1"];
_n = _n		+ ["Land_fort_artillery_nest_EP1"];
_n = _n		+ ["Hhedgehog_concreteBig"];
_n = _n		+ ["Hedgehog_EP1"];

//_____________SPAWNMARKER____________
_n = _n		+ ["HeliH"];
_n = _n		+ ["HeliHRescue"];
_n = _n		+ ["HeliHCivil"];


_n = _n		+ ["Land_CamoNet_EAST_EP1"];
_n = _n		+ ["Land_CamoNetVar_EAST_EP1"];
_n = _n		+ ["Land_CamoNetB_EAST_EP1"];
_n = _n		+ ["Sign_Danger"];
_n = _n		+ ["Fort_RazorWire"];
_n = _n		+ ["Concrete_Wall_EP1"];
_n = _n		+ ["Land_Campfire"];
_n = _n		+ ["TKOrdnanceBox_EP1"];
_n = _n		+ ["TKVehicleBox_EP1"];
_n = _n		+ ["TKBasicAmmunitionBox_EP1"];
_n = _n		+ ["TKBasicWeapons_EP1"];
_n = _n		+ ["TKLaunchers_EP1"];
_n = _n		+ ["TKSpecialWeapons_EP1"];

/* Class used for AI, AI will attempt to build those */
missionNamespace setVariable [Format["WFBE_%1DEFENSES_MG", _side], ['KORD_high_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_GL", _side], ['AGS_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_AAPOD", _side], ['Igla_AA_pod_TK_EP1','ZU23_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_ATPOD", _side], ['Metis_TK_EP1','SPG9_TK_INS_EP1']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_CANNON", _side], ['D30_TK_EP1']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_MASH", _side], ['MASH_EP1']];
missionNamespace setVariable [Format["WFBE_%1DEFENSES_MORTAR", _side], ['2b14_82mm_TK_EP1']];

missionNamespace setVariable [Format["WFBE_%1DEFENSENAMES", _side], _n];