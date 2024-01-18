WF_MenuAction = -1;

//_veh = vehicle player;
_allPylonMags2 = ("count( getArray (_x >> 'hardpoints')) > 0" configClasses (configfile >> "CfgMagazines")) apply {configname _x};

//hint str _allPylonMags2;		

_sideID= str cti_Client_SideJoined;
_pID=str player;
_EASAvar="giveDATAtoEASA"+_sideID+_pID;
_veh =missionNamespace getVariable _EASAvar;

//______________________________________________________________________________________________________________________________________________

_OpforContainer = ["OTeamleader1","OTeamleader2","OTeamleader3","OTeamleader4","OTeamleader5","OEngineer1","OEngineer2","OEngineer3","OEngineer4","OEngineer5","OMachinegunner1_1","OMachinegunner1_2","OMachinegunner2_1","OMachinegunner2_2","OMachinegunner3_1","OMachinegunner3_2","OMachinegunner4_1","OMachinegunner4_2","OMachinegunner5_1","OMachinegunner5_2","OMedic1","OMedic2","OMedic3","OMedic4","OMedic5","OSpecOps1","OSpecOps2","OSpecOps3","OSpecOps4","OSpecOps5"];
_BLUcontainer = ["BTeamleader1","BTeamleader2","BTeamleader3","BTeamleader4","BTeamleader5","BEngineer1","BEngineer2","BEngineer3","BEngineer4","BEngineer5","BMachinegunner1_1","BMachinegunner1_2","BMachinegunner2_1","BMachinegunner2_2","BMachinegunner3_1","BMachinegunner3_2","BMachinegunner4_1","BMachinegunner4_2","BMachinegunner5_1","BMachinegunner5_2","BMedic1","BMedic2","BMedic3","BMedic4","BMedic5","BSpecOps1","BSpecOps2","BSpecOps3","BSpecOps4","BSpecOps5"];
_UKContainer =["BTeamleader4","BTeamleader5","BEngineer4","BEngineer5","BMachinegunner4_1","BMachinegunner4_2","BMachinegunner5_1","BMachinegunner5_2","BMedic4","BMedic5","BSpecOps4","BSpecOps5"];
_USContainer =["BTeamleader1","BTeamleader2","BTeamleader3","BEngineer1","BEngineer2","BEngineer3","BMachinegunner1_1","BMachinegunner1_2","BMachinegunner2_1","BMachinegunner2_2","BMachinegunner3_1","BMachinegunner3_2","BMedic1","BMedic2","BMedic3","BSpecOps1","BSpecOps2","BSpecOps3"];




//hint str _sideID;
//____________________________________________________________________________________________________




_bulletsRU=[];
_bulletsRU pushBack	"PylonWeapon_2000Rnd_65x39_belt";							//10/1/2
_bulletsRU pushBack	"PylonWeapon_300Rnd_20mm_shells";							//60/6/1.6
_bulletsRU pushBack	"pook_UPK23_250";											//60/30/0.3
_bulletsRU pushBack	"CUP_PylonPod_250Rnd_TE2_Green_Tracer_GSh23_23mm_APHE_M";	//120/80/2
_bulletsRU pushBack	"pook_UPK23_SU22";											//60/30/0.3




_bulletsBLU=[];
_bulletsBLU pushBack	"CUP_PylonPod_2000Rnd_TE5_Red_Tracer_762x51_M134A_M";		//12/1.2/1.5
_bulletsBLU pushBack	"CUP_PylonPod_1200Rnd_TE1_Red_Tracer_GAU19A_M";				//32/1.5/1.5


_bulletsUK=[];
_bulletsUK pushBack	"UK3CB_BAF_PylonWeapon_1200Rnd_20mm_M621_HEI_T";				//40/10/2
_bulletsUK pushBack	"CUP_PylonPod_1200Rnd_TE1_Red_Tracer_M621_20mm_HE_M";			//40/10/2


_bulletsUS=[];
_bulletsUS pushBack	"FIR_SUU23_P_1200rnd_M";										//25/15/3
_bulletsUS pushBack	"CUP_PylonPod_1200Rnd_TE1_Red_Tracer_30x113mm_M789_HEDP_M";		//90/15/4






_EASA_RU=_bulletsRU;

_EASA_US=_bulletsBLU + _bulletsUS;

_EASA_UK=_bulletsBLU + _bulletsUK;



//____________________________________________________________________________________________________
//ROCKETS
//____________________________________________________________________________________________________

_rocketsRU=[];
_rocketsRU pushBack "pook_80mm_SMK_x5";
_rocketsRU pushBack "pook_80mm_SMK_O_x5";
_rocketsRU pushBack "pook_80mm_SMK_P_x5";
_rocketsRU pushBack "CUP_PylonPod_7Rnd_S5_M"; 									//300/50/8
_rocketsRU pushBack "CUP_PylonPod_16Rnd_S5_M"; 									//300/50/8
_rocketsRU pushBack "CUP_PylonPod_32Rnd_S5_M"; 									//300/50/8
_rocketsRU pushBack "pook_80mm_HE_x18"; 										//220/25/15
_rocketsRU pushBack "CUP_PylonPod_20Rnd_S8N_M"; 								//400/60/15
_rocketsRU pushBack "FIR_S8KOM_P_20rnd_M"; 										//650/75/15
_rocketsRU pushBack "FIR_S8KOR_P_20rnd_M"; 										//650/75/15 //lock 2+16 laser
_rocketsRU pushBack "FIR_S13_P_5rnd_M"; 										//950/450/20
_rocketsRU pushBack "pook_S24_x1"; 												//2000/1000/25




_rocketsUS=[];
_rocketsUS pushBack "FIR_Hydra_M257_P_7rnd_M";
_rocketsUS pushBack "FIR_Hydra_M278_P_7rnd_M";
_rocketsUS pushBack "CUP_PylonPod_7Rnd_Rocket_FFAR_M"; 							//150/40/8
_rocketsUS pushBack "CUP_PylonPod_19Rnd_Rocket_FFAR_M";							//150/40/8
_rocketsUS pushBack "FIR_Hydra_P_7rnd_M";										//600/50/15
_rocketsUS pushBack "FIR_Hydra_P_14rnd_M";										//600/50/15
_rocketsUS pushBack "FIR_Hydra_P_19rnd_M";										//600/50/15
_rocketsUS pushBack "FIR_Hydra_P_21rnd_M";										//600/50/15
_rocketsUS pushBack "FIR_Hydra_P_38rnd_M";										//600/50/15
_rocketsUS pushBack "FIR_Hydra_M247_P_7rnd_M";									//800/120/30
_rocketsUS pushBack "FIR_Hydra_M247_P_14rnd_M";									//800/120/30
_rocketsUS pushBack "FIR_Hydra_M247_P_19rnd_M";									//800/120/30
_rocketsUS pushBack "FIR_Hydra_M247_P_38rnd_M";									//800/120/30
_rocketsUS pushBack "FIR_Hydra_WP_P_7rnd_M";
_rocketsUS pushBack "FIR_Hydra_WP_P_21rnd_M";


