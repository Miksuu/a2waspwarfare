Private ['_c','_count','_d','_dir','_dis','_n','_s','_side','_t','_v'];

_side = _this;

/*now all green for all maps
_MHQ = "CUP_O_BTR90_HQ_RU";
_HQ = "BTR90_HQ_unfolded";
_BAR = "TK_WarfareBBarracks_Base_EP1";
_LVF = "TK_WarfareBLightFactory_base_EP1";
_CC = "TK_WarfareBUAVterminal_Base_EP1";
_HEAVY = "TK_WarfareBHeavyFactory_Base_EP1";
_AIR = "TK_WarfareBAircraftFactory_Base_EP1";
_SP = "TK_WarfareBVehicleServicePoint_Base_EP1";
_AAR = "TK_WarfareBAntiAirRadar_Base_EP1";
_ARR = "TK_WarfareBArtilleryRadar_Base_EP1";
*/


/* Root Definition */
_MHQ = "CUP_O_BTR90_HQ_RU";
_HQ = "BTR90_HQ_unfolded";
_BAR = "RU_WarfareBBarracks";
_LVF = "RU_WarfareBLightFactory";
_CC = "RU_WarfareBUAVterminal";
_HEAVY = "RU_WarfareBHeavyFactory";
_AIR = "RU_WarfareBAircraftFactory";
_SP = "RU_WarfareBVehicleServicePoint";
_AAR = "RU_WarfareBAntiAirRadar";
//arr unused, just spot enemy arty or move to other position
_ARR = "TK_WarfareBArtilleryRadar_Base_EP1";

/* Construction Crates */
missionNamespace setVariable [Format["cti_%1CONSTRUCTIONSITE", _side], 'TK_WarfareBContructionSite_EP1'];

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

/* Defenses */


_n = ["cwr3_o_searchlight"];

_n = _n + ['CUP_O_SearchLight_static_RU'];
_n = _n + ['cwr3_o_nsv_low'];


_n = _n + ["cwr3_o_nsv_high"];

_n = _n + ['CUP_O_KORD_RU'];
_n = _n + ['CUP_O_KORD_high_RU_M_BeigeDigital'];
_n = _n + ['cwr3_o_ags30'];
_n = _n + ['cwr3_o_spg9'];
_n = _n + ['cwr3_o_konkurs_tripod'];


_n = _n + ["CUP_O_Metis_RU"];
_n = _n + ["CUP_O_Kornet_RU"];
_n = _n + ["CUP_O_ZU23_RU"];
_n = _n + ['CUP_O_Igla_AA_pod_RU'];
_n = _n + ['CUP_O_2b14_82mm_RU'];


//BACKPACKSTUFF
_n = _n + ['CUP_I_2b14_82mm_AAF'];

_n = _n + ['cwr3_o_2b14'];

_n = _n + ['CUP_I_Kornet_AAF'];
_n = _n + ['CUP_I_Metis_AAF'];
_n = _n + ['cwr3_i_dshkm_high'];
_n = _n + ['cwr3_i_dshkm_low'];
_n = _n + ['CUP_I_AGS_AAF'];
_n = _n + ['CUP_I_DSHKM_AAF'];
_n = _n + ['CUP_I_DSHKM_MiniTriPod_AAF'];

_n = _n + ['cwr3_b_searchlight'];


//END BACKPACKSTUFF

_n = _n + ['CUP_O_D30_RU'];
_n = _n + ['O_Static_Designator_02_F'];
_n = _n + ['O_Radar_System_02_F'];
_n = _n + ['O_SAM_System_04_F'];


_n = _n + ['pook_KS19_base'];
_n = _n + ['pook_KS12_base'];
_n = _n + ['pook_ZU23M_base'];
_n = _n + ['pook_ZU23_base'];
_n = _n + ['pook_S60_base'];



//Fortification

_n = _n + ['Fort_Nest'];
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
//_n = _n + ['Land_Illum_Tower'];
//_n = _n + ['cwr3_target_grenade'];
//_n = _n + ['Land_CamoNetB_NATO_EP1'];
_n = _n + ['CamoNet_wdl_big_F'];
_n = _n + ['Land_IRMaskingCover_01_F'];
//_n = _n + ['Land_IRMaskingCover_02_F'];
//_n = _n + ['Land_Setka_Car'];
//_n = _n + ['Land_smallhangaropen'];

//Ammo
_n = _n + ['CUP_BOX_TK_WpsSpecial_F'];


/*vanilla
Land_nav_pier_m_F
Land_Pier_small_F
Land_Pier_F
Land_Pier_Box_F
Land_Sea_Wall_F
*/




/*apex
port_short
port_long
pier_wood_3
pier_wood_5
pier_wood_basic
pier_concrete_low_3
pier_concrete_low_5
pier_concrete_3
pier_concrete_5
Land_PierConcrete_01_4m_ladders_F
Land_PierConcrete_01_16m_F
Land_PierConcrete_01_30deg_F
Land_PierConcrete_01_end_F
Land_PierConcrete_01_steps_F
Land_PierWooden_01_10m_noRails_F
Land_PierWooden_01_16m_F
Land_PierWooden_01_dock_F
Land_PierWooden_01_hut_F
Land_PierWooden_01_ladder_F
Land_PierWooden_01_platform_F
Land_PierWooden_02_16m_F
Land_PierWooden_02_30deg_F
Land_PierWooden_02_barrel_F
Land_PierWooden_02_hut_F
Land_PierWooden_02_ladder_F
Land_PierWooden_03_F
*/



/* Class used for AI, AI will attempt to build those */
missionNamespace setVariable [Format["cti_%1DEFENSES_MG", _side], ['CUP_O_KORD_high_RU']];
missionNamespace setVariable [Format["cti_%1DEFENSES_GL", _side], ['CUP_O_AGS_RU']];
missionNamespace setVariable [Format["cti_%1DEFENSES_AAPOD", _side], ['CUP_O_Igla_AA_pod_RU','CUP_O_ZU23_RU']];
missionNamespace setVariable [Format["cti_%1DEFENSES_ATPOD", _side], ['CUP_O_Metis_RU','CUP_O_SPG9_ChDKZ']];
missionNamespace setVariable [Format["cti_%1DEFENSES_CANNON", _side], ['CUP_O_D30_RU','CUP_O_D30_RU']];
missionNamespace setVariable [Format["cti_%1DEFENSES_MASH", _side], ['land_cwr3_tent1_mash']];
missionNamespace setVariable [Format["cti_%1DEFENSES_MORTAR", _side], ['CUP_O_2b14_82mm_RU']];

missionNamespace setVariable [Format["cti_%1DEFENSENAMES", _side], _n];
