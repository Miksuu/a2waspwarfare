/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "WEST";
_faction = "US";







_k pushBack "Squad_0";
_u		= [selectRandom["cwr3_b_soldier_sl","cwr3_b_soldier","cwr3_b_soldier_ar_m16"]];
_u = _u + [selectRandom["cwr3_b_soldier_at_law","cwr3_b_soldier_ar_m16","cwr3_b_soldier_mg"]];
_u = _u + [selectRandom["cwr3_b_soldier_at_law","cwr3_b_soldier_ar_m16","cwr3_b_soldier_marksman"]];
_u = _u + [selectRandom["cwr3_b_soldier_at_law","cwr3_b_soldier_ar_m16","cwr3_b_soldier"]];
_u = _u + [selectRandom["cwr3_b_soldier_at_law","cwr3_b_soldier_ar_m16","cwr3_b_soldier_backpack"]];
_u = _u + [selectRandom["cwr3_b_soldier_at_law","cwr3_b_soldier_ar_m16","cwr3_b_soldier_engineer"]];
_u = _u + [selectRandom["cwr3_b_soldier_at_law","cwr3_b_soldier_ar_m16","cwr3_b_soldier_medic"]];
_l pushBack _u;








_k pushBack "Squad_1";
_u		= [selectRandom["cwr3_b_soldier_sl","cwr3_b_officer_night","cwr3_b_soldier_ar"]];
_u = _u + [selectRandom["cwr3_b_soldier_at_m67","cwr3_b_soldier_at_carlgustaf","cwr3_b_soldier_mg"]];
_u = _u + [selectRandom["cwr3_b_soldier_at_m67","cwr3_b_soldier_hg","cwr3_b_soldier_marksman"]];
_u = _u + [selectRandom["cwr3_b_soldier_at_m67","cwr3_b_soldier_mg","cwr3_b_soldier_aa_redeye"]];
_u = _u + [selectRandom["cwr3_b_soldier_at_m67","cwr3_b_soldier_hg","cwr3_b_soldier_aa_redeye"]];
_u = _u + [selectRandom["cwr3_b_soldier_at_m67","cwr3_b_soldier_at_carlgustaf","cwr3_b_soldier_engineer"]];
_u = _u + [selectRandom["cwr3_b_soldier_at_m67","cwr3_b_soldier_at_m47","cwr3_b_soldier_medic"]];
_u = _u + ["cwr3_b_soldier_aa_redeye"];
_l pushBack _u;








_k pushBack "Squad_2";
_u		= [selectRandom["CUP_B_USMC_Soldier_SL","CUP_B_USMC_Soldier_TL","CUP_B_USMC_Soldier_GL"]];
_u = _u + [selectRandom["CUP_B_USMC_Soldier_AT","CUP_B_USMC_Soldier_Marksman","CUP_B_USMC_Soldier_GL"]];
_u = _u + [selectRandom["CUP_B_USMC_Soldier_AT","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier_MG"]];
_u = _u + [selectRandom["CUP_B_USMC_Soldier_AT","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Soldier_Marksman"]];
_u = _u + [selectRandom["CUP_B_USMC_Soldier_AT","CUP_B_USMC_Soldier_LAT","CUP_B_USMC_Engineer"]];
_u = _u + [selectRandom["CUP_B_USMC_Soldier_AT","CUP_B_USMC_Soldier_AA","CUP_B_USMC_Medic"]];
_u = _u + [selectRandom["CUP_B_USMC_Soldier_AT","CUP_B_USMC_Soldier_AA","CUP_B_USMC_Soldier_AR"]];
_u = _u + ["CUP_B_USMC_Soldier_AA"];
_l pushBack _u;