_rocketsUK=[];
_rocketsUK pushBack "CUP_PylonPod_12Rnd_CRV7_HE_M";								//200/50/10
_rocketsUK pushBack "CUP_PylonPod_19Rnd_CRV7_HE_M";								//200/50/10
_rocketsUK pushBack "UK3CB_BAF_PylonPod_12Rnd_CRV7_HEISAP";						//400/60/15
_rocketsUK pushBack "UK3CB_BAF_PylonPod_19Rnd_CRV7_HEISAP";						//400/60/15
_rocketsUK pushBack "CUP_PylonPod_12Rnd_CRV7_KEP_M";							//430/10/1
_rocketsUK pushBack "CUP_PylonPod_19Rnd_CRV7_KEP_M";							//430/10/1
_rocketsUK pushBack "CUP_PylonPod_12Rnd_CRV7_FAT_M";							//550/100/10
_rocketsUK pushBack "CUP_PylonPod_19Rnd_CRV7_FAT_M";							//550/100/10
_rocketsUK pushBack "FIR_CRV7_P_19rnd_M";										//600/50/15
_rocketsUK pushBack "UK3CB_BAF_PylonPod_12Rnd_CRV7_FAT";						//800/8/3
_rocketsUK pushBack "UK3CB_BAF_PylonPod_19Rnd_CRV7_FAT";						//800/8/3
_rocketsUK pushBack "UK3CB_BAF_PylonPod_12Rnd_CRV7_PG_HEISAP";					//400/60/15 lock
_rocketsUK pushBack "UK3CB_BAF_PylonPod_19Rnd_CRV7_PG_HEISAP";					//400/60/15 lock
_rocketsUK pushBack "UK3CB_BAF_PylonPod_12Rnd_CRV7_PG_FAT";						//800/8/3 lock
_rocketsUK pushBack "UK3CB_BAF_PylonPod_19Rnd_CRV7_PG_FAT";						//800/8/3 lock


_rocketsBLU=[];
	
_rocketsBLU pushBack "FIR_Poniard_P_7rnd_M";							//600/50/15 2+16 5k
_rocketsBLU pushBack "FIR_APKWS_P_7rnd_M";
_rocketsBLU pushBack "FIR_APKWS_P_14rnd_M";
_rocketsBLU pushBack "FIR_APKWS_P_19rnd_M";
_rocketsBLU pushBack "FIR_APKWS_P_38rnd_M";
	
_rocketsBLU pushBack "FIR_APKWS_M282_P_7rnd_M";						 //800/120/1 2+16 5k
_rocketsBLU pushBack "FIR_APKWS_M282_P_14rnd_M";
_rocketsBLU pushBack "FIR_APKWS_M282_P_19rnd_M";
_rocketsBLU pushBack "FIR_APKWS_M282_P_38rnd_M";
	
_rocketsBLU pushBack "FIR_APKWS_M247_P_7rnd_M";						//800/120/30 2+16 5k
_rocketsBLU pushBack "FIR_APKWS_M247_P_14rnd_M";
_rocketsBLU pushBack "FIR_APKWS_M247_P_19rnd_M";
_rocketsBLU pushBack "FIR_APKWS_M247_P_38rnd_M";
	
	
	
_rocketsBLU pushBack "FIR_Zuni_P_4rnd_M";											//900/100/10
_rocketsBLU pushBack "FIR_Zuni_P_8rnd_M";										//900/100/10
_rocketsBLU pushBack "FIR_Zuni_Mk32_P_4rnd_M";									//900/200/25
_rocketsBLU pushBack "FIR_Zuni_Mk32_P_8rnd_M";									//900/200/25
	
_rocketsBLU pushBack "FIR_LZuni_P_4rnd_M";										//900/400/20 2+16 4k
_rocketsBLU pushBack "FIR_LZuni_P_8rnd_M";										//900/400/20 2+16 4k
	
	



_EASA_RU=_EASA_RU + _rocketsRU;
//{_EASA_RU pushBack _x}forEach _rocketsRU;

_EASA_US=_EASA_US + _rocketsUS + _rocketsBLU;
//{_EASA_US pushBack _x}forEach _rocketsUS;
//{_EASA_US pushBack _x}forEach _rocketsBLU;

_EASA_UK=_EASA_UK + _rocketsUK + _rocketsBLU;
//{_EASA_UK pushBack _x}forEach _rocketsUK;
//{_EASA_UK pushBack _x}forEach _rocketsBLU;



//____________________________________________________________________________________________________
//AA
//____________________________________________________________________________________________________

_AAmissilesBLU=[];

_AAmissilesBLU pushBack "CUP_PylonPod_1Rnd_AIM_9L_LAU_Sidewinder_M";		//130/85/10 5k
_AAmissilesBLU pushBack "CUP_PylonPod_2Rnd_AIM_9L_LAU_Sidewinder_M";	//130/85/10 5k

_AAmissilesBLU pushBack "FIR_AIM9M_LAU115_P_1rnd_M";					//250/120/8 2+16
_AAmissilesBLU pushBack "FIR_AIM9M_LAU115_P_2rnd_M";					//250/120/8 2+16




_AAmissilesUS=[];

_AAmissilesUS pushBack "FIR_AIM9X_LAU115_P_1rnd_M";					//250/120/8 2+16
_AAmissilesUS pushBack "FIR_AIM9X_LAU115_P_2rnd_M";				//250/120/8 2+16

_AAmissilesUS pushBack "FIR_AIM9X_P_F23A_3rnd_M";					//250/120/8 2+16
_AAmissilesUS pushBack "FIR_AIM9X_EWP_4rnd_M";						//250/120/8 2+16

_AAmissilesUS pushBack "CUP_PylonPod_1Rnd_AIM_120_AMRAAM_M";		//170/115/12 5k 8+16
_AAmissilesUS pushBack "CUP_PylonPod_1Rnd_AIM_120_AMRAAM_INT_M";	//200/125/13 5k 8+16
_AAmissilesUS pushBack "CUP_PylonPod_2Rnd_AIM_120_AMRAAM_M";		//200/125/13 5k 8+16
_AAmissilesUS pushBack "PylonRack_Missile_AMRAAM_C_x1";			//200/125/13 12k
_AAmissilesUS pushBack "PylonRack_Missile_AMRAAM_C_x2";			//200/125/13 12k
_AAmissilesUS pushBack "PylonRack_Missile_AMRAAM_D_x1";			//200/125/13 13k
_AAmissilesUS pushBack "PylonRack_Missile_AMRAAM_D_x2";			//200/125/13 13k
_AAmissilesUS pushBack "FIR_AIM120A_LAU115_P_1rnd_M";				//280/140/13 8+16 AMRAAM
_AAmissilesUS pushBack "FIR_AIM120A_LAU115_P_2rnd_M";				//280/140/13 8+16 AMRAAM
_AAmissilesUS pushBack "FIR_AIM120B_LAU115_P_1rnd_M";				//280/140/13 8+16 AMRAAM
_AAmissilesUS pushBack "FIR_AIM120_LAU115_P_1rnd_M";				//280/140/13 8+16 AMRAAM
_AAmissilesUS pushBack "FIR_AIM120_LAU115_P_2rnd_M";				//280/140/13 8+16 AMRAAM
_AAmissilesUS pushBack "FIR_AIM120_P_AMBER_2rnd_M";				//280/140/13 8+16 AMRAAM
_AAmissilesUS pushBack "FIR_AIM120_P_F23A_3rnd_M";					//280/140/13 8+16 AMRAAM
_AAmissilesUS pushBack "FIR_AIM120_EWP_4rnd_M";					//280/140/13 8+16 AMRAAM

_AAmissilesUS pushBack "FIR_AIM7E_P_1rnd_M";						//250/120/13 8+16  10
_AAmissilesUS pushBack "FIR_AIM7F_P_1rnd_M";						//250/120/13 8+16  11.5
_AAmissilesUS pushBack "FIR_AIM7_P_1rnd_M";						//250/120/13 8+16  13

_AAmissilesUS pushBack "FIR_AIM54_LAU93_P_1rnd_M";					//400/300/10 8+16 Phoenix


