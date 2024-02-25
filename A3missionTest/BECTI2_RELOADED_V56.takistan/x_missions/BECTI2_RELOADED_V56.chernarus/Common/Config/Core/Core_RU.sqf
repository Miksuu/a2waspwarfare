/* TKA Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];

//_i ["Sonderezeichnung in Liste","Vermutlich Beschreibungstext",Preis,Buildtime,0für strategisch und forti 1für defense -1 für men -2 für vehicle,Upgradelevel,0=inf und defense |1-3=lf-af,Skill,Registerbezeichnung,?,optionale Camonummer]

//Infantry
//Random Townunits

//SOLDIER
_c pushBack 'CUP_O_INS_Soldier';
_i pushBack [localize "STR_WF_ALL_TAI1",'',350,4,-1,0,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_sla_Soldier';
_i pushBack [localize "STR_WF_ALL_TAI1",'',350,4,-1,0,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_TK_INS_Soldier';
_i pushBack [localize "STR_WF_ALL_TAI1",'',350,4,-1,0,0,1,'HIRE TOWNFIGHTER',[]];

//MEDIC
_c pushBack 'CUP_O_TK_INS_Guerilla_Medic';
_i pushBack [localize "STR_WF_ALL_TAI2",'',550,4,-1,0,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_TK_Medic';
_i pushBack [localize "STR_WF_ALL_TAI2",'',550,4,-1,0,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_INS_Medic';
_i pushBack [localize "STR_WF_ALL_TAI2",'',550,4,-1,0,0,1,'HIRE TOWNFIGHTER',[]];

//LEVEL1 TOWN

//LAT
_c pushBack 'CUP_O_sla_Soldier_LAT';
_i pushBack [localize "STR_WF_ALL_TAI3",'',750,4,-1,1,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_TK_Soldier_LAT';
_i pushBack [localize "STR_WF_ALL_TAI3",'',750,4,-1,1,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_INS_Soldier_LAT';
_i pushBack [localize "STR_WF_ALL_TAI3",'',750,4,-1,1,0,1,'HIRE TOWNFIGHTER',[]];

//MG
_c pushBack 'CUP_O_INS_Soldier_MG';
_i pushBack [localize "STR_WF_ALL_TAI4",'',650,4,-1,1,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_TK_Soldier_MG';
_i pushBack [localize "STR_WF_ALL_TAI4",'',650,4,-1,1,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_TK_INS_Soldier_MG';
_i pushBack [localize "STR_WF_ALL_TAI4",'',650,4,-1,1,0,1,'HIRE TOWNFIGHTER',[]];

//AR
_c pushBack 'CUP_O_sla_Soldier_AR';
_i pushBack [localize "STR_WF_ALL_TAI5",'',550,4,-1,1,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_INS_Soldier_AR';
_i pushBack [localize "STR_WF_ALL_TAI5",'',550,4,-1,1,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_TK_INS_Soldier_AR';
_i pushBack [localize "STR_WF_ALL_TAI5",'',550,4,-1,1,0,1,'HIRE TOWNFIGHTER',[]];

//LEVEL 2 TOWN

//HAT
_c pushBack 'CUP_O_TK_Soldier_AT';
_i pushBack [localize "STR_WF_ALL_TAI6",'',960,4,-1,2,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_INS_Soldier_AT';
_i pushBack [localize "STR_WF_ALL_TAI6",'',960,4,-1,2,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_TK_INS_Soldier_AT';
_i pushBack [localize "STR_WF_ALL_TAI6",'',960,4,-1,2,0,1,'HIRE TOWNFIGHTER',[]];

//LEVEL 3 TOWN

//AA
_c pushBack 'CUP_O_TK_Soldier_AA';
_i pushBack [localize "STR_WF_ALL_TAI7",'',1200,4,-1,3,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_INS_Soldier_AA';
_i pushBack [localize "STR_WF_ALL_TAI7",'',1200,4,-1,3,0,1,'HIRE TOWNFIGHTER',[]];
_c pushBack 'CUP_O_TK_INS_Soldier_AA';
_i pushBack [localize "STR_WF_ALL_TAI7",'',1200,4,-1,3,0,1,'HIRE TOWNFIGHTER',[]];




//level 0 ru

_c pushBack 'cwr3_o_soldier_driver';
_i pushBack [localize "STR_WF_RU_B1",'',75,4,-1,0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_o_soldier_pilot_jet';
_i pushBack [localize "STR_WF_RU_B2",'',80,4,-1,0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_o_soldier_pilot';
_i pushBack [localize "STR_WF_RU_B3",'',90,4,-1,0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_o_soldier_crew';
_i pushBack [localize "STR_WF_RU_B4",'',95,4,-1,0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_o_soldier';
_i pushBack [localize "STR_WF_RU_B5",'',105,4,-1,0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_o_soldier_backpack';
_i pushBack [localize "STR_WF_RU_B6",'',115,4,-1,0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_o_soldier_at_rpg18';
_i pushBack [localize "STR_WF_RU_B7",'',215,4,-1,0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_o_soldier_medic';
_i pushBack [localize "STR_WF_RU_B8",'',130,4,-1,0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_o_soldier_engineer';
_i pushBack [localize "STR_WF_RU_B9",'',450,4,-1,0,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_o_soldier_ar';
_i pushBack [localize "STR_WF_RU_B10",'',125,4,-1,0,0,1,'LEVEL 0',[]];


//level 1 ru

_c pushBack 'cwr3_o_soldier_amg';
_i pushBack [localize "STR_WF_RU_B11",'',110,4,-1,1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_o_soldier_mg';
_i pushBack [localize "STR_WF_RU_B12",'',135,4,-1,1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_o_soldier_marksman';
_i pushBack [localize "STR_WF_RU_B13",'',160,4,-1,1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_o_soldier_spotter';
_i pushBack [localize "STR_WF_RU_B14",'',270,4,-1,1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_o_soldier_sapper';
_i pushBack [localize "STR_WF_RU_B15",'',325,4,-1,1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_o_soldier_sniper';
_i pushBack [localize "STR_WF_RU_B16",'',410,4,-1,1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_o_soldier_at_at4';
_i pushBack [localize "STR_WF_RU_B17",'',430,4,-1,1,0,1,'LEVEL 1',[]];


_c pushBack 'cwr3_o_soldier_aat_at4';
_i pushBack [localize "STR_WF_RU_B18",'',330,4,-1,1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_o_soldier_aa_strela';
_i pushBack [localize "STR_WF_RU_B19",'',600,4,-1,1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_o_soldier_aat_rpg7';
_i pushBack [localize "STR_WF_RU_B20",'',230,4,-1,1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_o_soldier_at_rpg7';
_i pushBack [localize "STR_WF_RU_B21",'',390,4,-1,1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_o_soldier_hg';
_i pushBack [localize "STR_WF_RU_B22",'',370,4,-1,1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_o_officer_night';
_i pushBack [localize "STR_WF_RU_B23",'',200,4,-1,1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_o_soldier_sl';
_i pushBack [localize "STR_WF_RU_B24",'',160,4,-1,1,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_o_soldier_gl';
_i pushBack [localize "STR_WF_RU_B25",'',155,4,-1,1,0,1,'LEVEL 1',[]];


//level 2 ru

_c pushBack 'CUP_O_RU_Pilot_VDV_M_EMR';
_i pushBack [localize "STR_WF_RU_B26",'',80,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_Crew_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B27",'',90,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B28",'',110,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_AR_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B29",'',200,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_LAT_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B30",'',275,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_MG_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B31",'',260,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_GL_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B32",'',195,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_Marksman_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B33",'',255,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_AAT_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B34",'',205,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_AT_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B35",'',390,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_Engineer_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B36",'',305,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B37",'',290,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_AA_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B38",'',690,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_TL_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B39",'',315,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_SL_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B40",'',320,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Spotter_VDV_M_EMR';
_i pushBack [localize "STR_WF_RU_B41",'',435,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Sniper_VDV_M_EMR';
_i pushBack [localize "STR_WF_RU_B42",'',515,4,-1,2,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_O_RU_Soldier_Saiga_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B43",'',100,4,-1,2,0,1,'LEVEL 2',[]];

//REQUIPED WITH HE AMMO(FOR BALANCE DRAGON)
_c pushBack 'CUP_O_RU_Soldier_HAT_EMR';
_i pushBack [localize "STR_WF_RU_B44",'',780,4,-1,2,0,1,'LEVEL 2',[]];


//level 3 ru

_c pushBack 'cwr3_o_spetsnaz_bizon_sd';
_i pushBack [localize "STR_WF_RU_B45",'',555,4,-1,3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_O_TK_Soldier_AKS_Night';
_i pushBack [localize "STR_WF_RU_B46",'',300,4,-1,3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_O_TK_Sniper_SVD_Night';
_i pushBack [localize "STR_WF_RU_B47",'',605,4,-1,3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_O_RUS_SpecOps_Scout';
_i pushBack [localize "STR_WF_RU_B48",'',475,4,-1,3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_O_RUS_SpecOps_Scout_Night';
_i pushBack [localize "STR_WF_RU_B49",'',575,4,-1,3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_O_TK_Sniper_KSVK';
_i pushBack [localize "STR_WF_RU_B50",'',850,4,-1,3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_O_RU_Sniper_KSVK_VDV';
_i pushBack [localize "STR_WF_RU_B51",'',855,4,-1,3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_O_RU_Recon_Marksman_Ratnik_Summer';
_i pushBack [localize "STR_WF_RU_B52",'',670,4,-1,3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_O_RU_Recon_TL_Ratnik_Summer';
_i pushBack [localize "STR_WF_RU_B53",'',690,4,-1,3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_O_RU_Recon_Exp_Ratnik_Summer';
_i pushBack [localize "STR_WF_RU_B54",'',750,4,-1,3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_O_MVD_Soldier_Marksman';
_i pushBack [localize "STR_WF_RU_B55",'',665,4,-1,3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_O_RU_Soldier_AHAT_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B56",'',550,4,-1,3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2';
_i pushBack [localize "STR_WF_RU_B57",'',1075,4,-1,3,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_O_RUS_Saboteur';
_i pushBack [localize "STR_WF_RU_B58",'',580,4,-1,3,0,1,'LEVEL 3',[]];





_light_buildtime=25;

//Light---------------------------------------------------Light
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



//level 0//---------------------------------------------------

_c pushBack'Land_Pod_Heli_Transport_04_medevac_F';
_i pushBack[localize "STR_WF_ALL_L1",'',2050,_light_buildtime,-1,0,1,0,'LEVEL 2',[],1];


_c pushBack 'Land_Device_slingloadable_F';
_i pushBack [localize "STR_WF_ALL_L2",'',54000,_light_buildtime,-1,4,1,0,'LEVEL 4',[]];//ECM POD

//for salvage
_c pushBack 'Land_Device_assembled_F';
_i pushBack ['','',54000,_light_buildtime,-1,4,1,0,'LEVEL 4',[]];//ECM POD 



//___VEHICLE

_c pushBack'cwr3_c_bicycle';
_i pushBack[localize "STR_WF_ALL_L3",'',50,_light_buildtime,-2,0,1,0,'Civilians',[]];



_c pushBack'CUP_O_TT650_CHDKZ';
_i pushBack[localize "STR_WF_RU_L1",'',150,_light_buildtime,-2,0,1,0,'LEVEL 0',[]];

_c pushBack'O_Quadbike_01_F';
_i pushBack[localize "STR_WF_ALL_L4",'',180,_light_buildtime,-2,0,1,0,'LEVEL 0',[]];





_c pushBack 'cwr3_o_uaz452';
_i pushBack [localize "STR_WF_RU_L8",'',160,_light_buildtime,-2,0,1,0,'LEVEL 0',[]];

_c pushBack 'CUP_O_Ural_RU';
_i pushBack [localize "STR_WF_RU_L9",'',315,_light_buildtime,-2,0,1,0,'LEVEL 0',[]];


//LOADVEHICLES

_c pushBack 'pook_MAZ7910_base';
_i pushBack [localize "STR_WF_RU_L2",'',215,_light_buildtime,-2,0,1,0,'LEVEL 0',[]];//LOADER VEHICLE 8 slots (can load all)


_c pushBack 'cwr3_o_fia_ural_empty';
_i pushBack [localize "STR_WF_RU_L3",'',185,_light_buildtime,-2,0,1,0,'LEVEL 0',[]];//LOADER VEHICLE 4 slots 


_c pushBack 'CUP_O_UAZ_Open_RU';
_i pushBack [localize "STR_WF_RU_L4",'',45,_light_buildtime,-2,0,1,0,'LEVEL 0',[]];//LOADER VEHICLE 2 slots


_c pushBack 'CUP_O_Hilux_unarmed_CHDKZ';
_i pushBack [localize "STR_WF_RU_L5",'',170,_light_buildtime,-2,0,1,0,'LEVEL 0',[]];//LOADER VEHICLE 2 slots 

_c pushBack 'CUP_O_Datsun_PK';
_i pushBack [localize "STR_WF_RU_L6",'',195,_light_buildtime,-2,1,1,0,'LEVEL 1',[]];//LOADER VEHICLE 2 slots 


_c pushBack 'cwr3_o_fia_btr40_dshkm';
_i pushBack [localize "STR_WF_RU_L7",'',275,_light_buildtime,-2,1,1,0,'LEVEL 1',[]];//LOADER VEHICLE 2 slots 



//level 1//--------------------------------------------------
_c pushBack 'CUP_O_UAZ_MG_RU';
_i pushBack [localize "STR_WF_RU_L10",'',235,_light_buildtime,-2,1,1,0,'LEVEL 1',[]];

_c pushBack 'CUP_O_UAZ_AGS30_RU';
_i pushBack [localize "STR_WF_RU_L11",'',255,_light_buildtime,-2,1,1,0,'LEVEL 1',[]];

_c pushBack 'cwr3_o_ural_zu23';
_i pushBack [localize "STR_WF_RU_L12",'',300,_light_buildtime,-2,1,1,0,'LEVEL 1',[]];

_c pushBack 'CUP_O_UAZ_SPG9_RU';
_i pushBack [localize "STR_WF_RU_L13",'',345,_light_buildtime,-2,1,1,0,'LEVEL 1',[]];

_c pushBack 'CUP_O_GAZ_Vodnik_PK_RU';
_i pushBack [localize "STR_WF_RU_L14",'',550,_light_buildtime,-2,1,1,0,'LEVEL 1',[]];

_c pushBack 'CUP_O_GAZ_Vodnik_AGS_RU';
_i pushBack [localize "STR_WF_RU_L15",'',595,_light_buildtime,-2,1,1,0,'LEVEL 1',[]];

_c pushBack 'cwr3_o_ural_reammo';
_i pushBack [localize "STR_WF_RU_L16",'',890,_light_buildtime,-2,1,1,0,'LEVEL 1',[]];//ammo

_c pushBack 'cwr3_o_brdm2um';
_i pushBack [localize "STR_WF_RU_L17",'',450,_light_buildtime,-2,1,1,0,'LEVEL 1',[]];

_c pushBack 'BRDM2IMPPKM_OPFOR';
_i pushBack [localize "STR_WF_RU_L18",'',600,_light_buildtime,-2,1,1,0,'LEVEL 1',[]];

//level 2//--------------------------------------------------
_c pushBack 'cwr3_o_uaz_mev';
_i pushBack [localize "STR_WF_RU_L19",'',2100,_light_buildtime,-2,2,1,0,'LEVEL 2',[]];//ambu

_c pushBack 'cwr3_o_uaz452_mev';
_i pushBack [localize "STR_WF_RU_L20",'',2400,_light_buildtime,-2,2,1,0,'LEVEL 2',[]];//ambu

_c pushBack 'CUP_O_Ural_Repair_RU';
_i pushBack [localize "STR_WF_RU_L21",'',2500,_light_buildtime,-2,2,1,0,'LEVEL 2',[]];//rtruck

_c pushBack 'CUP_O_GAZ_Vodnik_KPVT_RU';
_i pushBack [localize "STR_WF_RU_L22",'',775,_light_buildtime,-2,2,1,0,'LEVEL 2',[]];

_c pushBack 'BRDM2IMPDSHK_OPFOR';
_i pushBack [localize "STR_WF_RU_L23",'',700,_light_buildtime,-2,2,1,0,'LEVEL 2',[]];


_c pushBack 'CUP_O_BRDM2_RUS';
_i pushBack [localize "STR_WF_RU_L24",'',850,_light_buildtime,-2,2,1,0,'LEVEL 2',[]];

_c pushBack 'CUP_O_UAZ_METIS_RU';
_i pushBack [localize "STR_WF_RU_L25",'',975,_light_buildtime,-2,2,1,0,'LEVEL 2',[]];

//level 3//--------------------------------------------------
_c pushBack 'BRDM2IMPAT2_OPFOR';
_i pushBack [localize "STR_WF_RU_L26",'',1200,_light_buildtime,-2,3,1,0,'LEVEL 3',[]];

_c pushBack 'BRDM2IMPAT3_OPFOR';
_i pushBack [localize "STR_WF_RU_L27",'',1300,_light_buildtime,-2,3,1,0,'LEVEL 3',[]];

_c pushBack 'CUP_O_GAZ_Vodnik_MedEvac_RU';
_i pushBack [localize "STR_WF_RU_L28",'',3100,_light_buildtime,-2,3,1,0,'LEVEL 3',[]];//ambu

_c pushBack 'CUP_O_UAZ_AA_RU';
_i pushBack [localize "STR_WF_RU_L29",'',1275,_light_buildtime,-2,3,1,0,'LEVEL 3',[]];

_c pushBack 'CUP_O_GAZ_Vodnik_BPPU_RU';
_i pushBack [localize "STR_WF_RU_L30",'',1350,_light_buildtime,-2,3,1,0,'LEVEL 3',[]];

_c pushBack 'pook_BTRMWS_OPFOR';
_i pushBack [localize "STR_WF_RU_L31",'',1090,_light_buildtime,-2,3,1,0,'LEVEL 3',[]];

_c pushBack 'cwr3_o_btr80';
_i pushBack [localize "STR_WF_RU_L32",'',990,_light_buildtime,-2,3,1,0,'LEVEL 3',[]];

_c pushBack 'BRDM2MAGS_OPFOR';
_i pushBack [localize "STR_WF_RU_L33",'',980,_light_buildtime,-2,3,1,0,'LEVEL 3',[]];

_c pushBack 'pook_BTR80MWS_OPFOR';
_i pushBack [localize "STR_WF_RU_L34",'',1170,_light_buildtime,-2,3,1,0,'LEVEL 3',[]];

_c pushBack 'pook_BTR2A42_OPFOR';
_i pushBack [localize "STR_WF_RU_L35",'',1450,_light_buildtime,-2,3,1,0,'LEVEL 3',[]];

_c pushBack 'CUP_O_BM21_RU';
_i pushBack [localize "STR_WF_RU_L36",'',5200,_light_buildtime,-2,3,1,0,'LEVEL 3',[]];//arty
//level 4//--------------------------------------------------
_c pushBack 'pook_96K6_root';
_i pushBack [localize "STR_WF_RU_L37",'',5400,_light_buildtime,-2,4,1,0,'LEVEL 4',[]];

_c pushBack 'BRDM2IMP_9K31_OPFOR';
_i pushBack [localize "STR_WF_RU_L38",'',4875,_light_buildtime,-2,4,1,0,'LEVEL 4',[]];//ambu

_c pushBack 'CUP_O_BRDM2_ATGM_RUS';
_i pushBack [localize "STR_WF_RU_L39",'',1350,_light_buildtime,-2,4,1,0,'LEVEL 4',[]];

_c pushBack 'cwr3_o_mtlb_mev';
_i pushBack [localize "STR_WF_RU_L40",'',3200,_light_buildtime,-2,4,1,0,'LEVEL 4',[]];

_c pushBack 'CUP_O_BTR90_RU';
_i pushBack [localize "STR_WF_RU_L41",'',2075,_light_buildtime,-2,4,1,0,'LEVEL 4',[]];

_c pushBack 'pook_9K57M_OPFOR';
_i pushBack [localize "STR_WF_RU_L42",'',6050,_light_buildtime,-2,4,1,0,'LEVEL 4',[]];//arty

_c pushBack 'pook_A222_OPFOR';
_i pushBack [localize "STR_WF_RU_L43",'',7380,_light_buildtime,-2,4,1,0,'LEVEL 4',[]];//arty




_c pushBack 'pook_9K58_OPFOR';
_i pushBack [localize "STR_WF_RU_L44",'',6875,_light_buildtime,-2,4,1,0,'LEVEL 4',[]];//arty

_c pushBack 'pook_MRK27BT';
_i pushBack [localize "STR_WF_RU_L45",'',1475,_light_buildtime,-1,4,1,0,'LEVEL 4',[]];//uav



_heavy_buildtime=40;

//Heavy---------------------------------------------------Heavy
//level 0//---------------------------------------------------


_c pushBack 'CUP_O_MTLB_pk_WDL_RU';
_i pushBack [localize "STR_WF_RU_H1",'',900,_heavy_buildtime,-2,0,2,0,'LEVEL 0',[]];

_c pushBack 'cwr3_o_bmp2_zu23';
_i pushBack [localize "STR_WF_RU_H2",'',1050,_heavy_buildtime,-2,0,2,0,'LEVEL 0',[]];

//level 1//---------------------------------------------------


_c pushBack 'cwr3_o_pt76b';
_i pushBack [localize "STR_WF_RU_H3",'',2975,_heavy_buildtime,-2,1,2,0,'LEVEL 1',[]];

_c pushBack 'cwr3_o_bmp1' ;
_i pushBack [localize "STR_WF_RU_H4",'',2400,_heavy_buildtime,-2,1,2,0,'LEVEL 1',[]];

_c pushBack 'cwr3_o_bmp1p';
_i pushBack [localize "STR_WF_RU_H5",'',2600,_heavy_buildtime,-2,1,2,0,'LEVEL 1',[]];

_c pushBack 'cwr3_o_t55';
_i pushBack [localize "STR_WF_RU_H6",'',3100,_heavy_buildtime,-2,1,2,0,'LEVEL 1',[]];


//level 2//----------------------------------------------------
_c pushBack 'cwr3_o_t55a' ;
_i pushBack [localize "STR_WF_RU_H7",'',4600,_heavy_buildtime,-2,2,2,0,'LEVEL 2',[]];

_c pushBack 'cwr3_o_bmp2_mev' ;
_i pushBack [localize "STR_WF_RU_H8",'',5800,_heavy_buildtime,-2,2,2,0,'LEVEL 2',[]];//ambu

_c pushBack 'cwr3_o_t55amv';
_i pushBack [localize "STR_WF_RU_H9",'',4975,_heavy_buildtime,-2,2,2,0,'LEVEL 2',[]];

_c pushBack 'cwr3_o_bmp2';
_i pushBack [localize "STR_WF_RU_H10",'',3050,_heavy_buildtime,-2,2,2,0,'LEVEL 2',[]];
//level 3//----------------------------------------------------

_c pushBack 'pook_TOS1A_OPFOR' ;
_i pushBack [localize "STR_WF_RU_H11",'',7600,_heavy_buildtime,-2,3,2,0,'LEVEL 3',[]];//arty

_c pushBack 'cwr3_o_mtlb_sa13' ;
_i pushBack [localize "STR_WF_RU_H12",'',5000,_heavy_buildtime,-2,3,2,0,'LEVEL 3',[]];

_c pushBack 'cwr3_o_t64b';
_i pushBack [localize "STR_WF_RU_H13",'',5300,_heavy_buildtime,-2,3,2,0,'LEVEL 3',[]];

_c pushBack 'cwr3_o_t64bv';
_i pushBack [localize "STR_WF_RU_H14",'',5450,_heavy_buildtime,-2,3,2,0,'LEVEL 3',[]];

_c pushBack 'CUP_O_T72_RU' ;
_i pushBack [localize "STR_WF_RU_H15",'',5750,_heavy_buildtime,-2,3,2,0,'LEVEL 3',[]];

_c pushBack 'CUP_O_BMP3_RU' ;
_i pushBack [localize "STR_WF_RU_H16",'',3800,_heavy_buildtime,-2,3,2,0,'LEVEL 3',[]];

_c pushBack 'cwr3_o_zsu';
_i pushBack [localize "STR_WF_RU_H17",'',2775,_heavy_buildtime,-2,3,2,0,'LEVEL 3',[]];

_c pushBack 'cwr3_o_t72a';
_i pushBack [localize "STR_WF_RU_H18",'',5075,_heavy_buildtime,-2,3,2,0,'LEVEL 3',[]];

//level 3//----------------------------------------------------

_c pushBack 'cwr3_o_t72b1' ;
_i pushBack [localize "STR_WF_RU_H19",'',6050,_heavy_buildtime,-2,4,2,0,'LEVEL 4',[]];

_c pushBack 'CUP_O_T90_RU' ;
_i pushBack [localize "STR_WF_RU_H20",'',6375,_heavy_buildtime,-2,4,2,0,'LEVEL 4',[]];

_c pushBack 'CUP_O_2S6M_RU';
_i pushBack [localize "STR_WF_RU_H21",'',6500,_heavy_buildtime,-2,4,2,0,'LEVEL 4',[]];


_air_buildtime= 60;



//-------------------------Air---------------
_c pushBack 'CUP_O_Ka60_Grey_RU';
_i pushBack [localize "STR_WF_RU_A1",'',6900,_air_buildtime,-2,0,3,0,'LEVEL 0',[]];


//_c pushBack 'pook_Ka27_FIA_O';
//_i pushBack ['','',6900,_air_buildtime,-2,0,3,0,'LEVEL 0',[]];


_c pushBack 'cwr3_o_an2';
_i pushBack [localize "STR_WF_RU_A2",'',7300,_air_buildtime,-2,1,3,0,'LEVEL 1',[]];

_c pushBack 'pook_AN26_OPFOR';
_i pushBack [localize "STR_WF_RU_A3",'',8450,_air_buildtime,-2,1,3,0,'LEVEL 1',[]];

_c pushBack 'cwr3_o_an12';
_i pushBack [localize "STR_WF_RU_A4",'',9300,_air_buildtime,-2,1,3,0,'LEVEL 1',[]];


_c pushBack 'CUP_O_Mi8AMT_RU';
_i pushBack [localize "STR_WF_RU_A5",'',9400,_air_buildtime,-2,1,3,0,'LEVEL 1',[]];

_c pushBack 'cwr3_o_mi6t';
_i pushBack [localize "STR_WF_RU_A6",'',9750,_air_buildtime,-2,1,3,0,'LEVEL 1',[]];






_c pushBack 'cwr3_o_mi8_mev';
_i pushBack [localize "STR_WF_RU_A7",'',11300,_air_buildtime,-2,2,3,0,'LEVEL 2',[]];

//_c pushBack 'pook_Ka29_FIA_O';
//_i pushBack ['','',12700,_air_buildtime,-2,2,3,0,'LEVEL 2',[]];


_c pushBack 'CUP_O_Mi8_RU';
_i pushBack [localize "STR_WF_RU_A8",'',13800,_air_buildtime,-2,2,3,0,'LEVEL 2',[]];

//_c pushBack 'pook_Mi28D_OPFOR_P';
//_i pushBack ['','',18350,_air_buildtime,-2,2,3,0,'LEVEL 2',[]];

_c pushBack 'pook_MIG21_OPFOR';
_i pushBack [localize "STR_WF_RU_A9",'',20000,_air_buildtime,-2,2,3,0,'LEVEL 2',[]];






//_c pushBack 'pook_Mi28_OPFOR_P';
//_i pushBack ['','',20100,_air_buildtime,-2,3,3,0,'LEVEL 3',[]];



_c pushBack 'cwr3_o_mi24d';
_i pushBack [localize "STR_WF_RU_A10",'',23200,_air_buildtime,-2,3,3,0,'LEVEL 3',[]];

_c pushBack 'CUP_O_Ka50_DL_RU';
_i pushBack [localize "STR_WF_RU_A11",'',24200,_air_buildtime,-2,3,3,0,'LEVEL 3',[]];

_c pushBack 'cwr3_o_su17m4';
_i pushBack [localize "STR_WF_RU_A12",'',25875,_air_buildtime,-2,3,3,0,'LEVEL 3',[]];

_c pushBack 'pook_Su22_OPFOR_P';
_i pushBack [localize "STR_WF_RU_A13",'',28350,_air_buildtime,-2,3,3,0,'LEVEL 3',[]];



_c pushBack 'CUP_O_Mi24_P_Dynamic_RU';
_i pushBack [localize "STR_WF_RU_A14",'',25050,_air_buildtime,-2,4,3,0,'LEVEL 4',[]];

_c pushBack 'CUP_O_Mi24_V_Dynamic_RU';
_i pushBack [localize "STR_WF_RU_A15",'',27100,_air_buildtime,-2,4,3,0,'LEVEL 4',[]];

_c pushBack 'pook_Mig23_OPFOR';
_i pushBack [localize "STR_WF_RU_A16",'',31000,_air_buildtime,-2,4,3,0,'LEVEL 4',[]];

_c pushBack 'CUP_O_Ka52_RU';
_i pushBack [localize "STR_WF_RU_A17",'',39500,_air_buildtime,2,4,3,0,'LEVEL 4',[]];

_c pushBack 'pook_YAK38_OPFOR';
_i pushBack [localize "STR_WF_RU_A18",'',33150,_air_buildtime,-2,4,3,0,'LEVEL 4',[]];

_c pushBack 'pook_MIG31_OPFOR';
_i pushBack [localize "STR_WF_RU_A19",'',34050,_air_buildtime,-2,4,3,0,'LEVEL 4',[]];

_c pushBack 'CUP_O_Su25_Dyn_RU';
_i pushBack [localize "STR_WF_RU_A20",'',36475,_air_buildtime,-2,4,3,0,'LEVEL 4',[]];

_c pushBack 'pook_MIG29_OPFOR';
_i pushBack [localize "STR_WF_RU_A21",'',41050,_air_buildtime,-2,4,3,0,'LEVEL 4',[]];

_c pushBack 'pook_su24_base';
_i pushBack [localize "STR_WF_RU_A22",'',43000,_air_buildtime,-2,4,3,0,'LEVEL 4',[]];




//_c pushBack 'CUP_O_Mi24_Mk3_CSAT_T';
//_i pushBack ['','',33000,_air_buildtime,-2,4,3,0,'LEVEL 4',[],2];

_c pushBack 'CUP_O_Mi24_Mk4_CSAT_T';
_i pushBack [localize "STR_WF_RU_A23",'',43000,_air_buildtime,-2,4,3,0,'LEVEL 4',[],2];


_c pushBack 'CUP_O_Ka52_Blk_RU';
_i pushBack [localize "STR_WF_RU_A24",'',44500,_air_buildtime,2,5,3,0,'LEVEL 5',[]];

_c pushBack 'pook_S70';
_i pushBack [localize "STR_WF_RU_A25",'',25000,_air_buildtime,-1,5,3,0,'LEVEL 5',[]];

_c pushBack 'CUP_O_Pchela1T_RU';
_i pushBack [localize "STR_WF_RU_A26",'',4800,_air_buildtime,-1,5,3,0,'LEVEL 5',[]];

_c pushBack 'pook_MIG35_OPFOR';
_i pushBack [localize "STR_WF_RU_A27",'',51000,_air_buildtime,-2,5,3,0,'LEVEL 5',[]];

_c pushBack 'CUP_O_SU34_RU';
_i pushBack [localize "STR_WF_RU_A28",'',56700,_air_buildtime,-2,5,3,0,'LEVEL 5',[]];




/*------------ BUILD MENU --------------*/

