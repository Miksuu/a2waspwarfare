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

_UKContainer =[BTeamleader4,BTeamleader5,BEngineer4,BEngineer5,BMachinegunner4_1,BMachinegunner4_2,BMachinegunner5_1,BMachinegunner5_2,BMedic4,BMedic5,BSpecOps4,BSpecOps5];


_side = _this;

//INF_level 0 us
_u= 		['cwr3_b_soldier_driver'];
_u pushBack 'cwr3_b_soldier_pilot_jet';
_u pushBack 'cwr3_b_soldier_pilot';
_u pushBack 'cwr3_b_soldier_crew';
_u pushBack 'cwr3_b_soldier';
_u pushBack 'cwr3_b_soldier_backpack';
_u pushBack 'cwr3_b_soldier_at_law';
_u pushBack 'cwr3_b_soldier_medic';
_u pushBack 'cwr3_b_soldier_engineer';
_u pushBack 'cwr3_b_soldier_ar_m16';

//INF_level 0 uk
_u pushBack 'cwr3_b_uk_soldier_crewman_apc';
_u pushBack 'cwr3_b_uk_soldier_pilot_jet';
_u pushBack 'cwr3_b_uk_soldier_pilot';
_u pushBack 'cwr3_b_uk_soldier_crewman';
_u pushBack 'cwr3_b_uk_soldier';
_u pushBack 'cwr3_b_uk_soldier_backpack';
_u pushBack 'cwr3_b_uk_soldier_at_law';
_u pushBack 'cwr3_b_uk_soldier_medic';
_u pushBack 'cwr3_b_uk_soldier_engineer';
_u pushBack 'cwr3_b_uk_soldier_ar';

//INF_level 1 us
_u pushBack 'cwr3_b_soldier_amg';
_u pushBack 'cwr3_b_soldier_mg';
_u pushBack 'cwr3_b_soldier_marksman';
_u pushBack 'cwr3_b_soldier_spotter';
_u pushBack 'cwr3_b_soldier_sapper';
_u pushBack 'cwr3_b_soldier_sniper';
_u pushBack 'cwr3_b_soldier_aat_carlgustaf';
_u pushBack 'cwr3_b_soldier_at_carlgustaf';
_u pushBack 'cwr3_b_soldier_aa_redeye';
_u pushBack 'cwr3_b_soldier_aat_m67';
_u pushBack 'cwr3_b_soldier_at_m67';
_u pushBack 'cwr3_b_soldier_aat_m47';
_u pushBack 'cwr3_b_soldier_at_m47';
_u pushBack 'cwr3_b_soldier_hg';
_u pushBack 'cwr3_b_soldier_aar';
_u pushBack 'cwr3_b_soldier_ar';
_u pushBack 'cwr3_b_officer_night';
_u pushBack 'cwr3_b_soldier_sl';
_u pushBack 'cwr3_b_soldier_m14';
_u pushBack 'cwr3_b_soldier_gl';

//INF_level 1 uk
_u pushBack 'cwr3_b_uk_soldier_amg';
_u pushBack 'cwr3_b_uk_soldier_mg';
_u pushBack 'cwr3_b_uk_soldier_marksman';
_u pushBack 'cwr3_b_uk_soldier_spotter';
_u pushBack 'cwr3_b_uk_soldier_sapper';
_u pushBack 'cwr3_b_uk_soldier_sniper';
_u pushBack 'cwr3_b_uk_soldier_aat_carlgustaf';
_u pushBack 'cwr3_b_uk_soldier_at_carlgustaf';
_u pushBack 'cwr3_b_uk_soldier_aaa_javelin';
_u pushBack 'cwr3_b_uk_soldier_aa_javelin';
_u pushBack 'cwr3_b_uk_soldier_tl';

