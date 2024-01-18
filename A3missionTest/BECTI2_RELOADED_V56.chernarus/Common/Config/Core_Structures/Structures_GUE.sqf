Private ['_c','_count','_d','_dir','_dis','_n','_s','_side','_t','_v'];

_side = _this;

/* Root Definition */
_MHQ = "CUP_I_BRDM2_HQ_NAPA";
_HQ = "BRDM2_HQ_Gue_unfolded";
_BAR = "TK_GUE_WarfareBBarracks_Base_EP1";
_LVF = "TK_GUE_WarfareBLightFactory_base_EP1";
_CC = "TK_GUE_WarfareBUAVterminal_Base_EP1";
_HEAVY = "TK_GUE_WarfareBHeavyFactory_Base_EP1";
_AIR = "TK_GUE_WarfareBAircraftFactory_Base_EP1";
_SP = "GUE_WarfareBVehicleServicePoint";
_AAR = "GUE_WarfareBAntiAirRadar";

/* Construction Crates */
missionNamespace setVariable [Format["cti_%1CONSTRUCTIONSITE", _side], 'Gue_WarfareBContructionSite'];

/* Structures */
_v			= ["Headquarters"];
_n			= [_HQ];
_d			= [getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName")];
_c			= [missionNamespace getVariable "cti_C_STRUCTURES_HQ_COST_DEPLOY"];
_t			= [if (WF_Debug) then {1} else {30}];
_s			= ["HQSite"];
_dis		= [15];
_dir		= [0];

_v pushBack "Barracks";
_n pushBack _BAR;
_d pushBack (getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName"));
_c pushBack 200;
_t pushBack (if (WF_Debug) then {1} else {70});
_s pushBack "SmallSite";
_dis pushBack 25;
_dir pushBack 90;

_v pushBack "Light";
_n pushBack _LVF;
_d pushBack (getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName"));
_c pushBack 600;
_t pushBack (if (WF_Debug) then {1} else {90});
_s pushBack "MediumSite";
_dis pushBack 45;
_dir pushBack 135;

_v pushBack "CommandCenter";
_n pushBack _CC;
_d pushBack (localize "STR_WF_CommandCenter");
_c pushBack 1200;
_t pushBack (if (WF_Debug) then {1} else {110});
_s pushBack "SmallSite";
_dis pushBack 20;
_dir pushBack 90;

_v pushBack "Heavy";
_n pushBack _HEAVY;
_d pushBack (getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName"));
_c pushBack 2800;
_t pushBack (if (WF_Debug) then {1} else {130});
_s pushBack "MediumSite";
_dis pushBack 45;
_dir pushBack 90;

_v pushBack "Aircraft";
_n pushBack _AIR;
_d pushBack (localize "STR_WF_AircraftFactory");
_c pushBack 4400;
_t pushBack (if (WF_Debug) then {1} else {150});
_s pushBack "SmallSite";
_dis pushBack 55;
_dir pushBack 90;

_v pushBack "ServicePoint";
_n pushBack _SP;
_d pushBack (localize "STR_WF_MAIN_ServicePoint");
_c pushBack 700;
_t pushBack (if (WF_Debug) then {1} else {70});
_s pushBack "SmallSite";
_dis pushBack 21;
_dir pushBack 90;

_v pushBack "AARadar";
_n pushBack _AAR;
_d pushBack (getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName"));
_c pushBack 3200;
_t pushBack (if (WF_Debug) then {1} else {280});
_s pushBack "MediumSite";
_dis pushBack 21;
_dir pushBack 90;


for [{_count = count _v - 1},{_count >= 0},{_count = _count - 1}] do {
	missionNamespace setVariable [Format["cti_%1%2TYPE",_side,_v select _count],_count];
};

{
	missionNamespace setVariable [Format ["%1%2",_side, _x select 0], _x select 1];
} forEach [["HQ",_HQ],["BAR",_BAR],["LVF",_LVF],["CC",_CC],["HEAVY",_HEAVY],["SP",_SP],["AAR",_AAR]];

missionNamespace setVariable [Format["cti_%1MHQNAME", _side], _MHQ];
missionNamespace setVariable [Format["cti_%1STRUCTURES", _side], _v];
missionNamespace setVariable [Format["cti_%1STRUCTURENAMES", _side], _n];
missionNamespace setVariable [Format["cti_%1STRUCTUREDESCRIPTIONS", _side], _d];
missionNamespace setVariable [Format["cti_%1STRUCTURECOSTS", _side], _c];
missionNamespace setVariable [Format["cti_%1STRUCTURETIMES", _side], _t];
missionNamespace setVariable [Format["cti_%1STRUCTUREDISTANCES", _side], _dis];
missionNamespace setVariable [Format["cti_%1STRUCTUREDIRECTIONS", _side], _dir];
missionNamespace setVariable [Format["cti_%1STRUCTURESCRIPTS", _side], _s];

_n			= ["CUP_I_M2StaticMG_RACS"];
_n pushBack "I_HMG_02_high_F";
_n pushBack "cwr3_i_dshkm_high";
_n pushBack "I_HMG_02_F";

_n pushBack "cwr3_i_dshkm_low";
_n pushBack "CUP_I_M2StaticMG_MiniTripod_RACS";

_n pushBack "cwr3_i_ags30";

_n pushBack "cwr3_i_spg9";

_n pushBack "cwr3_i_zu23";
_n pushBack "pook_S60_base_IND";
_n pushBack "CUP_I_Type072_Turret";


_n pushBack "CUP_I_2b14_82mm_NAPA";


_n pushBack "CUP_I_M119_RACS";
_n pushBack "CUP_I_D30_TK_GUE";
_n pushBack "pook_M777_IND";





/* Class used for AI, AI will attempt to build those */
missionNamespace setVariable [Format["cti_%1DEFENSES_MG", _side], ['cwr3_i_dshkm_high']];
missionNamespace setVariable [Format["cti_%1DEFENSES_GL", _side], ['cwr3_i_ags30']];
missionNamespace setVariable [Format["cti_%1DEFENSES_AAPOD", _side], ['cwr3_i_zu23']];
missionNamespace setVariable [Format["cti_%1DEFENSES_ATPOD", _side], ['cwr3_i_spg9']];
missionNamespace setVariable [Format["cti_%1DEFENSES_CANNON", _side], ['pook_S60_base_IND']];
missionNamespace setVariable [Format["cti_%1DEFENSES_MASH", _side], ['land_cwr3_tent1_mash']];
missionNamespace setVariable [Format["cti_%1DEFENSES_MORTAR", _side], ['CUP_I_M119_RACS']];

missionNamespace setVariable [Format["cti_%1DEFENSENAMES", _side], _n];