_c = _c + ['cwr3_o_searchlight'];	
_i = _i + [[localize "STR_WF_RU_CD1",'',20,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['CUP_O_SearchLight_static_RU'];	
_i = _i + [[localize "STR_WF_RU_CD2",'',25,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['cwr3_o_nsv_low'];	
_i = _i + [[localize "STR_WF_RU_CD3",'',105,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['cwr3_o_nsv_high'];
_i = _i + [[localize "STR_WF_RU_CD4",'',115,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['CUP_O_KORD_RU'];	
_i = _i + [[localize "STR_WF_RU_CD5",'',120,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['CUP_O_KORD_high_RU_M_BeigeDigital'];	
_i = _i + [[localize "STR_WF_RU_CD6",'',130,0,1,0,'Defense',0,'whatever',[]]];
_c = _c + ['cwr3_o_ags30'];	
_i = _i + [[localize "STR_WF_RU_CD7",'',255,0,1,0,'Defense',0,'whatever',[]]];


_c = _c + ['cwr3_o_spg9'];	_i = _i + [[localize "STR_WF_RU_CD8",'',310,0,1,0,'Defense60',0,'whatever',[]]];
_c = _c + ['cwr3_o_konkurs_tripod'];	_i = _i + [[localize "STR_WF_RU_CD9",'',640,0,1,0,'Defense60',0,'whatever',[]]];
_c = _c + ['CUP_O_Metis_RU'];	_i = _i + [[localize "STR_WF_RU_CD10",'',745,0,1,0,'Defense60',0,'whatever',[]]];
_c = _c + ['CUP_O_Kornet_RU'];	_i = _i + [[localize "STR_WF_RU_CD11",'',825,0,1,0,'Defense60',0,'whatever',[]]];
_c = _c + ['CUP_O_ZU23_RU'];	_i = _i + [[localize "STR_WF_RU_CD12",'',435,0,1,0,'Defense60',0,'whatever',[]]];
_c = _c + ['CUP_O_Igla_AA_pod_RU'];	_i = _i + [[localize "STR_WF_RU_CD13",'',1250,0,1,0,'Defense60',0,'whatever',[]]];
_c = _c + ['CUP_O_2b14_82mm_RU'];	_i = _i + [[localize "STR_WF_RU_CD14",'',2000,0,1,0,'Defense60',0,'whatever',[]]];


//BACKPACKSTUFF SELLPART
_c = _c + ['CUP_I_2b14_82mm_AAF'];	_i = _i + [['','',2000,0,1,0,'nowhere',0,'whatever',[]]];//listed to get sell option, only indi backpack
_c = _c + ['cwr3_o_2b14'];	_i = _i + [['','',2000,0,1,0,'nowhere',0,'whatever',[]]];//listed to get sell option, only indi backpack


_c = _c + ['CUP_I_Kornet_AAF'];	_i = _i + [['','',825,0,1,0,'nowhere',0,'whatever',[]]];//listed to get sell option, only indi backpack
_c = _c + ['CUP_I_Metis_AAF'];	_i = _i + [['','',745,0,1,0,'nowhere',0,'whatever',[]]];//listed to get sell option, only indi backpack
_c = _c + ['cwr3_i_dshkm_high'];	_i = _i + [['','',105,0,1,0,'nowhere',0,'whatever',[]]];//listed to get sell option, only indi backpack
_c = _c + ['cwr3_i_dshkm_low'];	_i = _i + [['','',105,0,1,0,'nowhere',0,'whatever',[]]];//listed to get sell option, only indi backpack
_c = _c + ['CUP_I_AGS_AAF'];	_i = _i + [['','',255,0,1,0,'nowhere',0,'whatever',[]]];//listed to get sell option, only indi backpack
_c = _c + ['CUP_I_DSHKM_AAF'];	_i = _i + [['','',105,0,1,0,'nowhere',0,'whatever',[]]];//listed to get sell option, only indi backpack
_c = _c + ['CUP_I_DSHKM_MiniTriPod_AAF'];	_i = _i + [['','',105,0,1,0,'nowhere',0,'whatever',[]]];//listed to get sell option, only indi backpack

_c = _c + ['cwr3_b_searchlight'];	_i = _i + [['','',20,0,1,0,'nowhere',0,'whatever',[]]];
//END BACKPACKSTATICSELLPART



_c = _c + ['CUP_O_D30_RU'];	_i = _i + [[localize "STR_WF_RU_CD15",'',6400,0,1,0,'Defense60',0,'whatever',[]]];



_c = _c + ['O_Static_Designator_02_F'];_i = _i + [[localize "STR_WF_RU_CD16",'',750,0,1,0,'Defense80',0,'whatever',[]]];

//_c = _c + ['pook_S60_base'];	_i = _i + [[localize "STR_WF_RU_CD23",'',1400,0,1,0,'Defense80',0,'whatever',[]]];//changed weapons to fix soundbug



_c = _c + ['cwr3_o_zu23'];	_i = _i + [[localize "STR_WF_RU_CD22",'',950,0,1,0,'Defense80',0,'whatever',[]]];
//_c = _c + ['pook_ZU23_base'];	_i = _i + [[localize "STR_WF_RU_CD22",'',450,0,1,0,'Defense80',0,'whatever',[]]];
//_c = _c + ['pook_ZU23M_base'];	_i = _i + [[localize "STR_WF_RU_CD21",'',600,0,1,0,'Defense80',0,'whatever',[]]];
//_c = _c + ['pook_KS12_base'];	_i = _i + [[localize "STR_WF_RU_CD20",'',1050,0,1,0,'Defense80',0,'whatever',[]]];//removed because pook ammo soundbug
//_c = _c + ['pook_KS19_base'];	_i = _i + [[localize "STR_WF_RU_CD19",'',1175,0,1,0,'Defense80',0,'whatever',[]]];


_c = _c + ['O_Radar_System_02_F'];	_i = _i + [[localize "STR_WF_RU_CD17",'',3800,0,1,0,'Defense80',0,'whatever',[]]];
_c = _c + ['O_SAM_System_04_F'];	_i = _i + [[localize "STR_WF_RU_CD18",'',8750,0,1,0,'Defense80',0,'whatever',[]]];



//ammo

_c = _c + ['CUP_BOX_TK_WpsSpecial_F'];
_i = _i + [[localize "STR_WF_ALL_CA1",'',7200,0,0,0,'Ammo',0,'whatever',[]]];


//BOTH SIDES SIMILAR



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
//RU
_c pushBack 'CUP_O_RUS_SpecOps_Autumn';
_i pushBack ['','',2000,4,-1,9,0,1,'',[]];
_c pushBack 'CUP_O_RU_Soldier_MG_VDV';
_i pushBack ['','',2000,4,-1,9,0,1,'',[]];
_c pushBack 'CUP_O_RU_Medic_VDV';
_i pushBack ['','',2000,4,-1,9,0,1,'',[]];
_c pushBack 'CUP_O_RU_Engineer_VDV';
_i pushBack ['','',2000,5,-1,9,0,1,'',[]];
_c pushBack 'CUP_O_RU_Soldier_TL_VDV';
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
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_TKA: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_TKA: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];
