Private ["_side"];
_side = _this;
//
missionNamespace setVariable [Format['cti_%1_ARTILLERY_DISPLAY_NAME', _side], [

'[ALL]',
'[RU] 122-mm D-30',
'[RU] 82-mm 2B14 Podnos',
'[RU] 122-mm BM-21 Grad',
'[RU] 9K57M Urugan-M',
'[RU] 9K58 Smerch',
'[RU] A-222',
"[RU] TOS-1A",
'[UK] 105-mm L-118',
'[UK] 82-mm L-16A2',
'[UK] 120-mm M-121 PANDUR',
'[UK] 155-mm CAESAR',
'[UK] 227-mm M270 MLRS',
'[US] M-777',				
'[US] 82-mm M252',			
'[US] 120-mm M-121 STRYKER',
'[US] 227-mm MLRS TRUCK',
'[US] 227-mm M270 MLRS',
'[ION] HILUX Podnos',
'[ION] HILUX MLRS',
"[ION] HILUX UB32",
"[ION] 122-mm 2S1",
"[ION] 122-mm 2S5",
"[ION] 82-mm 2B14 Podnos",
"[ION] 105-mm M119",
"[ION] 122-mm D-30",
"[ION] M-777"


]]; //--- Display Name to use in the GUI.

missionNamespace setVariable [Format['cti_%1_ARTILLERY_WEAPONS', _side], [

'mortar_82mm', 
'CUP_Vcannon_D30_veh', 					//D30
'mortar_82mm', 							//Prodnos
'CUP_Vmlauncher_GRAD_veh',				//Grad
"pook_9P140_Launcher",					//Urugan
"pook_9M55_Launcher",					//Smerch
"pook_ARTY_A222",						//A-222
"pook_TOS1_Launcher",					//TOS1A
'CUP_Vcannon_M119_veh', 				//L-118
'mortar_82mm', 							//L-16A2
'pandur_120mm',							//PANDUR
'pook_ARTY_L52',						//CAESAR
'CUP_Vmlauncher_MLRS_veh',				//MLRS
'pook_ARTY_M777', 						//M777
'mortar_82mm', 							//M252
'CUP_Vmortar_M121',						//STRYKER
'pook_MLRS_Launcher',				//MLRS TRUCK
'CUP_Vmlauncher_MLRS_veh',				//MLRS
'CUP_mortar_82mm_veh', 					//Podnos
'CUP_Vmlauncher_technical', 			//MLRS
"CUP_Vmlauncher_ub32_technical",			//UB32
"pook_ARTY_2A18",						//2S1
"pook_ARTY_2A18",						//2S5
'mortar_82mm',
'CUP_Vcannon_M119_veh',
'CUP_Vcannon_D30_veh', 
'pook_ARTY_M777'

]]; //--- Weapon classname.

missionNamespace setVariable [Format['cti_%1_ARTILLERY_RANGES_MIN', _side], [
100,
1000, 	//D30
100, 	//Prodnos
1600, 	//Grad
1800,	//Urugan
2000,	//Smerch
2400,	//A-222
1800,	//TOS1A
1000, 	//L-118
100, 	//L-16A2
250,	//PANDUR
1600,	//CAESAR
2200,	//MLRS
1100, 	//M777
100, 	//M252
250,	//STRYKER
2200, 	//MLRS TRUCK
2200, 	//MLRS
100, 	//Podnos
500, 	//MLRS
500,		//UB32
1000,		//2S1
1000,		//2S5

100,
1000,
1000,
1100


]]; //--- Unit cannot fire if the target is within it's min range.

missionNamespace setVariable [Format['cti_%1_ARTILLERY_VELOCITIES', _side], [
500,
500,		//D30 		
500, 		//Prodnos			
500, 		//Grad			
500,		//Urugan
500,  		//Smerch
500,		//A-222
500,		//TOS1A
500, 		//L-118	
500, 		//L-16A2			
500, 		//PANDUR
500,		//CAESAR
500,  		//MLRS	
500, 		//M777
500, 		//M252	
500, 		//STRYKER
500, 		//MLRS TRUCK
500, 		//MLRS
500, 	//Podnos
500, 	//MLRS
500,		//UB32
500,		//2S1
500,			//2S5

500,
500,
500,
500


]]; //--- Projectile fall velocity.

