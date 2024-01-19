/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "GUER";
_faction = "GUE";

_k pushBack "Squad";
_u		= [selectRandom["CUP_I_PMC_Winter_Soldier_TL","cwr3_i_soldier_tl","CUP_I_GUE_Commander"]];
_u = _u + [selectRandom["CUP_I_GUE_Gamekeeper","CUP_I_PMC_Medic","cwr3_i_soldier_medic"]];
_u = _u + [selectRandom["CUP_I_GUE_Soldier_LAT","cwr3_i_soldier_at_rpg7","CUP_I_PMC_Winter_Soldier_AT"]];
_u = _u + [selectRandom["CUP_I_PMC_Soldier_MG_PKM","CUP_I_TK_GUE_Soldier_MG","cwr3_i_soldier_hg"]];
_u = _u + [selectRandom["CUP_I_GUE_Soldier_AT","cwr3_i_soldier_at_at4","CUP_I_TK_GUE_Soldier_AT"]];
_u = _u + [selectRandom["CUP_I_TK_GUE_Soldier_LAT","CUP_I_PMC_Winter_Soldier_AT","cwr3_i_soldier_at_rpg75"]];
_l pushBack _u;

_k pushBack "Squad_Advanced";
_u		= [selectRandom["CUP_I_GUE_Farmer","cwr3_i_militia_g3","CUP_I_PMC_Bodyguard_AA12"]];
_u = _u + [selectRandom["CUP_I_PMC_Soldier_MG","cwr3_i_soldier_ar","CUP_I_GUE_Soldier_AR"]];
_u = _u + [selectRandom["cwr3_i_soldier_aa_strela","CUP_I_GUE_Soldier_AA","CUP_I_PMC_Soldier_AA"]];
_u = _u + [selectRandom["CUP_I_PMC_Bodyguard_M4","cwr3_i_militia_fal","CUP_I_GUE_Villager"]];
_u = _u + [selectRandom["CUP_I_PMC_Sniper_KSVK","CUP_I_PMC_Winter_Sniper_KSVK","CUP_I_GUE_Soldier_AA2"]];
_u = _u + [selectRandom["CUP_I_GUE_Soldier_LAT","cwr3_i_soldier_at_rpg75","CUP_I_TK_GUE_Soldier_HAT"]];
_u = _u + [selectRandom["cwr3_i_militia_ak","CUP_I_GUE_Woodman","CUP_I_GUE_Local"]];
_l pushBack _u;

_k pushBack "Team";
_u		= [selectRandom["CUP_I_PMC_Contractor1","CUP_I_PMC_Winter_Soldier","CUP_I_GUE_Soldier_AKS74"]];
_u = _u + [selectRandom["CUP_I_GUE_Saboteur","cwr3_i_soldier_sapper","CUP_I_TK_GUE_Mechanic"]];
_u = _u + [selectRandom["CUP_I_TK_GUE_Soldier_LAT","CUP_I_PMC_Soldier_AT","cwr3_i_soldier_at_at4"]];
_u = _u + [selectRandom["CUP_I_PMC_Contractor2","CUP_I_TK_GUE_Soldier_M16A2","CUP_I_PMC_Winter_Soldier_GL"]];
_u = _u + [selectRandom["CUP_I_PMC_Winter_Medic","CUP_I_TK_GUE_Guerilla_Medic","cwr3_i_soldier_medic"]];
_u = _u + [selectRandom["CUP_I_TK_GUE_Soldier_HAT","CUP_I_PMC_Soldier_AT","CUP_I_GUE_Soldier_AT"]];
_u = _u + [selectRandom["CUP_I_GUE_Soldier_LAT","cwr3_i_soldier_at_rpg7","CUP_I_PMC_Winter_Soldier_AT"]];
_l pushBack _u;

_k pushBack "Team_MG";
_u =      [selectRandom["CUP_I_GUE_Officer","cwr3_i_officer","CUP_I_TK_GUE_Commander"]];
_u = _u + [selectRandom["CUP_I_PMC_Winter_Sniper","CUP_I_PMC_Contractor1","cwr3_i_soldier_g3"]];
_u = _u + [selectRandom["CUP_I_PMC_Soldier_MG","CUP_I_TK_GUE_Soldier_MG","cwr3_i_soldier_hg"]];
_u = _u + [selectRandom["CUP_I_PMC_Soldier_MG_PKM","CUP_I_PMC_Winter_Soldier_MG","CUP_I_GUE_Soldier_MG"]];
_l pushBack _u;