_EASA_US=_EASA_US + _AAmissilesBLU +_AAmissilesUS;
//{_EASA_US pushBack _x}forEach _AAmissilesBLU;
//{_EASA_US pushBack _x}forEach _AAmissilesUS;


_AAmissilesUK=[];
_AAmissilesUK pushBack "FIR_AIM9P_P_1rnd_M";				//250/120/8 2+16 
_AAmissilesUK pushBack "FIR_AIM9P_P_2rnd_M";				//250/120/8 2+16 
_AAmissilesUK pushBack "FIR_IRIS_T_P_1rnd_M";				//250/120/8 2+16 
_AAmissilesUK pushBack "PylonRack_1Rnd_AAA_missiles";		//200/100/7 2+16 ASRAAM
_AAmissilesUK pushBack "FIR_AIM132_P_1rnd_M";				//250/120/8 2+8+16	ASRAAM
_AAmissilesUK pushBack "FIR_Skyflash_P_1rnd_M";			//250/120/13 8+16
_AAmissilesUK pushBack "FIR_Meteor_P_1rnd_M";				//280/140/13 8+16



_EASA_UK=_EASA_UK + _AAmissilesBLU+_AAmissilesUK;
//{_EASA_UK pushBack _x}forEach _AAmissilesBLU;
//{_EASA_UK pushBack _x}forEach _AAmissilesUK;



_AAmissilesRU=[];

_AAmissilesRU pushBack "CUP_PylonPod_2Rnd_Igla_M";			//50/40/8 2+16 5.2k or
_AAmissilesRU pushBack "pook_9M38_Heli_2xmag";				//70/40/8 16+2 5.2k mr
_AAmissilesRU pushBack "pook_9M38_Heli_4xmag";				//70/40/8 16+2 5.2k mr
_AAmissilesRU pushBack "pook_mag_R3_AA";					//100/50/18 5k 16+2 mr	
_AAmissilesRU pushBack "pook_mag_R23T_AA";					//100/60/8 28k 16+2 mr
_AAmissilesRU pushBack "pook_mag_R27T_AA";					//100/60/8 25k 16+2 mr
_AAmissilesRU pushBack "FIR_R27ER_P_1rnd_M";				//280/140/13 8+16 13k or
_AAmissilesRU pushBack "FIR_R27ET_P_1rnd_M";				//280/140/13 8+16 13k or
_AAmissilesRU pushBack "pook_mag_R60_AA";					//100/60/8 5.5k 16+2 mr	
_AAmissilesRU pushBack "pook_mag_R60_x2_L";
_AAmissilesRU pushBack "pook_mag_R60_x2_R";
_AAmissilesRU pushBack "FIR_R60M_P_1rnd_M";				//250/120/8 2+16 5k



_AAmissilesRU pushBack "pook_mag_R73_AA";					//110/40/7 8k 16+2 mr
_AAmissilesRU pushBack "pook_mag_R73_x2_L";
_AAmissilesRU pushBack "pook_mag_R73_x2_R";
_AAmissilesRU pushBack "CUP_PylonPod_1Rnd_R73_Vympel";		//140/90/8 2+16 6k mr
_AAmissilesRU pushBack "PylonMissile_Missile_AA_R73_x1";	//140/95/10 2+16 6k or
_AAmissilesRU pushBack "FIR_R73_P_1rnd_M";					//250/120/8 2+16 6k or
_AAmissilesRU pushBack "PylonMissile_Missile_AA_R77_x1";	//200/125/13 8+16 12k or
_AAmissilesRU pushBack "FIR_R77_P_1rnd_M";					//280/140/13 8+16 16k or
_AAmissilesRU pushBack "pook_mag_R33_AA";					//480/80/10 50k 16+2 mr
_AAmissilesRU pushBack "pook_mag_R33_AA_4x";				//480/80/10 50k 16+2 mr
_AAmissilesRU pushBack "pook_mag_R37M_AA";					//480/80/10 99k 16+2 mr	
_AAmissilesRU pushBack "pook_mag_R37M_AA_4x";				//480/80/10 99k 16+2 mr	
_AAmissilesRU pushBack "pook_mag_R40T_AA";					//480/80/10 25k 16+2 mr
_AAmissilesRU pushBack "pook_mag_R40R_AA";					//480/80/10 75k 16+2 mr



_EASA_RU=_EASA_RU + _AAmissilesRU;
//{_EASA_RU pushBack _x}forEach _AAmissilesRU;




//____________________________________________________________________________________________________
//BOMBS
//____________________________________________________________________________________________________

_BOMBSboth=[];

_BOMBSboth pushBack "PylonRack_4Rnd_BombDemine_01_F";




_BOMBSblu=[];

_BOMBSblu pushBack "FIR_AGM154A_P_1rnd_M";
_BOMBSblu pushBack "FIR_Scalpel_P_1rnd_M";
_BOMBSblu pushBack "FIR_Scalpel_P_3rnd_M";

_BOMBSblu pushBack "PylonRack_Bomb_SDB_x4";

_BOMBSblu pushBack "FIR_GBU39_P_4rnd_M";
_BOMBSblu pushBack "FIR_GBU39_EWP_4rnd_M";
_BOMBSblu pushBack "FIR_GBU39_EWP_6rnd_M";
_BOMBSblu pushBack "FIR_GBU53_P_4rnd_M";
_BOMBSblu pushBack "FIR_GBU53_EWP_4rnd_M";
_BOMBSblu pushBack "FIR_GBU53_EWP_6rnd_M";

_BOMBSblu pushBack "PylonMissile_Bomb_GBU12_x1";
_BOMBSblu pushBack "PylonMissile_1Rnd_Bomb_04_F";

_BOMBSblu pushBack "UK3CB_BAF_PylonMissile_1Rnd_GBU12";
_BOMBSblu pushBack "CUP_PylonPod_1Rnd_GBU12_M";
_BOMBSblu pushBack "CUP_PylonPod_2Rnd_GBU12_M";
_BOMBSblu pushBack "CUP_PylonPod_3Rnd_GBU12_M";
_BOMBSblu pushBack "PylonMissile_1Rnd_Mk82_F";
_BOMBSblu pushBack "CUP_PylonPod_1Rnd_Mk82_M";
_BOMBSblu pushBack "CUP_PylonPod_2Rnd_Mk82_M";
_BOMBSblu pushBack "CUP_PylonPod_3Rnd_Mk82_M";
_BOMBSblu pushBack "PylonRack_Bomb_GBU12_x2";

_BOMBSblu pushBack "FIR_GBU12_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU12_P_3rnd_M";
_BOMBSblu pushBack "FIR_EGBU12_P_3rnd_M";
_BOMBSblu pushBack "FIR_PavewayIV_P_1rnd_M";
_BOMBSblu pushBack "FIR_AGM154C_P_1rnd_M";

_BOMBSblu pushBack "FIR_GBU12_PW1_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU12_Navy_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU12_P_2rnd_M";
_BOMBSblu pushBack "FIR_GBU12_Navy_P_2rnd_M";
_BOMBSblu pushBack "FIR_GBU12_Navy_P_3rnd_M";
_BOMBSblu pushBack "FIR_EGBU12_P_1rnd_M";
_BOMBSblu pushBack "FIR_EGBU12_P_2rnd_M";
_BOMBSblu pushBack "FIR_EGBU12_Navy_P_2rnd_M";

_BOMBSblu pushBack "FIR_GCS1_P_1rnd_M";

//,"FIR_GBU38_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU38_F15SE_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU38_P_2rnd_M";
_BOMBSblu pushBack "FIR_GBU38_P_3rnd_M";

//,"FIR_GBU38_Navy_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU38_P_F14_1rnd_M";
_BOMBSblu pushBack "FIR_GBU38_Navy_P_2rnd_M";
_BOMBSblu pushBack "FIR_GBU38_Navy_EWP_2rnd_M";

