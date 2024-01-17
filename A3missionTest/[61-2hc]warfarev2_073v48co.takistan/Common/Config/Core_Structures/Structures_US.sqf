Private ['_c','_count','_d','_dir','_dis','_n','_s','_side','_t','_v'];

_side = _this;




/*now all green for all maps
_MHQ = 'CUP_B_LAV25_HQ_desert_USMC';
_HQ = "M1130_HQ_unfolded_Base_EP1";
_BAR = "US_WarfareBBarracks_Base_EP1";
_LVF = "US_WarfareBLightFactory_base_EP1";
_CC = "US_WarfareBUAVterminal_Base_EP1";
_HEAVY = "US_WarfareBHeavyFactory_Base_EP1";
_AIR = "US_WarfareBAircraftFactory_Base_EP1";
_SP = "US_WarfareBVehicleServicePoint_Base_EP1";
_AAR = "US_WarfareBAntiAirRadar_Base_EP1";
_ARR = "US_WarfareBArtilleryRadar_Base_EP1";

*/

/* Root Definition */
_MHQ = 'CUP_B_LAV25_HQ_USMC';
_HQ = "LAV25_HQ_unfolded";
_BAR = "USMC_WarfareBBarracks";
_LVF = "USMC_WarfareBLightFactory";
_CC = "USMC_WarfareBUAVterminal";
_HEAVY = "USMC_WarfareBHeavyFactory";
_AIR = "USMC_WarfareBAircraftFactory";
_SP = "USMC_WarfareBVehicleServicePoint";
_AAR = "USMC_WarfareBAntiAirRadar";
//arr unused, just spot enemy arty or move to other position
_ARR = "US_WarfareBArtilleryRadar_Base_EP1";



/* Construction Crates */
missionNamespace setVariable [Format["cti_%1CONSTRUCTIONSITE", _side], 'US_WarfareBContructionSite_EP1'];

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
_t pushBack (if (WF_Debug) then {1} else {60});
_s pushBack "SmallSite";
_dis pushBack 25;
_dir pushBack 90;

