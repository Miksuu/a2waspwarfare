/*
	Groups (Used in towns).
*/

Private ["_faction","_k","_l","_side","_u"];
_l = [];//--- Unit list
_k = [];//--- Type used by AI.

_side = "EAST";
_faction = "RU";






_k pushBack "Squad_0";
_u		= [selectRandom["cwr3_o_soldier_sl","cwr3_o_soldier","cwr3_o_soldier_ar"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg18","cwr3_o_soldier_ar","cwr3_o_soldier_mg"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg18","cwr3_o_soldier_ar","cwr3_o_soldier_marksman"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg18","cwr3_o_soldier_ar","cwr3_o_soldier"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg18","cwr3_o_soldier_ar","cwr3_o_soldier_backpack"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg18","cwr3_o_soldier_ar","cwr3_o_soldier_engineer"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg18","cwr3_o_soldier_ar","cwr3_o_soldier_medic"]];
_l pushBack _u;








_k pushBack "Squad_1";
_u		= [selectRandom["cwr3_o_soldier_sl","cwr3_o_officer_night","cwr3_o_soldier_ar"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg7","cwr3_o_soldier_at_at4","cwr3_o_soldier_mg"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg7","cwr3_o_soldier_hg","cwr3_o_soldier_marksman"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg7","cwr3_o_soldier_mg","cwr3_o_soldier_aa_strela"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg7","cwr3_o_soldier_hg","cwr3_o_soldier_aa_strela"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg7","cwr3_o_soldier_at_at4","cwr3_o_soldier_engineer"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg7","cwr3_o_soldier_at_at4","cwr3_o_soldier_medic"]];
_u = _u + ["cwr3_o_soldier_aa_strela"];
_l pushBack _u;








_k pushBack "Squad_2";
_u		= [selectRandom["CUP_O_RU_Soldier_SL_M_VDV_EMR_V2","CUP_O_RU_Soldier_TL_M_VDV_EMR_V2","CUP_O_RU_Soldier_AAT_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_Marksman_M_VDV_EMR_V2","CUP_O_RU_Soldier_GL_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_LAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_MG_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_LAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_Marksman_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_LAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_Engineer_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AA_M_VDV_EMR_V2","CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AA_M_VDV_EMR_V2","CUP_O_RU_Soldier_AR_M_VDV_EMR_V2"]];
_u = _u + ["CUP_O_RU_Soldier_AR_M_VDV_EMR_V2"];
_l pushBack _u;








_k pushBack "Squad_3";
_u		= [selectRandom["CUP_O_RU_Soldier_SL_M_VDV_EMR_V2","CUP_O_RU_Soldier_TL_M_VDV_EMR_V2","CUP_O_RU_Recon_TL_Ratnik_Summer"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AHAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_GL_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_MG_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Recon_Marksman_Ratnik_Summer"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_Engineer_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AA_M_VDV_EMR_V2","CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_MVD_Soldier_Marksman","CUP_O_RU_Soldier_AA_M_VDV_EMR_V2","CUP_O_RU_Soldier_AR_M_VDV_EMR_V2"]];
_u = _u + ["CUP_O_RU_Soldier_AA_M_VDV_EMR_V2"];
_l pushBack _u;









_k pushBack "Squad_Advanced";
_u		= ["cwr3_o_officer_night"];
_u = _u + ["cwr3_o_soldier_aa_strela"];
_u = _u + ["cwr3_o_soldier_at_at4"];
_u = _u + ["cwr3_o_soldier_aat_at4"];
_u = _u + ["cwr3_o_soldier_marksman"];
_u = _u + ["cwr3_o_soldier_mg"];
_u = _u + ["cwr3_o_soldier_medic"];
_l pushBack _u;