//,"FIR_GBU54_P_1rnd_M"
_BOMBSblu pushBack "FIR_GBU54_F15SE_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU54_P_2rnd_M";
_BOMBSblu pushBack "FIR_GBU54_P_3rnd_M";

_BOMBSblu pushBack "FIR_GBU54_Navy_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU54_Navy_P_2rnd_M";
_BOMBSblu pushBack "FIR_GBU54_Navy_EWP_2rnd_M";

_BOMBSblu pushBack "FIR_KGGB_P_1rnd_M";


_BOMBSblu pushBack "FIR_Mk82_GP_P_1rnd_M";
_BOMBSblu pushBack "FIR_Mk82_GP_P_3rnd_M";
_BOMBSblu pushBack "FIR_Mk82_GP_TER9A_P_3rnd_M";
_BOMBSblu pushBack "FIR_Mk82_GP_P_6rnd_M";

_BOMBSblu pushBack "FIR_Mk82_GP_Navy_P_1rnd_M";
_BOMBSblu pushBack "FIR_Mk82_GP_P_F14_1rnd_M";
_BOMBSblu pushBack "FIR_Mk82_GP_Navy_P_2rnd_M";
_BOMBSblu pushBack "FIR_Mk82_GP_Navy_P_6rnd_M";

_BOMBSblu pushBack "FIR_Mk82_snakeye_P_1rnd_M";
_BOMBSblu pushBack "FIR_Mk82_snakeye_P_3rnd_M";
_BOMBSblu pushBack "FIR_Mk82_snakeye_P_6rnd_M";

_BOMBSblu pushBack "FIR_Mk82_snakeye_Navy_P_1rnd_M";
_BOMBSblu pushBack "FIR_Mk82_snakeye_P_F14_1rnd_M";
_BOMBSblu pushBack "FIR_Mk82_snakeye_Navy_P_2rnd_M";

_BOMBSblu pushBack "FIR_Mk82_AIR_P_1rnd_M";
_BOMBSblu pushBack "FIR_Mk82_AIR_P_3rnd_M";
_BOMBSblu pushBack "FIR_Mk82_AIR_P_6rnd_M";

_BOMBSblu pushBack "FIR_GBU16_Navy_P_1rnd_M";
_BOMBSblu pushBack "FIR_AGM62_Walleye1_P_1rnd_M";
_BOMBSblu pushBack "FIR_AGM62_Walleye1ER_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU16_Navy_P_F14_1rnd_M";
_BOMBSblu pushBack "FIR_GBU16_Navy_P_2rnd_M";
_BOMBSblu pushBack "FIR_GBU32_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU32_Navy_P_F14_1rnd_M";
_BOMBSblu pushBack "FIR_GBU32_Navy_P_2rnd_M";
_BOMBSblu pushBack "FIR_GBU55_P_1rnd_M";
_BOMBSblu pushBack "FIR_gbu55_F15SE_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU55_Navy_P_1rnd_M";
_BOMBSblu pushBack "FIR_gbu55_Navy_EWP_1rnd_M";
_BOMBSblu pushBack "FIR_gbu55_Navy_P_2rnd_M";
_BOMBSblu pushBack "FIR_Mk83_GP_Navy_P_1rnd_M";
_BOMBSblu pushBack "FIR_Mk83_GP_Navy_P_F14_1rnd_M";
_BOMBSblu pushBack "FIR_Mk83_GP_Navy_P_2rnd_M";

_BOMBSblu pushBack "FIR_Mk83_AIR_Navy_P_1rnd_M";
_BOMBSblu pushBack "FIR_Mk83_AIR_Navy_P_F14_1rnd_M";
_BOMBSblu pushBack "FIR_Mk83_AIR_Navy_P_2rnd_M";


_BOMBSblu pushBack "FIR_GBU24A_BLU118_P_1rnd_M";

_BOMBSblu pushBack "FIR_AGM62_Walleye2ER_P_1rnd_M";
_BOMBSblu pushBack "FIR_AGM62_Walleye2_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU10_PW1_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU10_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU24A_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU24B_P_1rnd_M";
//_BOMBSblu pushBack "FIR_GBU24_EWP_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU31_P_1rnd_M";
_BOMBSblu pushBack "FIR_GBU31_Navy_P_1rnd_M";
//_BOMBSblu pushBack "FIR_GBU31_EWP_P_1rnd_M";
_BOMBSblu pushBack "FIR_Mk84_GP_P_1rnd_M";
_BOMBSblu pushBack "FIR_Mk84_GP_Navy_P_1rnd_M";
_BOMBSblu pushBack "FIR_Mk84_GP_P_F14_1rnd_M";
_BOMBSblu pushBack "FIR_Mk84_AIR_P_1rnd_M";

_BOMBSblu pushBack "FIR_MW1_P_1rnd_M";
_BOMBSblu pushBack "FIR_CBU87_P_1rnd_M";
_BOMBSblu pushBack "FIR_CBU87_P_BRU57_2rnd_M";
_BOMBSblu pushBack "FIR_CBU87_F15E_Demo_P_6rnd_M";
//,"FIR_CBU100_P_1rnd_M"
_BOMBSblu pushBack "FIR_CBU100_P_F14_1rnd_M";
_BOMBSblu pushBack "FIR_CBU100_P_TripleRack_3rnd_M";
_BOMBSblu pushBack "FIR_CBU100_P_6rnd_M";
_BOMBSblu pushBack "FIR_CBU103_P_1rnd_M";
_BOMBSblu pushBack "FIR_CBU103_P_BRU57_2rnd_M";
_BOMBSblu pushBack "FIR_BLU107_P_3rnd_M";
_BOMBSblu pushBack "PylonMissile_1Rnd_BombCluster_01_F";
_BOMBSblu pushBack "PylonRack_2Rnd_BombCluster_01_F";
_BOMBSblu pushBack "PylonMissile_1Rnd_BombCluster_02_F";
_BOMBSblu pushBack "PylonMissile_1Rnd_BombCluster_03_F";
//_BOMBSblu pushBack "PylonMissile_2Rnd_BombCluster_03_F";



_BOMBSopf=[

"pook_FAB100_x1"
,"pook_FAB100_x2"
,"pook_FAB100_x3"
,"pook_FAB100_x4"
,"pook_FAB100_x6"

//,"pook_KAB250_x1"
//,"pook_KAB250_x2"
,"CUP_PylonPod_1Rnd_KAB250_M"
,"FIR_KAB250L_P_1rnd_M"

,"su24_1Rnd_FAB250"
,"su24_2Rnd_FAB250"
,"su24_3Rnd_FAB250"
,"su24_4Rnd_FAB250"
,"su24_6Rnd_FAB250"
,"tu22_9Rnd_FAB250"

,"CUP_PylonPod_1Rnd_FAB250_M"
,"FIR_FAB250_P_1rnd_M"
,"pook_FAB250_x1"
,"pook_FAB250_x2"
,"pook_FAB250_x3"
,"pook_FAB250_x4"
,"pook_FAB250_x6"

,"PylonMissile_Bomb_KAB250_x1"

,"pook_KAB500L_x1"
,"pook_KAB500SE_x1"
,"pook_KAB500KR_x1"

,"pook_FAB500_x1"
,"pook_FAB500_x2"
,"pook_FAB500_x4"
,"pook_OFAB500_x1"
,"pook_OFAB500_x2"
,"pook_ODAB500_x1"
,"pook_ODAB500_x2"

,"pook_FAB500sh_x1"
,"pook_FAB500sh_x2"
,"FIR_KAB500L_P_1rnd_M"
,"FIR_KAB500Kr_P_1rnd_M"
,"FIR_KAB500SE_P_1rnd_M"
,"pook_KAB1500L_x1"
,"pook_KAB1500KR_x1"
,"pook_FAB1500_x1"


,"pook_RBK500AT_x1"
,"pook_RBK500AT_x2"
,"pook_RBK500AO_x1"
,"pook_RBK500AO_x2"
,"pook_RBK250AO_x1"
,"pook_RBK250AO_x2"
,"pook_RBK500SFU_x1"
,"pook_RBK500SFU_x2"
,"pook_BetAB500_x1"
,"pook_BetAB500_x2"
,"FIR_RBK250_P_1rnd_M"
,"FIR_RBK500_SPBE_D_P_1rnd_M"
,"pook_ZB500_x1"
,"pook_ZB500_x2"
,"pook_ZB250_x1"
,"pook_ZB250_x2"
,"PylonMissile_1Rnd_BombCluster_02_F"
,"PylonMissile_1Rnd_BombCluster_02_cap_F"


];


