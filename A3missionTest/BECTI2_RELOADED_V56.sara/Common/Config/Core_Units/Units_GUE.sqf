Private ['_side','_u'];

/*
USED MODS= 

CBA_A3
CUP Weapons
CUP Units
CUP Vehicles
CUP Terrain-Core
CUP Terrains-Maps
Universal Uniforms
POOK Camonets
POOK AFV Pack
Pook SovietAirForcePack
Pook ARTY Pack
Pook UGV Pack
Firewill`s Aircraft Collection Reborn
POOK SAM PACK
Cold War Rearmed III
3CB BAF Vehicles
Cold War Rearmed III -British Armed Forces
CUP Terrain-CWA
Cold War Rearmed III-Malden Islands
Universal Uniforms:CUP Edition
*/
_side = _this;
_restriction_air = missionNamespace getVariable "cti_C_UNITS_RESTRICT_AIR";

_u = ['CUP_I_GUE_Farmer'];
_u pushBack 'CUP_I_GUE_Forester';
_u pushBack 'CUP_I_GUE_Gamekeeper';
_u pushBack 'CUP_I_GUE_Local';
_u pushBack 'CUP_I_GUE_Villager';
_u pushBack 'CUP_I_GUE_Woodman';

_u pushBack 'cwr3_i_militia_g3';
_u pushBack 'cwr3_i_militia_fal';
_u pushBack 'cwr3_i_militia_ak';

_u pushBack 'CUP_I_PMC_Bodyguard_AA12';
_u pushBack 'CUP_I_PMC_Bodyguard_M4';
_u pushBack 'CUP_I_PMC_Contractor1';
_u pushBack 'CUP_I_PMC_Contractor2';
_u pushBack 'CUP_I_PMC_Sniper';
_u pushBack 'CUP_I_PMC_Medic';
_u pushBack 'CUP_I_PMC_Soldier_MG';
_u pushBack 'CUP_I_PMC_Soldier_MG_PKM';
_u pushBack 'CUP_I_PMC_Soldier_AT';
_u pushBack 'CUP_I_PMC_Engineer';
_u pushBack 'CUP_I_PMC_Soldier_M4A3';
_u pushBack 'CUP_I_PMC_Soldier';
_u pushBack 'CUP_I_PMC_Soldier_GL';
_u pushBack 'CUP_I_PMC_Soldier_GL_M16A2';
_u pushBack 'CUP_I_PMC_Sniper_KSVK';
_u pushBack 'CUP_I_PMC_Soldier_AA';
_u pushBack 'CUP_I_PMC_Soldier_TL';
_u pushBack 'CUP_I_PMC_Crew';


_u pushBack 'CUP_I_TK_GUE_Soldier_AA';
_u pushBack 'CUP_I_TK_GUE_Soldier_AR';
_u pushBack 'CUP_I_TK_GUE_Guerilla_Medic';
_u pushBack 'CUP_I_TK_GUE_Demo';
_u pushBack 'CUP_I_TK_GUE_Soldier';
_u pushBack 'CUP_I_TK_GUE_Soldier_AK_47S';
_u pushBack 'CUP_I_TK_GUE_Soldier_HAT';
_u pushBack 'CUP_I_TK_GUE_Guerilla_Enfield';
_u pushBack 'CUP_I_TK_GUE_Soldier_GL';
_u pushBack 'CUP_I_TK_GUE_Soldier_M16A2';
_u pushBack 'CUP_I_TK_GUE_Soldier_AAT';
_u pushBack 'CUP_I_TK_GUE_Soldier_LAT';
_u pushBack 'CUP_I_TK_GUE_Soldier_AT';
_u pushBack 'CUP_I_TK_GUE_Sniper';
_u pushBack 'CUP_I_TK_GUE_Mechanic';
_u pushBack 'CUP_I_TK_GUE_Soldier_MG';
_u pushBack 'CUP_I_TK_GUE_Soldier_TL';
_u pushBack 'CUP_I_TK_GUE_Commander';