//INF_level 2 us
_u pushBack 'CUP_B_USMC_Pilot';
_u pushBack 'CUP_B_USMC_Crew';
_u pushBack 'CUP_B_USMC_Soldier';
_u pushBack 'CUP_B_USMC_Soldier_AR';
_u pushBack 'CUP_B_USMC_Soldier_LAT';
_u pushBack 'CUP_B_USMC_Soldier_MG';
_u pushBack 'CUP_B_USMC_Soldier_GL';
_u pushBack 'CUP_B_USMC_Soldier_Marksman';
_u pushBack 'CUP_B_USMC_Soldier_AT';
_u pushBack 'CUP_B_USMC_Engineer';
_u pushBack 'CUP_B_USMC_Medic';
_u pushBack 'CUP_B_USMC_Soldier_AA';
_u pushBack 'CUP_B_USMC_Soldier_TL';
_u pushBack 'CUP_B_USMC_Soldier_SL';
_u pushBack 'CUP_B_USMC_Spotter_des';
_u pushBack 'CUP_B_USMC_Sniper_M40A3';
_u pushBack 'CUP_B_USMC_SpecOps_SD';

//INF_level 2 uk
_u pushBack 'CUP_B_BAF_Soldier_Helipilot_DPM';
_u pushBack 'CUP_B_BAF_Soldier_Crew_DPM';
_u pushBack 'CUP_B_BAF_Soldier_Rifleman_DPM';
_u pushBack 'CUP_B_BAF_Soldier_AutoRifleman_DPM';
_u pushBack 'CUP_B_BAF_Soldier_RiflemanLAT_DPM';
_u pushBack 'CUP_B_BAF_Soldier_HeavyGunner_DPM';
_u pushBack 'CUP_B_BAF_Soldier_Grenadier_DPM';
_u pushBack 'CUP_B_BAF_Soldier_Marksman_DPM';
//_u pushBack 'CUP_B_BAF_Soldier_AsstAT_DPM';
_u pushBack 'CUP_B_BAF_Soldier_RiflemanAT_DPM';
_u pushBack 'CUP_B_BAF_Soldier_Engineer_DPM';
_u pushBack 'CUP_B_BAF_Soldier_Medic_DPM';
_u pushBack 'CUP_B_BAF_Soldier_AA_DPM';
_u pushBack 'CUP_B_BAF_Soldier_TeamLeader_DPM';
_u pushBack 'CUP_B_BAF_Soldier_SquadLeader_DPM';
_u pushBack 'CUP_B_BAF_Spotter_DPM';
_u pushBack 'CUP_B_BAF_Spotter_DDPM';
_u pushBack 'CUP_B_BAF_Sniper_DPM';
_u pushBack 'CUP_B_BAF_Soldier_SharpShooter_DPM';

//INF_level 3 us
_u pushBack 'cwr3_b_blackop_laser';
_u pushBack 'CUP_B_US_Sniper_OCP';
_u pushBack 'CUP_B_US_Sniper_M107_UCP';
_u pushBack 'CUP_B_US_Spotter_UCP';
_u pushBack 'CUP_B_US_Sniper_M110_TWS_UCP';
_u pushBack 'CUP_B_USMC_MARSOC_Marksman_DA';
_u pushBack 'CUP_B_USMC_Sniper_M107';
_u pushBack 'CUP_B_USMC_Soldier_HAT';
_u pushBack 'CUP_B_FR_Saboteur';

//INF_level 3 uk
_u pushBack 'cwr3_b_uk_soldier_sas_laser_night';
_u pushBack 'CUP_B_BAF_Spotter_L85TWS_DPM';
_u pushBack 'CUP_B_BAF_Sniper_AS50_DPM';
_u pushBack 'CUP_B_BAF_Sniper_AS50_TWS_DPM';
_u pushBack 'CUP_B_BAF_Soldier_AT_DPM';
_u pushBack 'CUP_B_BAF_Soldier_AsstAT_DPM';