_k pushBack "Squad_3";
_u		= [selectRandom["CUP_B_USMC_Soldier_SL","CUP_B_USMC_Soldier_TL","CUP_B_USMC_MARSOC_Marksman_DA"]];
_u = _u + [selectRandom["CUP_B_USMC_Soldier_HAT","CUP_B_USMC_Soldier_AT","CUP_B_USMC_Soldier_GL"]];
_u = _u + [selectRandom["CUP_B_USMC_Soldier_HAT","CUP_B_USMC_Soldier_AT","CUP_B_USMC_Soldier_MG"]];
_u = _u + [selectRandom["CUP_B_USMC_Soldier_HAT","CUP_B_USMC_Soldier_AT","CUP_B_USMC_MARSOC_Marksman_DA"]];
_u = _u + [selectRandom["CUP_B_USMC_Soldier_AT","CUP_B_USMC_Soldier_AT","CUP_B_USMC_Engineer"]];
_u = _u + [selectRandom["CUP_B_USMC_Soldier_AT","CUP_B_USMC_Soldier_AA","CUP_B_USMC_Medic"]];
_u = _u + [selectRandom["CUP_B_USMC_MARSOC_Marksman_DA","CUP_B_USMC_Soldier_AA","CUP_B_USMC_Soldier_AR"]];
_u = _u + ["CUP_B_USMC_Soldier_AA"];
_l pushBack _u;









_k pushBack "Squad_Advanced";
_u		= ["cwr3_b_officer_night"];
_u = _u + ["cwr3_b_soldier_aa_redeye"];
_u = _u + ["cwr3_b_soldier_at_carlgustaf"];
_u = _u + ["cwr3_b_soldier_aat_carlgustaf"];
_u = _u + ["cwr3_b_soldier_marksman"];
_u = _u + ["cwr3_b_soldier_mg"];
_u = _u + ["cwr3_b_soldier_medic"];
_l pushBack _u;






_k pushBack "Team_0";
_u		= [selectRandom["cwr3_b_uk_soldier_tl","cwr3_b_uk_soldier_ar","cwr3_b_uk_soldier"]];
_u = _u + [selectRandom["cwr3_b_uk_soldier_engineer","cwr3_b_uk_soldier_ar","cwr3_b_uk_soldier_marksman"]];
_u = _u + [selectRandom["cwr3_b_uk_soldier_ar","cwr3_b_uk_soldier_at_law","cwr3_b_uk_soldier_backpack"]];
_u = _u + [selectRandom["cwr3_b_uk_soldier_at_law","cwr3_b_uk_soldier_ar","cwr3_b_uk_soldier_mg"]];
_u = _u + ["cwr3_b_uk_soldier_at_law"];
_u = _u + ["cwr3_b_uk_soldier_medic"];
_l pushBack _u;






_k pushBack "Team_1";
_u		= [selectRandom["cwr3_b_uk_soldier_tl","cwr3_b_uk_soldier_ar","cwr3_b_uk_soldier"]];
_u = _u + [selectRandom["cwr3_b_uk_soldier_at_carlgustaf","cwr3_b_uk_soldier_aat_carlgustaf","cwr3_b_uk_soldier_mg"]];
_u = _u + [selectRandom["cwr3_b_uk_soldier_ar","cwr3_b_uk_soldier_at_law","cwr3_b_uk_soldier_marksman"]];
_u = _u + [selectRandom["cwr3_b_uk_soldier_at_law","cwr3_b_uk_soldier_marksman","cwr3_b_uk_soldier_mg"]];
_u = _u + ["cwr3_b_uk_soldier_at_carlgustaf"];
_u = _u + ["cwr3_b_uk_soldier_aa_javelin"];
_u = _u + ["cwr3_b_uk_soldier_medic"];
_l pushBack _u;







_k pushBack "Team_2";
_u		= [selectRandom["CUP_B_BAF_Soldier_TeamLeader_DPM","CUP_B_BAF_Soldier_SquadLeader_DPM","CUP_B_BAF_Soldier_Grenadier_DPM"]];
_u = _u + [selectRandom["CUP_B_BAF_Soldier_Rifleman_DPM","CUP_B_BAF_Soldier_HeavyGunner_DPM","CUP_B_BAF_Soldier_AutoRifleman_DPM"]];
_u = _u + [selectRandom["CUP_B_BAF_Soldier_AsstAT_DPM","CUP_B_BAF_Soldier_RiflemanLAT_DPM","CUP_B_BAF_Soldier_Marksman_DPM"]];
_u = _u + [selectRandom["CUP_B_BAF_Soldier_RiflemanLAT_DPM","CUP_B_BAF_Soldier_AsstAT_DPM","CUP_B_BAF_Soldier_Grenadier_DPM"]];
_u = _u + [selectRandom["CUP_B_BAF_Soldier_RiflemanAT_DPM","CUP_B_BAF_Soldier_AA_DPM","CUP_B_BAF_Soldier_RiflemanLAT_DPM"]];
_u = _u + ["CUP_B_BAF_Soldier_RiflemanAT_DPM"];
_u = _u + ["CUP_B_BAF_Soldier_AA_DPM"];
_u = _u + ["CUP_B_BAF_Soldier_Medic_DPM"];
_l pushBack _u;