//WITH CAMO
_u pushBack 'CUP_I_PMC_Winter_Soldier_M4A3';
_u pushBack 'CUP_I_PMC_Winter_Soldier';
_u pushBack 'CUP_I_PMC_Winter_Soldier_GL';
_u pushBack 'CUP_I_PMC_Winter_Sniper_KSVK';
_u pushBack 'CUP_I_PMC_Winter_Crew';
_u pushBack 'CUP_I_PMC_Winter_Soldier_AA';
_u pushBack 'CUP_I_PMC_Winter_Soldier_TL';
_u pushBack 'CUP_I_PMC_Winter_Sniper';
_u pushBack 'CUP_I_PMC_Winter_Medic';
_u pushBack 'CUP_I_PMC_Winter_Soldier_MG';
_u pushBack 'CUP_I_PMC_Winter_Soldier_MG_PKM';
_u pushBack 'CUP_I_PMC_Winter_Soldier_AT';
_u pushBack 'CUP_I_PMC_Winter_Engineer';


_u pushBack 'cwr3_i_soldier_tl';
_u pushBack 'cwr3_i_soldier_sl';
_u pushBack 'cwr3_i_soldier_spotter';
_u pushBack 'cwr3_i_soldier_sniper';
_u pushBack 'cwr3_i_soldier_scout';
_u pushBack 'cwr3_i_soldier_saboteur';
_u pushBack 'cwr3_i_soldier_vz58';
_u pushBack 'cwr3_i_soldier_sks';
_u pushBack 'cwr3_i_soldier_at_rpg75';
_u pushBack 'cwr3_i_soldier_g3';
_u pushBack 'cwr3_i_soldier_fal';
_u pushBack 'cwr3_i_soldier';
_u pushBack 'cwr3_i_officer_night';
_u pushBack 'cwr3_i_officer';
_u pushBack 'cwr3_i_soldier_medic';
_u pushBack 'cwr3_i_soldier_marksman';
_u pushBack 'cwr3_i_soldier_hg';
_u pushBack 'cwr3_i_soldier_gl';
_u pushBack 'cwr3_i_soldier_engineer';
_u pushBack 'cwr3_i_soldier_sapper';
_u pushBack 'cwr3_i_commander';
_u pushBack 'cwr3_i_soldier_ar';
_u pushBack 'cwr3_i_soldier_aat_rpg7';
_u pushBack 'cwr3_i_soldier_at_rpg7';
_u pushBack 'cwr3_i_soldier_aat_at4';
_u pushBack 'cwr3_i_soldier_at_at4';
_u pushBack 'cwr3_i_soldier_aa_strela';

_u pushBack 'CUP_I_GUE_Soldier_AA';
_u pushBack 'CUP_I_GUE_Soldier_AR';
_u pushBack 'CUP_I_GUE_Soldier_GL';
_u pushBack 'CUP_I_GUE_Sniper';
_u pushBack 'CUP_I_GUE_Officer';
_u pushBack 'CUP_I_GUE_Soldier_Scout';
_u pushBack 'CUP_I_GUE_Soldier_MG';
_u pushBack 'CUP_I_GUE_Engineer';
_u pushBack 'CUP_I_GUE_Medic';
_u pushBack 'CUP_I_GUE_Soldier_AKM';
_u pushBack 'CUP_I_GUE_Soldier_AKSU';
_u pushBack 'CUP_I_GUE_Soldier_LAT';
_u pushBack 'CUP_I_GUE_Soldier_AT';
_u pushBack 'CUP_I_GUE_Soldier_AA2';
_u pushBack 'CUP_I_GUE_Saboteur';
_u pushBack 'CUP_I_GUE_Soldier_AKS74';
_u pushBack 'CUP_I_GUE_Commander';

_u pushBack 'cwr3_i_soldier_crew';
_u pushBack 'CUP_I_GUE_Crew';
_u pushBack 'cwr3_i_soldier_pilot_jet';