//_EASA_RU=_EASA_RU+_BOMBSboth+_BOMBSopf;

{_EASA_RU pushBack _x}forEach _BOMBSboth;
{_EASA_RU pushBack _x}forEach _BOMBSopf;


//_EASA_US=_EASA_US+_BOMBSboth+_BOMBSblu;

{_EASA_US pushBack _x}forEach _BOMBSboth;
{_EASA_US pushBack _x}forEach _BOMBSblu;

//_EASA_UK=_EASA_UK+_BOMBSboth+_BOMBSblu;

{_EASA_UK pushBack _x}forEach _BOMBSboth;
{_EASA_UK pushBack _x}forEach _BOMBSblu;



//____________________________________________________________________________________________________
//AT MISSILES
//____________________________________________________________________________________________________

_ATmissileBLU=[

"CUP_PylonPod_2Rnd_AGM114K_Hellfire_II_M"
,"CUP_PylonPod_2Rnd_AGM114L_Hellfire_II_M"
,"CUP_PylonPod_4Rnd_AGM114K_Hellfire_II_M"
,"CUP_PylonPod_4Rnd_AGM114L_Hellfire_II_M"
,"PylonMissile_1Rnd_LG_scalpel"
,"PylonRack_1Rnd_LG_scalpel"
,"PylonRack_3Rnd_LG_scalpel"
,"PylonRack_4Rnd_LG_scalpel"
,"Tornado_AWS_1Rnd_LG_scalpel"
,"Tornado_AWS_3Rnd_LG_scalpel"
,"Tornado_AWS_4Rnd_LG_scalpel"

,"UK3CB_BAF_PylonRack_2Rnd_Hellfire_K"
,"UK3CB_BAF_PylonRack_4Rnd_Hellfire_K"

,"UK3CB_BAF_PylonRack_4Rnd_Hellfire_L"
,"UK3CB_BAF_PylonRack_2Rnd_Hellfire_N"
,"UK3CB_BAF_PylonRack_4Rnd_Hellfire_N"

,"CUP_PylonPod_1Rnd_AGM65_Maverick_M"
,"CUP_PylonPod_3Rnd_AGM65_Maverick_M"

,"FIR_Brimstone_std_P_3rnd_M"
,"FIR_Brimstone_type1_P_3rnd_M"
,"FIR_Brimstone_type2_P_3rnd_M"
,"FIR_Brimstone_DM_std_P_3rnd_M"
,"FIR_Brimstone_DM_type1_P_3rnd_M"
,"FIR_Brimstone_DM_type2_P_3rnd_M"

,"PylonMissile_Missile_HARM_x1"
,"PylonMissile_Missile_HARM_INT_x1"
,"PylonRack_Missile_HARM_x1"
,"FIR_AGM65H_P_1rnd_M"
,"FIR_AGM65H_P_3rnd_M"
,"FIR_AGM65D_P_1rnd_M"
,"FIR_AGM65D_P_3rnd_M"
,"FIR_AGM65B_P_1rnd_M"
,"FIR_AGM65B_P_3rnd_M"
,"FIR_AGM65D_P_2rnd_M"
,"FIR_AGM65H_P_2rnd_M"

,"FIR_AGM65F_P_1rnd_M"
,"FIR_AGM65G_P_1rnd_M"
,"FIR_AGM65K_P_1rnd_M"
,"FIR_AGM65E_P_1rnd_M"
,"FIR_AGM65E2_P_1rnd_M"
,"FIR_AGM65L_P_1rnd_M"

,"FIR_AGM88_P_1rnd_M"

//,"FIR_AGM84_P_1rnd_M"
,"FIR_AGM84D_P_1rnd_M"
,"FIR_AGM84E_P_1rnd_M"
,"FIR_AGM84K_P_1rnd_M"
,"FIR_ASM1_P_1rnd_M"
,"FIR_ASM2_P_1rnd_M"

,"Tornado_AWS_StormShadow_P_1rnd_M"

,"FIR_AGM123_P_1rnd_M"
,"FIR_AGM158B_P_1rnd_M"


];

_ATmissileOPF=[

"pook_mag_9K120F"
,"pook_mag_9K120Fx4"
,"pook_mag_9K120Fx2"
,"CUP_PylonPod_2Rnd_AT2_M"
,"CUP_PylonPod_2Rnd_AT6_M"
,"CUP_PylonPod_4Rnd_Ataka_Empty_M"
,"CUP_PylonPod_2Rnd_Ataka_M"
,"CUP_PylonPod_6Rnd_Vikhr_M"
,"pook_mag_9K120"
,"pook_mag_9K120x4"
,"pook_mag_9K120x2"

,"pook_mag_KH28"
,"pook_mag_KH31P"
,"pook_mag_KH38_L"
,"pook_mag_KH38_T"
,"pook_mag_KH38_R"
,"pook_mag_KH38_G"

,"pook_mag_KH25MP"

,"PylonMissile_Missile_AGM_KH25_x1"
,"PylonMissile_Missile_AGM_KH25_INT_x1"
,"pook_mag_KH31"
,"CUP_PylonPod_1Rnd_Kh29_M"
,"pook_mag_KH23M"

,"pook_mag_KH25MTP"
,"pook_mag_KH25ML"
,"pook_mag_KH25MT"
,"pook_mag_KH25MAE"
,"pook_mag_KH25MSE"
,"pook_mag_KH59"
,"pook_mag_KH59M"
,"pook_mag_KH59MK2"
,"pook_mag_KH35"
,"PylonMissile_Missile_KH58_x1"
,"PylonMissile_Missile_KH58_INT_x1"

,"FIR_9K121_P_8rnd_M"
,"FIR_Kh25ML_P_1rnd_M"
,"FIR_Kh25MT_P_1rnd_M"
,"FIR_Kh25MTP_P_1rnd_M"
,"FIR_Kh25MS_P_1rnd_M"
,"pook_mag_KH61"
,"FIR_Kh25MPU_P_1rnd_M"
,"pook_mag_KH29D"
,"pook_mag_KH29L"
,"pook_mag_KH58"
,"tu95_1Rnd_Kh65"
,"tu95_2Rnd_Kh65"
,"tu95_3Rnd_Kh65"
,"tu95_1Rnd_Kh101"
,"tu95_2Rnd_Kh101"
,"tu95_1Rnd_3M80"
,"tu95_1Rnd_Kh22"
,"tu22_1Rnd_Kh22"
,"tu95_1Rnd_Kh32"
,"tu22_1Rnd_Kh32"

,"tu95_1Rnd_Kh15S"
,"tu95_1Rnd_Kh15P"
,"tu16_1Rnd_KSR2"
,"tu16_1Rnd_K10"
,"tu95_1Rnd_Kh55"
,"FIR_Kh29_P_1rnd_M"
,"FIR_Kh29T_P_1rnd_M"
,"FIR_Kh29D_P_1rnd_M"

];