missionNamespace setVariable [Format['cti_%1_ARTILLERY_DISPERSIONS', _side], [
60,
50, //D30	
60, //Prodnos 
40, //Grad	
35,	//Urugan
30, //Smerch
20,	//A-222
45,	//TOS1A
50, //L-118	
60, //L-16A2
65, //PANDUR
20, //CAESAR
30, //MLRS
40, //M777
60, //M252
65, //STRYKER
30, //MLRS TRUCK
30,	//MLRS
60, //Podnos	
50, //MLRS 
65,	//UB32
50,	//2S1
50,	//2S5

60,
50,
50,
40

]]; //--- Accuracy of the shell upon landing.

missionNamespace setVariable [Format['cti_%1_ARTILLERY_RANGES_MAX', _side], [
7500,
8000, 	//D30
7500, 	//Prodnos
9000, 	//Grad
9750,	//Urugan 
11000,	//Smerch
10000, 	//A-222
8000,	//TOS1A
8000, 	//L-118
7500, 	//L-16A2
7000, 	//PANDUR
10000, 	//CAESAR
11000, 	//MLRS
8500, 	//M777
7500, 	//M252
7000, 	//STRYKER
11000,	//MLRS TRUCK
11000, 	//MLRS
7500, 	//Podnos
9500,	//MLRS
8500,	//UB32
8000,	//2S1
8000,	//2S5


7500,
8000,
8000,
8500

]]; //--- Unit max firing range.

missionNamespace setVariable [Format['cti_%1_ARTILLERY_TIME_RELOAD', _side], [
4,
7, 	//D30
4,	//Prodnos
2, 	//Grad
2,	//Urugan
2,	//Smerch
7,	//A-222
2,	//TOS1A
7, 	//L-118
4, 	//L-16A2
6, 	//PANDUR
6, 	//CAESAR
2, 	//MLRS
7, 	//M777
4, 	//M252
6, 	//STRYKER
2, 	//MLRS TRUCK
2, 	//MLRS
4, 	//Podnos
2, 	//MLRS
2,	//UB32
7,	//2S1
7,	//2S5

4,
7,
7,
7

]]; //--- Approximate time needed for unit to fire again.




missionNamespace setVariable [Format['cti_%1_ARTILLERY_BURST', _side], [
4,
10, //D30
4, 	//Prodnos
10, //Grad
8,	//Urugan
4,	//Smerch
6,	//A-222
6,	//TOS1A
10, //L-118
4, 	//L-16A2
6, 	//PANDUR
10, //CAESAR
6,	//MLRS
6,	//M777
4,	//M252
6,	//STRYKER
6, 	//MLRS TRUCK
6, 	//MLRS
4, 	//Podnos
5, 	//MLRS
8,	//UB32
10,	//2S1
10,	//2S5

4,
10,
10,
6

]]; //--- Burst sent per fire mission.