//SLOTUNITS LISTED FOR BOUNTY (could be useless for playerbounty but i keep it in list)
_u pushBack 'CUP_B_BAF_Soldier_TeamLeader_MTP';
_u pushBack 'CUP_B_BAF_Soldier_Engineer_MTP';
_u pushBack 'CUP_B_BAF_Soldier_HeavyGunner_MTP';
_u pushBack 'CUP_B_BAF_Soldier_Medic_MTP';
_u pushBack 'CUP_B_BAF_Spotter_MTP';
//SLOTUNITS LISTED FOR BOUNTY (could be useless for playerbounty but i keep it in list)
_u pushBack 'CUP_B_US_Soldier_TL_UCP';
_u pushBack 'CUP_B_US_Soldier_Engineer_UCP';
_u pushBack 'CUP_B_US_Soldier_MG_UCP';
_u pushBack 'CUP_B_US_Medic_UCP';
_u pushBack 'CUP_B_USMC_MARSOC';
//SLOTUNITS LISTED FOR BOUNTY (could be useless for playerbounty but i keep it in list)

missionNamespace setVariable [Format ["cti_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};




//___|---LIGHT---|___\\


//LIGHT_level 0 us
_u = ['Land_Pod_Heli_Transport_04_medevac_F'];
_u  pushBack 'Land_Device_slingloadable_F';


_u pushBack 'cwr3_c_bicycle';

_u pushBack 'CUP_B_M1030_USA';
_u pushBack 'B_Quadbike_01_F';

//LOADVEHICLE--------------------------------------
//8
_u pushBack 'pook_MAZ7910_base_BLUFOR';

//4
_u pushBack 'cwr3_b_m939_empty';
_u pushBack 'UK3CB_BAF_MAN_HX60_Cargo_Green_A';

//2 us
_u pushBack 'CUP_B_M1152_WDL_USA';
_u pushBack 'CUP_B_M1165_GMV_WDL_USA';
_u pushBack 'CUP_B_nM1025_SOV_M2_USA_WDL';
_u pushBack 'CUP_B_nM1025_SOV_Mk19_USA_WDL';

//2 uk
_u pushBack 'cwr3_b_uk_fv620_transport';

_u pushBack 'CUP_B_BAF_Coyote_L2A1_W';
_u pushBack 'CUP_B_BAF_Coyote_GMG_W';
_u pushBack 'UK3CB_BAF_Husky_Passenger_GMG_Green';
_u pushBack 'UK3CB_BAF_Husky_Passenger_GPMG_Green';
_u pushBack 'CUP_B_Wolfhound_LMG_GB_W';
_u pushBack 'CUP_B_Wolfhound_HMG_GB_W';
_u pushBack 'CUP_B_Wolfhound_GMG_GB_W';
//-----------------------------------------


_u pushBack 'cwr3_b_m151';
_u pushBack 'CUP_B_nM1038_DF_USMC_WDL';
_u pushBack 'cwr3_b_m939';//						---SALVAGE



//LIGHT_level 0 uk
_u pushBack 'UK3CB_BAF_LandRover_Soft_Green_B';
_u pushBack 'UK3CB_BAF_MAN_HX58_Transport_Green';//	---SALVAGE




//LIGHT_level 1 us
_u pushBack 'cwr3_b_m151_m2';
_u pushBack 'CUP_B_nM1025_M240_USMC_WDL';
_u pushBack 'CUP_B_M1165_GMV_USMC';
_u pushBack 'CUP_B_nM1025_Mk19_DF_USMC_WDL';
_u pushBack 'CUP_B_nM1025_M2_DF_USMC_WDL';
_u pushBack 'CUP_B_M1151_Mk19_USMC';
_u pushBack 'CUP_B_M1151_M2_USMC';
_u pushBack 'cwr3_b_m939_reammo';//					---AMMO
_u pushBack 'CUP_B_M113A1_USA';

//LIGHT_level 1 uk
_u pushBack 'UK3CB_BAF_LandRover_WMIK_GMG_Green_B';
_u pushBack 'UK3CB_BAF_Panther_GPMG_Green_A';
//_u pushBack 'UK3CB_BAF_Husky_Passenger_GMG_Green';
//_u pushBack 'UK3CB_BAF_Husky_Passenger_GPMG_Green';
_u pushBack 'CUP_B_Jackal2_L2A1_GB_W';
_u pushBack 'CUP_B_Jackal2_GMG_GB_W';
_u pushBack 'cwr3_b_uk_fv620_reammo';//				---AMMO
_u pushBack 'cwr3_b_uk_fv432_gpmg';

//LIGHT_level 2 us
_u pushBack 'CUP_B_nM997_DF_USMC_WDL';//			---AMBU
_u pushBack 'cwr3_b_m939_repair';//					---RTRUCK
_u pushBack 'CUP_B_RG31_M2_OD_USMC';
_u pushBack 'CUP_B_RG31_Mk19_OD_USMC';
_u pushBack 'CUP_B_nM1036_TOW_DF_USMC_WDL';

//LIGHT_level 2 uk
_u pushBack 'UK3CB_BAF_LandRover_Soft_MERT_A';//	---AMBU
_u pushBack 'UK3CB_BAF_LandRover_Amb_Green_A';//	---AMBU
_u pushBack 'UK3CB_BAF_MAN_HX60_Repair_Green';//	---RTRUCK
_u pushBack 'pook_Pandur_Mk19_BLUFOR';
_u pushBack 'pook_Pandur_M2_BLUFOR';
_u pushBack 'CUP_B_Ridgback_LMG_GB_W';
_u pushBack 'UK3CB_BAF_LandRover_WMIK_Milan_Green_B';

//LIGHT_level 3 us
_u pushBack 'CUP_B_M1135_ATGMV_Woodland';
_u pushBack 'CUP_B_M1133_MEV_Woodland';//			---AMBU

_u pushBack 'CUP_B_nM1097_AVENGER_USA_WDL';

_u pushBack "CUP_B_HMMWV_Avenger_USMC";

_u pushBack 'CUP_B_M113A3_USA';
_u pushBack 'CUP_B_LAV25_USMC';
_u pushBack 'CUP_B_M1126_ICV_M2_Woodland';
_u pushBack 'CUP_B_M1126_ICV_MK19_Woodland';
_u pushBack 'CUP_B_M1129_MC_MK19_Woodland';//		---ARTY
_u pushBack 'cwr3_b_m901_itv';


//LIGHT_level 3 uk
_u pushBack 'pook_Pandur_AT_BLUFOR';
_u pushBack 'pook_Pandur_AMB_BLUFOR';//				---AMBU
_u pushBack 'CUP_I_LR_AA_AAF';
_u pushBack 'pook_Pandur_RWS_BLUFOR';
_u pushBack 'pook_Pandur_SP30_BLUFOR';
_u pushBack 'CUP_B_Ridgback_HMG_GB_W';
_u pushBack 'CUP_B_Ridgback_GMG_GB_W';
_u pushBack 'CUP_B_Mastiff_LMG_GB_W';
//_u pushBack 'cwr3_b_uk_fv432_peak';
_u pushBack 'pook_Pandur_Mortar_BLUFOR';//			---ARTY
_u pushBack 'CUP_B_FV432_Mortar';//					---ARTY

//LIGHT_level 4 us
_u pushBack 'pook_CRAM_BASE';
_u pushBack 'pook_MEADS_base';
_u pushBack 'cwr3_b_m113a3_mev_des';//				---AMBU
_u pushBack 'CUP_B_M1128_MGS_Woodland';
_u pushBack 'CUP_B_M163_Vulcan_USA';
_u pushBack 'pook_MLRS_BLUFOR';//					---ARTY
_u pushBack 'pook_MAARS_M240';



//LIGHT_level 4 uk
_u pushBack 'pook_NASAMS_BASE';
_u pushBack 'cwr3_b_uk_fv620_repair';//				---RTRUCK
_u pushBack 'CUP_B_Mastiff_HMG_GB_W';
_u pushBack 'CUP_B_Mastiff_GMG_GB_W';
_u pushBack 'pook_Pandur_RCWS30_BLUFOR';
_u pushBack 'CUP_B_FV432_GB_Ambulance';//			---AMBU
_u pushBack 'pook_Pandur_MGS_BLUFOR';
_u pushBack 'pook_Pandur_AA_BLUFOR';

_u pushBack 'pook_CAESAR_BLUFOR';//					---ARTY
_u pushBack 'UK3CB_BAF_LandRover_Panama_Green_A';
//_u pushBack 'pook_MAARS_M240';

//HQ VEHICLE---------------------need listed
//_u pushBack 'CUP_B_LAV25_HQ_USMC';

missionNamespace setVariable [Format ["cti_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};



//___|---HEAVY---|___\\


//HEAVY_level 0 us
_u = ['CUP_B_AAV_USMC'];

//HEAVY_level 0 uk
_u pushBack 'CUP_B_FV432_Bulldog_GB_W_RWS';
_u pushBack 'UK3CB_BAF_FV432_Mk3_GPMG_Green';

//HEAVY_level 1 us
_u pushBack 'CUP_B_M7Bradley_USA_W';
_u pushBack 'cwr3_b_fia_m41a1';
_u pushBack 'CUP_B_M60A3_USMC';

//HEAVY_level 1 uk
_u pushBack 'cwr3_b_uk_fv510';
_u pushBack 'cwr3_b_uk_fv107';
_u pushBack 'cwr3_b_uk_fv101';

//HEAVY_level 2 us
_u pushBack 'CUP_B_M2Bradley_USA_W';
_u pushBack 'cwr3_b_m163';
_u pushBack 'cwr3_b_m1';

//HEAVY_level 2 uk
_u pushBack 'CUP_B_MCV80_GB_W';
_u pushBack 'cwr3_b_uk_fv4201';

//HEAVY_level 3 us
_u pushBack 'CUP_B_M270_HE_USMC';//					---ARTY
_u pushBack 'CUP_B_M1A1FEP_Woodland_USMC';
_u pushBack 'CUP_B_M1A1SA_Woodland_US_Army';
_u pushBack 'CUP_B_M60A3_TTS_USMC';
_u pushBack 'CUP_B_M2A3Bradley_USA_W';

//HEAVY_level 3 uk
_u pushBack 'CUP_B_M270_HE_BAF_WOOD';//				---ARTY
_u pushBack 'CUP_B_MCV80_GB_W_SLAT';
_u pushBack 'cwr3_b_uk_fv4030';
_u pushBack 'CUP_B_FV510_GB_W';

//HEAVY_level 4 us
_u pushBack 'CUP_B_M1A1EP_TUSK_Woodland_USMC';
_u pushBack 'CUP_B_M1A2SEP_TUSK_II_Woodland_US_Army';
_u pushBack 'CUP_B_M6LineBacker_USA_W';

//HEAVY_level 4 uk
_u pushBack 'CUP_B_Challenger2_2CW_BAF';
_u pushBack 'CUP_B_FV510_GB_W_SLAT';

missionNamespace setVariable [Format ["cti_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};



//___|---AIR---|___\\


//AIR_level 0 us
_u = ['cwr3_b_mh6j'];



//AIR_level 0 uk
_u pushBack 'CUP_B_AW159_Unarmed_RN_Grey';

//AIR_level 1 us
_u pushBack 'CUP_B_CESSNA_T41_UNARMED_AIRFORCE_USA';
_u pushBack 'CUP_B_C130J_USMC';
_u pushBack 'CUP_B_MV22_USMC';
_u pushBack 'CUP_B_CH53E_USMC';
_u pushBack 'cwr3_b_ch47';
_u pushBack 'cwr3_b_uh60';

//AIR_level 1 uk
_u pushBack 'cwr3_b_camel';
_u pushBack 'CUP_B_C130J_GB';
_u pushBack 'UK3CB_BAF_Merlin_HC3_24';
_u pushBack 'cwr3_b_uk_hc1';
_u pushBack 'cwr3_b_uk_puma_hc1';
_u pushBack 'cwr3_b_uk_lynx_ah7_transport';

//AIR_level 2 us
_u pushBack 'CUP_B_CESSNA_T41_ARMED_USA';
_u pushBack 'CUP_B_UH1Y_MEV_USMC';//				---AMBU
_u pushBack 'cwr3_b_ah6j';
_u pushBack 'CUP_B_MH60L_DAP_4x_USN';
_u pushBack 'CUP_B_UH1Y_Gunship_Dynamic_USMC';
_u pushBack 'cwr3_b_f4e';

//AIR_level 2 uk
_u pushBack 'UK3CB_BAF_Merlin_HC4_CSAR';
_u pushBack 'cwr3_b_uh60_mev';//					---AMBU
_u pushBack 'CUP_B_AW159_GB';
_u pushBack 'cwr3_b_uk_f4m';

//AIR_level 3 us
_u pushBack 'cwr3_b_ah1f';
_u pushBack 'cwr3_b_kiowa_dyn';
_u pushBack 'FIR_F14A_NSAWC';

_u pushBack 'cwr3_b_ah64';

//AIR_level 3 uk
_u pushBack 'cwr3_b_uk_lynx_ah7_tow';
_u pushBack 'UK3CB_BAF_Wildcat_AH1_6_Generic';
_u pushBack 'Tornado_AWS_camo_uk';

_u pushBack 'UK3CB_BAF_Apache_AH1_CAS';

//AIR_level 4 us
_u pushBack 'CUP_B_AH64_DL_USA';
_u pushBack 'FIR_F15A';

_u pushBack 'CUP_B_AV8B_DYN_USMC';
_u pushBack 'CUP_B_A10_DYN_USA';
_u pushBack 'cwr3_b_f16c';
_u pushBack 'EA18G_141CAG';
_u pushBack 'CUP_B_AH6X_USA';

//AIR_level 4 uk
_u pushBack 'UK3CB_BAF_Wildcat_AH1_8_Generic';
_u pushBack 'CUP_B_AH1_DL_BAF';

_u pushBack 'FIR_AV8B_GR7A_Lucy';

_u pushBack 'cwr3_b_frs1';



//_u pushBack 'FMX_AV8B2_GR9_SQN3_A_UK';
_u pushBack 'CUP_B_GR9_DYN_GB';
//_u pushBack 'EAWS_EF2000_rafhist_CAP';



//AIR_level 5 us
_u pushBack 'FIR_AV8B';
_u pushBack 'CUP_B_AH1Z_Dynamic_USMC';
_u pushBack 'CUP_B_AH64D_DL_USA';


_u pushBack 'CUP_B_USMC_DYN_MQ9';
_u pushBack 'FIR_F22_FF';
_u pushBack 'FIR_F23A_Black';
_u pushBack 'CUP_B_F35B_USMC';
_u pushBack 'CUP_B_F35B_Stealth_USMC';
_u pushBack 'FIR_F35B_DarkGrey';


//AIR_level 5 uk
//_u pushBack 'UK3CB_BAF_Apache_AH1_Generic';

_u pushBack 'UK3CB_BAF_Apache_AH1_JS';//AA version like KA black with RadarAA,requiped in init_CommonConstants.sqf

_u pushBack 'UK3CB_BAF_MQ9_Reaper_Generic';
_u pushBack 'CUP_B_F35B_BAF';
_u pushBack 'CUP_B_F35B_Stealth_BAF';
_u pushBack 'FIR_F35B_RAF01';

missionNamespace setVariable [Format ["cti_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};



//___|---AIRPORTS---|___\\

//AIRPORT_level 0 us =nothing
//AIRPORT_level 0 uk =nothing

//AIRPORT_level 1 us
_u = ['CUP_B_CESSNA_T41_UNARMED_AIRFORCE_USA'];
_u pushBack 'CUP_B_C130J_USMCCUP_B_C130J_USMC';
_u pushBack 'CUP_B_MV22_USMC';

//AIRPORT_level 1 uk
_u pushBack 'cwr3_b_camel';
_u pushBack 'CUP_B_C130J_GB';

//AIRPORT_level 2 us
_u pushBack 'CUP_B_CESSNA_T41_ARMED_USA';
_u pushBack 'cwr3_b_f4e';

//AIRPORT_level 2 uk
_u pushBack 'cwr3_b_uk_F4M';

//AIRPORT_level 3 us
_u pushBack 'FIR_F14A_NSAWC';

//AIRPORT_level 3 uk
_u pushBack 'Tornado_AWS_camo_uk';

//AIRPORT_level 4 us
_u pushBack 'FIR_F15A';
_u pushBack 'FIR_AV8B';
_u pushBack 'CUP_B_AV8B_DYN_USMC';
_u pushBack 'CUP_B_A10_DYN_USA';
_u pushBack 'cwr3_b_f16c';
_u pushBack 'EA18G_141CAG';

//AIRPORT_level 4 uk
_u pushBack 'cwr3_b_frs1';//(remove nuke ammo)
_u pushBack 'FMX_AV8B2_GR9_SQN3_A_UK';
_u pushBack 'CUP_B_GR9_DYN_GB';
_u pushBack 'EAWS_EF2000_rafhist_CAP';


//AIRPORT_level 5 us
_u pushBack 'FIR_F22_FF';
_u pushBack 'FIR_F23A_Black';
_u pushBack 'CUP_B_F35B_USMC';
_u pushBack 'CUP_B_F35B_Stealth_USMC';
_u pushBack 'FIR_F35B_DarkGrey';

//AIRPORT_level 5 uk
_u pushBack 'FIR_F35B_RAF01';
_u pushBack 'CUP_B_F35B_BAF';
_u pushBack 'CUP_B_F35B_Stealth_BAF';


missionNamespace setVariable [Format ["cti_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};


//RANDOM TOWNUNITS WITH RANDOM CAMO AND RANDOM SPEECH,LIKE HIRE POPULATION IN TOWN 

//GUNNER
_u 			= [selectRandom["CUP_B_CZ_SpecOps_DES","B_G_Captain_Ivan_F","CUP_B_HIL_Soldier"]];
//MEDIC
_u = _u + [selectRandom["CUP_B_CDF_Medic_DST","CUP_B_HIL_Medic","CUP_B_CDF_Medic_SNW"]];
//LAT
_u = _u + [selectRandom["CUP_B_CDF_Soldier_RPG18_DST","CUP_B_CDF_Soldier_RPG18_SNW","CUP_B_HIL_Soldier_LAT_Res"]];
//MG
_u = _u + [selectRandom["CUP_B_HIL_MMG_Recon","CUP_B_CDF_Soldier_MG_SNW","CUP_B_HIL_MMG"]];
//AR
_u = _u + [selectRandom["CUP_B_CDF_Soldier_AR_DST","CUP_B_CDF_Soldier_AR_SNW","CUP_B_CDF_Soldier_AR_MNT"]];
//HAT
_u = _u + [selectRandom["CUP_B_CDF_Soldier_LAT_DST","CUP_B_CDF_Soldier_LAT_SNW","CUP_B_HIL_Soldier_HAT_Res"]];
//AA
_u = _u + [selectRandom["CUP_B_CDF_Soldier_AA_DST","CUP_B_CDF_Soldier_AA_SNW","CUP_B_HIL_Soldier_AA"]];
//ENG(BOTH, UK \US SELECTION MAKES THE Core_us FILE)
_u = _u + ["cwr3_b_soldier_engineer"];
_u = _u + ["cwr3_b_uk_soldier_engineer"];

//Vehicle
_u = _u + ["cwr3_c_bicycle"];
_u = _u +['pook_MAZ7910_base_BLUFOR'];

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