//_EASA_RU=_EASA_RU+_ATmissileOPF;
{_EASA_RU pushBack _x}forEach _ATmissileOPF;

//_EASA_US=_EASA_US+_ATmissileBLU;
{_EASA_US pushBack _x}forEach _ATmissileBLU;


//_EASA_UK=_EASA_UK+_ATmissileBLU;
{_EASA_UK pushBack _x}forEach _ATmissileBLU;

/*
*/
//hint str _EASA_RU;



_allPylonMags3=[];


if (_pID in _USContainer) then {
	
	
	_allPylonMags3=_EASA_US;
	
};
if (_pID in _UKContainer) then {
	//_sorted=_EASA_UK;
	_allPylonMags3=_EASA_UK;
	
	
};

if (_pID in _OpforContainer) then {
//if ( _sideID isEqualto "EAST") then {	
	
	_allPylonMags3=_EASA_RU;
	
	

};


//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________
//______________________________________________________________________________________________________________________________________________


_Etrack = _veh;
		showCinemaBorder false;
		
		_pitch = 0;
		_Edir = 0;
		_Edistance = 15.5;
		_Epos = [(sin _Edir)*(cos _pitch * _Edistance),(cos _pitch) * (cos _Edir * _Edistance),0.1-(sin _pitch * _Edistance)];
		
		EASA_CTI_UnitsCamera = "camera" camCreate getPos _Etrack;
		EASA_CTI_UnitsCamera camSetTarget _Etrack;
		EASA_CTI_UnitsCamera camSetRelPos _Epos;
		EASA_CTI_UnitsCamera camCommit 0;
		EASA_CTI_UnitsCamera cameraEffect ["Internal", "back"];



_sideID= str cti_Client_SideJoined;
_pID=str player;
_EASAvar="giveDATAtoEASA"+_sideID+_pID;
missionNamespace setvariable [_EASAvar,0];

_type = typeOf (vehicle player);

//_type = typeOf _veh;


_pylons = [];
_rearmPrice = 0;
_oldpylons = _veh getVariable "_pylons";

//--Check is it first EASA for veh or no. If it is no a first EASA, copy old data--
if(!(isNil '_oldpylons' )) then { 
	if (count _oldpylons > 0) then {
		_pylons = +_oldpylons;
		_rearmPrice = round((((missionNamespace getVariable _type) select QUERYUNITPRICE)/(missionNamespace getVariable "cti_C_UNITS_SUPPORT_REARM_PRICE"))*1.25);
		_rearmPrice = round((_rearmPrice * (count _pylons)) / 2);
	};
};

_ix = 0;
private _allPylons = "true" configClasses (
		configFile 
		>> 
		"CfgVehicles" 
		>> 
		typeOf _veh
		>> 
		"Components" 
		>> 
		"TransportPylonsComponent" 
		>> 
		"pylons"
		) apply {configName _x};



{
	_strText = "";
	_strSubText = getText (configFile >> "CfgMagazines" >> (getPylonMagazines _veh) select _ix >> "displayName");
	for "_i" from 0 to (count _pylons) - 1 do {			
		if(((_pylons select _i) select 0) == _x) exitWith {
			_strText = format["%1 (%2)", _x, getText (configFile >> "CfgMagazines" >> (_pylons select _i) select 1 >> "displayName")];			
		};
	};	
	
	lbAdd[230033, format ["%1 (%2)", _x, _strSubText]];
	
	lbSetTooltip [230033, _ix, _strSubText];
	
	
	
	
	
	
	if(_strText != "") then {
		lbSetColor [230033, _ix, [0.9333, 0.8980, 0.5451, 0.9]];
	};
	
	lbSetData[230033, _ix, _x];
	_ix = _ix + 1;
} foreach _allPylons;

//hint parseText(localize 'STR_WF_INFO_EASA_HELP');
	

lbAdd[230035, "FALSE"];
lbAdd[230035, "TRUE"];


lbSetCurSel [230035, 0];

if(count allTurrets [_veh, true] == 0) then {
	lbSetCurSel [230035, 1];
	ctrlEnable[230035, false];
	};

ctrlEnable[22004, false];
ctrlSetText [230005, "$" + str(_rearmPrice)];

ctrlEnable[230007 , false];

if(!(isNil '_oldpylons' ) ) then { 
	if (count _oldpylons > 0) then {	
		ctrlSetText [230006,"$" + str(round(_rearmPrice / 2))];
		if(round(_rearmPrice / 2) <= Call cti_CL_FNC_GetPlayerFunds && (count _pylons > 0)) then {
			ctrlEnable[230007, true];
		}
		else {
			ctrlEnable[230007, false];
		};
	};
} else {
	ctrlEnable[230007, false];
	ctrlSetText [230006,"$0"];
};

//diag_log format["_pylons after check = %1", _pylons];