missionNamespace setVariable [Format['cti_%1_ARTILLERY_AMMOS', _side], [
	['Sh_82mm_AMOS','Flare_82mm_AMOS_White','Smoke_82mm_AMOS_White','Sh_82mm_AMOS_guided','Sh_82mm_AMOS_LG'],
	['CUP_Sh_122_HE','CUP_Sh_122_WP','CUP_Sh_122_LASER','CUP_Sh_122_SMOKE','CUP_Sh_122_ILLUM'],									//D30
	['Sh_82mm_AMOS','Flare_82mm_AMOS_White','Smoke_82mm_AMOS_White','Sh_82mm_AMOS_guided','Sh_82mm_AMOS_LG'],					//Prodnos
	['CUP_R_GRAD_HE'],																											//Grad
	['POOK_ARTY_9M55_HE'], 																										//Urugan 16rounds
	['POOK_ARTY_9M55_HE'],																										//Smerch 12rounds
	['pook_122mmArty_HE',"Smoke_120mm_AMOS_White","pook_ARTY_vehflare","Sh_120mm_APFSDS"], 										//A-222
	["POOK_ARTY_TOS1_FAE"],																										//TOS1A
	['CUP_Sh_105_HE','CUP_Sh_105_WP','CUP_Sh_105_LASER','CUP_Sh_105_SMOKE','CUP_Sh_105_ILLUM'],									//L-118
	['Sh_82mm_AMOS','Flare_82mm_AMOS_White','Smoke_82mm_AMOS_White','Sh_82mm_AMOS_guided','Sh_82mm_AMOS_LG'],					//L-16A2
	['pandur_120mm_HE'],																										//PANDUR
	['pook_155mmArty_HE','pook_155mmArty_GPS','pook_155mmArty_RAPHE','pook_155mmArty_DPICM','pook_155mmArty_LASER','Smoke_120mm_AMOS_White','pook_ARTY_vehflare','Sh_120mm_APFSDS'],//CAESAR
	['CUP_R_MLRS_HE'],																											//MLRS
	['pook_155mmArty_HE','pook_155mmArty_GPS','pook_155mmArty_RAPHE','pook_155mmArty_DPICM','pook_155mmArty_LASER','Sh_120mm_APFSDS','pook_ARTY_vehflare','Smoke_120mm_AMOS_White'],//M777
	['Sh_82mm_AMOS','Flare_82mm_AMOS_White','Smoke_82mm_AMOS_White','Sh_82mm_AMOS_guided','Sh_82mm_AMOS_LG'],					//M252
	['ammo_ShipCannon_120mm_HE','ammo_ShipCannon_120mm_smoke'],																	//STRYKER
	['POOK_ARTY_MLRS_HE'],																										//MLRS TRUCK
	['CUP_R_MLRS_HE'],																											//MLRS
	['Sh_82mm_AMOS','Flare_82mm_AMOS_White','Smoke_82mm_AMOS_White'],															//Podnos
	['CUP_R_techical_HE'],																										//MLRS
	["CUP_R_S8_techical_HE"],																									//UB32
	['pook_122mmArty_HE','Smoke_120mm_AMOS_White','pook_ARTY_vehflare',"Sh_120mm_APFSDS"],										//2S1											
	['pook_122mmArty_HE','Smoke_120mm_AMOS_White','pook_ARTY_vehflare',"Sh_120mm_APFSDS","Sh_155mm_AMOS_LG"],					//2S5								
	
		
	['Sh_82mm_AMOS','Flare_82mm_AMOS_White','Smoke_82mm_AMOS_White','Sh_82mm_AMOS_guided','Sh_82mm_AMOS_LG'],
	['CUP_Sh_105_HE','CUP_Sh_105_WP','CUP_Sh_105_LASER','CUP_Sh_105_SMOKE','CUP_Sh_105_ILLUM'],								
	['CUP_Sh_122_HE','CUP_Sh_122_WP','CUP_Sh_122_LASER','CUP_Sh_122_SMOKE','CUP_Sh_122_ILLUM'],	
	['pook_155mmArty_HE','pook_155mmArty_GPS','pook_155mmArty_RAPHE','pook_155mmArty_DPICM','pook_155mmArty_LASER','Sh_120mm_APFSDS','pook_ARTY_vehflare','Smoke_120mm_AMOS_White']
	
	
]]; //--- Usable projectiles per artillery class.



