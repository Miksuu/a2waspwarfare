Private ['_resTeamCost','_resTeamTemplates','_resTeamTypes','_d','_f','_get','_p','_u'];
/* RES TEAM TEMPLATES */
/* GUE*/
_resTeamTemplates = [];
_resTeamTypes = []; //--- 0 Inf, 2 Light, 3 Armor, 4 Air

_d		= ["Infantry - Weapon Squad"];
_u		= ["cwr3_i_soldier_tl"];
_u pushBack "CUP_I_TK_GUE_Soldier_MG";
_u pushBack "CUP_I_GUE_Soldier_MG";
_u pushBack "CUP_I_PMC_Medic";
_u pushBack "CUP_I_GUE_Gamekeeper";
_u pushBack "CUP_I_PMC_Soldier_AT";
_u pushBack "CUP_I_TK_GUE_Soldier_AT";
_u pushBack "CUP_I_GUE_Soldier_AT";

_resTeamTemplates pushBack _u;
_resTeamTypes pushBack 0;

_d		= ["Infantry - Weapon Squad"];
_u		= ["CUP_I_GUE_Commander"];
_u pushBack "cwr3_i_soldier_hg";
_u pushBack "CUP_I_PMC_Winter_Soldier_MG";
_u pushBack "CUP_I_PMC_Medic";
_u pushBack "CUP_I_TK_GUE_Sniper";
_u pushBack "cwr3_i_soldier_at_at4";
_u pushBack "CUP_I_GUE_Soldier_AT";
_u pushBack "CUP_I_TK_GUE_Soldier_HAT";

_resTeamTemplates pushBack _u;
_resTeamTypes pushBack 0;

_d		= ["Infantry - Weapon Squad"];
_u		= ["CUP_I_TK_GUE_Commander"];
_u pushBack "CUP_I_PMC_Winter_Soldier_MG_PKM";
_u pushBack "cwr3_i_soldier_ar";
_u pushBack "CUP_I_GUE_Medic";
_u pushBack "CUP_I_TK_GUE_Sniper";
_u pushBack "CUP_I_PMC_Soldier_AT";
_u pushBack "cwr3_i_soldier_at_rpg7";
_u pushBack "CUP_I_GUE_Soldier_AT";

_resTeamTemplates pushBack _u;
_resTeamTypes pushBack 0;

_d		= ["Infantry - Weapon Squad"];
_u		= ["CUP_I_PMC_Contractor1"];
_u pushBack "cwr3_i_soldier_hg";
_u pushBack "CUP_I_GUE_Soldier_MG";
_u pushBack "CUP_I_PMC_Winter_Medic";
_u pushBack "CUP_I_PMC_Sniper";
_u pushBack "CUP_I_PMC_Winter_Soldier_AT";
_u pushBack "CUP_I_TK_GUE_Soldier_AT";
_u pushBack "CUP_I_TK_GUE_Soldier_HAT";

_resTeamTemplates pushBack _u;
_resTeamTypes pushback 0;

_d		= ["Motorized - Light DSHKM Patrol"];
_u		= [selectRandom["CUP_I_RG31_M2_ION","CUP_I_Hilux_podnos_TK","CUP_I_Hilux_MLRS_TK"]];


_resTeamTemplates pushBack _u;
_resTeamTypes pushback 2;

_d		= ["Motorized - Light AGS Patrol"];
_u		= [selectRandom["CUP_I_nM1025_Mk19_ION_WIN","CUP_I_Hilux_MLRS_TK","CUP_I_Hilux_podnos_TK"]];




_resTeamTemplates pushBack _u;
_resTeamTypes pushback 2;

_d		= ["Motorized - Light PK Patrol"];
_u		= [selectRandom["CUP_I_Hilux_podnos_TK","CUP_I_Hilux_MLRS_TK","CUP_I_Hilux_UB32_TK"]];



_resTeamTemplates pushBack _u;
_resTeamTypes pushback 2;

_d		= ["Motorized - Light APC Patrol"];
_u		= [selectRandom["CUP_I_Hilux_zu23_TK","CUP_I_Datsun_AA_TK_Random","CUP_I_Hilux_UB32_TK"]];




_resTeamTemplates pushBack _u;
_resTeamTypes pushback 2;

_d		= ["Motorized - BRDM"];
_u		= [selectRandom["CUP_I_BRDM2_TK_Gue","cwr3_i_brdm2","CUP_I_Hilux_MLRS_TK"]];




_resTeamTemplates pushBack _u;
_resTeamTypes pushback 2;

_d		= ["Motorized - BRDM ATGM"];
_u		= [selectRandom["CUP_I_BRDM2_ATGM_TK_Gue","BRDM2IMPTOW_INDFOR","CUP_I_Hilux_podnos_TK"]];




_resTeamTemplates pushBack _u;
_resTeamTypes pushback 2;



_d		= ["Mechanized - BMP 1"];
_u		= [selectRandom["cwr3_i_bmp1","pook_2S5_INDFOR","pook_2S1_INDFOR"]];




_resTeamTemplates pushBack _u;
_resTeamTypes pushback 3;

_d		= ["Mechanized - BMP 2"];
_u		= [selectRandom["CUP_I_BMP2_NAPA","pook_2S1_INDFOR","pook_2S5_INDFOR"]];




_resTeamTemplates pushBack _u;
_resTeamTypes pushback 3;

_d		= ["Mechanized AA - Shilka"];

_u		= [selectRandom["CUP_I_ZSU23_Afghan_AAF","pook_ZSU57_base_IND","pook_2S5_INDFOR"]];


_resTeamTemplates pushBack _u;
_resTeamTypes pushback 3;

_d		= ["Heavy Armor - T-72"];


_u		= [selectRandom["cwr3_i_t72b1","CUP_I_T72_NAPA","pook_2S1_INDFOR"]];


_resTeamTemplates pushBack _u;
_resTeamTypes pushback 3;

_d		= ["Light Air patrol - KA60"];
_u		=[selectRandom["pook_MIG21_INDFOR","cwr3_i_l39_s5","CUP_I_Mi24_Mk3_ION"]];

_resTeamTemplates pushBack _u;
_resTeamTypes pushback 4;

_d		= ["Light Air patrol - AH6J"];
_u		= [selectRandom["cwr3_i_l39_cap","cwr3_i_cessna_t41_armed","CUP_I_Mi24_Mk4_ION"]];
_resTeamTemplates pushBack _u;
_resTeamTypes pushback 4;

missionNamespace setVariable ['cti_GUERRESTEAMTEMPLATES',_resTeamTemplates];
missionNamespace setVariable ['cti_GUERRESTEAMTYPES',_resTeamTypes];

missionNamespace setVariable ['cti_GUERRESCREW','cwr3_i_soldier_crew'];
missionNamespace setVariable ['cti_GUERRESSOLDIER','CUP_I_GUE_Crew'];
missionNamespace setVariable ['cti_GUERRESPILOT','cwr3_i_soldier_pilot_jet'];