_k pushBack "Team_3";
_u		= [selectRandom["CUP_B_BAF_Soldier_SquadLeader_DPM","CUP_B_BAF_Soldier_TeamLeader_DPM","CUP_B_BAF_Soldier_SharpShooter_DPM"]];
_u = _u + [selectRandom["CUP_B_BAF_Soldier_Marksman_DPM","CUP_B_BAF_Soldier_Grenadier_DPM","CUP_B_BAF_Soldier_AT_DPM"]];
_u = _u + [selectRandom["CUP_B_BAF_Soldier_AsstAT_DPM","CUP_B_BAF_Soldier_AA_DPM","CUP_B_BAF_Soldier_SharpShooter_DPM"]];
_u = _u + [selectRandom["CUP_B_BAF_Soldier_Marksman_DPM","CUP_B_BAF_Soldier_AsstAT_DPM","CUP_B_BAF_Soldier_Grenadier_DPM"]];
_u = _u + [selectRandom["CUP_B_BAF_Soldier_RiflemanAT_DPM","CUP_B_BAF_Soldier_AA_DPM","CUP_B_BAF_Soldier_SharpShooter_DPM"]];
_u = _u + ["CUP_B_BAF_Soldier_AT_DPM"];
_u = _u + ["CUP_B_BAF_Soldier_AT_DPM"];
_u = _u + ["CUP_B_BAF_Soldier_AA_DPM"];
_u = _u + ["CUP_B_BAF_Soldier_Medic_DPM"];
_l pushBack _u;




_k pushBack "Team_MG_0";
_u		= ["cwr3_b_uk_soldier_at_law"];
_u pushBack "cwr3_b_uk_soldier_ar";
_u pushBack "cwr3_b_uk_soldier_ar";
_u pushBack "cwr3_b_uk_soldier_ar";
_u pushBack "cwr3_b_uk_soldier_medic";
_l pushBack _u;

_k pushBack "Team_MG_1";
_u		= ["cwr3_b_soldier_at_m67"];
_u pushBack "cwr3_b_soldier_ar_m16";
_u pushBack "cwr3_b_soldier_mg";
_u pushBack "cwr3_b_soldier_mg";
_u pushBack "cwr3_b_soldier_medic";
_l pushBack _u;

_k pushBack "Team_MG_2";
_u		= ["CUP_B_BAF_Soldier_RiflemanAT_DPM"];
_u pushBack "CUP_B_BAF_Soldier_AutoRifleman_DPM";
_u pushBack "CUP_B_BAF_Soldier_HeavyGunner_DPM";
_u pushBack "CUP_B_BAF_Soldier_HeavyGunner_DPM";
_u pushBack "CUP_B_BAF_Soldier_Medic_DPM";
_l pushBack _u;

_k pushBack "Team_MG_3";
_u		= ["CUP_B_USMC_Soldier_HAT"];
_u pushBack "CUP_B_USMC_Soldier_AR";
_u pushBack "CUP_B_USMC_Soldier_MG";
_u pushBack "CUP_B_USMC_Soldier_MG";
_u pushBack "CUP_B_USMC_Soldier_AA";
_u pushBack "CUP_B_USMC_Medic";

_l pushBack _u;

_k pushBack "Team_AT_0";
_u		= ["cwr3_b_uk_soldier_ar"];
_u pushBack "cwr3_b_uk_soldier_at_law";
_u pushBack "cwr3_b_uk_soldier_at_law";
_u pushBack "cwr3_b_uk_soldier_medic";
_l pushBack _u;

_k pushBack "Team_AT_1";
_u		= ["cwr3_b_soldier_gl"];
_u pushBack "cwr3_b_soldier_at_m67";
_u pushBack "cwr3_b_soldier_at_m67";
_u pushBack "cwr3_b_soldier_aat_m67";
_u pushBack "cwr3_b_soldier_medic";
_l pushBack _u;

_k pushBack "Team_AT_2";
_u		= ["CUP_B_USMC_Soldier_TL"];
_u pushBack "CUP_B_USMC_Soldier_AT";
_u pushBack "CUP_B_USMC_Soldier_AT";
_u pushBack "CUP_B_USMC_Soldier_LAT";
_u pushBack "CUP_B_USMC_Medic";
_l pushBack _u;