missionNamespace setVariable [Format ["cti_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};
//uav
_u 			= ['pook_AdunokM_GL_IND'];
_u pushBack 'pook_AdunokM_DSHK_IND';
_u pushBack 'pook_Adunok_IND';
_u pushBack 'pook_MAARS_AA12_IND';
_u pushBack 'pook_MAARS_M240_IND';
_u pushBack 'pook_MRK27BT_IND';

//apc wheeled
_u pushBack 'CUP_I_BRDM2_TK_Gue';
_u pushBack 'cwr3_i_brdm2';
_u pushBack 'CUP_I_BTR80_ION';
_u pushBack 'cwr3_i_btr60';
_u pushBack 'CUP_I_BTR80A_ION';
_u pushBack 'CUP_I_BRDM2_ATGM_TK_Gue';
_u pushBack 'cwr3_i_brdm2_atgm';

//armored wheeled
_u pushBack 'CUP_I_SUV_Armored_ION';
_u pushBack 'CUP_I_RG31_M2_W_GC_ION';
_u pushBack 'CUP_I_RG31_M2_W_ION';
_u pushBack 'CUP_I_RG31E_M2_W_ION';
_u pushBack 'CUP_I_RG31_Mk19_W_ION';

_u pushBack 'CUP_I_RG31_M2_GC_ION';
_u pushBack 'CUP_I_RG31_M2_ION';
_u pushBack 'CUP_I_RG31E_M2_ION';
_u pushBack 'CUP_I_RG31_Mk19_ION';

_u pushBack 'CUP_I_BTR40_MG_TKG';
_u pushBack 'cwr3_i_btr40_dshkm';

//aa veh

_u pushBack 'cwr3_i_ural_zu23';
_u pushBack 'CUP_I_Hilux_zu23_TK';
_u pushBack 'CUP_I_Ural_ZU23_TK_Gue';
_u pushBack 'CUP_I_Datsun_AA_TK_Random';
_u pushBack 'CUP_I_Hilux_igla_TK';
_u pushBack 'CUP_I_Datsun_AA_TK';
_u pushBack 'cwr3_i_uaz_aa';

//at veh
_u pushBack 'cwr3_i_uaz_spg9';
_u pushBack 'CUP_I_Hilux_SPG9_TK';
_u pushBack 'CUP_I_Hilux_metis_TK';
_u pushBack 'CUP_I_nM1036_TOW_ION_WIN';
_u pushBack 'CUP_I_nM1036_TOW_ION';

//hmg veh
_u pushBack 'CUP_B_nM1025_SOV_M2_ION';
_u pushBack 'cwr3_i_uaz_dshkm';
_u pushBack 'CUP_I_Hilux_M2_TK';
_u pushBack 'CUP_I_Hilux_DSHKM_TK';
_u pushBack 'CUP_I_nM1025_M2_ION_WIN';
_u pushBack 'CUP_B_nM1025_SOV_M2_ION_WIN';
_u pushBack 'CUP_I_nM1025_M2_ION';

//he veh
_u pushBack 'cwr3_i_uaz_ags30';
_u pushBack 'CUP_I_nM1025_Mk19_ION';
_u pushBack 'CUP_I_Hilux_AGS30_TK';
_u pushBack 'CUP_I_nM1025_Mk19_ION_WIN';


//mg veh
_u pushBack 'CUP_I_nM1025_M240_ION_WIN';
_u pushBack 'CUP_I_Datsun_PK_TK_Random';
_u pushBack 'CUP_I_Datsun_PK_TK';
_u pushBack 'CUP_I_nM1025_M240_ION';

//arty veh
_u pushBack 'CUP_I_Hilux_podnos_TK';
_u pushBack 'CUP_I_Hilux_MLRS_TK';

//------------------------
//add veh wapc
//mg
_u pushBack 'BRDM2IMPM240_INDFOR';
_u pushBack 'BRDM2IMPPKM_INDFOR';

//he
_u pushBack 'pook_BTRMWS_INDFOR';
_u pushBack 'pook_BTR80MWS_INDFOR';
_u pushBack 'BRDM2MAGS_INDFOR';
_u pushBack 'BRDM2IMPMk19_INDFOR';

//lmg
_u pushBack 'BRDM2IMPM2_INDFOR';
_u pushBack 'pook_BTR60_INDFOR';
_u pushBack 'BRDM2IMPDSHK_INDFOR';
_u pushBack 'BRDM2M_INDFOR';
_u pushBack 'pook_BTR80_INDFOR';
_u pushBack 'BRDM2IMP_INDFOR';

//hmg
_u pushBack 'pook_BPM2A42_INDFOR';
_u pushBack 'pook_BTR2A42_INDFOR';
_u pushBack 'pook_BTR80_2A42_INDFOR';

//at
_u pushBack 'BRDM2IMPAT3_INDFOR';
_u pushBack 'BRDM2IMPRKT_INDFOR';
_u pushBack 'BRDM2IMPAT2_INDFOR';
_u pushBack 'BRDM2IMPTOW_INDFOR';
_u pushBack 'BRDM2IMPAT3c_INDFOR';
_u pushBack 'BRDM2IMPAT5_INDFOR';

//aa
_u pushBack 'BRDM2IMPAA_INDFOR';
_u pushBack 'BRDM2IMP_9K31_INDFOR';

//arty
_u pushBack 'CUP_I_Hilux_UB32_TK';

//aa add2
_u pushBack 'pook_ZSU_base_IND';


missionNamespace setVariable [Format ["cti_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['CUP_I_ZSU23_Afghan_AAF'];
_u pushBack 'pook_ZSU57_base_IND';
_u pushBack 'CUP_I_T55_TK_GUE';
_u pushBack 'CUP_I_T72_NAPA';
_u pushBack 'cwr3_i_m41a1';
_u pushBack 'CUP_I_T34_TK_GUE';
_u pushBack 'cwr3_i_pt76b';
_u pushBack 'cwr3_i_t72b1';
_u pushBack 'cwr3_i_t72a';
_u pushBack 'cwr3_i_t55a';
_u pushBack 'cwr3_i_t34';


_u pushBack 'cwr3_i_mtlb_sa13';
_u pushBack 'cwr3_i_bmp2_zu23';
_u pushBack 'cwr3_i_mtlb_repair';
_u pushBack 'cwr3_i_mtlb_pk';
_u pushBack 'CUP_I_MTLB_pk_NAPA';
_u pushBack 'cwr3_i_bmp2';
_u pushBack 'CUP_I_BMP2_NAPA';
_u pushBack 'cwr3_i_bmp1';
_u pushBack 'CUP_I_BMP1_TK_GUE';



missionNamespace setVariable [Format ["cti_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= ['pook_MIG21_INDFOR'];
_u pushBack 'cwr3_i_l39_cap';
_u pushBack 'cwr3_i_l39_s5';
_u pushBack 'cwr3_i_cessna_t41_armed';
_u pushBack 'CUP_I_Ka60_GL_Blk_ION';
_u pushBack 'CUP_I_Mi24_Mk3_ION';
_u pushBack 'CUP_I_Mi24_Mk4_ION';
_u pushBack 'CUP_I_Mi24_D_Dynamic_ION';
_u pushBack 'CUP_I_Ka60_GL_Blk_ION';
_u pushBack 'CUP_I_UH60L_RACS';
_u pushBack 'CUP_I_UH1H_armed_TK_GUE';
_u pushBack 'CUP_I_UH1H_gunship_TK_GUE';
_u pushBack 'cwr3_i_mi8_mtv3';
_u pushBack 'pook_Mi28_INDFOR';


_u pushBack 'pook_2S1_INDFOR';
_u pushBack 'pook_2S5_INDFOR';


_u pushBack 'cwr3_i_an2';



missionNamespace setVariable [Format ["cti_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u = [];

missionNamespace setVariable [Format ["cti_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u 			= [];

if ((missionNamespace getVariable "cti_C_UNITS_TOWN_PURCHASE") > 0) then {
	_u pushBack (missionNamespace getVariable "cti_GUERSOLDIER");
};

missionNamespace setVariable [Format ["cti_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};