_k pushBack "Team_AT";
_u =     [selectRandom["CUP_I_GUE_Soldier_AKSU","cwr3_i_soldier_marksman","CUP_I_TK_GUE_Soldier_GL"]];
_u = _u + [selectRandom["CUP_I_TK_GUE_Soldier_HAT","cwr3_i_soldier_at_rpg7","cwr3_i_soldier_at_at4"]];
_u = _u + [selectRandom["cwr3_i_soldier_sks","CUP_I_GUE_Soldier_GL","CUP_I_TK_GUE_Guerilla_Enfield"]];
_u = _u + [selectRandom["CUP_I_GUE_Soldier_AT","cwr3_i_soldier_at_rpg7","cwr3_i_soldier_at_rpg75"]];
_u = _u + [selectRandom["CUP_I_TK_GUE_Soldier_LAT","CUP_I_PMC_Winter_Soldier_AT","CUP_I_PMC_Soldier_AT"]];
_l pushBack _u;

_k pushBack "Team_AA";
_u		= [selectRandom["CUP_I_PMC_Soldier_GL","cwr3_i_militia_g3","CUP_I_GUE_Farmer"]];
_u = _u + [selectRandom["CUP_I_GUE_Soldier_AKSU","cwr3_i_soldier_fal","cwr3_i_soldier_vz58"]];
_u = _u + [selectRandom["CUP_I_PMC_Soldier_AA","CUP_I_TK_GUE_Soldier_AA","CUP_I_PMC_Winter_Soldier_AA"]];
_u = _u + [selectRandom["CUP_I_GUE_Soldier_AA2","CUP_I_GUE_Soldier_AA","cwr3_i_soldier_aa_strela"]];
_l pushBack _u;

_k pushBack "Team_Sniper";
_u		= [selectRandom["CUP_I_GUE_Soldier_Scout","cwr3_i_soldier_spotter"]];
_u = _u + [selectRandom["cwr3_i_soldier_sniper","CUP_I_GUE_Sniper"]];
_u = _u + [selectRandom["cwr3_i_soldier_sniper","CUP_I_GUE_Sniper"]];
_l pushBack _u;

_k pushBack "Motorized";
_u =      [selectRandom["CUP_I_Datsun_PK_TK_Random","CUP_I_Ural_ZU23_TK_Gue","CUP_I_RG31_M2_ION"]];
_u = _u + [selectRandom["pook_AdunokM_GL_IND","pook_AdunokM_DSHK_IND","CUP_I_RG31_M2_GC_ION"]];
_u = _u + [selectRandom["CUP_I_Hilux_DSHKM_TK","CUP_I_nM1025_M2_ION_WIN","CUP_B_nM1025_SOV_M2_ION_WIN"]];
_u = _u + [selectRandom["cwr3_i_uaz_spg9","cwr3_i_uaz_ags30","CUP_I_Hilux_AGS30_TK"]];
_u = _u + [selectRandom["cwr3_i_uaz_aa","CUP_I_Hilux_metis_TK","CUP_I_Hilux_UB32_TK"]];
_l pushBack _u;

_k pushBack "Motorized";
_u =      [selectRandom["CUP_I_nM1025_M240_ION_WIN","CUP_I_SUV_Armored_ION","cwr3_i_ural_zu23"]];
_u = _u + [selectRandom["pook_Adunok_IND","pook_MAARS_AA12_IND","CUP_I_RG31_M2_W_GC_ION"]];
_u = _u + [selectRandom["CUP_B_nM1025_SOV_M2_ION","cwr3_i_uaz_dshkm","CUP_I_RG31E_M2_ION"]];
_u = _u + [selectRandom["CUP_I_Hilux_SPG9_TK","CUP_I_RG31_Mk19_W_ION","CUP_I_nM1025_Mk19_ION_WIN"]];
_u = _u + [selectRandom["CUP_I_Datsun_AA_TK_Random","CUP_I_nM1036_TOW_ION","CUP_I_Hilux_MLRS_TK"]];
_l pushBack _u;