_v pushBack "Light";
_n pushBack _LVF;
_d pushBack (getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName"));
_c pushBack 600;
_t pushBack (if (WF_Debug) then {1} else {60});
_s pushBack "MediumSite";
_dis pushBack 45;
_dir pushBack 90;

_v pushBack "CommandCenter";
_n pushBack _CC;
_d pushBack (localize "STR_WF_CommandCenter");
_c pushBack 1200;
_t pushBack (if (WF_Debug) then {1} else {60});
_s pushBack "SmallSite";
_dis pushBack 20;
_dir pushBack 90;

_v pushBack "Heavy";
_n pushBack _HEAVY;
_d pushBack (getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName"));
_c pushBack 2800;
_t pushBack (if (WF_Debug) then {1} else {60});
_s pushBack "MediumSite";
_dis pushBack 45;
_dir pushBack 90;

_v pushBack "Aircraft";
_n pushBack _AIR;
_d pushBack (localize "STR_WF_AircraftFactory");
_c pushBack 4400;
_t pushBack (if (WF_Debug) then {1} else {60});
_s pushBack "SmallSite";
_dis pushBack 55;
_dir pushBack 90;

_v pushBack "ServicePoint";
_n pushBack _SP;
_d pushBack (localize "STR_WF_MAIN_ServicePoint");
_c pushBack 700;
_t pushBack (if (WF_Debug) then {1} else {60});
_s pushBack "SmallSite";
_dis pushBack 21;
_dir pushBack 90;


_v pushBack "AARadar";
_n pushBack _AAR;
_d pushBack (getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName"));
_c pushBack 3200;
_t pushBack (if (WF_Debug) then {1} else {60});
_s pushBack "MediumSite";
_dis pushBack 21;
_dir pushBack 90;

/*
_v pushBack "ArtyRadar";
_n pushBack _ARR;
_d pushBack (getText (configFile >> "CfgVehicles" >> (_n select (count _n - 1)) >> "displayName"));
_c pushBack 2500;
_t pushBack (if (WF_Debug) then {1} else {60});
_s pushBack "MediumSite";
_dis pushBack 21;
_dir pushBack 90;
*/

for [{_count = count _v - 1},{_count >= 0},{_count = _count - 1}] do {
	missionNamespace setVariable [Format["cti_%1%2TYPE",_side,_v select _count],_count];
};

{
	missionNamespace setVariable [Format ["%1%2",_side, _x select 0], _x select 1];
} forEach [["HQ",_HQ],["BAR",_BAR],["LVF",_LVF],["CC",_CC],["HEAVY",_HEAVY],["SP",_SP],["AAR",_AAR],["ARR",_ARR]];

missionNamespace setVariable [Format["cti_%1MHQNAME", _side], _MHQ];
missionNamespace setVariable [Format["cti_%1STRUCTURES", _side], _v];
missionNamespace setVariable [Format["cti_%1STRUCTURENAMES", _side], _n];
missionNamespace setVariable [Format["cti_%1STRUCTUREDESCRIPTIONS", _side], _d];
missionNamespace setVariable [Format["cti_%1STRUCTURECOSTS", _side], _c];
missionNamespace setVariable [Format["cti_%1STRUCTURETIMES", _side], _t];
missionNamespace setVariable [Format["cti_%1STRUCTUREDISTANCES", _side], _dis];
missionNamespace setVariable [Format["cti_%1STRUCTUREDIRECTIONS", _side], _dir];
missionNamespace setVariable [Format["cti_%1STRUCTURESCRIPTS", _side], _s];


_UKContainer =[BTeamleader4,BTeamleader5,BEngineer4,BEngineer5,BMachinegunner4_1,BMachinegunner4_2,BMachinegunner5_1,BMachinegunner5_2,BMedic4,BMedic5,BSpecOps4,BSpecOps5];



_n =  ['Fort_Nest'];
//USvUK LEVEL0
/*
if (player in _UKContainer) then	{
_n pushBack "cwr3_b_searchlight";
_n pushBack "CUP_B_SearchLight_static_USMC";
_n pushBack "CUP_B_M2StaticMG_MiniTripod_USMC";
_n pushBack "CUP_B_M2StaticMG_USMC";
_n pushBack "CUP_B_MK19_TriPod_USMC";
} else {
_n pushBack	"cwr3_b_uk_searchlight";
_n pushBack "CUP_B_SearchLight_static_BAF_DDPM";
_n pushBack "cwr3_b_uk_l7a2_low";
_n pushBack "cwr3_b_uk_l111a1_low";
_n pushBack "cwr3_b_uk_l111a1_high";
_n pushBack "CUP_B_L111A1_MiniTripod_BAF_WDL";
_n pushBack "CUP_B_L111A1_BAF_DDPM";
_n pushBack "CUP_B_L134A1_TriPod_BAF_DDPM";
};
*/




//makes less sense but just switch it to fix it ingame->fixed
if (player in _UKContainer) then	{
_n pushBack	"cwr3_b_uk_searchlight";
_n pushBack "CUP_B_SearchLight_static_BAF_DDPM";
_n pushBack "cwr3_b_uk_l7a2_low";
_n pushBack "cwr3_b_uk_l111a1_low";
_n pushBack "cwr3_b_uk_l111a1_high";
_n pushBack "CUP_B_L111A1_MiniTripod_BAF_WDL";
_n pushBack "CUP_B_L111A1_BAF_DDPM";
_n pushBack "CUP_B_L134A1_TriPod_BAF_DDPM";
} else {
_n pushBack "cwr3_b_searchlight";
_n pushBack "CUP_B_SearchLight_static_USMC";
_n pushBack "CUP_B_M2StaticMG_MiniTripod_USMC";
_n pushBack "CUP_B_M2StaticMG_USMC";
_n pushBack "CUP_B_MK19_TriPod_USMC";
};


//USvUK LEVEL1v2
if (player in _UKContainer) then	{
_n pushBack "CUP_B_TOW2_TriPod_USMC";
_n pushBack "cwr3_b_uk_javelin_lml";
_n pushBack "CUP_B_L16A2_BAF_DDPM";
_n pushBack "cwr3_b_uk_l118";
_n pushBack "CUP_B_M134_A_GB";
} else {
_n pushBack "CUP_B_TOW_TriPod_USMC";
_n pushBack "CUP_B_Stinger_AA_pod_Base_USMC";
_n pushBack "CUP_B_M252_USMC";
_n pushBack "pook_M777";
_n pushBack "CUP_B_M134_A_US_ARMY";
};





//both LEVEL2
_n pushBack "B_Static_Designator_01_F";
_n pushBack "B_Radar_System_01_F";
_n pushBack "B_SAM_System_03_F";
//_n pushBack "CUP_WV_B_CRAM";//buggy

_n pushBack "B_AAA_System_01_F";



//BACKPACKSTUFF
_n pushBack "cwr3_b_m252";
_n pushBack "CUP_I_M252_AAF";
_n pushBack "cwr3_b_mk19";
_n pushBack "CUP_I_MK19_TriPod_AAF";

_n pushBack "cwr3_b_m2hb_high";
_n pushBack "cwr3_b_m2hb_low";
_n pushBack "CUP_I_M2StaticMG_MiniTripod_AAF";
_n pushBack "CUP_I_M2StaticMG_AAF";

_n pushBack "CUP_I_L16A2_AAF";
_n pushBack "CUP_I_TOW2_TriPod_AAF";
_n pushBack "CUP_I_L134A1_TriPod_AAF";
//_n pushBack "cwr3_b_uk_l111a1_high";

//_n pushBack "cwr3_b_uk_l111a1_low";
_n pushBack "CUP_I_L111A1_MiniTripod_AAF";
_n pushBack "CUP_I_L111A1_AAF";
_n pushBack "cwr3_b_tow";
_n pushBack "CUP_I_TOW_TriPod_AAF";

//end backpacksellstuff






//Fortification

_n = _n + ['TK_WarfareBBarrier10xTall_EP1'];
_n = _n + ['TK_WarfareBBarrier5x_EP1'];
_n = _n + ['Land_HBarrier_large'];
_n = _n + ['Land_HBarrier5'];
_n = _n + ['Land_HBarrier3'];
_n = _n + ['Land_HBarrier1'];
_n = _n + ['cwr3_bagfence_corner'];
_n = _n + ['cwr3_bagfence'];
_n = _n + ['pook_Land_fort_rampart_DES'];
_n = _n + ['Land_fort_artillery_nest_EP1'];
_n = _n + ['pook_Land_fort_artillery_nest_DES'];
_n = _n + ['Hhedgehog_concreteBig'];
_n = _n + ['land_cwr3_vez'];
_n = _n + ['land_cwr3_lampa_sidl_3'];

_n = _n + ['Concrete_Wall_EP1'];


if ((missionNamespace getVariable "cti_C_BUNKER_SWITCH") == 1) then {
//BUNKER

_n = _n + ['Land_Target_Concrete_Support_01_F'];
_n = _n + ['Land_Bunker_01_blocks_1_F'];
_n = _n + ['Land_Bunker_01_blocks_3_F'];
_n = _n + ['Land_PillboxWall_01_3m_round_F'];
_n = _n + ['Land_CncBarrierMedium4_F'];
_n = _n + ['Land_PetroglyphWall_02_F'];
_n = _n + ['Land_i_Garage_V2_F'];
_n = _n + ['Land_PillboxWall_01_6m_round_F'];
_n = _n + ['Land_CncWall4_F'];
_n = _n + ['Land_Podesta_1_stairs4'];
_n = _n + ['Land_Platform_Stairs_30'];
_n = _n + ['Land_Platform_Stairs_20'];
_n = _n + ['Land_ConcreteRamp'];
_n = _n + ['Land_ConcreteBlock'];
_n = _n + ['Land_Platform_Base'];
_n = _n + ['Land_BasaltWall_01_d_left_F'];
_n = _n + ['Land_BasaltWall_01_gate_F'];
_n = _n + ['Land_PillboxBunker_01_rectangle_F'];
_n = _n + ['Land_PillboxBunker_01_hex_F'];
_n = _n + ['Land_Bunker_02_light_right_F'];
_n = _n + ['Land_Bunker_02_right_F'];
_n = _n + ['Land_Bunker_02_light_double_F'];
_n = _n + ['Land_Bunker_02_light_left_F'];
_n = _n + ['Land_Bunker_02_left_F'];
_n = _n + ['Land_Bunker_02_double_F'];
_n = _n + ['Land_Bunker_01_small_F'];
_n = _n + ['Land_Podesta_1_stairs2'];

_n = _n + ['Land_Bunker_01_big_F'];
_n = _n + ['Land_Bunker_01_HQ_F'];
_n = _n + ['land_cwr3_ammostore2'];
_n = _n + ['Land_PillboxBunker_01_big_F'];
_n = _n + ['Land_Bunker_01_tall_F'];
_n = _n + ['land_cwr3_garaz_bez_tanku'];

};




//Strategic


_n = _n + ['Land_PedestrianCrossing_01_6m_6str_F'];
_n = _n + ['Land_HelipadSquare_F'];
_n = _n + ['Land_HelipadRescue_F'];
_n = _n + ['Land_HelipadCivil_F'];

_n = _n + ['TK_GUE_WarfareBVehicleServicePoint_Base_EP1'];
_n = _n + ['Sign_Danger'];
_n = _n + ['Sign_DangerMines_ACR'];


_n = _n + ['land_cwr3_tent1_mash'];
_n = _n + ['Land_radar_EP1'];
//_n = _n + ['cwr3_target_grenade'];
_n = _n + ['CamoNet_wdl_big_F'];
_n = _n + ['Land_IRMaskingCover_01_F'];


//ammo
if (player in _UKContainer) then	{
_n = _n + ['CUP_BOX_GB_WpsSpecial_F'];
} else {
_n = _n + ['CUP_BOX_US_ARMY_WpsSpecial_F'];
};



/* Class used for AI, AI will attempt to build those */
missionNamespace setVariable [Format["cti_%1DEFENSES_MG", _side], ['CUP_B_M2StaticMG_US']];
missionNamespace setVariable [Format["cti_%1DEFENSES_GL", _side], ['CUP_B_MK19_TriPod_US']];
missionNamespace setVariable [Format["cti_%1DEFENSES_AAPOD", _side], ['CUP_B_CUP_Stinger_AA_pod_US']];
missionNamespace setVariable [Format["cti_%1DEFENSES_ATPOD", _side], ['CUP_B_TOW_TriPod_US']];
missionNamespace setVariable [Format["cti_%1DEFENSES_CANNON", _side], ['CUP_B_M119_US']];
missionNamespace setVariable [Format["cti_%1DEFENSES_MASH", _side], ['land_cwr3_tent1_mash']];
missionNamespace setVariable [Format["cti_%1DEFENSES_MORTAR", _side], ['CUP_B_M252_USMC']];

missionNamespace setVariable [Format["cti_%1DEFENSENAMES", _side], _n];