_k pushBack "Team_AT_3";
_u		= ["CUP_B_BAF_Soldier_TeamLeader_DPM"];
_u pushBack "CUP_B_BAF_Soldier_AT_DPM";
_u pushBack "CUP_B_BAF_Soldier_AT_DPM";
_u pushBack "CUP_B_BAF_Soldier_AsstAT_DPM";
_u pushBack "CUP_B_BAF_Soldier_Medic_DPM";
_l pushBack _u;

_k pushBack "Team_AA";
_u =      ["cwr3_b_soldier_gl"];
_u pushBack "cwr3_b_soldier_aa_redeye";
_u pushBack "cwr3_b_soldier_aa_redeye";
_l pushBack _u;

_k pushBack "Team_Sniper_0";
_u		= ["cwr3_b_soldier_marksman"];
_u pushBack "cwr3_b_soldier_marksman";
_l pushBack _u;

_k pushBack "Team_Sniper_1";
_u		= ["cwr3_b_uk_soldier_spotter"];
_u pushBack "cwr3_b_uk_soldier_sniper";
_u pushBack "cwr3_b_uk_soldier_sniper";
_l pushBack _u;

_k pushBack "Team_Sniper_2";
_u		= ["CUP_B_USMC_Spotter_des"];
_u pushBack "CUP_B_USMC_Sniper_M40A3";
_u pushBack "CUP_B_USMC_Sniper_M40A3";
_u pushBack "CUP_B_USMC_Sniper_M40A3";
_l pushBack _u;

_k pushBack "Team_Sniper_3";
_u		= ["CUP_B_BAF_Spotter_DPM"];
_u pushBack "CUP_B_BAF_Sniper_AS50_DPM";
_u pushBack "CUP_B_BAF_Sniper_DPM";
_l pushBack _u;

/*
_k pushBack "Motorized_0";
_u =      ["CUP_O_UAZ_MG_RU"];
_u pushBack "CUP_O_UAZ_AGS30_RU";
_l pushBack _u;
*/

_k pushBack "Motorized_0";
_u		= [selectRandom["cwr3_b_m151_m2","UK3CB_BAF_LandRover_WMIK_GMG_Green_B","UK3CB_BAF_Husky_Passenger_GPMG_Green"]];
_u = _u + [selectRandom["CUP_B_nM1025_Mk19_DF_USMC_WDL","CUP_B_M1165_GMV_USMC","UK3CB_BAF_Husky_Passenger_GMG_Green"]];
_l pushBack _u;


_k pushBack "Motorized_1";
_u		= [selectRandom["UK3CB_BAF_Panther_GPMG_Green_A","cwr3_b_uk_fv432_gpmg","CUP_B_M1151_M2_USMC"]];
_u = _u + [selectRandom["CUP_B_RG31_M2_OD_USMC","pook_Pandur_M2_BLUFOR","CUP_B_nM1036_TOW_DF_USMC_WDL"]];
_u = _u + [selectRandom["CUP_B_M1151_Mk19_USMC","CUP_B_Jackal2_GMG_GB_W","CUP_B_nM1025_M2_DF_USMC_WDL"]];
_l pushBack _u;

_k pushBack "Motorized_2";
_u		= [selectRandom["CUP_B_Ridgback_HMG_GB_W","CUP_B_Ridgback_GMG_GB_W","CUP_B_M1126_ICV_M2_Woodland"]];
_u = _u + [selectRandom["CUP_B_M1135_ATGMV_Woodland","pook_Pandur_AT_BLUFOR","UK3CB_BAF_LandRover_WMIK_Milan_Green_B"]];
_u = _u + [selectRandom["CUP_I_LR_AA_AAF","CUP_B_LAV25_USMC","CUP_B_M1126_ICV_MK19_Woodland"]];
_l pushBack _u;

_k pushBack "Motorized_3";
_u		= [selectRandom["pook_Pandur_SP30_BLUFOR","pook_Pandur_RWS_BLUFOR","pook_Pandur_Mk19_BLUFOR"]];
_u = _u + [selectRandom["pook_Pandur_Mortar_BLUFOR","CUP_B_LAV25_USMC","CUP_B_M1129_MC_MK19_Woodland"]];
_u = _u + [selectRandom["pook_Pandur_SP30_BLUFOR","CUP_B_LAV25_USMC","pook_Pandur_RCWS30_BLUFOR"]];
_l pushBack _u;