_k pushBack "Motorized";
_u =      [selectRandom["CUP_I_Datsun_PK_TK","CUP_I_nM1025_M240_ION","CUP_I_RG31_M2_W_ION"]];
_u = _u + [selectRandom["pook_MAARS_M240_IND","pook_MRK27BT_IND","CUP_I_RG31E_M2_W_ION"]];
_u = _u + [selectRandom["CUP_I_nM1025_M2_ION","CUP_I_BTR40_MG_TKG","CUP_I_Hilux_M2_TK"]];
_u = _u + [selectRandom["CUP_I_RG31_Mk19_ION","CUP_I_nM1025_Mk19_ION","CUP_I_Hilux_zu23_TK"]];
_u = _u + [selectRandom["CUP_I_Hilux_igla_TK","CUP_I_nM1036_TOW_ION_WIN","CUP_I_Hilux_podnos_TK"]];
_l pushBack _u;

_k pushBack "AA_Light";
_u		= [selectRandom["CUP_I_Datsun_AA_TK_Random","CUP_I_Hilux_igla_TK","cwr3_i_uaz_aa"]];
_u = _u + [selectRandom["cwr3_i_ural_zu23","CUP_I_Hilux_zu23_TK","CUP_I_Ural_ZU23_TK_Gue"]];
_l pushBack _u;

_k pushBack "AA_Heavy";
_u		= [selectRandom["cwr3_i_mtlb_sa13","BRDM2IMPAA_INDFOR","BRDM2IMP_9K31_INDFOR"]];
_u = _u + [selectRandom["cwr3_i_bmp2_zu23","pook_ZSU_base_IND","pook_ZSU57_base_IND"]];
_l pushBack _u;

_k pushBack "Mechanized";
_u		= [selectRandom["BRDM2IMPMk19_INDFOR","BRDM2IMPM240_INDFOR","BRDM2IMPPKM_INDFOR"]];
_u = _u + [selectRandom["CUP_I_BRDM2_TK_Gue","CUP_I_BTR80_ION","BRDM2M_INDFOR"]];
_u = _u + [selectRandom["cwr3_i_btr60","cwr3_i_brdm2","BRDM2IMPM2_INDFOR"]];
_u = _u + [selectRandom["pook_BTR60_INDFOR","BRDM2IMPDSHK_INDFOR"]];
_u = _u + [selectRandom["BRDM2IMP_INDFOR","pook_BTR80_INDFOR"]];
_u = _u + [selectRandom["pook_BTR80MWS_INDFOR","pook_BTRMWS_INDFOR","BRDM2MAGS_INDFOR"]];
_l pushBack _u;

_k pushBack "Mechanized_Heavy";
_u =    [selectRandom["BRDM2IMPRKT_INDFOR","pook_BTR2A42_INDFOR","pook_BTR80_2A42_INDFOR"]];
_u = _u + [selectRandom["CUP_I_BTR80A_ION","pook_BPM2A42_INDFOR","BRDM2IMPTOW_INDFOR"]];
_u = _u + [selectRandom["BRDM2IMPAT3_INDFOR","BRDM2IMPAT2_INDFOR","CUP_I_BRDM2_ATGM_TK_Gue"]];
_u = _u + [selectRandom["cwr3_i_brdm2_atgm","BRDM2IMPAT5_INDFOR","BRDM2IMPAT3c_INDFOR"]];
_l pushBack _u;

_k pushBack "Armored_Light";
_u		= [selectRandom["cwr3_i_mtlb_pk","cwr3_i_bmp1","CUP_I_MTLB_pk_NAPA"]];
_u = _u + [selectRandom["CUP_I_BMP2_NAPA","CUP_I_BMP1_TK_GUE","cwr3_i_bmp2"]];
_l pushBack _u;

_k pushBack "Armored_Heavy";
_u		= [selectRandom["cwr3_i_m41a1","CUP_I_T34_TK_GUE","cwr3_i_pt76b"]];
_u = _u + [selectRandom["cwr3_i_t72b1","CUP_I_T72_NAPA","cwr3_i_t55a"]];
_u = _u + [selectRandom["CUP_I_T55_TK_GUE","cwr3_i_t72a","cwr3_i_t34"]];

_l pushBack _u;

[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";