_k pushBack "Team_0";
_u		= [selectRandom["cwr3_o_soldier_gl","cwr3_o_soldier_ar","cwr3_o_soldier"]];
_u = _u + [selectRandom["cwr3_o_soldier_engineer","cwr3_o_soldier_ar","cwr3_o_soldier_marksman"]];
_u = _u + [selectRandom["cwr3_o_soldier_ar","cwr3_o_soldier_at_rpg18","cwr3_o_soldier_backpack"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg18","cwr3_o_soldier_ar","cwr3_o_soldier_mg"]];
_u = _u + ["cwr3_o_soldier_at_rpg18"];
_u = _u + ["cwr3_o_soldier_medic"];
_l pushBack _u;






_k pushBack "Team_1";
_u		= [selectRandom["cwr3_o_soldier_gl","cwr3_o_soldier_ar","cwr3_o_soldier_sl"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg7","cwr3_o_soldier_aat_at4","cwr3_o_soldier_hg"]];
_u = _u + [selectRandom["cwr3_o_soldier_ar","cwr3_o_soldier_at_rpg18","cwr3_o_soldier_marksman"]];
_u = _u + [selectRandom["cwr3_o_soldier_at_rpg18","cwr3_o_soldier_hg","cwr3_o_soldier_mg"]];
_u = _u + ["cwr3_o_soldier_at_at4"];
_u = _u + ["cwr3_o_soldier_aa_strela"];
_u = _u + ["cwr3_o_soldier_medic"];
_l pushBack _u;







_k pushBack "Team_2";
_u		= [selectRandom["CUP_O_RU_Soldier_TL_M_VDV_EMR_V2","CUP_O_RU_Soldier_SL_M_VDV_EMR_V2","CUP_O_RU_Soldier_GL_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_Saiga_M_VDV_EMR_V2","CUP_O_RU_Soldier_MG_M_VDV_EMR_V2","CUP_O_RU_Soldier_AR_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_AAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_LAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_Marksman_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_LAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_GL_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AA_M_VDV_EMR_V2","CUP_O_RU_Soldier_LAT_M_VDV_EMR_V2"]];
_u = _u + ["CUP_O_RU_Soldier_AT_M_VDV_EMR_V2"];
_u = _u + ["CUP_O_RU_Soldier_AA_M_VDV_EMR_V2"];
_u = _u + ["CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2"];
_l pushBack _u;






_k pushBack "Team_3";
_u		= [selectRandom["CUP_O_RUS_SpecOps_Scout","CUP_O_RU_Soldier_SL_M_VDV_EMR_V2","CUP_O_RU_Recon_TL_Ratnik_Summer"]];
_u = _u + [selectRandom["CUP_O_RUS_SpecOps_Scout_Night","CUP_O_RU_Recon_Exp_Ratnik_Summer","CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_AHAT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AA_M_VDV_EMR_V2","CUP_O_MVD_Soldier_Marksman"]];
_u = _u + [selectRandom["CUP_O_MVD_Soldier_Marksman","CUP_O_RU_Soldier_AHAT_M_VDV_EMR_V2","CUP_O_RU_Recon_Exp_Ratnik_Summer"]];
_u = _u + [selectRandom["CUP_O_RU_Soldier_AT_M_VDV_EMR_V2","CUP_O_RU_Soldier_AA_M_VDV_EMR_V2","CUP_O_RU_Recon_Marksman_Ratnik_Summer"]];
_u = _u + ["CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2"];
_u = _u + ["CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2"];
_u = _u + ["CUP_O_RU_Soldier_AA_M_VDV_EMR_V2"];
_u = _u + ["CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2"];
_l pushBack _u;




_k pushBack "Team_MG_0";
_u		= ["cwr3_o_soldier_at_rpg18"];
_u pushBack "cwr3_o_soldier_ar";
_u pushBack "cwr3_o_soldier_ar";
_u pushBack "cwr3_o_soldier_ar";
_u pushBack "cwr3_o_soldier_medic";
_l pushBack _u;

_k pushBack "Team_MG_1";
_u		= ["cwr3_o_soldier_at_rpg7"];
_u pushBack "cwr3_o_soldier_ar";
_u pushBack "cwr3_o_soldier_mg";
_u pushBack "cwr3_o_soldier_mg";
_u pushBack "cwr3_o_soldier_medic";
_l pushBack _u;

_k pushBack "Team_MG_2";
_u		= ["CUP_O_RU_Soldier_AT_M_VDV_EMR_V2"];
_u pushBack "CUP_O_RU_Soldier_AR_M_VDV_EMR_V2";
_u pushBack "CUP_O_RU_Soldier_MG_M_VDV_EMR_V2";
_u pushBack "CUP_O_RU_Soldier_MG_M_VDV_EMR_V2";
_u pushBack "CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2";
_l pushBack _u;

_k pushBack "Team_MG_3";
_u		= ["CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2"];
_u pushBack "CUP_O_RU_Soldier_AR_M_VDV_EMR_V2";
_u pushBack "CUP_O_RU_Soldier_MG_M_VDV_EMR_V2";
_u pushBack "CUP_O_RU_Soldier_MG_M_VDV_EMR_V2";
_u pushBack "CUP_O_RU_Soldier_AA_M_VDV_EMR_V2";
_u pushBack "CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2";

_l pushBack _u;

_k pushBack "Team_AT_0";
_u		= ["cwr3_o_soldier_ar"];
_u pushBack "cwr3_o_soldier_at_rpg18";
_u pushBack "cwr3_o_soldier_at_rpg18";
_u pushBack "cwr3_o_soldier_medic";
_l pushBack _u;

_k pushBack "Team_AT_1";
_u		= ["cwr3_o_soldier_gl"];
_u pushBack "cwr3_o_soldier_at_at4";
_u pushBack "cwr3_o_soldier_at_at4";
_u pushBack "cwr3_o_soldier_aat_at4";
_u pushBack "cwr3_o_soldier_medic";
_l pushBack _u;

_k pushBack "Team_AT_2";
_u		= ["CUP_O_RU_Soldier_TL_M_VDV_EMR_V2"];
_u pushBack "CUP_O_RU_Soldier_AT_M_VDV_EMR_V2";
_u pushBack "CUP_O_RU_Soldier_AT_M_VDV_EMR_V2";
_u pushBack "CUP_O_RU_Soldier_AAT_M_VDV_EMR_V2";
_u pushBack "CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2";
_l pushBack _u;

_k pushBack "Team_AT_3";
_u		= ["CUP_O_RU_Recon_TL_Ratnik_Summer"];
_u pushBack "CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2";
_u pushBack "CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2";
_u pushBack "CUP_O_RU_Soldier_AHAT_M_VDV_EMR_V2";
_u pushBack "CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2";
_l pushBack _u;

_k pushBack "Team_AA";
_u =      ["cwr3_o_soldier_gl"];
_u pushBack "cwr3_o_soldier_aa_strela";
_u pushBack "cwr3_o_soldier_aa_strela";
_l pushBack _u;

_k pushBack "Team_Sniper_0";
_u		= ["cwr3_o_soldier_marksman"];
_u pushBack "cwr3_o_soldier_marksman";
_l pushBack _u;

_k pushBack "Team_Sniper_1";
_u		= ["cwr3_o_soldier_spotter"];
_u pushBack "cwr3_o_soldier_sniper";
_u pushBack "cwr3_o_soldier_sniper";
_l pushBack _u;

_k pushBack "Team_Sniper_2";
_u		= ["CUP_O_RU_Spotter_VDV_M_EMR"];
_u pushBack "CUP_O_RU_Sniper_VDV_M_EMR";
_u pushBack "CUP_O_RU_Sniper_VDV_M_EMR";
_u pushBack "CUP_O_RU_Sniper_VDV_M_EMR";
_l pushBack _u;

_k pushBack "Team_Sniper_3";
_u		= ["CUP_O_RU_Spotter_VDV_M_EMR"];
_u pushBack "CUP_O_TK_Sniper_KSVK";
_u pushBack "CUP_O_RU_Sniper_KSVK_VDV";
_l pushBack _u;

/*
_k pushBack "Motorized_0";
_u =      ["CUP_O_UAZ_MG_RU"];
_u pushBack "CUP_O_UAZ_AGS30_RU";
_l pushBack _u;
*/

_k pushBack "Motorized_0";
_u		= [selectRandom["CUP_O_UAZ_MG_RU","CUP_O_UAZ_SPG9_RU","CUP_O_GAZ_Vodnik_PK_RU"]];
_u = _u + [selectRandom["CUP_O_UAZ_AGS30_RU","cwr3_o_ural_zu23","CUP_O_GAZ_Vodnik_AGS_RU"]];
_l pushBack _u;


_k pushBack "Motorized_1";
_u		= [selectRandom["cwr3_o_brdm2um","BRDM2IMPPKM_OPFOR","CUP_O_GAZ_Vodnik_KPVT_RU"]];
_u = _u + [selectRandom["BRDM2IMPDSHK_OPFOR","CUP_O_BRDM2_RUS","CUP_O_UAZ_METIS_RU"]];
_u = _u + [selectRandom["CUP_O_UAZ_SPG9_RU","CUP_O_UAZ_AGS30_RU","CUP_O_UAZ_MG_RU"]];
_l pushBack _u;

_k pushBack "Motorized_2";
_u		= [selectRandom["CUP_O_GAZ_Vodnik_KPVT_RU","BRDM2IMPDSHK_OPFOR","CUP_O_BRDM2_RUS"]];
_u = _u + [selectRandom["BRDM2IMPAT2_OPFOR","BRDM2IMPAT3_OPFOR","CUP_O_UAZ_METIS_RU"]];
_u = _u + [selectRandom["CUP_O_UAZ_AA_RU","CUP_O_GAZ_Vodnik_BPPU_RU","pook_BTRMWS_OPFOR"]];
_l pushBack _u;

_k pushBack "Motorized_3";
_u		= [selectRandom["CUP_O_GAZ_Vodnik_BPPU_RU","cwr3_o_btr80","BRDM2MAGS_OPFOR"]];
_u = _u + [selectRandom["pook_BTR80MWS_OPFOR","pook_BTR2A42_OPFOR","CUP_O_BM21_RU"]];
_u = _u + [selectRandom["pook_BTR2A42_OPFOR","CUP_O_GAZ_Vodnik_BPPU_RU","CUP_O_BTR90_RU"]];
_l pushBack _u;


_k pushBack "Motorized_4";
_u		= [selectRandom["CUP_O_GAZ_Vodnik_BPPU_RU","CUP_O_BTR90_RU","pook_BTR2A42_OPFOR"]];
_u = _u + [selectRandom["CUP_O_BRDM2_ATGM_RUS","BRDM2IMPAT3_OPFOR","BRDM2IMPAT2_OPFOR"]];
_u = _u + [selectRandom["pook_96K6_root","BRDM2IMP_9K31_OPFOR","CUP_O_UAZ_AA_RU"]];
_u = _u + [selectRandom["pook_9K57M_OPFOR","pook_A222_OPFOR","pook_9K58_OPFOR"]];
_u = _u + [selectRandom["CUP_O_GAZ_Vodnik_BPPU_RU","CUP_O_BTR90_RU","pook_BTR2A42_OPFOR"]];
_l pushBack _u;



_k pushBack "AA_Light";
_u		= [selectRandom["cwr3_o_ural_zu23","CUP_O_UAZ_AA_RU","BRDM2IMP_9K31_OPFOR"]];
_u = _u + [selectRandom["pook_96K6_root","BRDM2IMP_9K31_OPFOR","CUP_O_UAZ_AA_RU"]];
_l pushBack _u;


_k pushBack "AA_Heavy";
_u		= [selectRandom["cwr3_o_bmp2_zu23","cwr3_o_zsu","CUP_O_2S6M_RU"]];
_u = _u + [selectRandom["cwr3_o_mtlb_sa13","CUP_O_2S6M_RU"]];
_l pushBack _u;



_k pushBack "Mechanized_0";
_u		= [selectRandom["CUP_O_MTLB_pk_WDL_RU","cwr3_o_bmp2_zu23","cwr3_o_bmp1"]];
_u = _u + [selectRandom["cwr3_o_bmp1","cwr3_o_bmp2_zu23"]];
_l pushBack _u;

_k pushBack "Mechanized_1";
_u		= [selectRandom["cwr3_o_bmp1p","cwr3_o_bmp1"]];
_u = _u + [selectRandom["cwr3_o_bmp1","cwr3_o_bmp1p"]];
_l pushBack _u;


_k pushBack "Mechanized_2";
_u		= [selectRandom["cwr3_o_bmp2","cwr3_o_bmp1p"]];
_u = _u + [selectRandom["cwr3_o_bmp2","cwr3_o_bmp1p"]];
_l pushBack _u;

_k pushBack "Mechanized_3";
_u		= [selectRandom["cwr3_o_bmp2","CUP_O_BMP3_RU"]];
_u = _u + [selectRandom["cwr3_o_bmp2","CUP_O_BMP3_RU"]];
_l pushBack _u;

_k pushBack "Mechanized_4";
_u		= [selectRandom["cwr3_o_bmp2","CUP_O_BMP3_RU"]];
_u = _u + [selectRandom["cwr3_o_bmp2","CUP_O_BMP3_RU"]];
_l pushBack _u;



_k pushBack "Armored_0";
_u		= [selectRandom["cwr3_o_t55","cwr3_o_pt76b","cwr3_o_t55a"]];
_u = _u + [selectRandom["cwr3_o_t55","cwr3_o_pt76b"]];
_l pushBack _u;


_k pushBack "Armored_1";
_u		= [selectRandom["cwr3_o_t55","cwr3_o_t55amv","cwr3_o_t55a"]];
_u = _u + [selectRandom["cwr3_o_t55a","cwr3_o_t55amv"]];
_l pushBack _u;

_k pushBack "Armored_2";
_u		= [selectRandom["cwr3_o_t55amv","cwr3_o_t64b","cwr3_o_t64bv"]];
_u = _u + [selectRandom["cwr3_o_t64bv","CUP_O_T72_RU","pook_TOS1A_OPFOR"]];
_l pushBack _u;

_k pushBack "Armored_3";
_u		= [selectRandom["CUP_O_T90_RU","cwr3_o_t72b1","cwr3_o_t72a"]];
_u = _u + [selectRandom["CUP_O_T90_RU","cwr3_o_t72b1","CUP_O_2S6M_RU"]];
_l pushBack _u;

_k pushBack "Armored_4";
_u		= [selectRandom["CUP_O_T90_RU","cwr3_o_t72b1","cwr3_o_t72a"]];
_u = _u + [selectRandom["CUP_O_T90_RU","cwr3_o_t72b1","CUP_O_2S6M_RU"]];
_l pushBack _u;


[_k,_l,_side,_faction] Call Compile preprocessFile "Common\Config\Config_Groups.sqf";