_k pushBack "Motorized_4";
_u		= [selectRandom["CUP_B_M1128_MGS_Woodland","pook_Pandur_RCWS30_BLUFOR","pook_Pandur_MGS_BLUFOR"]];
_u = _u + [selectRandom["pook_Pandur_AT_BLUFOR","CUP_B_M1135_ATGMV_Woodland","CUP_B_nM1036_TOW_DF_USMC_WDL"]];
_u = _u + [selectRandom["pook_CRAM_BASE","pook_Pandur_AA_BLUFOR","CUP_B_nM1097_AVENGER_USA_WDL"]];
_u = _u + [selectRandom["pook_CAESAR_BLUFOR","pook_MLRS_BLUFOR","pook_Pandur_Mortar_BLUFOR"]];
_u = _u + [selectRandom["CUP_B_LAV25_USMC","pook_Pandur_RCWS30_BLUFOR","pook_Pandur_SP30_BLUFOR"]];
_l pushBack _u;



_k pushBack "AA_Light";
_u		= [selectRandom["CUP_B_M163_Vulcan_USA","pook_CRAM_BASE","CUP_B_nM1097_AVENGER_USA_WDL"]];
_u = _u + [selectRandom["pook_Pandur_AA_BLUFOR","pook_MEADS_base","pook_NASAMS_BASE"]];
_l pushBack _u;


_k pushBack "AA_Heavy";
_u		= [selectRandom["CUP_B_M163_Vulcan_USA","CUP_B_M6LineBacker_USA_W","cwr3_b_m163"]];
_u = _u + [selectRandom["cwr3_b_m163","CUP_B_M6LineBacker_USA_W","CUP_B_M163_Vulcan_USA"]];
_l pushBack _u;



_k pushBack "Mechanized_0";
_u		= [selectRandom["CUP_B_AAV_USMC","CUP_B_FV432_Bulldog_GB_W_RWS","CUP_B_M7Bradley_USA_W"]];
_u = _u + [selectRandom["cwr3_b_uk_fv510","UK3CB_BAF_FV432_Mk3_GPMG_Green"]];
_l pushBack _u;

_k pushBack "Mechanized_1";
_u		= [selectRandom["cwr3_b_uk_fv510","CUP_B_M7Bradley_USA_W"]];
_u = _u + [selectRandom["cwr3_b_uk_fv510","CUP_B_M7Bradley_USA_W"]];
_l pushBack _u;


_k pushBack "Mechanized_2";
_u		= [selectRandom["CUP_B_M2Bradley_USA_W","cwr3_b_m163","CUP_B_MCV80_GB_W"]];
_u = _u + [selectRandom["CUP_B_M2Bradley_USA_W","CUP_B_MCV80_GB_W"]];
_l pushBack _u;

_k pushBack "Mechanized_3";
_u		= [selectRandom["CUP_B_M2A3Bradley_USA_W","CUP_B_MCV80_GB_W_SLAT","CUP_B_FV510_GB_W"]];
_u = _u + [selectRandom["CUP_B_FV510_GB_W_SLAT","CUP_B_M6LineBacker_USA_W"]];
_l pushBack _u;

_k pushBack "Mechanized_4";
_u		= [selectRandom["CUP_B_M2A3Bradley_USA_W","CUP_B_MCV80_GB_W_SLAT","CUP_B_FV510_GB_W"]];
_u = _u + [selectRandom["CUP_B_FV510_GB_W_SLAT","CUP_B_M6LineBacker_USA_W"]];
_l pushBack _u;


_k pushBack "Armored_0";
_u		= [selectRandom["CUP_B_M60A3_USMC","cwr3_b_uk_fv107","cwr3_b_uk_fv101"]];
_u = _u + [selectRandom["cwr3_b_uk_fv101","CUP_B_M60A3_USMC"]];
_l pushBack _u;


_k pushBack "Armored_1";
_u		= [selectRandom["CUP_B_M60A3_USMC","cwr3_b_uk_fv107","cwr3_b_uk_fv101"]];
_u = _u + [selectRandom["cwr3_b_uk_fv4201","cwr3_b_m1"]];
_l pushBack _u;

