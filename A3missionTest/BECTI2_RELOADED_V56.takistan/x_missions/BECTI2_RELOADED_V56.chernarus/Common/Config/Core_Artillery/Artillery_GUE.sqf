Private ["_side"];
_side = _this;
//
missionNamespace setVariable [Format['cti_%1_ARTILLERY_DISPLAY_NAME', _side], [

'[ION] HILUX Podnos',
'[ION] HILUX MLRS',
"[ION] HILUX UB32"

//CUP_I_Hilux_podnos_TK
//CUP_I_Hilux_MLRS_TK
//CUP_I_Hilux_UB32_TK

]]; //--- Display Name to use in the GUI.

missionNamespace setVariable [Format['cti_%1_ARTILLERY_WEAPONS', _side], [

'CUP_mortar_82mm_veh', 					//Podnos
'CUP_Vmlauncher_technical', 			//MLRS
"CUP_Vmlauncher_ub32_technical"			//UB32

]]; //--- Weapon classname.

missionNamespace setVariable [Format['cti_%1_ARTILLERY_RANGES_MIN', _side], [

100, //Podnos
500, //MLRS
500//UB32
]]; //--- Unit cannot fire if the target is within it's min range.

missionNamespace setVariable [Format['cti_%1_ARTILLERY_VELOCITIES', _side], [

300,		//Podnos 			
300,		//MLRS		
300			//UB32
]]; //--- Projectile fall velocity.

missionNamespace setVariable [Format['cti_%1_ARTILLERY_DISPERSIONS', _side], [

60, //Podnos	
50, //MLRS 
65	//UB32
]]; //--- Accuracy of the shell upon landing.

missionNamespace setVariable [Format['cti_%1_ARTILLERY_RANGES_MAX', _side], [

7500, //Podnos
9500, //MLRS
8500	//UB32
]]; //--- Unit max firing range.

missionNamespace setVariable [Format['cti_%1_ARTILLERY_TIME_RELOAD', _side], [

4, //Podnos
2, //MLRS
2	//UB32
]]; //--- Approximate time needed for unit to fire again.




missionNamespace setVariable [Format['cti_%1_ARTILLERY_BURST', _side], [

4, //Podnos
5, //MLRS
8	//UB32
]]; //--- Burst sent per fire mission.


missionNamespace setVariable [Format['cti_%1_ARTILLERY_AMMOS', _side], [
	
	['Sh_82mm_AMOS','Flare_82mm_AMOS_White','Smoke_82mm_AMOS_White'],//Podnos
	['CUP_R_techical_HE'],//MLRS
	["CUP_R_S8_techical_HE"]//UB32
	
]]; //--- Usable projectiles per artillery class.



missionNamespace setVariable [Format['cti_%1_ARTILLERY_EXTENDED_MAGS', _side], [

[],  //Podnos
[],	 //MLRS
[] 	//UB32
 
 
]]; //--- Special projectiles used by artillery classes.


missionNamespace setVariable [Format['cti_%1_ARTILLERY_EXTENDED_MAGS_UPGRADE', _side], [

[], //Podnos
[], //MLRS
[] //UB32
]]; //--- Upgrade level required to use the special projectile.


missionNamespace setVariable [Format['cti_%1_ARTILLERY_MAGAZINES', _side], [

['CUP_8Rnd_82mm_Mo_shells_veh'],			//Podnos
['CUP_10Rnd_technical_HE'], 				//MLRS
["CUP_32Rnd_UB32_technical_HE"] 						//UB32


]]; //--- Artillery magazines.Should be Standardloadout


missionNamespace setVariable [Format['cti_%1_ARTILLERY_CLASSNAMES', _side], [

['CUP_I_Hilux_podnos_TK'], 		//Podnos
['CUP_I_Hilux_MLRS_TK'],	//MLRS
["CUP_I_Hilux_UB32_TK"] 	//UB32

]]; //--- Artillery classnames, more than one of the same family may be used.


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