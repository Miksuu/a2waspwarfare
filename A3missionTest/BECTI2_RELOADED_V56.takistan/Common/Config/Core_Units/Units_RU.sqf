Private ['_side','_tiMode','_u'];

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



//level 0




_u=      ['cwr3_o_soldier_driver'];


_u pushBack 'cwr3_o_soldier_pilot_jet';	
_u pushBack 'cwr3_o_soldier_pilot';			
_u pushBack 'cwr3_o_soldier_crew';				
_u pushBack 'cwr3_o_soldier';					
_u pushBack 'cwr3_o_soldier_backpack';			
_u pushBack 'cwr3_o_soldier_at_rpg18';			
_u pushBack 'cwr3_o_soldier_medic';			
_u pushBack 'cwr3_o_soldier_engineer';			
_u pushBack 'cwr3_o_soldier_ar';				


//level 1


_u pushBack 'cwr3_o_soldier_amg';
_u pushBack 'cwr3_o_soldier_mg';
_u pushBack 'cwr3_o_soldier_marksman';
_u pushBack 'cwr3_o_soldier_spotter';
_u pushBack 'cwr3_o_soldier_sapper';
_u pushBack 'cwr3_o_soldier_sniper';
_u pushBack 'cwr3_o_soldier_at_at4';
_u pushBack 'cwr3_o_soldier_aat_at4';

_u pushBack 'cwr3_o_soldier_aa_strela';
_u pushBack 'cwr3_o_soldier_aat_rpg7';
_u pushBack 'cwr3_o_soldier_at_rpg7';
_u pushBack 'cwr3_o_soldier_hg';
_u pushBack 'cwr3_o_officer_night';
_u pushBack 'cwr3_o_soldier_sl';
_u pushBack 'cwr3_o_soldier_gl';

//level 2

_u pushBack 'CUP_O_RU_Pilot_VDV_M_EMR';
_u pushBack 'CUP_O_RU_Soldier_Crew_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_AR_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_LAT_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_MG_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_GL_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_Marksman_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_AAT_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_AT_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_Engineer_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_AA_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_TL_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_SL_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Spotter_VDV_M_EMR';
_u pushBack 'CUP_O_RU_Sniper_VDV_M_EMR';
_u pushBack 'CUP_O_RU_Soldier_Saiga_M_VDV_EMR_V2';

//REQUIPED WITH HE AMMO TO BALANCE DRAGON UNITS
_u pushBack 'CUP_O_RU_Soldier_HAT_EMR';

//level 3

_u pushBack 'cwr3_o_spetsnaz_bizon_sd';
_u pushBack 'CUP_O_TK_Soldier_AKS_Night';
_u pushBack 'CUP_O_TK_Sniper_SVD_Night';
_u pushBack 'CUP_O_RUS_SpecOps_Scout';
_u pushBack 'CUP_O_RUS_SpecOps_Scout_Night';
_u pushBack 'CUP_O_TK_Sniper_KSVK';
_u pushBack 'CUP_O_RU_Sniper_KSVK_VDV';
_u pushBack 'CUP_O_RU_Recon_Marksman_Ratnik_Summer';
_u pushBack 'CUP_O_RU_Recon_TL_Ratnik_Summer';
_u pushBack 'CUP_O_RU_Recon_Exp_Ratnik_Summer';
_u pushBack 'CUP_O_MVD_Soldier_Marksman';
_u pushBack 'CUP_O_RU_Soldier_AHAT_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2';
_u pushBack 'CUP_O_RUS_Saboteur';





//SLOTUNITS LISTED FOR BOUNTY
_u pushBack 'CUP_O_RUS_SpecOps_Autumn';
_u pushBack 'CUP_O_RU_Soldier_MG_VDV';
_u pushBack 'CUP_O_RU_Medic_VDV';
_u pushBack 'CUP_O_RU_Engineer_VDV';
_u pushBack 'CUP_O_RU_Soldier_TL_VDV';
//SLOTUNITS LISTED FOR BOUNTY