_k pushBack "Armored_2";
_u		= [selectRandom["cwr3_b_uk_fv4201","cwr3_b_m1","CUP_B_M60A3_TTS_USMC"]];
_u = _u + [selectRandom["cwr3_b_uk_fv4201","cwr3_b_m1","CUP_B_M270_HE_BAF_WOOD"]];
_l pushBack _u;

_k pushBack "Armored_3";
_u		= [selectRandom["CUP_B_M1A1SA_Woodland_US_Army","CUP_B_M1A1FEP_Woodland_USMC","cwr3_b_uk_fv4030"]];
_u = _u + [selectRandom["CUP_B_M1A1EP_TUSK_Woodland_USMC","CUP_B_M1A2SEP_TUSK_II_Woodland_US_Army","CUP_B_Challenger2_2CW_BAF"]];
_l pushBack _u;

_k pushBack "Armored_4";
_u		= [selectRandom["CUP_B_M1A1SA_Woodland_US_Army","CUP_B_M1A1FEP_Woodland_USMC","cwr3_b_uk_fv4030"]];
_u = _u + [selectRandom["CUP_B_M1A1EP_TUSK_Woodland_USMC","CUP_B_M1A2SEP_TUSK_II_Woodland_US_Army","CUP_B_Challenger2_2CW_BAF"]];
_l pushBack _u;