while {alive player && dialog} do {
	sleep 0.1;
	
	if (side player != cti_Client_SideJoined) exitWith {closeDialog 0};
	if !(dialog) exitWith {};
	
	
	if (WF_MenuAction == 111) then {
		WF_MenuAction = -1;		
		
		_k = 0;
		lbClear 230034;
		{
			if(_x != "CUP_PylonPod_ANAAQ_28" && _x != "CUP_PylonPod_ALQ_131"&& _x != "cwr3_PylonMissile_1Rnd_B61"&& _x != "cwr3_PylonMissile_1Rnd_RN28") then {
				//lbAdd[230034, getText (configFile >> "CfgMagazines" >> _x >> "displayName")];				
				
				_displayName=getText (configFile >> "CfgMagazines" >> _x >> "displayName");
				
				_ammoclass = getText(configFile >> 'CfgMagazines' >> _x >> 'ammo');
				
				_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'missileLockMinDistance');	//Defines min range a lock can be obtained
				_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'missileLockMaxDistance');	//Defines max range a lock can be obtained
				
				if (_ammostat_minLock == 0) then {	
				_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'ActiveRadar'>>'AirTarget'>>'minRange');	
					
					if (_ammostat_minLock == 0) then {	
					_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'ActiveRadar'>>'GroundTarget'>>'minRange');	
				
						if (_ammostat_minLock == 0) then {	
						_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'IRSensorComponent'>>'AirTarget'>>'minRange');	
				
							if (_ammostat_minLock == 0) then {	
							_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'IRSensorComponent'>>'GroundTarget'>>'minRange');					
				
								if (_ammostat_minLock == 0) then {	
								_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'LaserSensor'>>'AirTarget'>>'minRange');	
						
									if (_ammostat_minLock == 0) then {	
									_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'LaserSensor'>>'GroundTarget'>>'minRange');	
									
										if (_ammostat_minLock == 0) then {	
										_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'NVSensorComponent'>>'AirTarget'>>'minRange');	
								
											if (_ammostat_minLock == 0) then {	
											_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'NVSensorComponent'>>'GroundTarget'>>'minRange');	
												
												if (_ammostat_minLock == 0) then {	
												_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'VisualSensorComponent'>>'Components'>>'NVSensorComponent'>>'AirTarget'>>'minRange');	
												
													if (_ammostat_minLock == 0) then {	
													_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'VisualSensorComponent'>>'Components'>>'NVSensorComponent'>>'GroundTarget'>>'minRange');	
												
													};
												};
											};
										};
									};
								};
							};
						};
					};
				};
				
				
				
				if (_ammostat_maxLock == 0) then {	
				_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'ActiveRadar'>>'AirTarget'>>'maxRange');	
					
					if (_ammostat_maxLock == 0) then {	
					_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'ActiveRadar'>>'GroundTarget'>>'maxRange');	
				
						if (_ammostat_maxLock == 0) then {	
						_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'IRSensorComponent'>>'AirTarget'>>'maxRange');	
				
							if (_ammostat_maxLock == 0) then {	
							_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'IRSensorComponent'>>'GroundTarget'>>'maxRange');	
						
								if (_ammostat_maxLock == 0) then {	
								_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'LaserSensor'>>'AirTarget'>>'maxRange');	
						
									if (_ammostat_maxLock == 0) then {	
									_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'LaserSensor'>>'GroundTarget'>>'maxRange');	
										
										if (_ammostat_maxLock == 0) then {	
										_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'NVSensorComponent'>>'AirTarget'>>'maxRange');	
								
											if (_ammostat_maxLock == 0) then {	
											_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'SensorsManagerComponent'>>'Components'>>'NVSensorComponent'>>'GroundTarget'>>'maxRange');						
												
												if (_ammostat_maxLock == 0) then {	
												_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'VisualSensorComponent'>>'Components'>>'NVSensorComponent'>>'AirTarget'>>'maxRange');	
												
													if (_ammostat_maxLock == 0) then {	
													_ammostat_maxLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'Components' >>'VisualSensorComponent'>>'Components'>>'NVSensorComponent'>>'GroundTarget'>>'maxRange');	
												
													};
												};
											};
										};
									};
								};
							};
						};
					};
				};
				
				
				
				/*
				if (_ammostat_minLock == 0) then {	
				_parentslist=[ configFile >> 'CfgAmmo' >> _ammoclass, true ] call BIS_fnc_returnParents; 
				_Pclass=_parentslist#1;
				_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _Pclass >> 'missileLockMinDistance');	
					if (_ammostat_minLock == 0) then {
					_Pclass=_parentslist#2;
					_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _Pclass >> 'missileLockMinDistance');	
						if (_ammostat_minLock == 0) then {
						_Pclass=_parentslist#3;
						_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _Pclass >> 'missileLockMinDistance');	
							if (_ammostat_minLock == 0) then {
							_Pclass=_parentslist#4;
							_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _Pclass >> 'missileLockMinDistance');	
							
							//if still 0 crawl weapon baseclass
							_Wparentslist=[ configFile >> 'CfgMagazines' >> _x , true ] call BIS_fnc_returnParents; 
							_Px=_Wparentslist#1;
							_ammoclassB = getText(configFile >> 'CfgMagazines' >> _Px >> 'ammo');
							
							_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _ammoclassB >> 'missileLockMinDistance');
							
							if (_ammostat_minLock == 0) then {
							
								_parentslistB=[ configFile >> 'CfgAmmo' >> _ammoclassB, true ] call BIS_fnc_returnParents; 
								_PclassB=_parentslistB#1;
								_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _PclassB >> 'missileLockMinDistance');	
								
								if (_ammostat_minLock == 0) then {
								
									_PclassB=_parentslistB#2;
									_ammostat_minLock = getNumber(configFile >> 'CfgAmmo' >> _PclassB >> 'missileLockMinDistance');	
								
								
									};
								
								};
							};
						};
					};
				
				};
				
				*/
				_aSTRmin=str _ammostat_minLock;
				_aSTRmax=str _ammostat_maxLock;
				
				_aSubtext=_aSTRmin + "|>" + _aSTRmax;
				
				
				_ammostat_price = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'cost');	
				_ammostat_count = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'count');	
				
				/*
				if (_ammostat_count == 0) then {
				_PRICE=(_ammostat_price*0.1);
				_pSubtext=str _PRICE ;
				_pSubtext=_pSubtext +"$";
				}else{
				_PRICE=(_ammostat_price*0.1*_ammostat_count);
				_pSubtext=str _PRICE;
				_pSubtext=_pSubtext +"$";
				};
				*/
				
				_PRICE=(_ammostat_price*0.1);
				_pSubtext=str _PRICE ;
				_pSubtext=_pSubtext +"$";
				
				lbAdd[230034, format ["%1 (%2)", _displayName, _pSubtext]];
				
	

	
				
				//TOOLTIPSTUFF
				
								
				_ammostat_lockType = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'weaponLockSystem');	
				_locktype0="LOCK TYPE:";
				_locktype1=str _ammostat_lockType;
				
				
				if (_locktype1 isEqualto "") then {//CHECK OLD SYSTEM
				
				_ammostat_lockType_nvLock = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'nvLock');	
				_ammostat_lockType_laserLock = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'laserLock');	
				_ammostat_lockType_irLock  = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'irLock');
				
				if (_ammostat_lockType_nvLock == 1) then {
				_locktype1=_locktype1+ " NV "
				
				};
				if (_ammostat_lockType_laserLock == 1) then {
				_locktype1=_locktype1+ " LASER "
				
				};
				if (_ammostat_lockType_irLock == 1) then {
				_locktype1=_locktype1+ " IR "
				
				};
				
				
				
				//_ammostat_lockType_airLock = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'airLock');	//is aa= true
				
				
				/*
				_ammostat_lockType_laserScanner = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'laserScanner');	//for vehicle
				_ammostat_lockType_nvScanner  = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'laserScanner');	//for vehicle
				*/
				
				
				
					
				
				 
				
				//_ammostat_lockType_lockType = getText(configFile >> 'CfgAmmo' >> _ammoclass >> 'lockType');	//0 for all guided weapons
				 
				
				};
				_locktype2 =_locktype0 + _locktype1;
				
				_ammostat_hit = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'hit');
				_hit0="HIT DIRECT:";
				_hit1=str _ammostat_hit;
				_hit2=_hit0 + _hit1;
				
				_BORDER="______________";
				
				_ammostat_ihit = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'indirectHit');	
				_hiti0="HIT INDIRECT:";
				_hiti1=str _ammostat_ihit;
				_hiti2=_hiti0 + _hiti1;
				
				
				_ammostat_ihitRange = getNumber(configFile >> 'CfgAmmo' >> _ammoclass >> 'indirectHitRange');	
				_ammostat_ihitRangeSTR=str _ammostat_ihitRange;
				_iHitrange="RANGE INDIRECT:"+_ammostat_ihitRangeSTR;
				
				
				
				
				
				
				_Lockrange= "Lock (MIN/MAX) ="+_aSubtext;
				
				
				//
				
				//DEBUG
				
				
				//_parentslist=[ configFile >> 'CfgAmmo' >> _ammoclass, true ] call BIS_fnc_returnParents; 
				//_STRparents= str _parentslist;
				
				//_STR_Mag_class=str _x;
				
				//_tSubtext= format['%1<br/>%2<br/>%3<br/>%4',_locktype2,_hit2,_hiti2,_Lockrange]];
				
				_tSubtext=str composeText [
				
				_locktype2
				,toString [13, 10]
				,_hit2
				,toString [13, 10]
				,_BORDER
				,toString [13, 10]
				,_hiti2
				,toString [13, 10]
				,_iHitrange
				,toString [13, 10]
				,_Lockrange
				
				
				
				
				//,toString [13, 10]
				//,_STRparents
				
				//,toString [13, 10]
				//,_STR_Mag_class
				
				
				];
				
				
				//lbSetTooltip [230034, ,format['%1<br/>%2<br/>%3<br/>%4','My Multi-line Tool-tip:','Line 1','Line 2','Line 3']];

	
	
				lbSetTooltip [230034, _k, _tSubtext];
				
				lbSetData [230034, _k, _x];
				_k = _k + 1;
			};			
		//} foreach ((typeOf _veh) getCompatiblePylonMagazines lbData[230033, lbCurSel 230033]);		
		} foreach _allPylonMags3;	
		//} foreach _allPylonMags2;		
		//} foreach _sorted;		
	
	};
	
	/*
	
	if (WF_MenuAction == 111) then {
		WF_MenuAction = -1;		
		_allPylonMags2 = ("count( getArray (_x >> 'hardpoints')) > 0" configClasses (configfile >> "CfgMagazines")) apply {configname _x};
	
		_k = 0;
		lbClear 230034;
		{
			if(_x != "CUP_PylonPod_ANAAQ_28" && _x != "CUP_PylonPod_ALQ_131"&& _x != "cwr3_PylonMissile_1Rnd_B61"&& _x != "cwr3_PylonMissile_1Rnd_RN28") then {
				lbAdd[230034, getText (configFile >> "CfgMagazines" >> _x >> "displayName")];				
				lbSetData [230034, _k, _x];
				_k = _k + 1;
			};			
		} foreach _allPylonMags2 lbData[230033, lbCurSel 230033]);		
	};
	*/
	//_allPylonMags2 = ("count( getArray (_x >> 'hardpoints')) > 0" configClasses (configfile >> "CfgMagazines")) apply {configname _x};
	//hint str _allPylonMags2;	

	
	
	
	
	//--Weapon magazine changed--
	if (WF_MenuAction == 112) then {
		WF_MenuAction = -1;						
		
		_turretPath = [0];
		
		if(lbCurSel 230035 == 0) then {			
			_turretPath = [0];
		}
		else {			
			_turretPath = [];
		};
		
		if(count _pylons > 0) then {
			//--If current pylon already in array do not pushBack to array, else set new value--
			_exist = false;
			
			for "_j" from 0 to (count _pylons) - 1 do {
				if( (_pylons select _j) select 0 == lbData[230033, lbCurSel 230033]) exitWith {
					_exist = true;
					_pylons set [_j, [lbData[230033, lbCurSel 230033], lbData[230034, lbCurSel 230034], true, _turretPath]];
					lbSetColor [230033, lbCurSel 230033, [0.9333, 0.8980, 0.5451, 0.9]];					
				};
			};
			
			if(!_exist) then {
				_pylons pushBack [lbData[230033, lbCurSel 230033], lbData[230034, lbCurSel 230034], true, _turretPath];
				lbSetColor [230033, lbCurSel 230033, [0.9333, 0.8980, 0.5451, 0.9]];				
			};
		}
		else
		{
			_pylons pushBack [lbData[230033, lbCurSel 230033], lbData[230034, lbCurSel 230034], true, _turretPath];
			lbSetColor [230033, lbCurSel 230033, [0.9333, 0.8980, 0.5451, 0.9]];			
		};
		
		_rearmPrice = round((((missionNamespace getVariable _type) select QUERYUNITPRICE)/(missionNamespace getVariable "cti_C_UNITS_SUPPORT_REARM_PRICE"))*1.25);
		_rearmPrice = round((_rearmPrice * (count _pylons)) / 2);		
		ctrlSetText [230005,"$"+str(_rearmPrice)];
		
		if(_rearmPrice <= Call cti_CL_FNC_GetPlayerFunds && (count _pylons > 0)) then {
			ctrlEnable[22004 , true];
		}
		else {
			ctrlEnable[22004 , false];
		};
		
		if(!(isNil '_oldpylons' ) ) then { 
			if (count _oldpylons > 0) then {
				if(round(_rearmPrice / 2) <= Call cti_CL_FNC_GetPlayerFunds && (count _pylons > 0)) then {
					ctrlEnable[230007 , true];
				}
				else {
					ctrlEnable[230007 , false];
				};
			};
		};	
		
		ctrlSetText [230006,"$" + str(round(_rearmPrice / 2))];	
	};
	
	//--Weapon control mode changed--
	if (WF_MenuAction == 114) then {
		WF_MenuAction = -1;		
		
		_turretPath = [0];
		
		if(lbCurSel 230035 == 0) then {			
			_turretPath = [0];
		}
		else {			
			_turretPath = [];
		};
		
		if(count _pylons > 0) then {			
			for "_j" from 0 to (count _pylons) - 1 do {
				if( (_pylons select _j) select 0 == lbData[230033, lbCurSel 230033]) exitWith {					
					_pylons set [_j, [lbData[230033, lbCurSel 230033], lbData[230034, lbCurSel 230034], true, _turretPath]];					
				};
			};
		};		
	};
	
	//--Remove from set--
	if (WF_MenuAction == 102) then {
		WF_MenuAction = -1;
		
		_trysell_message = true;		
		
		if(count _pylons > 0) then {			
			for "_j" from 0 to (count _pylons) - 1 do {
				if( (_pylons select _j) select 0 == lbData[230033, lbCurSel 230033] && lbData[230033, lbCurSel 230033] == lbText[230033, lbCurSel 230033] ) exitWith {					
					_pylons deleteAt _j;
					lbSetColor [230033, lbCurSel 230033, [1, 1, 1, 1]];
					_trysell_message = false;
				};
			};
		};
		
		if(count _pylons > 0) then {
			_rearmPrice = round((((missionNamespace getVariable _type) select QUERYUNITPRICE)/(missionNamespace getVariable "cti_C_UNITS_SUPPORT_REARM_PRICE"))*1.25);
			_rearmPrice = round((_rearmPrice * (count _pylons)) / 2);		
		}
		else {
			_rearmPrice = 0;
		};
		
		ctrlSetText [230005,"$"+str(_rearmPrice)];
		
		if(_rearmPrice <= Call cti_CL_FNC_GetPlayerFunds && (count _pylons > 0)) then {
			ctrlEnable[22004 , true];
		}
		else {
			ctrlEnable[22004 , false];
		};
		
		if(!(isNil '_oldpylons' ) ) then { 
			if (count _oldpylons > 0) then {
				if(round(_rearmPrice / 2) <= Call cti_CL_FNC_GetPlayerFunds && (count _pylons > 0)) then {
					ctrlEnable[230007 , true];
				}
				else {
					ctrlEnable[230007 , false];
				};
			};
		};
		
		ctrlSetText [230006,"$" + str(round(_rearmPrice / 2))];		
		
		if(_trysell_message) then {
			//hint parseText(localize 'STR_WF_EASA_TRYSELL_MESSAGE');
		};		
	};
	
	//--Purchase Button--
	if (WF_MenuAction == 101) then {
		WF_MenuAction = -1;
		
		-_rearmPrice Call cti_CL_FNC_ChangePlayerFunds;
			
		if(count _pylons > 0) then {
			_veh setVariable ["_pylons", _pylons, true];
			[_veh, _pylons] call cti_CO_FNC_Requip_AIR_VEH;
		};
		
		if (WF_Debug) then {
			diag_log format["Set pylons for %1 : %2", typeOf _veh, _pylons];
		};
	};
	
	//--Rearm by default Button--
	if (WF_MenuAction == 115) then {
		WF_MenuAction = -1;
		
		-(round(_rearmPrice / 2)) Call cti_CL_FNC_ChangePlayerFunds;		
		
		cti_CO_FNC_RearmVehicle = Compile preprocessFileLineNumbers "Common\Functions\Common_RearmVehicle.sqf";
		_veh setVariable ["_pylons", nil]; 
		[_veh, side player] Spawn cti_CO_FNC_RearmVehicle;
	};
};

EASA_CTI_UnitsCamera cameraEffect["TERMINATE","BACK"];
camDestroy EASA_CTI_UnitsCamera;