missionNamespace setVariable [Format['cti_%1_ARTILLERY_EXTENDED_MAGS', _side], [
//seems running if you buy in factory,need be implemented
[],
/*00*/	['CUP_30Rnd_122mmWP_D30_M','CUP_30Rnd_122mmLASER_D30_M','CUP_30Rnd_122mmSMOKE_D30_M','CUP_30Rnd_122mmILLUM_D30_M'], 		 //D30
/*01*/	['8Rnd_82mm_Mo_shells','8Rnd_82mm_Mo_shells',"8Rnd_82mm_Mo_Flare_white","8Rnd_82mm_Mo_Smoke_white",'8Rnd_82mm_Mo_guided','8Rnd_82mm_Mo_guided','8Rnd_82mm_Mo_LG','8Rnd_82mm_Mo_LG','8Rnd_82mm_Mo_LG'],	 			//Prodnos
/*02*/[],	 			//Grad
/*03*/[], 			//Urugan
/*04*/[],				//Smerch
/*05*/["pook_130mm_40rdHE","pook_ARTY_12rdSMK","pook_ARTY_30rdILM","pook_ARTY_12rdAP"],				//A-222
/*06*/[], 			//TOS1A
/*07*/["CUP_30Rnd_105mmWP_M119_M","CUP_30Rnd_105mmLASER_M119_M","CUP_30Rnd_105mmSMOKE_M119_M","CUP_30Rnd_105mmILLUM_M119_M"], 			//L-118
/*08*/['8Rnd_82mm_Mo_shells','8Rnd_82mm_Mo_shells',"8Rnd_82mm_Mo_Flare_white","8Rnd_82mm_Mo_Smoke_white",'8Rnd_82mm_Mo_guided','8Rnd_82mm_Mo_guided','8Rnd_82mm_Mo_LG','8Rnd_82mm_Mo_LG','8Rnd_82mm_Mo_LG'],	 			//L-16A2
/*09*/["8Rnd_82mm_Mo_Smoke_white","8Rnd_82mm_Mo_Flare_white"],				//PANDUR
/*10*/["pook_ARTY_12rdSMK","pook_ARTY_30rdILM","pook_ARTY_12rdAP","pook_M864_12rdCBU"],	 			//CAESAR
/*11*/[],	 			//MLRS
/*12*/["pook_ARTY_12rdSMK","pook_ARTY_30rdILM","pook_ARTY_12rdAP","pook_M864_12rdCBU"], 			//M777
/*13*/['8Rnd_82mm_Mo_shells','8Rnd_82mm_Mo_shells',"8Rnd_82mm_Mo_Flare_white","8Rnd_82mm_Mo_Smoke_white",'8Rnd_82mm_Mo_guided','8Rnd_82mm_Mo_guided','8Rnd_82mm_Mo_LG','8Rnd_82mm_Mo_LG','8Rnd_82mm_Mo_LG'],				//M252
/*14*/["CUP_6Rnd_120mm_Smoke_M929"],				//STRYKER
/*15*/[], 			//MLRS TRUCK
/*16*/[],				//MLRS
/*17*/[],  			//Podnos
/*18*/[],	 			//MLRS
/*19*/[], 				//UB32
/*20*/[],				//2S1
/*21*/[],				//2S5

/*22*/['8Rnd_82mm_Mo_shells','8Rnd_82mm_Mo_shells',"8Rnd_82mm_Mo_Flare_white","8Rnd_82mm_Mo_Smoke_white",'8Rnd_82mm_Mo_guided','8Rnd_82mm_Mo_guided','8Rnd_82mm_Mo_LG','8Rnd_82mm_Mo_LG','8Rnd_82mm_Mo_LG'],	 				//2b14 RES
/*23*/["CUP_30Rnd_105mmWP_M119_M","CUP_30Rnd_105mmLASER_M119_M","CUP_30Rnd_105mmSMOKE_M119_M","CUP_30Rnd_105mmILLUM_M119_M"], 					//M119 RES
/*24*/['CUP_30Rnd_122mmWP_D30_M','CUP_30Rnd_122mmLASER_D30_M','CUP_30Rnd_122mmSMOKE_D30_M','CUP_30Rnd_122mmILLUM_D30_M'],					//D30 RES
/*25*/["pook_ARTY_12rdSMK","pook_ARTY_30rdILM","pook_ARTY_12rdAP","pook_M864_12rdCBU"]					//M777 RES
 
  
 
]]; //--- Special projectiles used by artillery classes.