[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";




//_______________________________________________________________________________________

/*

_k pushBack "Squad_0";
_u		= ["rhsusf_army_ucp_arb_grenadier"];
_u pushBack "rhsusf_army_ucp_arb_machinegunner";
_u pushBack "rhsusf_army_ucp_arb_riflemanat";
_u pushBack "rhsusf_army_ucp_arb_grenadier";
_u pushBack "rhsusf_army_ucp_arb_riflemanat";
_u pushBack "rhsusf_army_ucp_arb_medic";
_l pushBack _u;

_k pushBack "Squad_1";
_u		= ["rhsusf_army_ucp_arb_teamleader"];
_u pushBack "rhsusf_army_ucp_arb_autorifleman";
_u pushBack "rhsusf_army_ucp_arb_teamleader";
_u pushBack "rhsusf_army_ucp_arb_teamleader";
_u pushBack "rhsusf_army_ucp_arb_riflemanat";
_u pushBack "rhsusf_army_ucp_arb_medic";
_l pushBack _u;

_k pushBack "Squad_2";
_u		= ["rhsusf_army_ucp_arb_squadleader"];
_u pushBack "rhsusf_army_ucp_arb_autorifleman";
_u pushBack "rhsusf_army_ucp_arb_squadleader";
_u pushBack "rhsusf_army_ucp_riflemanat";
_u pushBack "rhsusf_army_ucp_arb_autorifleman";
_u pushBack "rhsusf_army_ucp_arb_medic";
_l pushBack _u;

_k pushBack "Squad_3";
_u		= ["rhsusf_army_ucp_arb_squadleader"];
_u pushBack "rhsusf_army_ucp_arb_autorifleman";
_u pushBack "rhsusf_army_ucp_arb_squadleader";
_u pushBack "rhsusf_usmc_marpat_d_smaw";
_u pushBack "rhsusf_army_ucp_arb_autorifleman";
_u pushBack "rhsusf_army_ucp_arb_medic";
_l pushBack _u;

_k pushBack "Squad_Advanced";
_u		= ["rhsusf_usmc_marpat_d_teamleader"];
_u pushBack "rhsusf_usmc_marpat_d_jfo";
_u pushBack "rhsusf_usmc_marpat_d_machinegunner";
_u pushBack "rhsusf_usmc_marpat_d_jfo";
_u pushBack "rhsusf_usmc_marpat_d_marksman";
_l pushBack _u;

_k pushBack "Team_0";
_u 		= ["rhsusf_army_ucp_arb_teamleader"];
_u pushBack "rhsusf_army_ucp_arb_machinegunner";
_u pushBack "rhsusf_army_ucp_arb_rifleman";
_u pushBack "rhsusf_army_ucp_arb_grenadier";
_u pushBack "rhsusf_army_ucp_arb_riflemanat";
_u pushBack "rhsusf_army_ucp_arb_medic";
_l pushBack _u;

_k pushBack "Team_1";
_u 		= ["rhsusf_army_ucp_arb_teamleader"];
_u pushBack "rhsusf_army_ucp_arb_autorifleman";
_u pushBack "rhsusf_army_ucp_arb_rifleman";
_u pushBack "rhsusf_army_ucp_arb_grenadier";
_u pushBack "rhsusf_army_ucp_arb_riflemanat";
_u pushBack "rhsusf_army_ucp_arb_medic";
_l pushBack _u;

_k pushBack "Team_2";
_u 		= ["rhsusf_army_ucp_arb_squadleader"];
_u pushBack "rhsusf_army_ucp_arb_autorifleman";
_u pushBack "rhsusf_army_ucp_arb_grenadier";
_u pushBack "rhsusf_army_ucp_arb_rifleman";
_u pushBack "rhsusf_army_ucp_arb_medic";
_u pushBack "rhsusf_army_ucp_arb_marksman";
_l pushBack _u;

_k pushBack "Team_3";
_u 		= ["rhsusf_army_ucp_arb_squadleader"];
_u pushBack "rhsusf_army_ucp_arb_autorifleman";
_u pushBack "rhsusf_army_ucp_arb_rifleman";
_u pushBack "rhsusf_usmc_marpat_d_smaw";
_u pushBack "rhsusf_army_ucp_javelin";
_u pushBack "rhsusf_army_ucp_arb_grenadier";
_u pushBack "rhsusf_army_ucp_arb_sniper_m107";
_l pushBack _u;

_k pushBack "Team_MG_0";
_u		= ["rhsusf_army_ucp_arb_machinegunner"];
_u pushBack "rhsusf_army_ucp_arb_machinegunner";
_u pushBack "rhsusf_army_ucp_arb_machinegunner";
_u pushBack "rhsusf_army_ucp_arb_machinegunner";
_u pushBack "rhsusf_army_ucp_arb_medic";
_l pushBack _u;

_k pushBack "Team_MG_1";
_u		= ["rhsusf_army_ucp_arb_autorifleman"];
_u pushBack "rhsusf_army_ucp_arb_autorifleman";
_u pushBack "rhsusf_army_ucp_arb_machinegunner";
_u pushBack "rhsusf_army_ucp_arb_machinegunner";
_u pushBack "rhsusf_army_ucp_arb_medic";
_l pushBack _u;

_k pushBack "Team_MG_2";
_u		= ["rhsusf_army_ucp_arb_autorifleman"];
_u pushBack "rhsusf_army_ucp_arb_autorifleman";
_u pushBack "rhsusf_army_ucp_arb_autorifleman";
_u pushBack "rhsusf_army_ucp_arb_autorifleman";
_u pushBack "rhsusf_army_ucp_arb_medic";
_l pushBack _u;

_k pushBack "Team_MG_3";
_u		= ["rhsusf_army_ucp_arb_machinegunner"];
_u pushBack "rhsusf_army_ucp_arb_machinegunner";
_u pushBack "rhsusf_army_ucp_arb_machinegunner";
_u pushBack "rhsusf_army_ucp_arb_machinegunner";
_l pushBack _u;

_k pushBack "Team_AT_0";
_u		= ["rhsusf_army_ucp_arb_riflemanat"];
_u pushBack "rhsusf_army_ucp_arb_riflemanat";
_u pushBack "rhsusf_army_ucp_arb_riflemanat";
_u pushBack "rhsusf_army_ucp_arb_medic";
_l pushBack _u;

_k pushBack "Team_AT_1";
_u		= ["rhsusf_army_ucp_arb_riflemanat"];
_u pushBack "rhsusf_army_ucp_arb_riflemanat";
_u pushBack "rhsusf_usmc_marpat_d_smaw";
_u pushBack "rhsusf_army_ucp_arb_medic";
_l pushBack _u;

_k pushBack "Team_AT_2";
_u		= ["rhsusf_usmc_marpat_d_smaw"];
_u pushBack "rhsusf_usmc_marpat_d_smaw";
_u pushBack "rhsusf_army_ucp_riflemanat";
_u pushBack "rhsusf_army_ucp_arb_medic";
_l pushBack _u;

_k pushBack "Team_AT_3";
_u		= ["rhsusf_usmc_marpat_d_smaw"];
_u pushBack "rhsusf_army_ucp_javelin";
_u pushBack "rhsusf_army_ucp_javelin";
_u pushBack "rhsusf_army_ucp_arb_medic";
_l pushBack _u;

_k pushBack "Team_AA";
_u =      ["rhsusf_army_ucp_aa"];
_u pushBack "rhsusf_army_ucp_aa";
_u pushBack "rhsusf_army_ucp_aa";
_l pushBack _u;

_k pushBack "Team_Sniper_0";
_u		= ["rhsusf_army_ucp_arb_rifleman"];
_u pushBack "rhsusf_army_ucp_arb_rifleman";
_u pushBack "rhsusf_army_ucp_arb_rifleman";
_l pushBack _u;

_k pushBack "Team_Sniper_1";
_u		= ["rhsusf_army_ucp_arb_rifleman"];
_u pushBack "rhsusf_army_ucp_arb_rifleman";
_l pushBack _u;

_k pushBack "Team_Sniper_2";
_u		= ["rhsusf_army_ucp_arb_rifleman"];
_u pushBack "rhsusf_army_ucp_arb_marksman";
_l pushBack _u;

_k pushBack "Team_Sniper_3";
_u		= ["rhsusf_socom_marsoc_spotter"];
_u pushBack "rhsusf_army_ucp_arb_sniper_m107";
_u pushBack "rhsusf_usmc_marpat_d_sniper_m107";
_l pushBack _u;

_k pushBack "Motorized_0";
_u =      ["rhsusf_m1025_d_m2"];
_u pushBack "rhsusf_m1025_d_Mk19";
_l pushBack _u;

_k pushBack "Motorized_1";
_u =      ["rhsusf_m1025_d_m2"];
_u pushBack "rhsusf_m1025_d_Mk19";
_l pushBack _u;

_k pushBack "Motorized_2";
_u =      ["rhsusf_M1237_M2_usarmy_d"];
_u pushBack "rhsusf_M1237_MK19_usarmy_d";
_u pushBack "rhsusf_M1237_MK19_usarmy_d";
_l pushBack _u;

_k pushBack "Motorized_3";
_u =      ["rhsusf_M1232_M2_usarmy_d"];
_u pushBack "rhsusf_M1232_MK19_usarmy_d";
_u pushBack "CUP_B_HMMWV_TOW_USA";
_l pushBack _u;

_k pushBack "Motorized_4";
_u =      ["rhsusf_M1237_M2_usarmy_d"];
_u pushBack "CUP_B_LAV25M240_desert_USMC";
_u pushBack "CUP_B_HMMWV_TOW_USA";
_l pushBack _u;

_k pushBack "AA_Light";
_u		= ["CUP_B_HMMWV_Avenger_USA"];
_u pushBack "CUP_B_HMMWV_Avenger_USA";
_l pushBack _u;

_k pushBack "AA_Heavy";
_u		= ["CUP_B_HMMWV_Avenger_USA"];
_u pushBack "RHS_M6";
_l pushBack _u;

_k pushBack "Mechanized_0";
_u		= ["rhsusf_m113d_usarmy_M240"];
_u pushBack "rhsusf_m113d_usarmy_MK19";
_l pushBack _u;

_k pushBack "Mechanized_1";
_u		= ["RHS_M2A2"];
_u pushBack "RHS_M2A3";
_l pushBack _u;

_k pushBack "Mechanized_2";
_u		= ["RHS_M2A2_BUSKI"];
_u pushBack "RHS_M2A3_BUSKI";
_l pushBack _u;

_k pushBack "Mechanized_3";
_u		= ["RHS_M2A2_BUSKI"];
_u pushBack "RHS_M2A3_BUSKI";
_u pushBack "RHS_M2A3_BUSKIII";
_l pushBack _u;

_k pushBack "Armored_0";
_u		= ["RHS_M2A2"];
_u pushBack "RHS_M2A3";
_l pushBack _u;

_k pushBack "Armored_1";
_u		= ["RHS_M2A3_BUSKI"];
_u pushBack "RHS_M2A3_BUSKIII";
_l pushBack _u;

_k pushBack "Armored_2";
_u		= ["rhsusf_m1a1fep_d"];
_u pushBack "rhsusf_m1a1aimd_usarmy_d";
_l pushBack _u;

_k pushBack "Armored_3";
_u		= ["rhsusf_m1a1aim_tuski_d"];
_u pushBack "rhsusf_m1a2sep1tuskid_usarmy";
_u pushBack "rhsusf_m1a2sep1tuskiid_usarmy";
_l pushBack _u;


[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";
*/