missionNamespace setVariable [Format ["cti_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

//---------------LIGHT--------------

//lf0

_u =      ['Land_Pod_Heli_Transport_04_medevac_F'];
_u  pushBack 'Land_Device_slingloadable_F';

_u  pushBack 'cwr3_c_bicycle';

_u  pushBack 'CUP_O_TT650_CHDKZ';
_u  pushBack 'O_Quadbike_01_F';

//LOADVEHICLES
_u  pushBack 'pook_MAZ7910_base';		//LOADER VEHICLE 8 slots (can load all)	

_u  pushBack 'cwr3_o_fia_ural_empty';	//LOADER VEHICLE 4 slots	

_u  pushBack 'CUP_O_UAZ_Open_RU';		//LOADER VEHICLE 2 slots
_u  pushBack 'CUP_O_Hilux_unarmed_CHDKZ';//LOADER VEHICLE 2 slots	

_u  pushBack 'CUP_O_Datsun_PK';			//LOADER VEHICLE 2 slots	
_u  pushBack 'cwr3_o_fia_btr40_dshkm';	//LOADER VEHICLE 2 slots	



_u  pushBack 'cwr3_o_uaz452';
_u  pushBack 'CUP_O_Ural_RU';			//salvage

		


//lf1
_u  pushBack 'CUP_O_UAZ_MG_RU';
_u  pushBack 'CUP_O_UAZ_AGS30_RU';

_u  pushBack 'cwr3_o_ural_zu23';	
_u  pushBack 'CUP_O_UAZ_SPG9_RU';	
_u  pushBack 'CUP_O_GAZ_Vodnik_PK_RU';
_u  pushBack 'CUP_O_GAZ_Vodnik_AGS_RU';

_u  pushBack 'cwr3_o_ural_reammo';		//ammo
_u  pushBack 'cwr3_o_brdm2um';	
_u  pushBack 'BRDM2IMPPKM_OPFOR';	

//lf2
_u  pushBack 'cwr3_o_uaz_mev';			//ambu
_u  pushBack 'cwr3_o_uaz452_mev';		//ambu
_u  pushBack 'CUP_O_Ural_Repair_RU';	//rtruck
_u  pushBack 'CUP_O_GAZ_Vodnik_KPVT_RU';

_u  pushBack 'BRDM2IMPDSHK_OPFOR';


_u  pushBack 'CUP_O_BRDM2_RUS';
_u  pushBack 'CUP_O_UAZ_METIS_RU';



//lf3
_u  pushBack 'BRDM2IMPAT2_OPFOR';
_u  pushBack 'BRDM2IMPAT3_OPFOR';
_u  pushBack 'CUP_O_GAZ_Vodnik_MedEvac_RU'; //ambu
_u  pushBack 'CUP_O_UAZ_AA_RU'; 
_u  pushBack 'CUP_O_GAZ_Vodnik_BPPU_RU';
_u  pushBack 'pook_BTRMWS_OPFOR';
_u  pushBack 'cwr3_o_btr80';
_u  pushBack 'BRDM2MAGS_OPFOR';
_u  pushBack 'pook_BTR80MWS_OPFOR';
_u  pushBack 'pook_BTR2A42_OPFOR';
_u  pushBack 'CUP_O_BM21_RU'; 				//arty

//lf4
_u  pushBack 'pook_96K6_root'; 
_u  pushBack 'BRDM2IMP_9K31_OPFOR'; 
_u  pushBack 'CUP_O_BRDM2_ATGM_RUS'; 
_u  pushBack 'cwr3_o_mtlb_mev';				//ambu
_u  pushBack 'CUP_O_BTR90_RU';
_u  pushBack 'pook_9K57M_OPFOR';			//arty
_u  pushBack 'pook_A222_OPFOR';				//arty




_u  pushBack 'pook_9K58_OPFOR';				//arty


_u  pushBack 'pook_MRK27BT';
_u  pushBack 'CUP_O_BTR90_HQ_RU';


missionNamespace setVariable [Format ["cti_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};


//level 0

_u =      ['CUP_O_MTLB_pk_WDL_RU'];
_u  pushBack 'cwr3_o_bmp2_zu23';




//level 1
_u  pushBack 'cwr3_o_pt76b';
_u  pushBack 'cwr3_o_bmp1';
_u  pushBack 'cwr3_o_bmp1p';
_u  pushBack 'cwr3_o_t55';

//level 2
_u  pushBack 'cwr3_o_t55a';
_u  pushBack 'cwr3_o_bmp2_mev';				//ambu
_u  pushBack 'cwr3_o_t55amv';
_u  pushBack 'cwr3_o_bmp2';

//level 3
_u  pushBack 'pook_TOS1A_OPFOR';			//arty
_u  pushBack 'cwr3_o_mtlb_sa13';
_u  pushBack 'cwr3_o_t64b';
_u  pushBack 'cwr3_o_t64bv';

_u  pushBack 'CUP_O_T72_RU';
_u  pushBack 'CUP_O_BMP3_RU';
_u  pushBack 'cwr3_o_zsu';
_u  pushBack 'cwr3_o_t72a';


//level 4
_u  pushBack 'cwr3_o_t72b1';
_u  pushBack 'CUP_O_T90_RU';
_u  pushBack 'CUP_O_2S6M_RU';





missionNamespace setVariable [Format ["cti_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

//level 0
_u = ['CUP_O_Ka60_Grey_RU'];

//level 1
_u  pushBack 'cwr3_o_an2';
_u  pushBack 'pook_AN26_OPFOR';
_u  pushBack 'cwr3_o_an12';
_u  pushBack 'CUP_O_Mi8AMT_RU';
_u  pushBack 'cwr3_o_mi6t';

//level 2
_u  pushBack 'cwr3_o_mi8_mev';			//ambu

_u  pushBack 'CUP_O_Mi8_RU';

_u  pushBack 'pook_MIG21_OPFOR';

//level 3
		
_u  pushBack 'cwr3_o_mi24d';
_u  pushBack 'CUP_O_Ka50_DL_RU';
_u  pushBack 'cwr3_o_su17m4';
_u  pushBack 'pook_Su22_OPFOR_P';

//level 4
_u  pushBack 'CUP_O_Mi24_P_Dynamic_RU';
_u  pushBack 'CUP_O_Mi24_V_Dynamic_RU';			

_u  pushBack 'pook_Mig23_OPFOR';
_u  pushBack 'CUP_O_Ka52_RU';
_u  pushBack 'pook_YAK38_OPFOR';
_u  pushBack 'pook_MIG31_OPFOR';
_u  pushBack 'CUP_O_Su25_Dyn_RU';
_u  pushBack 'pook_MIG29_OPFOR';
_u  pushBack 'pook_su24_base';
//_u  pushBack 'CUP_O_Mi24_Mk3_CSAT_T';
_u  pushBack 'CUP_O_Mi24_Mk4_CSAT_T';


//level 5



_u  pushBack 'CUP_O_Ka52_Blk_RU';
_u  pushBack 'pook_S70';			
_u  pushBack 'CUP_O_Pchela1T_RU';
_u  pushBack 'pook_MIG35_OPFOR';
_u  pushBack 'CUP_O_SU34_RU';




missionNamespace setVariable [Format ["cti_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};


//level 0

//level 1
_u = ['cwr3_o_an2'];
_u  pushBack 'pook_AN26_OPFOR';
_u  pushBack 'cwr3_o_an12';

//level 2
_u  pushBack 'pook_MIG21_OPFOR';

//level 3
_u  pushBack 'cwr3_o_su17m4';
_u  pushBack 'pook_Su22_OPFOR_P';


//level 4
_u  pushBack 'pook_Mig23_OPFOR';
_u  pushBack 'pook_YAK38_OPFOR';
_u  pushBack 'pook_MIG31_OPFOR';
_u  pushBack 'CUP_O_Su25_Dyn_RU';
_u  pushBack 'pook_MIG29_OPFOR';
_u  pushBack 'pook_su24_base';


//level 4
_u  pushBack 'pook_S70';
_u  pushBack 'pook_MIG35_OPFOR';
_u  pushBack 'CUP_O_SU34_RU';
_u  pushBack 'CUP_O_Pchela1T_RU';

missionNamespace setVariable [Format ["cti_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

//RANDOM TOWNUNITS WITH RANDOM CAMO AND RANDOM SPEECH,LIKE HIRE POPULATION IN TOWN 

//GUNNER
_u 			= [selectRandom["CUP_O_INS_Soldier","CUP_O_sla_Soldier","CUP_O_TK_INS_Soldier"]];
//MEDIC
_u = _u + [selectRandom["CUP_O_TK_INS_Guerilla_Medic","CUP_O_TK_Medic","CUP_O_INS_Medic"]];
//LAT
_u = _u + [selectRandom["CUP_O_sla_Soldier_LAT","CUP_O_TK_Soldier_LAT","CUP_O_INS_Soldier_LAT"]];
//MG
_u = _u + [selectRandom["CUP_O_INS_Soldier_MG","CUP_O_TK_Soldier_MG","CUP_O_TK_INS_Soldier_MG"]];
//AR
_u = _u + [selectRandom["CUP_O_sla_Soldier_AR","CUP_O_INS_Soldier_AR","CUP_O_TK_INS_Soldier_AR"]];
//HAT
_u = _u + [selectRandom["CUP_O_TK_Soldier_AT","CUP_O_INS_Soldier_AT","CUP_O_TK_INS_Soldier_AT"]];
//AA
_u = _u + [selectRandom["CUP_O_TK_Soldier_AA","CUP_O_INS_Soldier_AA","CUP_O_TK_INS_Soldier_AA"]];
//ENG(BOTH, UK \US SELECTION MAKES THE Core_us FILE)
_u = _u + ["cwr3_o_soldier_engineer"];


//Vehicle
_u = _u + ["cwr3_c_bicycle"];

_u = _u + ["pook_MAZ7910_base"];
	

_u = _u + [selectRandom["cwr3_c_ural_empty","C_Van_01_transport_F"]];

_u = _u + [selectRandom["CUP_C_Pickup_unarmed_CIV","C_Offroad_01_F","CUP_O_Hilux_unarmed_TK_CIV"]];

_u = _u + [selectRandom["CUP_C_UAZ_Open_TK_CIV","CUP_C_Datsun_4seat","CUP_C_Datsun"]];



_u = _u + ["C_Van_01_fuel_F"];

_u = _u + [selectRandom["CUP_C_TT650_TK_CIV","CUP_C_S1203_CIV"]];

_u = _u + [selectRandom["CUP_C_Ural_Civ_01","C_Truck_02_transport_F","CUP_C_V3S_Open_TKC"]];

_u = _u + [selectRandom["CUP_C_Lada_GreenTK_CIV","CUP_C_Golf4_green_Civ","CUP_C_Octavia_CIV"]];

_u = _u + [selectRandom["C_Hatchback_01_F","CUP_C_Volha_Gray_TKCIV","C_Hatchback_01_sport_F"]];

_u = _u + [selectRandom["C_SUV_01_F","C_Quadbike_01_F"]];

_u = _u + [selectRandom["CUP_C_Bus_City_TKCIV","CUP_C_Ikarus_TKC"]];

_u = _u + [selectRandom["CUP_C_UAZ_Unarmed_TK_CIV","CUP_C_SUV_TK","UK3CB_Civ_LandRover_Soft_Blue_A"]];

_u = _u + [selectRandom["UK3CB_Civ_LandRover_Hard_Red_A","CUP_C_LR_Transport_CTK"]];



missionNamespace setVariable [Format ["cti_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};