missionNamespace setVariable [Format['cti_%1_ARTILLERY_EXTENDED_MAGS_UPGRADE', _side], [
//seems running if you buy in factory,need be implemented
[],
/*00*/[2,3,1,1], 			//D30
/*01*/[0,1,1,1,2,2,2,3,3], 				//Prodnos
/*02*/[], 				//Grad
/*03*/[], 				//Urugan
/*04*/[], 				//Smerch
/*05*/[0,1,1,2],					//A-222
/*06*/[], 				//TOS1A
/*07*/[2,3,1,1],			//L-118
/*08*/[0,1,1,1,2,2,2,3,3],					//L-16A2
/*09*/[1,1],					//PANDUR
/*10*/[1,1,2,3], 				//CAESAR
/*11*/[], 				//MLRS
/*12*/[1,1,2,3], 				//M777
/*13*/[0,1,1,1,2,2,2,3,3], 				//M252
/*14*/[1],					//STRYKER
/*15*/[],					//MLRS TRUCK
/*16*/[],					//MLRS
/*17*/[], 				//Podnos
/*18*/[], 				//MLRS
/*19*/[], 					//UB32
/*20*/[],					//2S1
/*21*/[],					//2S5

/*22*/[0,1,1,1,2,2,2,3,3],				//2b14 RES
/*23*/[2,3,1,1],					//M119 RES
/*24*/[2,3,1,1], 					//D30 RES
/*25*/[1,1,2,3]					//M777 RES


]]; //--- Upgrade level required to use the special projectile.


missionNamespace setVariable [Format['cti_%1_ARTILLERY_MAGAZINES', _side], [
//seems no function atm
['8Rnd_82mm_Mo_shells','8Rnd_82mm_Mo_shells','8Rnd_82mm_Mo_shells'],
['CUP_30Rnd_122mmHE_D30_M', 'CUP_30Rnd_122mmHE_D30_M', 'CUP_30Rnd_122mmHE_D30_M'],						//D30
['8Rnd_82mm_Mo_shells','8Rnd_82mm_Mo_shells','8Rnd_82mm_Mo_shells'], 									//Prodnos
['CUP_40Rnd_GRAD_HE'], 																					//Grad
['pook_9K52_mag','pook_9K52_mag'], 																		//Urugan
["pook_9M55_mag","pook_9M55_mag"],																		//Smerch
["pook_130mm_40rdHE"],																					//A-222
["pook_TOS1_mag"], 																						//TOS1A
['CUP_30Rnd_105mmHE_M119_M'],																			//L-118
['8Rnd_82mm_Mo_shells'], 																				//L-16A2
['pandur_48rd_120mm_HE'], 																				//PANDUR
['pook_M795_30rdHE'], 																					//CAESAR
['CUP_12Rnd_MLRS_HE'], 																					//MLRS
['LIB_16Rnd_BM13'],																						//M777
['8Rnd_82mm_Mo_shells'], 																				//M252
['CUP_32Rnd_120mm_HE_M934'], 																			//STRYKER
['pook_MLRS_mag'], 																						//MLRS TRUCK
['CUP_12Rnd_MLRS_HE'], 																					//MLRS
['CUP_8Rnd_82mm_Mo_shells_veh'],																		//Podnos
['CUP_10Rnd_technical_HE'], 																			//MLRS
["CUP_32Rnd_UB32_technical_HE"], 																		//UB32
['pook_122mm_40rdHE', 'pook_ARTY_12rdSMK', 'pook_ARTY_30rdILM',"pook_ARTY_12rdAP"],						//2S1
['pook_122mm_40rdHE', 'pook_ARTY_12rdSMK', 'pook_ARTY_30rdILM',"pook_ARTY_12rdAP","2Rnd_155mm_Mo_LG"], 	//2S5

['8Rnd_82mm_Mo_shells','8Rnd_82mm_Mo_shells','8Rnd_82mm_Mo_shells'],
['CUP_30Rnd_105mmHE_M119_M'],
['CUP_30Rnd_122mmHE_D30_M', 'CUP_30Rnd_122mmHE_D30_M', 'CUP_30Rnd_122mmHE_D30_M'],
['LIB_16Rnd_BM13'] 



]]; //--- Artillery magazines.Should be Standardloadout

//,'CUP_30Rnd_122mmWP_D30_M','CUP_30Rnd_122mmLASER_D30_M','CUP_30Rnd_122mmSMOKE_D30_M','CUP_30Rnd_122mmILLUM_D30_M']


