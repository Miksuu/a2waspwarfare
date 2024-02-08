/* US Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

_BLUcontainer = [BTeamleader1,BTeamleader2,BTeamleader3,BTeamleader4,BTeamleader5,BEngineer1,BEngineer2,BEngineer3,BEngineer4,BEngineer5,BMachinegunner1_1,BMachinegunner1_2,BMachinegunner2_1,BMachinegunner2_2,BMachinegunner3_1,BMachinegunner3_2,BMachinegunner4_1,BMachinegunner4_2,BMachinegunner5_1,BMachinegunner5_2,BMedic1,BMedic2,BMedic3,BMedic4,BMedic5,BSpecOps1,BSpecOps2,BSpecOps3,BSpecOps4,BSpecOps5];
_UKContainer =[BTeamleader4,BTeamleader5,BEngineer4,BEngineer5,BMachinegunner4_1,BMachinegunner4_2,BMachinegunner5_1,BMachinegunner5_2,BMedic4,BMedic5,BSpecOps4,BSpecOps5];
_USContainer =_BLUcontainer - _UKContainer ;



_uk_level_0=9;	_us_level_0=9;	_blu_level_0=9;
_uk_level_1=9;	_us_level_1=9;	_blu_level_1=9;
_uk_level_2=9;	_us_level_2=9;	_blu_level_2=9;
_uk_level_3=9;	_us_level_3=9;	_blu_level_3=9;
_uk_level_4=9;	_us_level_4=9;	_blu_level_4=9;
_uk_level_5=9;	_us_level_5=9;	_blu_level_5=9;


if (player in _BLUcontainer) then{_blu_level_0=0;_blu_level_1=1;_blu_level_2=2;_blu_level_3=3;_blu_level_4=4;_blu_level_5=5;};

if (player in _UKContainer) then{_uk_level_0=0;_uk_level_1=1;_uk_level_2=2;_uk_level_3=3;_uk_level_4=4;_uk_level_5=5;};

if (player in _USContainer) then{_us_level_0=0;_us_level_1=1;_us_level_2=2;_us_level_3=3;_us_level_4=4;_us_level_5=5;};





//___|---BARRACKS---|___\\---0


//Random Townunits for both Factions first

//SOLDIER
_c pushBack 'CUP_B_CZ_SpecOps_DES';
_i pushBack [localize "STR_WF_ALL_TAI1",'',350,4,-1,_blu_level_0,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'B_G_Captain_Ivan_F';
_i pushBack [localize "STR_WF_ALL_TAI1",'',350,4,-1,_blu_level_0,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_B_HIL_Soldier';
_i pushBack [localize "STR_WF_ALL_TAI1",'',350,4,-1,_blu_level_0,0,1,'HIRE TOWNFIGHTER',[]];

//MEDIC
_c pushBack 'CUP_B_CDF_Medic_DST';
_i pushBack [localize "STR_WF_ALL_TAI2",'',550,4,-1,_blu_level_0,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_B_HIL_Medic';
_i pushBack [localize "STR_WF_ALL_TAI2",'',550,4,-1,_blu_level_0,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_B_CDF_Medic_SNW';
_i pushBack [localize "STR_WF_ALL_TAI2",'',550,4,-1,_blu_level_0,0,1,'HIRE TOWNFIGHTER',[]];

//LEVEL1 TOWN

//LAT
_c pushBack 'CUP_B_CDF_Soldier_RPG18_DST';
_i pushBack [localize "STR_WF_ALL_TAI3",'',750,4,-1,_blu_level_1,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_B_CDF_Soldier_RPG18_SNW';
_i pushBack [localize "STR_WF_ALL_TAI3",'',750,4,-1,_blu_level_1,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_B_HIL_Soldier_LAT_Res';
_i pushBack [localize "STR_WF_ALL_TAI3",'',750,4,-1,_blu_level_1,0,1,'HIRE TOWNFIGHTER',[]];

//MG
_c pushBack 'CUP_B_HIL_MMG_Recon';
_i pushBack [localize "STR_WF_ALL_TAI4",'',650,4,-1,_blu_level_1,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_B_CDF_Soldier_MG_SNW';
_i pushBack [localize "STR_WF_ALL_TAI4",'',650,4,-1,_blu_level_1,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_B_HIL_MMG';
_i pushBack [localize "STR_WF_ALL_TAI4",'',650,4,-1,_blu_level_1,0,1,'HIRE TOWNFIGHTER',[]];

//AR
_c pushBack 'CUP_B_CDF_Soldier_AR_DST';
_i pushBack [localize "STR_WF_ALL_TAI5",'',550,4,-1,_blu_level_1,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_B_CDF_Soldier_AR_SNW';
_i pushBack [localize "STR_WF_ALL_TAI5",'',550,4,-1,_blu_level_1,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_B_CDF_Soldier_AR_MNT';
_i pushBack [localize "STR_WF_ALL_TAI5",'',550,4,-1,_blu_level_1,0,1,'HIRE TOWNFIGHTER',[]];

//LEVEL 2 TOWN

//HAT
_c pushBack 'CUP_B_CDF_Soldier_LAT_DST';
_i pushBack [localize "STR_WF_ALL_TAI6",'',960,4,-1,_blu_level_2,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_B_CDF_Soldier_LAT_SNW';
_i pushBack [localize "STR_WF_ALL_TAI6",'',960,4,-1,_blu_level_2,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_B_HIL_Soldier_HAT_Res';
_i pushBack [localize "STR_WF_ALL_TAI6",'',960,4,-1,_blu_level_2,0,1,'HIRE TOWNFIGHTER',[]];

//LEVEL 3 TOWN

//AA
_c pushBack 'CUP_B_CDF_Soldier_AA_DST';
_i pushBack [localize "STR_WF_ALL_TAI7",'',1200,4,-1,_blu_level_3,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_B_CDF_Soldier_AA_SNW';
_i pushBack [localize "STR_WF_ALL_TAI7",'',1200,4,-1,_blu_level_3,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_B_HIL_Soldier_AA';
_i pushBack [localize "STR_WF_ALL_TAI7",'',1200,4,-1,_blu_level_3,0,1,'HIRE TOWNFIGHTER',[]];


//BARRACKS---------------------------------------------



//____________________________________________________________________________________________________//__UK_|---BARRACKS---|_UK__\\---0



_c pushBack 'cwr3_b_uk_soldier_crewman_apc';
_i pushBack [localize "STR_WF_UK_B1",'',75,4,-1,_uk_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_uk_soldier_pilot_jet';
_i pushBack [localize "STR_WF_UK_B2",'',80,4,-1,_uk_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_uk_soldier_pilot';
_i pushBack [localize "STR_WF_UK_B3",'',90,4,-1,_uk_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_uk_soldier_crewman';
_i pushBack [localize "STR_WF_UK_B4",'',95,4,-1,_uk_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_uk_soldier';
_i pushBack [localize "STR_WF_UK_B5",'',105,4,-1,_uk_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_uk_soldier_backpack';
_i pushBack [localize "STR_WF_UK_B6",'',115,4,-1,_uk_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_uk_soldier_at_law';
_i pushBack [localize "STR_WF_UK_B7",'',215,4,-1,_uk_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_uk_soldier_medic';
_i pushBack [localize "STR_WF_UK_B8",'',130,4,-1,_uk_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_uk_soldier_engineer';
_i pushBack [localize "STR_WF_UK_B9",'',450,4,-1,_uk_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_uk_soldier_ar';
_i pushBack [localize "STR_WF_UK_B10",'',125,4,-1,_uk_level_0,0,1,'LEVEL 0',[]];


//____________________________________________________________________________________________________//__UK_|---BARRACKS---|_UK__\\---1


_c pushBack 'cwr3_b_uk_soldier_amg';
_i pushBack [localize "STR_WF_UK_B11",'',110,4,-1,_uk_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_uk_soldier_mg';
_i pushBack [localize "STR_WF_UK_B12",'',135,4,-1,_uk_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_uk_soldier_marksman';
_i pushBack [localize "STR_WF_UK_B13",'',160,4,-1,_uk_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_uk_soldier_spotter';
_i pushBack [localize "STR_WF_UK_B14",'',270,4,-1,_uk_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_uk_soldier_sapper';
_i pushBack [localize "STR_WF_UK_B15",'',325,4,-1,_uk_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_uk_soldier_sniper';
_i pushBack [localize "STR_WF_UK_B16",'',410,4,-1,_uk_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_uk_soldier_aat_carlgustaf';
_i pushBack [localize "STR_WF_UK_B17",'',240,4,-1,_uk_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_uk_soldier_at_carlgustaf';
_i pushBack [localize "STR_WF_UK_B18",'',430,4,-1,_uk_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_uk_soldier_aaa_javelin';
_i pushBack [localize "STR_WF_UK_B19",'',300,4,-1,_uk_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_uk_soldier_aa_javelin';
_i pushBack [localize "STR_WF_UK_B20",'',600,4,-1,_uk_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_uk_soldier_tl';
_i pushBack [localize "STR_WF_UK_B21",'',240,4,-1,_uk_level_1,0,1,'LEVEL 1',[]];


//____________________________________________________________________________________________________//__UK_|---BARRACKS---|_UK__\\---2


_c pushBack 'CUP_B_BAF_Soldier_Helipilot_DPM';
_i pushBack [localize "STR_WF_UK_B22",'',80,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_Crew_DPM';
_i pushBack [localize "STR_WF_UK_B23",'',90,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_Rifleman_DPM';
_i pushBack [localize "STR_WF_UK_B24",'',115,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_AutoRifleman_DPM';
_i pushBack [localize "STR_WF_UK_B25",'',200,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_RiflemanLAT_DPM';
_i pushBack [localize "STR_WF_UK_B26",'',275,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_HeavyGunner_DPM';
_i pushBack [localize "STR_WF_UK_B27",'',260,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_Grenadier_DPM';
_i pushBack [localize "STR_WF_UK_B28",'',195,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_Marksman_DPM';
_i pushBack [localize "STR_WF_UK_B29",'',255,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_RiflemanAT_DPM';
_i pushBack [localize "STR_WF_UK_B30",'',535,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_Engineer_DPM';
_i pushBack [localize "STR_WF_UK_B31",'',305,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_Medic_DPM';
_i pushBack [localize "STR_WF_UK_B32",'',290,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_AA_DPM';
_i pushBack [localize "STR_WF_UK_B33",'',690,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_TeamLeader_DPM';
_i pushBack [localize "STR_WF_UK_B34",'',315,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_SquadLeader_DPM';
_i pushBack [localize "STR_WF_UK_B35",'',320,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Spotter_DPM';
_i pushBack [localize "STR_WF_UK_B36",'',435,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Spotter_DDPM';
_i pushBack [localize "STR_WF_UK_B37",'',435,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Sniper_DPM';
_i pushBack [localize "STR_WF_UK_B38",'',550,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_BAF_Soldier_SharpShooter_DPM';
_i pushBack [localize "STR_WF_UK_B39",'',450,4,-1,_uk_level_2,0,1,'LEVEL 2',[]];


//____________________________________________________________________________________________________//__UK_|---BARRACKS---|_UK__\\---3


_c pushBack 'cwr3_b_uk_soldier_sas_laser_night';
_i pushBack [localize "STR_WF_UK_B40",'',550,4,-1,_uk_level_3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_BAF_Spotter_L85TWS_DPM';
_i pushBack [localize "STR_WF_UK_B41",'',570,4,-1,_uk_level_3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_BAF_Sniper_AS50_DPM';
_i pushBack [localize "STR_WF_UK_B42",'',950,4,-1,_uk_level_3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_BAF_Sniper_AS50_TWS_DPM';
_i pushBack [localize "STR_WF_UK_B43",'',1050,4,-1,_uk_level_3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_BAF_Soldier_AT_DPM';
_i pushBack [localize "STR_WF_UK_B44",'',1075,4,-1,_uk_level_3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_BAF_Soldier_AsstAT_DPM';
_i pushBack [localize "STR_WF_UK_B45",'',550,4,-1,_uk_level_3,0,1,'LEVEL 3',[]];



//__________________________________________________________________________________________________________________________________



//____________________________________________________________________________________________________//__US_|---BARRACKS---|_US__\\---0

_c pushBack 'cwr3_b_soldier_driver';
_i pushBack [localize "STR_WF_US_B1",'',75,4,-1,_us_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_soldier_pilot_jet';
_i pushBack [localize "STR_WF_US_B2",'',80,4,-1,_us_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_soldier_pilot';
_i pushBack [localize "STR_WF_US_B3",'',90,4,-1,_us_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_soldier_crew';
_i pushBack [localize "STR_WF_US_B4",'',95,4,-1,_us_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_soldier';
_i pushBack [localize "STR_WF_US_B5",'',105,4,-1,_us_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_soldier_backpack';
_i pushBack [localize "STR_WF_US_B6",'',115,4,-1,_us_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_soldier_at_law';
_i pushBack [localize "STR_WF_US_B7",'',215,4,-1,_us_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_soldier_medic';
_i pushBack [localize "STR_WF_US_B8",'',130,4,-1,_us_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_soldier_engineer';
_i pushBack [localize "STR_WF_US_B9",'',450,4,-1,_us_level_0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_soldier_ar_m16';
_i pushBack [localize "STR_WF_US_B10",'',125,4,-1,_us_level_0,0,1,'LEVEL 0',[]];


//____________________________________________________________________________________________________//__US_|---BARRACKS---|_US__\\---1


_c pushBack 'cwr3_b_soldier_amg';
_i pushBack [localize "STR_WF_US_B11",'',110,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_mg';
_i pushBack [localize "STR_WF_US_B12",'',135,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_marksman';
_i pushBack [localize "STR_WF_US_B13",'',160,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_spotter';
_i pushBack [localize "STR_WF_US_B14",'',270,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_sapper';
_i pushBack [localize "STR_WF_US_B15",'',325,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_sniper';
_i pushBack [localize "STR_WF_US_B16",'',410,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_aat_carlgustaf';
_i pushBack [localize "STR_WF_US_B17",'',240,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_at_carlgustaf';
_i pushBack [localize "STR_WF_US_B18",'',430,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_aa_redeye';
_i pushBack [localize "STR_WF_US_B19",'',600,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_aat_m67';
_i pushBack [localize "STR_WF_US_B20",'',230,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_at_m67';
_i pushBack [localize "STR_WF_US_B21",'',390,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_aat_m47';
_i pushBack [localize "STR_WF_US_B22",'',280,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_at_m47';
_i pushBack [localize "STR_WF_US_B23",'',550,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_hg';
_i pushBack [localize "STR_WF_US_B24",'',370,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_aar';
_i pushBack [localize "STR_WF_US_B25",'',125,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_ar';
_i pushBack [localize "STR_WF_US_B26",'',130,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_officer_night';
_i pushBack [localize "STR_WF_US_B27",'',200,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_sl';
_i pushBack [localize "STR_WF_US_B28",'',160,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_m14';
_i pushBack [localize "STR_WF_US_B29",'',140,4,-1,_us_level_1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_soldier_gl';
_i pushBack [localize "STR_WF_US_B30",'',155,4,-1,_us_level_1,0,1,'LEVEL 1',[]];


//____________________________________________________________________________________________________//__US_|---BARRACKS---|_US__\\---2


_c pushBack 'CUP_B_USMC_Pilot';
_i pushBack [localize "STR_WF_US_B31",'',80,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Crew';
_i pushBack [localize "STR_WF_US_B32",'',90,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Soldier';
_i pushBack [localize "STR_WF_US_B33",'',110,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Soldier_AR';
_i pushBack [localize "STR_WF_US_B34",'',200,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Soldier_LAT';
_i pushBack [localize "STR_WF_US_B35",'',275,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Soldier_MG';
_i pushBack [localize "STR_WF_US_B36",'',260,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Soldier_GL';
_i pushBack [localize "STR_WF_US_B37",'',195,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Soldier_Marksman';
_i pushBack [localize "STR_WF_US_B38",'',255,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Soldier_AT';
_i pushBack [localize "STR_WF_US_B39",'',520,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Engineer';
_i pushBack [localize "STR_WF_US_B40",'',305,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Medic';
_i pushBack [localize "STR_WF_US_B41",'',290,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Soldier_AA';
_i pushBack [localize "STR_WF_US_B42",'',690,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Soldier_TL';
_i pushBack [localize "STR_WF_US_B43",'',315,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Soldier_SL';
_i pushBack [localize "STR_WF_US_B44",'',310,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Spotter_des';
_i pushBack [localize "STR_WF_US_B45",'',435,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_Sniper_M40A3';
_i pushBack [localize "STR_WF_US_B46",'',505,4,-1,_us_level_2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_USMC_SpecOps_SD';//ITS PUMPGUNG AI 
_i pushBack [localize "STR_WF_US_B47",'',100,4,-1,_us_level_2,0,1,'LEVEL 2',[]];


//____________________________________________________________________________________________________//__US_|---BARRACKS---|_US__\\---3


_c pushBack 'cwr3_b_blackop_laser';
_i pushBack [localize "STR_WF_US_B48",'',550,4,-1,_us_level_3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_US_Sniper_OCP';
_i pushBack [localize "STR_WF_US_B49",'',605,4,-1,_us_level_3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_US_Sniper_M107_UCP';
_i pushBack [localize "STR_WF_US_B50",'',920,4,-1,_us_level_3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_US_Spotter_UCP';
_i pushBack [localize "STR_WF_US_B51",'',570,4,-1,_us_level_3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_US_Sniper_M110_TWS_UCP';
_i pushBack [localize "STR_WF_US_B52",'',770,4,-1,_us_level_3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_USMC_MARSOC_Marksman_DA';
_i pushBack [localize "STR_WF_US_B53",'',665,4,-1,_us_level_3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_USMC_Sniper_M107';
_i pushBack [localize "STR_WF_US_B54",'',925,4,-1,_us_level_3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_USMC_Soldier_HAT';
_i pushBack [localize "STR_WF_US_B55",'',1075,4,-1,_us_level_3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_FR_Saboteur';
_i pushBack [localize "STR_WF_US_B56",'',475,4,-1,_us_level_3,0,1,'LEVEL 3',[]];

//__________________________________________________________________________________________________________________________________
//__________________________________________________________________________________________________________________________________
//__________________________________________________________________________________________________________________________________

_light_buildtime=25;
//__________________________________________________________________________________________________________________________________

//TOWN
_c pushBack'C_Van_01_fuel_F';
_i pushBack[localize "STR_WF_ALL_T1",'',1550,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'C_Van_01_transport_F';								//4 slots
_i pushBack[localize "STR_WF_ALL_T2",'',550,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_TT650_TK_CIV';
_i pushBack[localize "STR_WF_ALL_T3",'',250,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_S1203_CIV';
_i pushBack[localize "STR_WF_ALL_T4",'',450,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_Ural_Civ_01';
_i pushBack[localize "STR_WF_ALL_T5",'',1050,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'C_Truck_02_transport_F';
_i pushBack[localize "STR_WF_ALL_T6",'',980,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_V3S_Open_TKC';
_i pushBack[localize "STR_WF_ALL_T7",'',850,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_Lada_GreenTK_CIV';
_i pushBack[localize "STR_WF_ALL_T8",'',130,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Golf4_green_Civ';
_i pushBack[localize "STR_WF_ALL_T9",'',2550,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Octavia_CIV';
_i pushBack[localize "STR_WF_ALL_T10",'',1350,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'C_Hatchback_01_F';
_i pushBack[localize "STR_WF_ALL_T11",'',3580,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Volha_Gray_TKCIV';
_i pushBack[localize "STR_WF_ALL_T12",'',200,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'C_Hatchback_01_sport_F';
_i pushBack[localize "STR_WF_ALL_T13",'',5750,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'C_SUV_01_F';
_i pushBack[localize "STR_WF_ALL_T14",'',4100,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Datsun_4seat';								//2 slots
_i pushBack[localize "STR_WF_ALL_T15",'',310,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Datsun';										//2 slots
_i pushBack[localize "STR_WF_ALL_T16",'',310,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'C_Quadbike_01_F';
_i pushBack[localize "STR_WF_ALL_T17",'',350,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_Pickup_unarmed_CIV';							//2 slots
_i pushBack[localize "STR_WF_ALL_T18",'',850,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'C_Offroad_01_F';									//2 slots
_i pushBack[localize "STR_WF_ALL_T19",'',2470,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_O_Hilux_unarmed_TK_CIV';						//2 slots
_i pushBack[localize "STR_WF_ALL_T20",'',780,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_Bus_City_TKCIV';
_i pushBack[localize "STR_WF_ALL_T21",'',900,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Ikarus_TKC';
_i pushBack[localize "STR_WF_ALL_T22",'',1120,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_UAZ_Unarmed_TK_CIV';
_i pushBack[localize "STR_WF_ALL_T23",'',490,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_SUV_TK';
_i pushBack[localize "STR_WF_ALL_T24",'',5550,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'UK3CB_Civ_LandRover_Soft_Blue_A';
_i pushBack[localize "STR_WF_ALL_T25",'',2770,_light_buildtime,-2,0,1,0,'Civilians',[]];


_c pushBack'UK3CB_Civ_LandRover_Hard_Red_A';
_i pushBack[localize "STR_WF_ALL_T26",'',3050,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_LR_Transport_CTK';
_i pushBack[localize "STR_WF_ALL_T27",'',1550,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_UAZ_Open_TK_CIV';								//2 slots
_i pushBack[localize "STR_WF_ALL_T28",'',350,_light_buildtime,-2,0,1,0,'Civilians',[]];


_c pushBack'cwr3_c_ural_empty';									//4 slots
_i pushBack[localize "STR_WF_ALL_T29",'',350,_light_buildtime,-2,0,1,0,'Civilians',[]];




//___|---LIGHT---|___\\---0

_c pushBack'Land_Pod_Heli_Transport_04_medevac_F';
_i pushBack[localize "STR_WF_ALL_L1",'',2050,_light_buildtime,-1,2,1,0,'LEVEL 2',[],1];


_c pushBack 'Land_Device_slingloadable_F';
_i pushBack [localize "STR_WF_ALL_L2",'',54000,_light_buildtime,-1,4,1,0,'LEVEL 4',[]];//ECM POD


//for salvage
_c pushBack 'Land_Device_assembled_F';
_i pushBack ['','',54000,_light_buildtime,-1,4,1,0,'LEVEL 4',[]];//ECM POD


//___VEHICLE

_c pushBack'cwr3_c_bicycle';
_i pushBack[localize "STR_WF_ALL_L3",'',50,_light_buildtime,-2,0,1,0,'Civilians',[]];
//__________________________________________________________________________________________________________________________________



//____________________________________________________________________________________________________//__BLU_|---LIGHT---|_BLU__\\---0


_c pushBack'CUP_B_M1030_USA';
_i pushBack[localize "STR_WF_US_L1",'',150,_light_buildtime,-2,_us_level_0,1,0,'LEVEL 0',[]];

_c pushBack'B_Quadbike_01_F';
_i pushBack[localize "STR_WF_ALL_L4",'',180,_light_buildtime,-2,_blu_level_0,1,0,'LEVEL 0',[]];

//LOADVEHICLE
_c pushBack'pook_MAZ7910_base_BLUFOR';
_i pushBack[localize "STR_WF_BLU_L1",'',215,_light_buildtime,-2,_blu_level_0,1,0,'Civilians',[]];//LOADER VEHICLE 8 slots (can load all)

//-4 SLOTS----

_c pushBack'cwr3_b_m939_empty';
_i pushBack[localize "STR_WF_US_L3",'',180,_light_buildtime,-2,_us_level_0,1,0,'LEVEL 0',[]];//LOADER VEHICLE 4 slots 


_c pushBack'UK3CB_BAF_MAN_HX60_Cargo_Green_A';
_i pushBack[localize "STR_WF_UK_L1",'',195,_light_buildtime,-2,_uk_level_0,1,0,'LEVEL 0',[]];//LOADER VEHICLE 4 slots 

//-2 SLOTS----us

_c pushBack'CUP_B_M1152_WDL_USA';
_i pushBack[localize "STR_WF_US_L4",'',180,_light_buildtime,-2,_us_level_0,1,0,'LEVEL 0',[]];//LOADER VEHICLE 2 slots 

_c pushBack'CUP_B_M1165_GMV_WDL_USA';
_i pushBack[localize "STR_WF_US_L5",'',385,_light_buildtime,-2,_us_level_1,1,0,'LEVEL 1',[]];//LOADER VEHICLE 2 slots 

_c pushBack'CUP_B_nM1025_SOV_M2_USA_WDL';
_i pushBack[localize "STR_WF_US_L6",'',450,_light_buildtime,-2,_us_level_1,1,0,'LEVEL 1',[]];//LOADER VEHICLE 2 slots 

_c pushBack'CUP_B_nM1025_SOV_Mk19_USA_WDL';
_i pushBack[localize "STR_WF_US_L7",'',480,_light_buildtime,-2,_us_level_1,1,0,'LEVEL 1',[]];//LOADER VEHICLE 2 slots 


//-2 SLOTS----uk

_c pushBack'cwr3_b_uk_fv620_transport';
_i pushBack[localize "STR_WF_UK_L2",'',195,_light_buildtime,-2,_uk_level_0,1,0,'LEVEL 0',[]];//LOADER VEHICLE 2 slots 


_c pushBack'CUP_B_BAF_Coyote_L2A1_W';
_i pushBack[localize "STR_WF_UK_L3",'',375,_light_buildtime,-2,_uk_level_1,1,0,'LEVEL 1',[]];//LOADER VEHICLE 2 slots 

_c pushBack'CUP_B_BAF_Coyote_GMG_W';
_i pushBack[localize "STR_WF_UK_L4",'',395,_light_buildtime,-2,_uk_level_1,1,0,'LEVEL 1',[]];//LOADER VEHICLE 2 slots 

_c pushBack'UK3CB_BAF_Husky_Passenger_GMG_Green';
_i pushBack[localize "STR_WF_UK_L5",'',450,_light_buildtime,-2,_uk_level_1,1,0,'LEVEL 1',[]];//LOADER VEHICLE 2 slots 

_c pushBack'UK3CB_BAF_Husky_Passenger_GPMG_Green';
_i pushBack[localize "STR_WF_UK_L6",'',410,_light_buildtime,-2,_uk_level_1,1,0,'LEVEL 1',[]];//LOADER VEHICLE 2 slots 

_c pushBack'CUP_B_Wolfhound_LMG_GB_W';
_i pushBack[localize "STR_WF_UK_L7",'',810,_light_buildtime,-2,_uk_level_3,1,0,'LEVEL 3',[]];//LOADER VEHICLE 2 slots 


_c pushBack'CUP_B_Wolfhound_HMG_GB_W';
_i pushBack[localize "STR_WF_UK_L8",'',825,_light_buildtime,-2,_uk_level_4,1,0,'LEVEL 4',[]];//LOADER VEHICLE 2 slots 


_c pushBack'CUP_B_Wolfhound_GMG_GB_W';
_i pushBack[localize "STR_WF_UK_L9",'',840,_light_buildtime,-2,_uk_level_4,1,0,'LEVEL 4',[]];//LOADER VEHICLE 2 slots 




//__________________________________________________________________________________________________________________________________



//____________________________________________________________________________________________________//__UK_|---LIGHT---|_UK__\\---0


_c pushBack 'UK3CB_BAF_LandRover_Soft_Green_B';
_i pushBack [localize "STR_WF_UK_L10",'',55,_light_buildtime,-2,_uk_level_0,1,0,'LEVEL 0',[]];
_c pushBack 'UK3CB_BAF_MAN_HX58_Transport_Green';
_i pushBack [localize "STR_WF_UK_L11",'',320,_light_buildtime,-2,_uk_level_0,1,0,'LEVEL 0',[]];//---SALVAGE


//____________________________________________________________________________________________________//__UK_|---LIGHT---|_UK__\\---1


_c pushBack 'UK3CB_BAF_LandRover_WMIK_GMG_Green_B';
_i pushBack [localize "STR_WF_UK_L12",'',245,_light_buildtime,-2,_uk_level_1,1,0,'LEVEL 1',[]];
_c pushBack 'UK3CB_BAF_Panther_GPMG_Green_A';
_i pushBack [localize "STR_WF_UK_L13",'',385,_light_buildtime,-2,_uk_level_1,1,0,'LEVEL 1',[]];

_c pushBack 'CUP_B_Jackal2_L2A1_GB_W';
_i pushBack [localize "STR_WF_UK_L14",'',355,_light_buildtime,-2,_uk_level_1,1,0,'LEVEL 1',[]];
_c pushBack 'CUP_B_Jackal2_GMG_GB_W';
_i pushBack [localize "STR_WF_UK_L15",'',380,_light_buildtime,-2,_uk_level_1,1,0,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uk_fv620_reammo';
_i pushBack [localize "STR_WF_UK_L16",'',650,_light_buildtime,-2,_uk_level_1,1,0,'LEVEL 1',[]];//---AMMO
_c pushBack 'cwr3_b_uk_fv432_gpmg';
_i pushBack [localize "STR_WF_UK_L17",'',680,_light_buildtime,-2,_uk_level_1,1,0,'LEVEL 1',[]];


//____________________________________________________________________________________________________//__UK_|---LIGHT---|_UK__\\---2


_c pushBack 'UK3CB_BAF_LandRover_Soft_MERT_A';
_i pushBack [localize "STR_WF_UK_L18",'',2100,_light_buildtime,-2,_uk_level_2,1,0,'LEVEL 2',[]];//---AMBU
_c pushBack 'UK3CB_BAF_LandRover_Amb_Green_A';
_i pushBack [localize "STR_WF_UK_L19",'',2300,_light_buildtime,-2,_uk_level_2,1,0,'LEVEL 2',[]];//---AMBU
_c pushBack 'UK3CB_BAF_MAN_HX60_Repair_Green';
_i pushBack [localize "STR_WF_UK_L20",'',2550,_light_buildtime,-2,_uk_level_2,1,0,'LEVEL 2',[]];//---RTRUCK
_c pushBack 'pook_Pandur_Mk19_BLUFOR';
_i pushBack [localize "STR_WF_UK_L21",'',875,_light_buildtime,-2,_uk_level_2,1,0,'LEVEL 2',[]];
_c pushBack 'pook_Pandur_M2_BLUFOR';
_i pushBack [localize "STR_WF_UK_L22",'',820,_light_buildtime,-2,_uk_level_2,1,0,'LEVEL 2',[]];
_c pushBack 'CUP_B_Ridgback_LMG_GB_W';
_i pushBack [localize "STR_WF_UK_L23",'',675,_light_buildtime,-2,_uk_level_2,1,0,'LEVEL 2',[]];
_c pushBack 'UK3CB_BAF_LandRover_WMIK_Milan_Green_B';
_i pushBack [localize "STR_WF_UK_L24",'',900,_light_buildtime,-2,_uk_level_2,1,0,'LEVEL 2',[]];


//____________________________________________________________________________________________________//__UK_|---LIGHT---|_UK__\\---3


_c pushBack 'pook_Pandur_AT_BLUFOR';
_i pushBack [localize "STR_WF_UK_L25",'',1100,_light_buildtime,-2,_uk_level_3,1,0,'LEVEL 3',[]];
_c pushBack 'pook_Pandur_AMB_BLUFOR';
_i pushBack [localize "STR_WF_UK_L26",'',3300,_light_buildtime,-2,_uk_level_3,1,0,'LEVEL 3',[]];//---AMBU
_c pushBack 'CUP_I_LR_AA_AAF';
_i pushBack [localize "STR_WF_UK_L27",'',1250,_light_buildtime,-2,_uk_level_3,1,0,'LEVEL 3',[],5];
_c pushBack 'pook_Pandur_RWS_BLUFOR';
_i pushBack [localize "STR_WF_UK_L28",'',900,_light_buildtime,-2,_uk_level_3,1,0,'LEVEL 3',[]];
_c pushBack 'pook_Pandur_SP30_BLUFOR';
_i pushBack [localize "STR_WF_UK_L29",'',1375,_light_buildtime,-2,_uk_level_3,1,0,'LEVEL 3',[]];
_c pushBack 'CUP_B_Ridgback_HMG_GB_W';
_i pushBack [localize "STR_WF_UK_L30",'',755,_light_buildtime,-2,_uk_level_3,1,0,'LEVEL 3',[]];
_c pushBack 'CUP_B_Ridgback_GMG_GB_W';
_i pushBack [localize "STR_WF_UK_L31",'',790,_light_buildtime,-2,_uk_level_3,1,0,'LEVEL 3',[]];
_c pushBack 'CUP_B_Mastiff_LMG_GB_W';
_i pushBack [localize "STR_WF_UK_L32",'',690,_light_buildtime,-2,_uk_level_3,1,0,'LEVEL 3',[]];
//_c pushBack 'cwr3_b_uk_fv432_peak';
//_i pushBack ['','',820,_light_buildtime,-2,_uk_level_3,1,0,'LEVEL 3',[]];
_c pushBack 'pook_Pandur_Mortar_BLUFOR';
_i pushBack [localize "STR_WF_UK_L33",'',3900,_light_buildtime,-2,_uk_level_3,1,0,'LEVEL 3',[]];//---ARTY


//____________________________________________________________________________________________________//__UK_|---LIGHT---|_UK__\\---4


_c pushBack 'pook_NASAMS_BASE';
_i pushBack [localize "STR_WF_UK_L34",'',3900,_light_buildtime,-2,_uk_level_4,1,0,'LEVEL 4',[]];
_c pushBack 'cwr3_b_uk_fv620_repair';
_i pushBack [localize "STR_WF_UK_L35",'',3050,_light_buildtime,-2,_uk_level_4,1,0,'LEVEL 4',[]];//---RTRUCK
_c pushBack 'CUP_B_Mastiff_HMG_GB_W';
_i pushBack [localize "STR_WF_UK_L36",'',800,_light_buildtime,-2,_uk_level_4,1,0,'LEVEL 4',[]];
_c pushBack 'CUP_B_Mastiff_GMG_GB_W';
_i pushBack [localize "STR_WF_UK_L37",'',830,_light_buildtime,-2,_uk_level_4,1,0,'LEVEL 4',[]];
_c pushBack 'pook_Pandur_RCWS30_BLUFOR';
_i pushBack [localize "STR_WF_UK_L38",'',1775,_light_buildtime,-2,_uk_level_4,1,0,'LEVEL 4',[]];
_c pushBack 'CUP_B_FV432_GB_Ambulance';
_i pushBack [localize "STR_WF_UK_L39",'',3275,_light_buildtime,-2,_uk_level_4,1,0,'LEVEL 4',[]];//---AMBU
_c pushBack 'pook_Pandur_MGS_BLUFOR';
_i pushBack [localize "STR_WF_UK_L40",'',2800,_light_buildtime,-2,_uk_level_4,1,0,'LEVEL 4',[]];
_c pushBack 'pook_Pandur_AA_BLUFOR';
_i pushBack [localize "STR_WF_UK_L41",'',2350,_light_buildtime,-2,_uk_level_4,1,0,'LEVEL 4',[]];
_c pushBack 'pook_CAESAR_BLUFOR';
_i pushBack [localize "STR_WF_UK_L42",'',6700,_light_buildtime,-2,_uk_level_4,1,0,'LEVEL 4',[]];//---ARTY
_c pushBack 'UK3CB_BAF_LandRover_Panama_Green_A';
_i pushBack [localize "STR_WF_UK_L43",'',1075,_light_buildtime,-1,_uk_level_4,1,0,'LEVEL 4',[]];
//_c pushBack 'pook_MAARS_M240';
//_i pushBack ['','',1300,_light_buildtime,-1,_uk_level_4,1,0,'LEVEL 4',[]];

//__________________________________________________________________________________________________________________________________



//____________________________________________________________________________________________________//__US_|---LIGHT---|_US__\\---0

_c pushBack 'cwr3_b_m151';
_i pushBack [localize "STR_WF_US_L8",'',50,_light_buildtime,-2,_us_level_0,1,0,'LEVEL 0',[]];
_c pushBack 'CUP_B_nM1038_DF_USMC_WDL';
_i pushBack [localize "STR_WF_US_L9",'',210,_light_buildtime,-2,_us_level_0,1,0,'LEVEL 0',[]];
_c pushBack 'cwr3_b_m939';
_i pushBack [localize "STR_WF_US_L10",'',315,_light_buildtime,-2,_us_level_0,1,0,'LEVEL 0',[]];//---SALVAGE


//____________________________________________________________________________________________________//__US_|---LIGHT---|_US__\\---1


_c pushBack 'cwr3_b_m151_m2';
_i pushBack [localize "STR_WF_US_L11",'',230,_light_buildtime,-2,_us_level_1,1,0,'LEVEL 1',[]];
_c pushBack 'CUP_B_nM1025_M240_USMC_WDL';
_i pushBack [localize "STR_WF_US_L12",'',260,_light_buildtime,-2,_us_level_1,1,0,'LEVEL 1',[]];
_c pushBack 'CUP_B_M1165_GMV_USMC';
_i pushBack [localize "STR_WF_US_L13",'',320,_light_buildtime,-2,_us_level_1,1,0,'LEVEL 1',[]];
_c pushBack 'CUP_B_nM1025_Mk19_DF_USMC_WDL';
_i pushBack [localize "STR_WF_US_L14",'',350,_light_buildtime,-2,_us_level_1,1,0,'LEVEL 1',[]];
_c pushBack 'CUP_B_nM1025_M2_DF_USMC_WDL';
_i pushBack [localize "STR_WF_US_L15",'',330,_light_buildtime,-2,_us_level_1,1,0,'LEVEL 1',[]];
_c pushBack 'CUP_B_M1151_Mk19_USMC';
_i pushBack [localize "STR_WF_US_L16",'',380,_light_buildtime,-2,_us_level_1,1,0,'LEVEL 1',[]];
_c pushBack 'CUP_B_M1151_M2_USMC';
_i pushBack [localize "STR_WF_US_L17",'',350,_light_buildtime,-2,_us_level_1,1,0,'LEVEL 1',[]];
_c pushBack 'cwr3_b_m939_reammo';
_i pushBack [localize "STR_WF_US_L18",'',450,_light_buildtime,-2,_us_level_1,1,0,'LEVEL 1',[]];//---AMMO
_c pushBack 'CUP_B_M113A1_USA';
_i pushBack [localize "STR_WF_US_L19",'',500,_light_buildtime,-2,_us_level_1,1,0,'LEVEL 1',[]];


//____________________________________________________________________________________________________//__US_|---LIGHT---|_US__\\---2


_c pushBack 'CUP_B_nM997_DF_USMC_WDL';
_i pushBack [localize "STR_WF_US_L20",'',2300,_light_buildtime,-2,_us_level_2,1,0,'LEVEL 2',[]];//---AMBU
_c pushBack 'cwr3_b_m939_repair';
_i pushBack [localize "STR_WF_US_L21",'',2500,_light_buildtime,-2,_us_level_2,1,0,'LEVEL 2',[]];//---RTRUCK
_c pushBack 'CUP_B_RG31_M2_OD_USMC';
_i pushBack [localize "STR_WF_US_L22",'',550,_light_buildtime,-2,_us_level_2,1,0,'LEVEL 2',[]];
_c pushBack 'CUP_B_RG31_Mk19_OD_USMC';
_i pushBack [localize "STR_WF_US_L23",'',610,_light_buildtime,-2,_us_level_2,1,0,'LEVEL 2',[]];
_c pushBack 'CUP_B_nM1036_TOW_DF_USMC_WDL';
_i pushBack [localize "STR_WF_US_L24",'',890,_light_buildtime,-2,_us_level_2,1,0,'LEVEL 2',[]];


//____________________________________________________________________________________________________//__US_|---LIGHT---|_US__\\---3


_c pushBack 'CUP_B_M1135_ATGMV_Woodland';
_i pushBack [localize "STR_WF_US_L25",'',1075,_light_buildtime,-2,_us_level_3,1,0,'LEVEL 3',[]];
_c pushBack 'CUP_B_M1133_MEV_Woodland';
_i pushBack [localize "STR_WF_US_L26",'',3275,_light_buildtime,-2,_us_level_3,1,0,'LEVEL 3',[]];//---AMBU
_c pushBack 'CUP_B_nM1097_AVENGER_USA_WDL';
_i pushBack [localize "STR_WF_US_L27",'',1250,_light_buildtime,-2,_us_level_3,1,0,'LEVEL 3',[]];

_c pushBack 'CUP_B_HMMWV_Avenger_USMC';
_i pushBack [localize "STR_WF_US_L28",'',1650,_light_buildtime,-2,_us_level_3,1,0,'LEVEL 3',[]];



_c pushBack 'CUP_B_M113A3_USA';
_i pushBack [localize "STR_WF_US_L29",'',650,_light_buildtime,-2,_us_level_3,1,0,'LEVEL 3',[]];
_c pushBack 'CUP_B_LAV25_USMC';
_i pushBack [localize "STR_WF_US_L30",'',1350,_light_buildtime,-2,_us_level_3,1,0,'LEVEL 3',[]];
_c pushBack 'CUP_B_M1126_ICV_M2_Woodland';
_i pushBack [localize "STR_WF_US_L31",'',810,_light_buildtime,-2,_us_level_3,1,0,'LEVEL 3',[]];
_c pushBack 'CUP_B_M1126_ICV_MK19_Woodland';
_i pushBack [localize "STR_WF_US_L32",'',850,_light_buildtime,-2,_us_level_3,1,0,'LEVEL 3',[]];
_c pushBack 'CUP_B_M1129_MC_MK19_Woodland';
_i pushBack [localize "STR_WF_US_L33",'',3475,_light_buildtime,-2,_us_level_3,1,0,'LEVEL 3',[]];//---ARTY
_c pushBack 'cwr3_b_m901_itv';
_i pushBack [localize "STR_WF_US_L34",'',1050,_light_buildtime,-2,_us_level_3,1,0,'LEVEL 3',[]];


//____________________________________________________________________________________________________//__US_|---LIGHT---|_US__\\---4


_c pushBack 'pook_CRAM_BASE';
_i pushBack [localize "STR_WF_US_L35",'',2575,_light_buildtime,-2,_us_level_4,1,0,'LEVEL 4',[]];
_c pushBack 'pook_MEADS_base';
_i pushBack [localize "STR_WF_US_L36",'',4200,_light_buildtime,-2,_us_level_4,1,0,'LEVEL 4',[]];
_c pushBack 'cwr3_b_m113a3_mev_des';
_i pushBack [localize "STR_WF_US_L37",'',3050,_light_buildtime,-2,_us_level_4,1,0,'LEVEL 4',[]];//---AMBU
_c pushBack 'CUP_B_M1128_MGS_Woodland';
_i pushBack [localize "STR_WF_US_L38",'',2700,_light_buildtime,-2,_us_level_4,1,0,'LEVEL 4',[]];
_c pushBack 'CUP_B_M163_Vulcan_USA';
_i pushBack [localize "STR_WF_US_L39",'',2200,_light_buildtime,-2,_us_level_4,1,0,'LEVEL 4',[]];
_c pushBack 'pook_MLRS_BLUFOR';
_i pushBack [localize "STR_WF_US_L40",'',5475,_light_buildtime,-2,_us_level_4,1,0,'LEVEL 4',[]];



_c pushBack 'pook_MAARS_M240';
_i pushBack [localize "STR_WF_BLU_L2",'',1300,_light_buildtime,-1,_blu_level_4,1,0,'LEVEL 4',[]];

//__________________________________________________________________________________________________________________________________
//__________________________________________________________________________________________________________________________________
//__________________________________________________________________________________________________________________________________

_heavy_buildtime= 40;
//__________________________________________________________________________________________________________________________________



//____________________________________________________________________________________________________//__UK_|---HEAVY---|_UK__\\---0


_c pushBack 'CUP_B_FV432_Bulldog_GB_W_RWS';
_i pushBack [localize "STR_WF_UK_H1",'',1300,_heavy_buildtime,-2,_uk_level_0,2,0,'LEVEL 0',[]];
_c pushBack 'UK3CB_BAF_FV432_Mk3_GPMG_Green';
_i pushBack [localize "STR_WF_UK_H2",'',1100,_heavy_buildtime,-2,_uk_level_0,2,0,'LEVEL 0',[]];


//____________________________________________________________________________________________________//__UK_|---HEAVY---|_UK__\\---1


_c pushBack 'cwr3_b_uk_fv510';
_i pushBack [localize "STR_WF_UK_H3",'',2500,_heavy_buildtime,-2,_uk_level_1,2,0,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uk_fv107';
_i pushBack [localize "STR_WF_UK_H4",'',2350,_heavy_buildtime,-2,_uk_level_1,2,0,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uk_fv101';
_i pushBack [localize "STR_WF_UK_H5",'',3200,_heavy_buildtime,-2,_uk_level_1,2,0,'LEVEL 1',[]];


//____________________________________________________________________________________________________//__UK_|---HEAVY---|_UK__\\---2


_c pushBack 'CUP_B_MCV80_GB_W';
_i pushBack [localize "STR_WF_UK_H6",'',2700,_heavy_buildtime,-2,_uk_level_2,2,0,'LEVEL 2',[]];
_c pushBack 'cwr3_b_uk_fv4201';
_i pushBack [localize "STR_WF_UK_H7",'',4200,_heavy_buildtime,-2,_uk_level_2,2,0,'LEVEL 2',[]];


//____________________________________________________________________________________________________//__UK_|---HEAVY---|_UK__\\---3


_c pushBack 'CUP_B_M270_HE_BAF_WOOD';
_i pushBack [localize "STR_WF_UK_H8",'',7850,_heavy_buildtime,-2,_uk_level_3,2,0,'LEVEL 3',[]];//---ARTY
_c pushBack 'CUP_B_MCV80_GB_W_SLAT';
_i pushBack [localize "STR_WF_UK_H9",'',2850,_heavy_buildtime,-2,_uk_level_3,2,0,'LEVEL 3',[]];
_c pushBack 'cwr3_b_uk_fv4030';
_i pushBack [localize "STR_WF_UK_H10",'',4575,_heavy_buildtime,-2,_uk_level_3,2,0,'LEVEL 3',[]];
_c pushBack 'CUP_B_FV510_GB_W';
_i pushBack [localize "STR_WF_UK_H11",'',2975,_heavy_buildtime,-2,_uk_level_3,2,0,'LEVEL 3',[]];


//____________________________________________________________________________________________________//__UK_|---HEAVY---|_UK__\\---4


_c pushBack 'CUP_B_Challenger2_2CW_BAF';
_i pushBack [localize "STR_WF_UK_H12",'',6700,_heavy_buildtime,-2,_uk_level_4,2,0,'LEVEL 4',[]];
_c pushBack 'CUP_B_FV510_GB_W_SLAT';
_i pushBack [localize "STR_WF_UK_H13",'',3400,_heavy_buildtime,-2,_uk_level_4,2,0,'LEVEL 4',[]];


//__________________________________________________________________________________________________________________________________


//____________________________________________________________________________________________________//__US_|---HEAVY---|_US__\\---0


_c pushBack 'CUP_B_AAV_USMC';
_i pushBack [localize "STR_WF_US_H1",'',1300,_heavy_buildtime,-2,_us_level_0,2,0,'LEVEL 0',[]];


//____________________________________________________________________________________________________//__US_|---HEAVY---|_US__\\---1


_c pushBack 'CUP_B_M7Bradley_USA_W';
_i pushBack [localize "STR_WF_US_H2",'',2300,_heavy_buildtime,-2,_us_level_1,2,0,'LEVEL 1',[]];
_c pushBack 'cwr3_b_fia_m41a1';
_i pushBack [localize "STR_WF_US_H3",'',2400,_heavy_buildtime,-2,_us_level_1,2,0,'LEVEL 1',[]];
_c pushBack 'CUP_B_M60A3_USMC';
_i pushBack [localize "STR_WF_US_H4",'',3600,_heavy_buildtime,-2,_us_level_1,2,0,'LEVEL 1',[]];


//____________________________________________________________________________________________________//__US_|---HEAVY---|_US__\\---2


_c pushBack 'CUP_B_M2Bradley_USA_W';
_i pushBack [localize "STR_WF_US_H5",'',3100,_heavy_buildtime,-2,_us_level_2,2,0,'LEVEL 2',[]];
_c pushBack 'cwr3_b_m163';
_i pushBack [localize "STR_WF_US_H6",'',2900,_heavy_buildtime,-2,_us_level_2,2,0,'LEVEL 2',[]];
_c pushBack 'cwr3_b_m1';
_i pushBack [localize "STR_WF_US_H7",'',4200,_heavy_buildtime,-2,_us_level_2,2,0,'LEVEL 2',[]];


//____________________________________________________________________________________________________//__US_|---HEAVY---|_US__\\---3


_c pushBack 'CUP_B_M270_HE_USMC';
_i pushBack [localize "STR_WF_US_H8",'',7850,_heavy_buildtime,-2,_us_level_3,2,0,'LEVEL 3',[]];//---ARTY
_c pushBack 'CUP_B_M1A1FEP_Woodland_USMC';
_i pushBack [localize "STR_WF_US_H9",'',5400,_heavy_buildtime,-2,_us_level_3,2,0,'LEVEL 3',[]];
_c pushBack 'CUP_B_M1A1SA_Woodland_US_Army';
_i pushBack [localize "STR_WF_US_H10",'',5400,_heavy_buildtime,-2,_us_level_3,2,0,'LEVEL 3',[]];
_c pushBack 'CUP_B_M60A3_TTS_USMC';
_i pushBack [localize "STR_WF_US_H11",'',4100,_heavy_buildtime,-2,_us_level_3,2,0,'LEVEL 3',[]];
_c pushBack 'CUP_B_M2A3Bradley_USA_W';
_i pushBack [localize "STR_WF_US_H12",'',3600,_heavy_buildtime,-2,_us_level_3,2,0,'LEVEL 3',[]];


//____________________________________________________________________________________________________//__US_|---HEAVY---|_US__\\---4


_c pushBack 'CUP_B_M1A1EP_TUSK_Woodland_USMC';
_i pushBack [localize "STR_WF_US_H13",'',6200,_heavy_buildtime,-2,_us_level_4,2,0,'LEVEL 4',[]];
_c pushBack 'CUP_B_M1A2SEP_TUSK_II_Woodland_US_Army';
_i pushBack [localize "STR_WF_US_H14",'',6900,_heavy_buildtime,-2,_us_level_4,2,0,'LEVEL 4',[]];
_c pushBack 'CUP_B_M6LineBacker_USA_W';
_i pushBack [localize "STR_WF_US_H15",'',4300,_heavy_buildtime,-2,_us_level_4,2,0,'LEVEL 4',[]];
//__________________________________________________________________________________________________________________________________
//__________________________________________________________________________________________________________________________________
//__________________________________________________________________________________________________________________________________

_air_buildtime= 60;
//__________________________________________________________________________________________________________________________________



//____________________________________________________________________________________________________//__UK_|---AIR---|_UK__\\---0


_c pushBack 'CUP_B_AW159_Unarmed_RN_Grey';
_i pushBack [localize "STR_WF_UK_A1",'',6200,_air_buildtime,-2,_uk_level_0,3,0,'LEVEL 0',[]];


//____________________________________________________________________________________________________//__UK_|---AIR---|_UK__\\---1


_c pushBack 'cwr3_b_camel';
_i pushBack [localize "STR_WF_UK_A2",'',4100,_air_buildtime,-2,_uk_level_1,3,0,'LEVEL 1',[]];
_c pushBack 'CUP_B_C130J_GB';
_i pushBack [localize "STR_WF_UK_A3",'',8075,_air_buildtime,-2,_uk_level_1,3,0,'LEVEL 1',[]];
_c pushBack 'UK3CB_BAF_Merlin_HC3_24';
_i pushBack [localize "STR_WF_UK_A4",'',8350,_air_buildtime,-2,_uk_level_1,3,0,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uk_hc1';
_i pushBack [localize "STR_WF_UK_A5",'',8575,_air_buildtime,-2,_uk_level_1,3,0,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uk_puma_hc1';
_i pushBack [localize "STR_WF_UK_A6",'',8200,_air_buildtime,-2,_uk_level_1,3,0,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uk_lynx_ah7_transport';
_i pushBack [localize "STR_WF_UK_A7",'',7650,_air_buildtime,-2,_uk_level_1,3,0,'LEVEL 1',[]];


//____________________________________________________________________________________________________//__UK_|---AIR---|_UK__\\---2


_c pushBack 'UK3CB_BAF_Merlin_HC4_CSAR';
_i pushBack [localize "STR_WF_UK_A8",'',9300,_air_buildtime,-2,_uk_level_2,3,0,'LEVEL 2',[]];
_c pushBack 'cwr3_b_uh60_mev';
_i pushBack [localize "STR_WF_UK_A9",'',10500,_air_buildtime,-2,_uk_level_2,3,0,'LEVEL 2',[]];
_c pushBack 'CUP_B_AW159_GB';
_i pushBack [localize "STR_WF_UK_A10",'',12100,_air_buildtime,-2,_uk_level_2,3,0,'LEVEL 2',[]];
//MODBUG F4 need 1 on -2 position for fix manning
_c pushBack 'cwr3_b_uk_F4M';
_i pushBack [localize "STR_WF_UK_A11",'',23050,_air_buildtime,1,_uk_level_2,3,0,'LEVEL 2',[]];


//____________________________________________________________________________________________________//__UK_|---AIR---|_UK__\\---3


_c pushBack 'cwr3_b_uk_lynx_ah7_tow';
_i pushBack [localize "STR_WF_UK_A12",'',28000,_air_buildtime,-2,_uk_level_3,3,0,'LEVEL 3',[]];
_c pushBack 'UK3CB_BAF_Wildcat_AH1_6_Generic';
_i pushBack [localize "STR_WF_UK_A13",'',26300,_air_buildtime,-2,_uk_level_3,3,0,'LEVEL 3',[]];
_c pushBack 'Tornado_AWS_camo_uk';
_i pushBack [localize "STR_WF_UK_A14",'',31075,_air_buildtime,-2,_uk_level_3,3,0,'LEVEL 3',[]];


_c pushBack 'UK3CB_BAF_Apache_AH1_CAS';
_i pushBack [localize "STR_WF_UK_A15",'',42050,_air_buildtime,-2,_uk_level_3,3,0,'LEVEL 3',[]];


//____________________________________________________________________________________________________//__UK_|---AIR---|_UK__\\---4


_c pushBack 'UK3CB_BAF_Wildcat_AH1_8_Generic';
_i pushBack [localize "STR_WF_UK_A16",'',27350,_air_buildtime,-2,_uk_level_4,3,0,'LEVEL 4',[]];
_c pushBack 'CUP_B_AH1_DL_BAF';
_i pushBack [localize "STR_WF_UK_A17",'',39900,_air_buildtime,-2,_uk_level_4,3,0,'LEVEL 4',[]];

_c pushBack 'FIR_AV8B_GR7A_Lucy';
_i pushBack [localize "STR_WF_UK_A18",'',24000,_air_buildtime,-2,_uk_level_4,3,0,'LEVEL 4',[]];

_c pushBack 'cwr3_b_frs1';
_i pushBack [localize "STR_WF_UK_A19",'',35000,_air_buildtime,-2,_uk_level_4,3,0,'LEVEL 4',[]];
//_c pushBack 'FMX_AV8B2_GR9_SQN3_A_UK';
//_i pushBack ['','',36075,_air_buildtime,-2,_uk_level_4,3,0,'LEVEL 4',[]];
_c pushBack 'CUP_B_GR9_DYN_GB';
_i pushBack [localize "STR_WF_UK_A20",'',36550,_air_buildtime,-2,_uk_level_4,3,0,'LEVEL 4',[]];
//_c pushBack 'EAWS_EF2000_rafhist_CAP';
//_i pushBack ['','',38300,_air_buildtime,-2,_uk_level_4,3,0,'LEVEL 4',[]];


//____________________________________________________________________________________________________//__UK_|---AIR---|_UK__\\---5


//_c pushBack 'UK3CB_BAF_Apache_AH1_Generic';
//_i pushBack ['','',44050,_air_buildtime,-2,_uk_level_5,3,0,'LEVEL 5',[]];

_c pushBack 'UK3CB_BAF_Apache_AH1_JS';
_i pushBack [localize "STR_WF_UK_A21",'',54050,_air_buildtime,-2,_uk_level_5,3,0,'LEVEL 5',[]];


_c pushBack 'UK3CB_BAF_MQ9_Reaper_Generic';
_i pushBack [localize "STR_WF_UK_A22",'',36750,_air_buildtime,-1,_uk_level_5,3,0,'LEVEL 5',[]];
_c pushBack 'FIR_F35B_RAF01';
_i pushBack [localize "STR_WF_UK_A23",'',58500,_air_buildtime,-2,_uk_level_5,3,0,'LEVEL 5',[]];
_c pushBack 'CUP_B_F35B_BAF';
_i pushBack [localize "STR_WF_UK_A24",'',53000,_air_buildtime,-2,_uk_level_5,3,0,'LEVEL 5',[]];
_c pushBack 'CUP_B_F35B_Stealth_BAF';
_i pushBack [localize "STR_WF_UK_A25",'',50000,_air_buildtime,-2,_uk_level_5,3,0,'LEVEL 5',[]];


//__________________________________________________________________________________________________________________________________


//____________________________________________________________________________________________________//__US_|---AIR---|_US__\\---0


_c pushBack 'cwr3_b_mh6j';
_i pushBack [localize "STR_WF_US_A1",'',5300,_air_buildtime,-2,_us_level_0,3,0,'LEVEL 0',[]];


//____________________________________________________________________________________________________//__US_|---AIR---|_US__\\---1


_c pushBack 'CUP_B_CESSNA_T41_UNARMED_AIRFORCE_USA';
_i pushBack [localize "STR_WF_US_A2",'',4500,_air_buildtime,-2,_us_level_1,3,0,'LEVEL 1',[]];
_c pushBack 'CUP_B_C130J_USMC';
_i pushBack [localize "STR_WF_US_A3",'',8075,_air_buildtime,-2,_us_level_1,3,0,'LEVEL 1',[]];
_c pushBack 'CUP_B_MV22_USMC';
_i pushBack [localize "STR_WF_US_A4",'',12300,_air_buildtime,-2,_us_level_1,3,0,'LEVEL 1',[]];
_c pushBack 'CUP_B_CH53E_USMC';
_i pushBack [localize "STR_WF_US_A5",'',8575,_air_buildtime,-2,_us_level_1,3,0,'LEVEL 1',[]];
_c pushBack 'cwr3_b_ch47';
_i pushBack [localize "STR_WF_US_A6",'',8300,_air_buildtime,-2,_us_level_1,3,0,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uh60';
_i pushBack [localize "STR_WF_US_A7",'',9575,_air_buildtime,-2,_us_level_1,3,0,'LEVEL 1',[]];


//____________________________________________________________________________________________________//__US_|---AIR---|_US__\\---2


_c pushBack 'CUP_B_CESSNA_T41_ARMED_USA';
_i pushBack [localize "STR_WF_US_A8",'',9800,_air_buildtime,-2,_us_level_2,3,0,'LEVEL 2',[]];
_c pushBack 'CUP_B_UH1Y_MEV_USMC';
_i pushBack [localize "STR_WF_US_A9",'',9750,_air_buildtime,-2,_us_level_2,3,0,'LEVEL 2',[]];
_c pushBack 'cwr3_b_ah6j';
_i pushBack [localize "STR_WF_US_A10",'',8550,_air_buildtime,-2,_us_level_2,3,0,'LEVEL 2',[]];
_c pushBack 'CUP_B_MH60L_DAP_4x_USN';
_i pushBack [localize "STR_WF_US_A11",'',11775,_air_buildtime,-2,_us_level_2,3,0,'LEVEL 2',[]];
_c pushBack 'CUP_B_UH1Y_Gunship_Dynamic_USMC';
_i pushBack [localize "STR_WF_US_A12",'',12575,_air_buildtime,-2,_us_level_2,3,0,'LEVEL 2',[]];
//MODBUG F4 need 1 on -2 position for fix manning
_c pushBack 'cwr3_b_f4e';
_i pushBack [localize "STR_WF_US_A13",'',23050,_air_buildtime,1,_us_level_2,3,0,'LEVEL 2',[]];


//____________________________________________________________________________________________________//__US_|---AIR---|_US__\\---3


_c pushBack 'cwr3_b_ah1f';
_i pushBack [localize "STR_WF_US_A14",'',25300,_air_buildtime,-2,_us_level_3,3,0,'LEVEL 3',[]];
_c pushBack 'cwr3_b_kiowa_dyn';
_i pushBack [localize "STR_WF_US_A15",'',23575,_air_buildtime,-2,_us_level_3,3,0,'LEVEL 3',[]];
_c pushBack 'FIR_F14A_NSAWC';
_i pushBack [localize "STR_WF_US_A16",'',28900,_air_buildtime,-2,_us_level_3,3,0,'LEVEL 3',[]];

_c pushBack 'cwr3_b_ah64';
_i pushBack [localize "STR_WF_US_A17",'',38700,_air_buildtime,-2,_us_level_3,3,0,'LEVEL 3',[]];



//_c pushBack 'CUP_B_AH64_DL_USA';
//_i pushBack ['','',44500,_air_buildtime,-2,_us_level_3,3,0,'LEVEL 3',[]];


//____________________________________________________________________________________________________//__US_|---AIR---|_US__\\---4


_c pushBack 'CUP_B_AH64_DL_USA';
_i pushBack [localize "STR_WF_US_A18",'',47500,_air_buildtime,-2,_us_level_4,3,0,'LEVEL 4',[]];
_c pushBack 'FIR_F15A';
_i pushBack [localize "STR_WF_US_A19",'',35300,_air_buildtime,-2,_us_level_4,3,0,'LEVEL 4',[]];
_c pushBack 'CUP_B_AV8B_DYN_USMC';
_i pushBack [localize "STR_WF_US_A20",'',39500,_air_buildtime,-2,_us_level_4,3,0,'LEVEL 4',[]];
_c pushBack 'CUP_B_A10_DYN_USA';
_i pushBack [localize "STR_WF_US_A21",'',37350,_air_buildtime,-2,_us_level_4,3,0,'LEVEL 4',[]];
_c pushBack 'cwr3_b_f16c';
_i pushBack [localize "STR_WF_US_A22",'',36000,_air_buildtime,-2,_us_level_4,3,0,'LEVEL 4',[]];
_c pushBack 'EA18G_141CAG';
_i pushBack [localize "STR_WF_US_A23",'',30100,_air_buildtime,-2,_us_level_4,3,0,'LEVEL 4',[]];

_c pushBack 'CUP_B_AH6X_USA';//UAV
_i pushBack [localize "STR_WF_US_A24",'',21450,_air_buildtime,-1,_us_level_4,3,0,'LEVEL 4',[]];


//____________________________________________________________________________________________________//__US_|---AIR---|_US__\\---5

_c pushBack 'FIR_AV8B';
_i pushBack [localize "STR_WF_US_A25",'',48075,_air_buildtime,-2,_us_level_4,3,0,'LEVEL 5',[]];

_c pushBack 'CUP_B_AH1Z_Dynamic_USMC';
_i pushBack [localize "STR_WF_US_A26",'',42150,_air_buildtime,-2,_us_level_5,3,0,'LEVEL 5',[]];
_c pushBack 'CUP_B_AH64D_DL_USA';
_i pushBack [localize "STR_WF_US_A27",'',56375,_air_buildtime,-2,_us_level_5,3,0,'LEVEL 5',[]];
_c pushBack 'CUP_B_USMC_DYN_MQ9';
_i pushBack [localize "STR_WF_US_A28",'',34000,_air_buildtime,-1,_us_level_5,3,0,'LEVEL 5',[]];
_c pushBack 'FIR_F22_FF';
_i pushBack [localize "STR_WF_US_A29",'',48700,_air_buildtime,-2,_us_level_5,3,0,'LEVEL 5',[]];
_c pushBack 'FIR_F23A_Black';
_i pushBack [localize "STR_WF_US_A30",'',49975,_air_buildtime,-2,_us_level_5,3,0,'LEVEL 5',[]];
_c pushBack 'CUP_B_F35B_USMC';
_i pushBack [localize "STR_WF_US_A31",'',53000,_air_buildtime,-2,_us_level_5,3,0,'LEVEL 5',[]];
_c pushBack 'CUP_B_F35B_Stealth_USMC';
_i pushBack [localize "STR_WF_US_A32",'',50000,_air_buildtime,-2,_us_level_5,3,0,'LEVEL 5',[]];
_c pushBack 'FIR_F35B_DarkGrey';
_i pushBack [localize "STR_WF_US_A33",'',58500,_air_buildtime,-2,_us_level_5,3,0,'LEVEL 5',[]];

//__________________________________________________________________________________________________________________________________
//__________________________________________________________________________________________________________________________________
//__________________________________________________________________________________________________________________________________


//DEFENSES

if (player in _UKContainer) then	{
//level 0
_c = _c + ['cwr3_b_uk_searchlight'];	
_i = _i + [[localize "STR_WF_UK_CD1",'',20,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['CUP_B_SearchLight_static_BAF_DDPM'];	
_i = _i + [[localize "STR_WF_UK_CD2",'',25,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['cwr3_b_uk_l7a2_low'];	
_i = _i + [[localize "STR_WF_UK_CD3",'',75,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['cwr3_b_uk_l111a1_low'];
_i = _i + [[localize "STR_WF_UK_CD4",'',110,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['cwr3_b_uk_l111a1_high'];	
_i = _i + [[localize "STR_WF_UK_CD5",'',125,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['CUP_B_L111A1_MiniTripod_BAF_WDL'];	
_i = _i + [[localize "STR_WF_UK_CD6",'',165,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['CUP_B_L111A1_BAF_DDPM'];	
_i = _i + [[localize "STR_WF_UK_CD7",'',180,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['CUP_B_L134A1_TriPod_BAF_DDPM'];	
_i = _i + [[localize "STR_WF_UK_CD8",'',260,0,1,0,'Defense',0,'whatever',[]]];
} else {
_c = _c + ['cwr3_b_searchlight'];	//not listed in coin anymore because listed for sell in core_civ.sqf,whatever 1 lightcolor is ok too
_i = _i + [['','',20,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['CUP_B_SearchLight_static_USMC'];	
_i = _i + [[localize "STR_WF_US_CD1",'',25,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['CUP_B_M2StaticMG_MiniTripod_USMC'];	
_i = _i + [[localize "STR_WF_US_CD2",'',110,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['CUP_B_M2StaticMG_USMC'];
_i = _i + [[localize "STR_WF_US_CD3",'',125,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['CUP_B_MK19_TriPod_USMC'];	
_i = _i + [[localize "STR_WF_US_CD4",'',205,0,1,0,'Defense',0,'whatever',[]]];
};
if (player in _UKContainer) then	{
_c = _c + ['cwr3_b_searchlight'];	
_i = _i + [['','',20,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['CUP_B_SearchLight_static_USMC'];	
_i = _i + [[localize "STR_WF_US_CD1",'',25,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['CUP_B_M2StaticMG_MiniTripod_USMC'];	
_i = _i + [[localize "STR_WF_US_CD2",'',110,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['CUP_B_M2StaticMG_USMC'];
_i = _i + [[localize "STR_WF_US_CD3",'',125,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['CUP_B_MK19_TriPod_USMC'];	
_i = _i + [[localize "STR_WF_US_CD4",'',205,0,1,9,'Bountydummy',0,'whatever',[]]];
} else {
_c = _c + ['cwr3_b_uk_searchlight'];	
_i = _i + [[localize "STR_WF_UK_CD1",'',20,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['CUP_B_SearchLight_static_BAF_DDPM'];	
_i = _i + [[localize "STR_WF_UK_CD2",'',25,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['cwr3_b_uk_l7a2_low'];	
_i = _i + [[localize "STR_WF_UK_CD3",'',75,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['cwr3_b_uk_l111a1_low'];
_i = _i + [[localize "STR_WF_UK_CD4",'',110,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['cwr3_b_uk_l111a1_high'];	
_i = _i + [[localize "STR_WF_UK_CD5",'',125,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['CUP_B_L111A1_MiniTripod_BAF_WDL'];	
_i = _i + [[localize "STR_WF_UK_CD6",'',165,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['CUP_B_L111A1_BAF_DDPM'];	
_i = _i + [[localize "STR_WF_UK_CD7",'',180,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['CUP_B_L134A1_TriPod_BAF_DDPM'];	
_i = _i + [[localize "STR_WF_UK_CD8",'',260,0,1,9,'Bountydummy',0,'whatever',[]]];
};

//level 1
if (player in _UKContainer) then	{
_c = _c + ['CUP_B_TOW2_TriPod_USMC'];	_i = _i + [[localize "STR_WF_UK_CD9",'',750,0,1,0,'Defense60',0,'whatever',[]]];
_c = _c + ['cwr3_b_uk_javelin_lml'];	_i = _i + [[localize "STR_WF_UK_CD10",'',1200,0,1,0,'Defense60',0,'whatever',[]]];
_c = _c + ['CUP_B_L16A2_BAF_DDPM'];	_i = _i + [[localize "STR_WF_UK_CD11",'',2000,0,1,0,'Defense60',0,'whatever',[]]];
_c = _c + ['cwr3_b_uk_l118'];	_i = _i + [[localize "STR_WF_UK_CD12",'',6350,0,1,0,'Defense60',0,'whatever',[]]];
} else {
_c = _c + ['CUP_B_TOW_TriPod_USMC'];	_i = _i + [[localize "STR_WF_US_CD5",'',750,0,1,0,'Defense60',0,'whatever',[]]];
_c = _c + ['CUP_B_Stinger_AA_pod_Base_USMC'];	_i = _i + [[localize "STR_WF_US_CD6",'',1350,0,1,0,'Defense60',0,'whatever',[]]];
_c = _c + ['CUP_B_M252_USMC'];	_i = _i + [[localize "STR_WF_US_CD7",'',2000,0,1,0,'Defense60',0,'whatever',[]]];
_c = _c + ['pook_M777'];	_i = _i + [[localize "STR_WF_US_CD8",'',7800,0,1,0,'Defense60',0,'whatever',[]]];
};
if (player in _UKContainer) then	{
_c = _c + ['CUP_B_TOW_TriPod_USMC'];	_i = _i + [[localize "STR_WF_US_CD5",'',750,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['CUP_B_Stinger_AA_pod_Base_USMC'];	_i = _i + [[localize "STR_WF_US_CD6",'',1350,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['CUP_B_M252_USMC'];	_i = _i + [[localize "STR_WF_US_CD7",'',2000,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['pook_M777'];	_i = _i + [[localize "STR_WF_US_CD8",'',7800,0,1,9,'Bountydummy',0,'whatever',[]]];
} else {
_c = _c + ['CUP_B_TOW2_TriPod_USMC'];	_i = _i + [[localize "STR_WF_UK_CD9",'',750,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['cwr3_b_uk_javelin_lml'];	_i = _i + [[localize "STR_WF_UK_CD10",'',1200,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['CUP_B_L16A2_BAF_DDPM'];	_i = _i + [[localize "STR_WF_UK_CD11",'',2000,0,1,9,'Bountydummy',0,'whatever',[]]];
_c = _c + ['cwr3_b_uk_l118'];	_i = _i + [[localize "STR_WF_UK_CD12",'',6350,0,1,9,'Bountydummy',0,'whatever',[]]];
};
//level 2

if (player in _UKContainer) then	{
_c = _c + ['CUP_B_M134_A_GB'];	_i = _i + [[localize "STR_WF_UK_CD13",'',3200,0,1,0,'Defense80',0,'whatever',[]]];
} else {
_c = _c + ['CUP_B_M134_A_US_ARMY'];	_i = _i + [[localize "STR_WF_US_CD9",'',3200,0,1,0,'Defense80',0,'whatever',[]]];
};

//BLU
_c = _c + ['B_Static_Designator_01_F'];_i = _i + [[localize "STR_WF_BLU_CD1",'',750,0,1,0,'Defense80',0,'whatever',[]]];
_c = _c + ['B_Radar_System_01_F'];	_i = _i + [[localize "STR_WF_BLU_CD2",'',3800,0,1,0,'Defense80',0,'whatever',[]]];
_c = _c + ['B_SAM_System_03_F'];	_i = _i + [[localize "STR_WF_BLU_CD3",'',8750,0,1,0,'Defense80',0,'whatever',[]]];
_c = _c + ['B_AAA_System_01_F'];	_i = _i + [[localize "STR_WF_BLU_CD4",'',7300,0,1,0,'Defense80',0,'whatever',[]]];



//AMMOBOX 

if (player in _UKContainer) then	{
_c pushBack 'CUP_BOX_GB_WpsSpecial_F';
_i pushBack [localize "STR_WF_ALL_CA1",'',8500,0,0,0,'Ammo',0,'whatever',[]];
} else {
_c pushBack 'CUP_BOX_US_ARMY_WpsSpecial_F';
_i pushBack [localize "STR_WF_ALL_CA1",'',8500,0,0,0,'Ammo',0,'whatever',[]];
};
if (player in _UKContainer) then	{
_c pushBack 'CUP_BOX_US_ARMY_WpsSpecial_F';
_i pushBack [localize "STR_WF_ALL_CA1",'',8500,0,0,9,'Ammo',0,'whatever',[]];
} else {
_c pushBack 'CUP_BOX_GB_WpsSpecial_F';
_i pushBack [localize "STR_WF_ALL_CA1",'',8500,0,0,9,'Ammo',0,'whatever',[]];
};





//BOTH SIDES SIMILAR

//BACKBACKSELLSTUFF STATICS,need listed for sell option

_c = _c + ['cwr3_b_m252'];	_i = _i + [['','',1000,0,1,0,'nowhere',0,'whatever',[]]];
_c = _c + ['CUP_I_M252_AAF'];	_i = _i + [['','',1000,0,1,0,'nowhere',0,'whatever',[]]];
_c = _c + ['cwr3_b_mk19'];	_i = _i + [['','',205,0,1,0,'nowhere',0,'whatever',[]]];


_c = _c + ['CUP_I_MK19_TriPod_AAF'];	_i = _i + [['','',205,0,1,0,'nowhere',0,'whatever',[]]];
_c = _c + ['cwr3_b_m2hb_high'];	_i = _i + [['','',100,0,1,0,'nowhere',0,'whatever',[]]];
_c = _c + ['cwr3_b_m2hb_low'];	_i = _i + [['','',100,0,1,0,'nowhere',0,'whatever',[]]];
_c = _c + ['CUP_I_M2StaticMG_MiniTripod_AAF'];	_i = _i + [['','',100,0,1,0,'nowhere',0,'whatever',[]]];
_c = _c + ['CUP_I_M2StaticMG_AAF'];	_i = _i + [['','',100,0,1,0,'nowhere',0,'whatever',[]]];

_c = _c + ['CUP_I_L16A2_AAF'];	_i = _i + [['','',1000,0,1,0,'nowhere',0,'whatever',[]]];

_c = _c + ['CUP_I_TOW2_TriPod_AAF'];	_i = _i + [['','',750,0,1,0,'nowhere',0,'whatever',[]]];

_c = _c + ['CUP_I_L134A1_TriPod_AAF'];	_i = _i + [['','',260,0,1,0,'nowhere',0,'whatever',[]]];
//_c = _c + ['cwr3_b_uk_l111a1_high'];	_i = _i + [['','',110,0,1,0,'nowhere',0,'whatever',[]]];
//_c = _c + ['cwr3_b_uk_l111a1_low'];	_i = _i + [['','',110,0,1,0,'nowhere',0,'whatever',[]]];
_c = _c + ['CUP_I_L111A1_MiniTripod_AAF'];	_i = _i + [['','',110,0,1,0,'nowhere',0,'whatever',[]]];
_c = _c + ['CUP_I_L111A1_AAF'];	_i = _i + [['','',110,0,1,0,'nowhere',0,'whatever',[]]];

_c = _c + ['cwr3_b_tow'];	_i = _i + [['','',750,0,1,0,'nowhere',0,'whatever',[]]];
_c = _c + ['CUP_I_TOW_TriPod_AAF'];	_i = _i + [['','',750,0,1,0,'nowhere',0,'whatever',[]]];


//_c = _c + ['cwr3_b_searchlight'];	_i = _i + [['','',10,0,1,0,'nowhere',0,'whatever',[]]];
//END SELLPART






//forti

_c = _c + ['Fort_Nest'];	_i = _i + [[localize "STR_WF_ALL_CF1",'',115,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['TK_WarfareBBarrier10xTall_EP1'];	_i = _i + [[localize "STR_WF_ALL_CF2",'',275,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['TK_WarfareBBarrier5x_EP1'];	_i = _i + [[localize "STR_WF_ALL_CF3",'',175,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_HBarrier_large'];	_i = _i + [[localize "STR_WF_ALL_CF4",'',220,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_HBarrier5'];	_i = _i + [[localize "STR_WF_ALL_CF5",'',150,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_HBarrier3'];	_i = _i + [[localize "STR_WF_ALL_CF6",'',130,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_HBarrier1'];	_i = _i + [[localize "STR_WF_ALL_CF7",'',100,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['cwr3_bagfence_corner'];	_i = _i + [[localize "STR_WF_ALL_CF8",'',80,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['cwr3_bagfence'];	_i = _i + [[localize "STR_WF_ALL_CF9",'',50,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['pook_Land_fort_rampart_DES'];	_i = _i + [[localize "STR_WF_ALL_CF10",'',120,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_fort_artillery_nest_EP1'];	_i = _i + [[localize "STR_WF_ALL_CF11",'',235,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['pook_Land_fort_artillery_nest_DES'];	_i = _i + [[localize "STR_WF_ALL_CF12",'',255,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Hhedgehog_concreteBig'];	_i = _i + [[localize "STR_WF_ALL_CF13",'',435,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['land_cwr3_vez'];	_i = _i + [[localize "STR_WF_ALL_CF14",'',275,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['land_cwr3_lampa_sidl_3'];	_i = _i + [[localize "STR_WF_ALL_CF15",'',75,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Concrete_Wall_EP1'];	_i = _i + [[localize "STR_WF_ALL_CF16",'',95,0,1,0,'Fortification',0,'USA',[]]];


if ((missionNamespace getVariable "cti_C_BUNKER_SWITCH") == 1) then {
//BUNKER
_c = _c + ['Land_Target_Concrete_Support_01_F'];	
_i = _i + [[localize "STR_WF_ALL_CF17",'',1000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_01_blocks_1_F'];	
_i = _i + [[localize "STR_WF_ALL_CF18",'',1000,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_Bunker_01_blocks_3_F'];	
_i = _i + [[localize "STR_WF_ALL_CF19",'',2500,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_PillboxWall_01_3m_round_F'];	
_i = _i + [[localize "STR_WF_ALL_CF20",'',3000,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_CncBarrierMedium4_F'];	
_i = _i + [[localize "STR_WF_ALL_CF21",'',3200,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_PetroglyphWall_02_F'];	
_i = _i + [[localize "STR_WF_ALL_CF22",'',4150,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_i_Garage_V2_F'];	
_i = _i + [[localize "STR_WF_ALL_CF23",'',5000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_PillboxWall_01_6m_round_F'];	
_i = _i + [[localize "STR_WF_ALL_CF24",'',5300,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_CncWall4_F'];	
_i = _i + [[localize "STR_WF_ALL_CF25",'',6700,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Podesta_1_stairs4'];	
_i = _i + [[localize "STR_WF_ALL_CF26",'',7000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Platform_Stairs_30'];	
_i = _i + [[localize "STR_WF_ALL_CF27",'',7900,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Platform_Stairs_20'];	
_i = _i + [[localize "STR_WF_ALL_CF28",'',8200,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_ConcreteRamp'];	
_i = _i + [[localize "STR_WF_ALL_CF29",'',8950,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_ConcreteBlock'];	
_i = _i + [[localize "STR_WF_ALL_CF30",'',9000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Platform_Base'];	
_i = _i + [[localize "STR_WF_ALL_CF31",'',10750,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_BasaltWall_01_d_left_F'];	
_i = _i + [[localize "STR_WF_ALL_CF32",'',10800,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_BasaltWall_01_gate_F'];	
_i = _i + [[localize "STR_WF_ALL_CF33",'',12500,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_PillboxBunker_01_rectangle_F'];	
_i = _i + [[localize "STR_WF_ALL_CF34",'',15750,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_PillboxBunker_01_hex_F'];	
_i = _i + [[localize "STR_WF_ALL_CF35",'',17400,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_Bunker_02_light_right_F'];	
_i = _i + [[localize "STR_WF_ALL_CF36",'',20000,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_Bunker_02_right_F'];	
_i = _i + [[localize "STR_WF_ALL_CF37",'',20000,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_Bunker_02_light_double_F'];	
_i = _i + [[localize "STR_WF_ALL_CF38",'',22000,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_Bunker_02_light_left_F'];	
_i = _i + [[localize "STR_WF_ALL_CF39",'',20000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_02_left_F'];	
_i = _i + [[localize "STR_WF_ALL_CF40",'',20000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_02_double_F'];	
_i = _i + [[localize "STR_WF_ALL_CF41",'',22000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_01_small_F'];	
_i = _i + [[localize "STR_WF_ALL_CF42",'',25250,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Podesta_1_stairs2'];	
_i = _i + [[localize "STR_WF_ALL_CF43",'',28000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_01_big_F'];	
_i = _i + [[localize "STR_WF_ALL_CF44",'',33000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_01_HQ_F'];	
_i = _i + [[localize "STR_WF_ALL_CF45",'',35000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['land_cwr3_ammostore2'];	
_i = _i + [[localize "STR_WF_ALL_CF46",'',35750,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_PillboxBunker_01_big_F'];	
_i = _i + [[localize "STR_WF_ALL_CF47",'',37000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_01_tall_F'];	
_i = _i + [[localize "STR_WF_ALL_CF48",'',42000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['land_cwr3_garaz_bez_tanku'];	
_i = _i + [[localize "STR_WF_ALL_CF49",'',45000,0,1,0,'Fortification',0,'USA',[]]];
};



//Strategic


_c = _c + ['Land_PedestrianCrossing_01_6m_6str_F'];	_i = _i + [[localize "STR_WF_ALL_CS1",'',200,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_HelipadSquare_F'];	_i = _i + [[localize "STR_WF_ALL_CS2",'',200,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_HelipadRescue_F'];	_i = _i + [[localize "STR_WF_ALL_CS3",'',200,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_HelipadCivil_F'];	_i = _i + [[localize "STR_WF_ALL_CS4",'',200,0,1,0,'Strategic',0,'USA',[]]];

_c = _c + ['TK_GUE_WarfareBVehicleServicePoint_Base_EP1'];	_i = _i + [[localize "STR_WF_ALL_CS5",'',5600,0,1,0,'Strategic',0,'USA',[]]];

//minefield scripted in construction_stationarydefense.sqf
_c = _c + ['Sign_Danger'];	_i = _i + [[localize "STR_WF_ALL_CS6",'',5000,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Sign_DangerMines_ACR'];	_i = _i + [[localize "STR_WF_ALL_CS7",'',3800,0,1,0,'Strategic',0,'USA',[]]];

_c = _c + ['land_cwr3_tent1_mash'];	_i = _i + [[localize "STR_WF_ALL_CS8",'',200,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_radar_EP1'];	_i = _i + [[localize "STR_WF_ALL_CS9",'',370,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['CamoNet_wdl_big_F'];	_i = _i + [[localize "STR_WF_ALL_CS10",'',175,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_IRMaskingCover_01_F'];	_i = _i + [[localize "STR_WF_ALL_CS11",'',375,0,1,0,'Strategic',0,'USA',[]]];





//SLOTUNITS LISTED FOR BOUNTY
//US
_c pushBack 'CUP_B_US_Soldier_TL_UCP';
_i pushBack ['','',2000,4,-1,9,0,1,'',[]];
_c pushBack 'CUP_B_US_Soldier_Engineer_UCP';
_i pushBack ['','',2000,4,-1,9,0,1,'',[]];
_c pushBack 'CUP_B_US_Soldier_MG_UCP';
_i pushBack ['','',2000,4,-1,9,0,1,'',[]];
_c pushBack 'CUP_B_US_Medic_UCP';
_i pushBack ['','',2000,5,-1,9,0,1,'',[]];
_c pushBack 'CUP_B_USMC_MARSOC';
_i pushBack ['','',2000,5,-1,9,0,1,'',[]];
//SLOTUNITS LISTED FOR BOUNTY
//UK
_c pushBack 'CUP_B_BAF_Soldier_TeamLeader_MTP';
_i pushBack ['','',2000,4,-1,9,0,1,'',[]];
_c pushBack 'CUP_B_BAF_Soldier_Engineer_MTP';
_i pushBack ['','',2000,4,-1,9,0,1,'',[]];
_c pushBack 'CUP_B_BAF_Soldier_HeavyGunner_MTP';
_i pushBack ['','',2000,4,-1,9,0,1,'',[]];
_c pushBack 'CUP_B_BAF_Soldier_Medic_MTP';
_i pushBack ['','',2000,5,-1,9,0,1,'',[]];
_c pushBack 'CUP_B_BAF_Spotter_MTP';
_i pushBack ['','',2000,5,-1,9,0,1,'',[]];
//SLOTUNITS LISTED FOR BOUNTY




for '_z' from 0 to (count _c)-1 do {
	if (isClass (configFile >> 'CfgVehicles' >> (_c select _z))) then {
		_get = missionNamespace getVariable (_c select _z);
		if (isNil '_get') then {
			if ((_i select _z) select 0 == '') then {(_i select _z) set [0, [_c select _z,'displayName'] Call cti_CO_FNC_GetConfigInfo]};
			if (typeName ((_i select _z) select 4) == 'SCALAR') then {
				if (((_i select _z) select 4) == -2) then {
					_ret = (_c select _z) Call Compile preprocessFile "Common\Functions\Common_GetConfigVehicleCrewSlot.sqf";
					(_i select _z) set [4, _ret select 0];
					(_i select _z) set [9, _ret select 1];
				};
			};
			if (WF_Debug) then {(_i select _z) set [3,1]};
			_p = if ((_c select _z) isKindOf 'Man') then {'portrait'} else {'picture'};
			(_i select _z) set [1, [_c select _z,_p] Call cti_CO_FNC_GetConfigInfo];
			missionNamespace setVariable [_c select _z, _i select _z];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_US: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_US: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];
