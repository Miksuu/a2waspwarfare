/* CIV Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];
//_i ["Sonderezeichnung in Liste","Vermutlich Beschreibungstext",Preis,Buildtime,1für defense -1 für men -2 für vehicle,Upgradelevel,0=inf und defense |1-3=lf-af,Skill,Registerbezeichnung,?,optionale Camonummer]

_light_buildtime=25;

_c pushBack'cwr3_c_bicycle';
_i pushBack['','',50,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'C_Van_01_fuel_F';
_i pushBack['','',1550,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'C_Van_01_transport_F';
_i pushBack['','',550,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_TT650_TK_CIV';
_i pushBack['','',250,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_S1203_CIV';
_i pushBack['','',450,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_Ural_Civ_01';
_i pushBack['','',1050,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'C_Truck_02_transport_F';
_i pushBack['','',980,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_V3S_Open_TKC';
_i pushBack['','',850,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_Lada_GreenTK_CIV';
_i pushBack['','',130,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Golf4_green_Civ';
_i pushBack['','',2550,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Octavia_CIV';
_i pushBack['','',1350,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'C_Hatchback_01_F';
_i pushBack['','',3580,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Volha_Gray_TKCIV';
_i pushBack['','',200,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'C_Hatchback_01_sport_F';
_i pushBack['','',5750,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'C_SUV_01_F';
_i pushBack['','',4100,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Datsun_4seat';
_i pushBack['','',310,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Datsun';
_i pushBack['','',310,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'C_Quadbike_01_F';
_i pushBack['','',350,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_Pickup_unarmed_CIV';
_i pushBack['','',850,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'C_Offroad_01_F';
_i pushBack['','',2470,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_O_Hilux_unarmed_TK_CIV';
_i pushBack['','',780,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_Bus_City_TKCIV';
_i pushBack['','',900,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Ikarus_TKC';
_i pushBack['','',1120,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_UAZ_Unarmed_TK_CIV';
_i pushBack['','',490,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_SUV_TK';
_i pushBack['','',5550,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'UK3CB_Civ_LandRover_Soft_Blue_A';
_i pushBack['','',2770,_light_buildtime,-2,0,1,0,'Civilians',[]];


_c pushBack'UK3CB_Civ_LandRover_Hard_Red_A';
_i pushBack['','',3050,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_LR_Transport_CTK';
_i pushBack['','',1550,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_UAZ_Open_TK_CIV';
_i pushBack['','',350,_light_buildtime,-2,0,1,0,'Civilians',[]];


_c pushBack'cwr3_c_ural_empty';
_i pushBack['','',350,_light_buildtime,-2,0,1,0,'Civilians',[]];



//ammo

_c = _c + ['CUP_BOX_TK_WpsSpecial_F'];
_i = _i + [['GEARPOINT','',7200,0,0,0,'Ammo',0,'whatever',[]]];

_c = _c + ['CUP_BOX_GB_WpsSpecial_F'];
_i = _i + [['GEARPOINT','',7200,0,0,0,'Ammo',0,'whatever',[]]];

_c = _c + ['CUP_BOX_US_ARMY_WpsSpecial_F'];
_i = _i + [['GEARPOINT','',7200,0,0,0,'Ammo',0,'whatever',[]]];


//BOTH SIDES SIMILAR

//forti

_c = _c + ['Fort_Nest'];	_i = _i + [['','',115,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['TK_WarfareBBarrier10xTall_EP1'];	_i = _i + [['','',275,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['TK_WarfareBBarrier5x_EP1'];	_i = _i + [['','',175,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_HBarrier_large'];	_i = _i + [['','',220,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_HBarrier5'];	_i = _i + [['','',150,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_HBarrier3'];	_i = _i + [['','',130,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_HBarrier1'];	_i = _i + [['','',100,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['cwr3_bagfence_corner'];	_i = _i + [['','',80,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['cwr3_bagfence'];	_i = _i + [['','',50,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['pook_Land_fort_rampart_DES'];	_i = _i + [['','',120,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_fort_artillery_nest_EP1'];	_i = _i + [['','',235,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['pook_Land_fort_artillery_nest_DES'];	_i = _i + [['','',255,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Hhedgehog_concreteBig'];	_i = _i + [['','',435,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['land_cwr3_vez'];	_i = _i + [['','',275,0,1,0,'Fortification',0,'USA',[]]];
//_c = _c + ['LAND_fort'];	_i = _i + [['','',795,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['land_cwr3_lampa_sidl_3'];	_i = _i + [['','',75,0,1,0,'Fortification',0,'USA',[]]];

_c = _c + ['Concrete_Wall_EP1'];	_i = _i + [['','',95,0,1,0,'Fortification',0,'USA',[]]];

//for backpackstatic sell skill
_c = _c + ['cwr3_b_searchlight'];	_i = _i + [['','',20,0,1,0,'nowhere',0,'whatever',[]]];
//Strategic

_c = _c + ['Land_PedestrianCrossing_01_6m_6str_F'];	_i = _i + [['BARRACKS SPAWNPOINT','',200,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_HelipadSquare_F'];	_i = _i + [['LIGHT SPAWNPOINT','',200,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_HelipadRescue_F'];	_i = _i + [['HEAVY SPAWNPOINT','',200,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_HelipadCivil_F'];	_i = _i + [['AIR SPAWNPOINT','',200,0,1,0,'Strategic',0,'USA',[]]];

_c = _c + ['TK_GUE_WarfareBVehicleServicePoint_Base_EP1'];	_i = _i + [['','',5600,0,1,0,'Strategic',0,'USA',[]]];

//minefield scripted in construction_stationarydefense.sqf
_c = _c + ['Sign_Danger'];	_i = _i + [['MINEFIELD AT','',5000,0,1,0,'Strategic',0,'USA',[]]];

_c = _c + ['Sign_DangerMines_ACR'];	_i = _i + [['MINEFIELD AP','',3800,0,1,0,'Strategic',0,'USA',[]]];



_c = _c + ['land_cwr3_tent1_mash'];	_i = _i + [['','',200,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_radar_EP1'];	_i = _i + [['','',370,0,1,0,'Strategic',0,'USA',[]]];
//_c = _c + ['Land_Illum_Tower'];	_i = _i + [['','',435,0,1,0,'Strategic',0,'USA',[]]];
//_c = _c + ['cwr3_target_grenade'];	_i = _i + [['','',150,0,1,0,'Strategic',0,'USA',[]]];
//_c = _c + ['Land_CamoNetB_NATO_EP1'];	_i = _i + [['','',175,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['CamoNet_wdl_big_F'];	_i = _i + [['','',175,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_IRMaskingCover_01_F'];	_i = _i + [['','',375,0,1,0,'Strategic',0,'USA',[]]];
//_c = _c + ['Land_IRMaskingCover_02_F'];	_i = _i + [['','',275,0,1,0,'Strategic',0,'USA',[]]];
//_c = _c + ['Land_Setka_Car'];	_i = _i + [['','',155,0,1,0,'Strategic',0,'USA',[]]];
//_c = _c + ['Land_smallhangaropen'];	_i = _i + [['','',2350,0,1,0,'Strategic',0,'USA',[]]];
/*dont works
//us fixload for getting vehicle slots
_c pushBack 'UK3CB_BAF_Apache_AH1_Generic';
_i pushBack ['','',44050,5,-1,9,0,1,'LEVEL 5',[]];
_c pushBack 'UK3CB_BAF_MQ9_Reaper_Generic';
_i pushBack ['','',36750,5,-1,9,0,1,'LEVEL 5',[]];
_c pushBack 'FIR_F35B_RAF01';
_i pushBack ['','',58500,5,-1,9,0,1,'LEVEL 5',[]];
_c pushBack 'CUP_B_F35B_BAF';
_i pushBack ['','',53000,5,-1,9,0,1,'LEVEL 5',[]];
_c pushBack 'CUP_B_F35B_Stealth_BAF';
_i pushBack ['','',50000,5,-1,9,0,1,'LEVEL 5',[]];

_c pushBack 'CUP_B_AH1Z_Dynamic_USMC';
_i pushBack ['','',42150,5,-1,9,0,1,'LEVEL 5',[]];
_c pushBack 'CUP_B_USMC_DYN_MQ9';
_i pushBack ['','',34000,5,-1,9,0,1,'LEVEL 5',[]];
_c pushBack 'FIR_F22_FF';
_i pushBack ['','',48700,5,-1,9,0,1,'LEVEL 5',[]];
_c pushBack 'FIR_F23A_Black';
_i pushBack ['','',49975,5,-1,9,0,1,'LEVEL 5',[]];
_c pushBack 'CUP_B_F35B_USMC';
_i pushBack ['','',53000,5,-1,9,0,1,'LEVEL 5',[]];
_c pushBack 'CUP_B_F35B_Stealth_USMC';
_i pushBack ['','',50000,5,-1,9,0,1,'LEVEL 5',[]];
_c pushBack 'FIR_F35B_DarkGrey';
_i pushBack ['','',58500,5,-1,9,0,1,'LEVEL 5',[]];

_c pushBack 'UK3CB_BAF_Wildcat_AH1_8_Generic';
_i pushBack ['','',27350,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'CUP_B_AH1_DL_BAF';
_i pushBack ['','',39900,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'cwr3_b_frs1';
_i pushBack ['','',35000,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'FMX_AV8B2_GR9_SQN3_A_UK';
_i pushBack ['','',36075,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'CUP_B_GR9_DYN_GB';
_i pushBack ['','',36550,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'EAWS_EF2000_rafhist_CAP';
_i pushBack ['','',38300,5,-1,9,0,1,'LEVEL 4',[]];

_c pushBack 'cwr3_b_ah64';
_i pushBack ['','',38700,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'FIR_F15A';
_i pushBack ['','',35300,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'FIR_AV8B';
_i pushBack ['','',38075,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'CUP_B_AV8B_DYN_USMC';
_i pushBack ['','',39500,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'CUP_B_A10_DYN_USA';
_i pushBack ['','',37350,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'cwr3_b_f16c';
_i pushBack ['','',36000,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'EA18G_141CAG';
_i pushBack ['','',30100,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'CUP_B_AH6X_USA';
_i pushBack ['','',21450,5,-1,9,0,1,'LEVEL 4',[]];

_c pushBack 'cwr3_b_uk_lynx_ah7_tow';
_i pushBack ['','',28000,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'UK3CB_BAF_Wildcat_AH1_6_Generic';
_i pushBack ['','',26300,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'Tornado_AWS_camo_uk';
_i pushBack ['','',31075,5,-1,9,0,1,'LEVEL 3',[]];

_c pushBack 'cwr3_b_ah1f';
_i pushBack ['','',25300,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'cwr3_b_kiowa_dyn';
_i pushBack ['','',23575,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'FIR_F14A_NSAWC';
_i pushBack ['','',28900,5,-1,9,0,1,'LEVEL 3',[]];

_c pushBack 'UK3CB_BAF_Merlin_HC4_CSAR';
_i pushBack ['','',9300,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'cwr3_b_uh60_mev';
_i pushBack ['','',10500,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'CUP_B_AW159_GB';
_i pushBack ['','',12100,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'cwr3_b_uk_F4M';
_i pushBack ['','',23050,5,-1,9,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_CESSNA_T41_ARMED_USA';
_i pushBack ['','',9800,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'CUP_B_UH1Y_MEV_USMC';
_i pushBack ['','',9750,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'cwr3_b_ah6j';
_i pushBack ['','',8550,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'CUP_B_MH60L_DAP_4x_USN';
_i pushBack ['','',11775,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'CUP_B_UH1Y_Gunship_Dynamic_USMC';
_i pushBack ['','',12575,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'cwr3_b_f4e';
_i pushBack ['','',23050,5,-1,9,0,1,'LEVEL 2',[]];

_c pushBack 'cwr3_b_camel';
_i pushBack ['','',4100,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'CUP_B_C130J_GB';
_i pushBack ['','',8075,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'UK3CB_BAF_Merlin_HC3_24';
_i pushBack ['','',8350,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uk_hc1';
_i pushBack ['','',8575,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uk_puma_hc1';
_i pushBack ['','',8200,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uk_lynx_ah7_transport';
_i pushBack ['','',7650,5,-1,9,0,1,'LEVEL 1',[]];

_c pushBack 'CUP_B_CESSNA_T41_UNARMED_AIRFORCE_USA';
_i pushBack ['','',4500,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'CUP_B_C130J_USMC';
_i pushBack ['','',8075,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'CUP_B_MV22_USMC';
_i pushBack ['','',12300,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'CUP_B_CH53E_USMC';
_i pushBack ['','',8575,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'cwr3_b_ch47';
_i pushBack ['','',8300,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uh60';
_i pushBack ['','',9575,5,-1,9,0,1,'LEVEL 1',[]];

_c pushBack 'CUP_B_AW159_Unarmed_RN_Grey';
_i pushBack ['','',6200,5,-1,9,0,1,'LEVEL 0',[]];

_c pushBack 'cwr3_b_mh6j';
_i pushBack ['','',5300,5,-1,9,0,1,'LEVEL 0',[]];

_c pushBack 'CUP_B_Challenger2_2CW_BAF';
_i pushBack ['','',6700,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'CUP_B_FV510_GB_W_SLAT';
_i pushBack ['','',3400,5,-1,9,0,1,'LEVEL 4',[]];

_c pushBack 'CUP_B_M1A1EP_TUSK_Woodland_USMC';
_i pushBack ['','',6200,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'CUP_B_M1A2SEP_TUSK_II_Woodland_US_Army';
_i pushBack ['','',6900,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'CUP_B_M6LineBacker_USA_W';
_i pushBack ['','',4300,5,-1,9,0,1,'LEVEL 4',[]];

_c pushBack 'CUP_B_M270_HE_BAF_WOOD';
_i pushBack ['','',7850,5,-1,9,0,1,'LEVEL 3',[]];//---ARTY
_c pushBack 'CUP_B_MCV80_GB_W_SLAT';
_i pushBack ['','',2850,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'cwr3_b_uk_fv4030';
_i pushBack ['','',4575,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_FV510_GB_W';
_i pushBack ['','',2975,5,-1,9,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_M270_HE_USMC';
_i pushBack ['','',7850,5,-1,9,0,1,'LEVEL 3',[]];//---ARTY
_c pushBack 'CUP_B_M1A1FEP_Woodland_USMC';
_i pushBack ['','',5400,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_M1A1SA_Woodland_US_Army';
_i pushBack ['','',5400,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_M60A3_TTS_USMC';
_i pushBack ['','',4100,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_M2A3Bradley_USA_W';
_i pushBack ['','',3600,5,-1,9,0,1,'LEVEL 3',[]];

_c pushBack 'CUP_B_MCV80_GB_W';
_i pushBack ['','',2700,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'cwr3_b_uk_fv4201';
_i pushBack ['','',4200,5,-1,9,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_M2Bradley_USA_W';
_i pushBack ['','',3100,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'cwr3_b_m163';
_i pushBack ['','',2900,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'cwr3_b_m1';
_i pushBack ['','',4200,5,-1,9,0,1,'LEVEL 2',[]];

_c pushBack 'cwr3_b_uk_fv510';
_i pushBack ['','',2500,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uk_fv107';
_i pushBack ['','',2350,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uk_fv101';
_i pushBack ['','',3200,5,-1,9,0,1,'LEVEL 1',[]];

_c pushBack 'CUP_B_M7Bradley_USA_W';
_i pushBack ['','',2300,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'CUP_B_M60A3_USMC';
_i pushBack ['','',3600,5,-1,9,0,1,'LEVEL 1',[]];

_c pushBack 'CUP_B_FV432_Bulldog_GB_W_RWS';
_i pushBack ['','',1300,5,-1,9,0,1,'LEVEL 0',[]];
_c pushBack 'UK3CB_BAF_FV432_Mk3_GPMG_Green';
_i pushBack ['','',1100,5,-1,9,0,1,'LEVEL 0',[]];

_c pushBack 'CUP_B_AAV_USMC';
_i pushBack ['','',1300,5,-1,9,0,1,'LEVEL 0',[]];

_c pushBack 'pook_NASAMS_BASE';
_i pushBack ['','',3900,4,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'cwr3_b_uk_fv620_repair';
_i pushBack ['','',3050,4,-1,9,0,1,'LEVEL 4',[]];//---RTRUCK
_c pushBack 'CUP_B_Mastiff_HMG_GB_W';
_i pushBack ['','',800,4,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'CUP_B_Mastiff_GMG_GB_W';
_i pushBack ['','',830,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'pook_Pandur_RCWS30_BLUFOR';
_i pushBack ['','',1775,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'CUP_B_FV432_GB_Ambulance';
_i pushBack ['','',3275,5,-1,9,0,1,'LEVEL 4',[]];//---AMBU
_c pushBack 'pook_Pandur_MGS_BLUFOR';
_i pushBack ['','',2800,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'pook_Pandur_AA_BLUFOR';
_i pushBack ['','',2350,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'pook_Pandur_Mortar_BLUFOR';
_i pushBack ['','',3900,5,-1,9,0,1,'LEVEL 4',[]];//---ARTY
_c pushBack 'pook_CAESAR_BLUFOR';
_i pushBack ['','',6700,5,-1,9,0,1,'LEVEL 4',[]];//---ARTY
_c pushBack 'UK3CB_BAF_LandRover_Panama_Green_A';
_i pushBack ['','',1075,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'pook_MAARS_M240';
_i pushBack ['','',1300,5,-1,9,0,1,'LEVEL 4',[]];

_c pushBack 'pook_CRAM_BASE';
_i pushBack ['','',2575,4,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'pook_MEADS_base';
_i pushBack ['','',4200,4,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'cwr3_b_m113a3_mev_des';
_i pushBack ['','',3050,4,-1,9,0,1,'LEVEL 4',[]];//---AMBU
_c pushBack 'CUP_B_M1128_MGS_Woodland';
_i pushBack ['','',2700,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'CUP_B_M163_Vulcan_USA';
_i pushBack ['','',2200,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'pook_MLRS_BLUFOR';
_i pushBack ['','',5475,5,-1,9,0,1,'LEVEL 4',[]];
_c pushBack 'pook_MAARS_M240';
_i pushBack ['','',1300,5,-1,9,0,1,'LEVEL 4',[]];

_c pushBack 'pook_Pandur_AT_BLUFOR';
_i pushBack ['','',1100,4,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'pook_Pandur_AMB_BLUFOR';
_i pushBack ['','',3300,4,-1,9,0,1,'LEVEL 3',[]];//---AMBU
_c pushBack 'CUP_I_LR_AA_AAF';
_i pushBack ['','',1250,4,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'pook_Pandur_RWS_BLUFOR';
_i pushBack ['','',900,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'pook_Pandur_SP30_BLUFOR';
_i pushBack ['','',1375,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_Ridgback_HMG_GB_W';
_i pushBack ['','',755,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_Ridgback_GMG_GB_W';
_i pushBack ['','',790,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_Mastiff_LMG_GB_W';
_i pushBack ['','',690,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'cwr3_b_uk_fv432_peak';
_i pushBack ['','',820,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_FV432_Mortar';
_i pushBack ['','',3100,5,-1,9,0,1,'LEVEL 3',[]];//---ARTY

_c pushBack 'CUP_B_M1135_ATGMV_Woodland';
_i pushBack ['','',1075,4,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_M1133_MEV_Woodland';
_i pushBack ['','',3275,4,-1,9,0,1,'LEVEL 3',[]];//---AMBU
_c pushBack 'CUP_B_nM1097_AVENGER_USA_WDL';
_i pushBack ['','',1250,4,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_M113A3_USA';
_i pushBack ['','',650,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_LAV25_USMC';
_i pushBack ['','',1350,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_M1126_ICV_M2_Woodland';
_i pushBack ['','',810,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_M1126_ICV_MK19_Woodland';
_i pushBack ['','',850,5,-1,9,0,1,'LEVEL 3',[]];
_c pushBack 'CUP_B_M1129_MC_MK19_Woodland';
_i pushBack ['','',3475,5,-1,9,0,1,'LEVEL 3',[]];//---ARTY

_c pushBack 'UK3CB_BAF_LandRover_Soft_MERT_A';
_i pushBack ['','',2100,4,-1,9,0,1,'LEVEL 2',[]];//---AMBU
_c pushBack 'UK3CB_BAF_LandRover_Amb_Green_A';
_i pushBack ['','',2300,4,-1,9,0,1,'LEVEL 2',[]];//---AMBU
_c pushBack 'UK3CB_BAF_MAN_HX60_Repair_Green';
_i pushBack ['','',2550,4,-1,9,0,1,'LEVEL 2',[]];//---RTRUCK
_c pushBack 'pook_Pandur_Mk19_BLUFOR';
_i pushBack ['','',875,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'pook_Pandur_M2_BLUFOR';
_i pushBack ['','',820,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'CUP_B_Ridgback_LMG_GB_W';
_i pushBack ['','',675,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'UK3CB_BAF_LandRover_WMIK_Milan_Green_B';
_i pushBack ['','',900,5,-1,9,0,1,'LEVEL 2',[]];

_c pushBack 'CUP_B_nM997_DF_USMC_WDL';
_i pushBack ['','',2300,4,-1,9,0,1,'LEVEL 2',[]];//---AMBU
_c pushBack 'cwr3_b_m939_repair';
_i pushBack ['','',2500,4,-1,9,0,1,'LEVEL 2',[]];//---RTRUCK
_c pushBack 'CUP_B_RG31_M2_OD_USMC';
_i pushBack ['','',550,4,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'CUP_B_RG31_Mk19_OD_USMC';
_i pushBack ['','',610,5,-1,9,0,1,'LEVEL 2',[]];
_c pushBack 'CUP_B_nM1036_TOW_DF_USMC_WDL';
_i pushBack ['','',890,5,-1,9,0,1,'LEVEL 2',[]];

_c pushBack 'UK3CB_BAF_LandRover_WMIK_GMG_Green_B';
_i pushBack ['','',245,4,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'UK3CB_BAF_Panther_GPMG_Green_A';
_i pushBack ['','',385,4,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'UK3CB_BAF_Husky_Passenger_GMG_Green';
_i pushBack ['','',450,4,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'UK3CB_BAF_Husky_Passenger_GPMG_Green';
_i pushBack ['','',410,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'CUP_B_Jackal2_L2A1_GB_W';
_i pushBack ['','',355,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'CUP_B_Jackal2_GMG_GB_W';
_i pushBack ['','',380,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'cwr3_b_uk_fv620_reammo';
_i pushBack ['','',650,5,-1,9,0,1,'LEVEL 1',[]];//---AMMO
_c pushBack 'cwr3_b_uk_fv432_gpmg';
_i pushBack ['','',680,5,-1,9,0,1,'LEVEL 1',[]];

_c pushBack 'cwr3_b_m151_m2';
_i pushBack ['','',230,4,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'CUP_B_nM1025_M240_USMC_WDL';
_i pushBack ['','',260,4,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'CUP_B_M1165_GMV_USMC';
_i pushBack ['','',320,4,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'CUP_B_nM1025_Mk19_DF_USMC_WDL';
_i pushBack ['','',350,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'CUP_B_nM1025_M2_DF_USMC_WDL';
_i pushBack ['','',330,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'CUP_B_M1151_Mk19_USMC';
_i pushBack ['','',380,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'CUP_B_M1151_M2_USMC';
_i pushBack ['','',350,5,-1,9,0,1,'LEVEL 1',[]];
_c pushBack 'cwr3_b_m939_reammo';
_i pushBack ['','',450,5,-1,9,0,1,'LEVEL 1',[]];//---AMMO
_c pushBack 'CUP_B_M113A1_USA';
_i pushBack ['','',500,5,-1,9,0,1,'LEVEL 1',[]];

_c pushBack 'UK3CB_BAF_LandRover_Soft_Green_B';
_i pushBack ['','',55,4,-1,9,0,1,'LEVEL 0',[]];
_c pushBack 'UK3CB_BAF_MAN_HX58_Transport_Green';
_i pushBack ['','',320,4,-1,9,0,1,'LEVEL 0',[]];//---SALVAGE

_c pushBack 'cwr3_b_m151';
_i pushBack ['','',50,5,-1,9,0,1,'LEVEL 0',[]];
_c pushBack 'CUP_B_nM1038_DF_USMC_WDL';
_i pushBack ['','',210,5,-1,9,0,1,'LEVEL 0',[]];
_c pushBack 'cwr3_b_m939';
_i pushBack ['','',315,5,-1,9,0,1,'LEVEL 0',[]];//---SALVAGE
*/

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
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_CIV: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_CIV: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];