missionNamespace setVariable [Format['cti_%1_ARTILLERY_CLASSNAMES', _side], [

['CUP_B_L16A2_BAF_DDPM','CUP_B_M252_USMC','CUP_O_2b14_82mm_RU','CUP_O_D30_RU','CUP_O_BM21_RU','pook_9K57M_OPFOR',"pook_9K58_OPFOR","pook_A222_OPFOR","pook_TOS1A_OPFOR",'cwr3_b_uk_l118','pook_Pandur_Mortar_BLUFOR','pook_CAESAR_BLUFOR','CUP_B_M270_HE_BAF_WOOD','pook_M777','CUP_B_M1129_MC_MK19_Woodland','pook_MLRS_BLUFOR','CUP_B_M270_HE_USMC','CUP_I_Hilux_podnos_TK','CUP_I_Hilux_MLRS_TK',"CUP_I_Hilux_UB32_TK","CUP_I_2b14_82mm_NAPA","CUP_I_2b14_82mm_AAF","CUP_I_M119_RACS","CUP_I_D30_TK_GUE","pook_M777_IND",'cwr3_o_2b14',"cwr3_b_m252","CUP_I_M252_AAF","CUP_I_L16A2_AAF"],


['CUP_O_D30_RU'], 														//D30
['CUP_O_2b14_82mm_RU',"CUP_I_2b14_82mm_AAF",'cwr3_o_2b14'],				//Prodnos only indi backpacks available
['CUP_O_BM21_RU'],														//Grad
['pook_9K57M_OPFOR'],													//Urugan
["pook_9K58_OPFOR"],													//Smerch
["pook_A222_OPFOR"],													//A-222
["pook_TOS1A_OPFOR"], 													//TOS1A
['cwr3_b_uk_l118'], 													//L-118
['CUP_B_L16A2_BAF_DDPM',"CUP_I_L16A2_AAF"],								//L-16A2
['pook_Pandur_Mortar_BLUFOR'],											//PANDUR
['pook_CAESAR_BLUFOR'],													//CAESAR
['CUP_B_M270_HE_BAF_WOOD'],												//MLRS
['pook_M777'], 															//M777
['CUP_B_M252_USMC',"cwr3_b_m252","CUP_I_M252_AAF"],						//M252
['CUP_B_M1129_MC_MK19_Woodland'],										//STRYKER
['pook_MLRS_BLUFOR'],													//MLRS TRUCK
['CUP_B_M270_HE_USMC'],													//MLRS
['CUP_I_Hilux_podnos_TK'], 												//Podnos
['CUP_I_Hilux_MLRS_TK'],												//MLRS
["CUP_I_Hilux_UB32_TK"],												//UB32
["pook_2S1_INDFOR"],													//2S1
["pook_2S5_INDFOR"], 													//2S5

["CUP_I_2b14_82mm_NAPA"],
["CUP_I_M119_RACS"],
["CUP_I_D30_TK_GUE"],
["pook_M777_IND"]

]]; //--- Artillery classnames, more than one of the same family may be used.On index 0 all could be used now


missionNamespace setVariable [Format['cti_%1_ARTILLERY_AMMO_LASER', _side], [

 //D30

]]; //--- Laserammo


missionNamespace setVariable [Format['cti_%1_ARTILLERY_AMMO_SADARM', _side], [

 //D30

]]; //-- Sadarm maybe unused atm


missionNamespace setVariable [Format['cti_%1_ARTILLERY_AMMO_ILLUMN', _side], [

 //D30

]]; //-- ILLUMAMMO

missionNamespace setVariable [Format['cti_%1_ARTILLERY_DEPLOY_SMOKE', _side], [

//D30

]]; //--Smokeammo


/*
['WFBE_EAST_ARTILLERY_AMMO_LASER',['CUP_30Rnd_122mmLASER_D30_M'],true] Call SetNamespace;
['WFBE_EAST_ARTILLERY_AMMO_SADARM',['CUP_30Rnd_122mmWP_D30_M'],true] Call SetNamespace;
['WFBE_EAST_ARTILLERY_AMMO_ILLUMN',['CUP_30Rnd_122mmILLUM_D30_M'],true] Call SetNamespace;
['WFBE_EAST_ARTILLERY_DEPLOY_SMOKE',['CUP_30Rnd_122mmSMOKE_D30_M'],true] Call SetNamespace;
cti_%1_ARTILLERY_AMMO_LASER
cti_%1_ARTILLERY_AMMO_SADARM
cti_%1_ARTILLERY_AMMO_ILLUMN
cti_%1_ARTILLERY_DEPLOY_SMOKE
*/