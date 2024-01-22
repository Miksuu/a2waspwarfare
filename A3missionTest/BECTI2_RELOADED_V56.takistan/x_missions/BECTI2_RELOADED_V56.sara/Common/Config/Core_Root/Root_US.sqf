Private ["_side"];

_side = "WEST";
//--- Generic.


_UKContainer =[BTeamleader4,BTeamleader5,BEngineer4,BEngineer5,BMachinegunner4_1,BMachinegunner4_2,BMachinegunner5_1,BMachinegunner5_2,BMedic4,BMedic5,BSpecOps4,BSpecOps5];

if (player in _UKContainer) then	{
missionNamespace setVariable [Format["cti_%1CREW", _side], 'cwr3_b_uk_soldier_crewman'];
} else {
missionNamespace setVariable [Format["cti_%1CREW", _side], 'cwr3_b_soldier_crew'];
};

if (player in _UKContainer) then	{
missionNamespace setVariable [Format["cti_%1PILOT", _side], 'cwr3_b_uk_soldier_pilot'];
} else {
missionNamespace setVariable [Format["cti_%1PILOT", _side], 'cwr3_b_soldier_pilot'];
};


if (player in _UKContainer) then	{
missionNamespace setVariable [Format["cti_%1SOLDIER", _side], 'cwr3_b_uk_soldier_crewman_apc'];
} else {
missionNamespace setVariable [Format["cti_%1SOLDIER", _side], 'cwr3_b_soldier_driver'];
};




//--- Flag texture.
missionNamespace setVariable [Format["cti_%1FLAG", _side], '\A3\Data_F\Flags\flag_nato_co.paa'];



missionNamespace setVariable [Format["cti_%1AMBULANCES", _side], ['CUP_B_nM997_DF_USMC_WDL','CUP_B_M1133_MEV_Woodland','cwr3_b_m113a3_mev_des','UK3CB_BAF_LandRover_Soft_MERT_A','UK3CB_BAF_LandRover_Amb_Green_A','pook_Pandur_AMB_BLUFOR','CUP_B_FV432_GB_Ambulance','CUP_B_UH1Y_MEV_USMC','cwr3_b_uh60_mev',"Land_Pod_Heli_Transport_04_medevac_F"]];
missionNamespace setVariable [Format["cti_%1REPAIRTRUCKS", _side], ['cwr3_b_m939_repair','UK3CB_BAF_MAN_HX60_Repair_Green','cwr3_b_uk_fv620_repair','CUP_O_Ural_Repair_RU']];
missionNamespace setVariable [Format["cti_%1SALVAGETRUCK", _side], ['UK3CB_BAF_MAN_HX58_Transport_Green','cwr3_b_m939','CUP_O_Ural_RU']];
missionNamespace setVariable [Format["cti_%1SUPPLYTRUCKS", _side], []];
missionNamespace setVariable [Format["cti_%1UAV", _side], 'CUP_B_USMC_DYN_MQ9'];
missionNamespace setVariable [Format["cti_%1AMMOTRUCKS", _side], ['cwr3_b_m939_reammo','cwr3_b_uk_fv620_reammo','cwr3_o_ural_reammo','CUP_BOX_GB_WpsSpecial_F','CUP_BOX_US_ARMY_WpsSpecial_F','CUP_BOX_TK_WpsSpecial_F']];

//only used for menucolor but i want keep the syntax in Client_UIFillListBuyUnits.sqf
missionNamespace setVariable [Format["cti_%1ARTYVEHICLE", _side], ['CUP_B_M270_HE_BAF_WOOD','CUP_B_M270_HE_USMC','pook_CAESAR_BLUFOR','pook_Pandur_Mortar_BLUFOR','pook_MLRS_BLUFOR','CUP_B_FV432_Mortar','CUP_B_M1129_MC_MK19_Woodland']];
missionNamespace setVariable [Format["cti_%1LIFTVEHICLE", _side], ["UK3CB_BAF_Merlin_HC3_24","cwr3_b_uk_puma_hc1","cwr3_b_uk_hc1","CUP_B_MV22_USMC","CUP_B_CH53E_USMC","cwr3_b_ch47","cwr3_b_uh60"
	,"UK3CB_BAF_Merlin_HC4_CSAR","CUP_B_C130J_USMC","CUP_B_C130J_GB"]];
missionNamespace setVariable [Format["cti_%1CARGOVEHICLE", _side], ["pook_MAZ7910_base_BLUFOR"]];
missionNamespace setVariable [Format["cti_%1ECMVEHICLE", _side], ["Land_Device_slingloadable_F"]];



//--- Radio Announcers.
missionNamespace setVariable [Format ["cti_%1_RadioAnnouncers", _side], ['WFHQ_EN0_EP1','WFHQ_EN1_EP1','WFHQ_EN2_EP1','WFHQ_EN4_EP1','WFHQ_EN5_EP1']];
missionNamespace setVariable [Format ["cti_%1_RadioAnnouncers_Config", _side], 'RadioProtocol_EP1_EN'];


if (player in _UKContainer) then	{
missionNamespace setVariable [Format ["cti_%1_RadioAnnouncers_Type", _side], [
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\CUP_D_Male01GB_BAF\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\CUP_D_Male02GB_BAF\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\CUP_D_Male03GB_BAF\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\CUP_D_Male04GB_BAF\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male01ENGB\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male02ENGB\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male04ENGB\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male05ENGB\DEFAULT\', 'ogg']
																			   ]];
																			   

} else {
missionNamespace setVariable [Format ["cti_%1_RadioAnnouncers_Type", _side], [
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male01EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male02EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male03EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male04EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male05EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male06EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male07EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male08EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male09EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male10EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male11EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\CUP_D_MALE01_EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\CUP_D_MALE02_EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\CUP_D_MALE03_EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\CUP_D_MALE04_EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\CUP_D_MALE05_EN\DEFAULT\', 'ogg'],
																			   ['\CUP_Dubbing_Radio_EN\RadioProtocol\Male12EN\DEFAULT\', 'ogg']]];
																			   
};

if (player in _UKContainer) then	{
//--- Paratroopers.
missionNamespace setVariable [Format["cti_%1PARACHUTELEVEL1", _side],['cwr3_b_uk_soldier_sniper','cwr3_b_uk_soldier_at_law','cwr3_b_uk_soldier_mg','cwr3_b_uk_soldier_ar','cwr3_b_uk_soldier_engineer','cwr3_b_uk_soldier_medic']];
missionNamespace setVariable [Format["cti_%1PARACHUTELEVEL2", _side],['CUP_B_BAF_Sniper_DPM','CUP_B_BAF_Soldier_RiflemanLAT_DPM','CUP_B_BAF_Soldier_HeavyGunner_DPM','CUP_B_BAF_Soldier_AutoRifleman_DPM','CUP_B_BAF_Soldier_Engineer_DPM','CUP_B_BAF_Soldier_Medic_DPM','CUP_B_BAF_Soldier_RiflemanAT_DPM','CUP_B_BAF_Soldier_AA_DPM','CUP_B_BAF_Spotter_DPM']];
missionNamespace setVariable [Format["cti_%1PARACHUTELEVEL3", _side],['CUP_B_BAF_Sniper_AS50_DPM','CUP_B_BAF_Soldier_RiflemanAT_DPM','CUP_B_BAF_Soldier_HeavyGunner_DPM','CUP_B_BAF_Soldier_AutoRifleman_DPM','CUP_B_BAF_Soldier_Engineer_DPM','CUP_B_BAF_Soldier_Medic_DPM','CUP_B_BAF_Soldier_AT_DPM','CUP_B_BAF_Soldier_AA_DPM','CUP_B_BAF_Spotter_L85TWS_DPM','CUP_B_BAF_Soldier_RiflemanAT_DDPM','CUP_B_BAF_Soldier_AT_DPM','cwr3_b_uk_soldier_sas_laser_night']];
missionNamespace setVariable [Format["cti_%1PARACARGO", _side], 'CUP_B_C130J_GB'];//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["cti_%1REPAIRTRUCK", _side], 'UK3CB_BAF_MAN_HX60_Repair_Green'];//--- Repair Truck model.
} else {
missionNamespace setVariable [Format["cti_%1PARACHUTELEVEL1", _side],['cwr3_b_soldier_sniper','cwr3_b_soldier_at_law','cwr3_b_soldier_mg','cwr3_b_soldier_ar_m16','cwr3_b_soldier_engineer','cwr3_b_soldier_medic']];
missionNamespace setVariable [Format["cti_%1PARACHUTELEVEL2", _side],['CUP_B_USMC_Sniper_M40A3','CUP_B_USMC_Soldier_LAT','CUP_B_USMC_Soldier_MG','CUP_B_USMC_Soldier_AR','CUP_B_USMC_Engineer','CUP_B_USMC_Medic','CUP_B_USMC_Soldier_AT','CUP_B_USMC_Soldier_AA','CUP_B_USMC_Spotter_des']];
missionNamespace setVariable [Format["cti_%1PARACHUTELEVEL3", _side],['CUP_B_USMC_Sniper_M107','CUP_B_USMC_Soldier_AT','CUP_B_USMC_Soldier_MG','CUP_B_USMC_Soldier_AR','CUP_B_USMC_Engineer','CUP_B_USMC_Medic','CUP_B_USMC_Soldier_AT','CUP_B_USMC_Soldier_AA','CUP_B_US_Spotter_UCP','CUP_B_USMC_Soldier_AT','CUP_B_USMC_Soldier_HAT','cwr3_b_blackop_laser']];
missionNamespace setVariable [Format["cti_%1PARACARGO", _side], 'CUP_B_C130J_USMC'];//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["cti_%1REPAIRTRUCK", _side], 'cwr3_b_m939_repair'];//--- Repair Truck model.
};

missionNamespace setVariable [Format["cti_%1STARTINGVEHICLES", _side], ['CUP_B_nM997_DF_USMC_WDL','cwr3_b_m939_reammo']];//--- Starting Vehicles.

if (player in _UKContainer) then	{
missionNamespace setVariable [Format["cti_%1PARAAMMO", _side], 'CUP_BOX_GB_WpsSpecial_F'];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["cti_%1PARAVEHICARGO", _side], 'UK3CB_BAF_MAN_HX60_Repair_Green'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["cti_%1PARAVEHI", _side], 'CUP_B_C130J_GB'];//--- Supply Paradropping, Vehicle
} else {
missionNamespace setVariable [Format["cti_%1PARAAMMO", _side], 'CUP_BOX_US_ARMY_WpsSpecial_F'];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["cti_%1PARAVEHICARGO", _side], 'cwr3_b_m939_repair'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["cti_%1PARAVEHI", _side], 'CUP_B_C130J_USMC'];//--- Supply Paradropping, Vehicle
};
missionNamespace setVariable [Format["cti_%1PARACHUTE", _side], 'O_Parachute_02_F'];//--- Supply Paradropping, Parachute Model.

//--- Base Patrols. (i dont spend time for unused shit,so all mg units now.if you want a secured base, just build statics.)

if ((missionNamespace getVariable "cti_C_BASE_PATROLS_INFANTRY") > 0) then {
	missionNamespace setVariable [Format["cti_%1BASEPATROLS_0", _side],['cwr3_b_soldier_mg']];
	missionNamespace setVariable [Format["cti_%1BASEPATROLS_1", _side],['cwr3_b_soldier_mg','cwr3_b_soldier_mg']];
	missionNamespace setVariable [Format["cti_%1BASEPATROLS_2", _side],['cwr3_b_soldier_mg','cwr3_b_soldier_mg','cwr3_b_soldier_mg']];
	missionNamespace setVariable [Format["cti_%1BASEPATROLS_3", _side],['cwr3_b_soldier_mg','cwr3_b_soldier_mg','cwr3_b_soldier_mg','cwr3_b_soldier_mg']];
	missionNamespace setVariable [Format["cti_%1BASEPATROLS_4", _side],['cwr3_b_soldier_mg','cwr3_b_soldier_mg','cwr3_b_soldier_mg','cwr3_b_soldier_mg','cwr3_b_soldier_mg']];
};
//--- Server only.

if (isServer) then {
	//--- Patrols. (same here,nobody need patrols)
	missionNamespace setVariable [Format["cti_%1_PATROL_LIGHT", _side], [
		['cwr3_b_m151'],
		['cwr3_b_m151'],
		['cwr3_b_m151']
	]];

	missionNamespace setVariable [Format["cti_%1_PATROL_MEDIUM", _side], [
		['cwr3_b_m151','cwr3_b_m151'],
		['cwr3_b_m151','cwr3_b_m151'],
		['cwr3_b_m151','cwr3_b_m151']
	]];

	missionNamespace setVariable [Format["cti_%1_PATROL_HEAVY", _side], [
		['cwr3_b_m151','cwr3_b_m151','cwr3_b_m151'],
		['cwr3_b_m151','cwr3_b_m151','cwr3_b_m151'],
		['cwr3_b_m151','cwr3_b_m151','cwr3_b_m151'],
		['cwr3_b_m151','cwr3_b_m151','cwr3_b_m151']
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["cti_%1DEFAULTFACTION", _side], 'US'];

	//if ((missionNamespace getVariable "cti_C_MODULE_BIS_BAF") > 0) then {(_side) Call Compile preprocessFileLineNumbers "Common\Config\Loadout\Loadout_BAF.sqf"};
};

//--- Artillery.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_US.sqf";
//--- Units.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_US.sqf";
//--- Structures.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_US.sqf";
//--- Upgrades.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_US.sqf";





// Teamleader
missionNamespace setVariable ["cti_WEST_DefaultGearTeamleader", [
	[
		["CUP_arifle_M16A1E1",["","","",""],["CUP_30Rnd_556x45_Stanag"]],
		["cwr3_launch_m72a3_loaded",["","","",""],["cwr3_m72a3_m"]],
		["CUP_hgun_Colt1911",["","","",""],["CUP_7Rnd_45ACP_1911"]]
	],
	
	[
		["cwr3_b_uniform_m81_woodland",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","",""]],
		["cwr3_b_vest_pasgt_alice_od_crew",["CUP_7Rnd_45ACP_1911","CUP_HandGrenade_M67","CUP_HandGrenade_M67","","",""]],
		["cwr3_b_backpack_alice",["FirstAidKit","CUP_30Rnd_556x45_Stanag"]]],
		["cwr3_b_headgear_cap_m81_woodland",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];



//Engineer
missionNamespace setVariable ["cti_WEST_DefaultGearEngineer", [
	[
		["CUP_smg_M3A1",["","","",""],["CUP_30Rnd_45ACP_M3A1_M"]],
		["cwr3_launch_m72a3_loaded",["","","",""],["cwr3_m72a3_m"]],
		["CUP_hgun_Colt1911",["","","",""],["CUP_7Rnd_45ACP_1911"]]
	],
	
	[
		["cwr3_b_uniform_m81_woodland",["CUP_30Rnd_45ACP_M3A1_M","CUP_30Rnd_45ACP_M3A1_M",""]],
		["cwr3_b_vest_pasgt_alice_od_crew",["CUP_7Rnd_45ACP_1911","CUP_HandGrenade_M67","CUP_HandGrenade_M67","","",""]],
		["cwr3_b_backpack_alice",["FirstAidKit","CUP_Mine_M"]]],
		["cwr3_b_headgear_cap_m81_woodland",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];

// Machinegunner
missionNamespace setVariable ["cti_WEST_DefaultGearMachinegunner", [
	[
		["cwr3_arifle_m16a1e1_lsw",["","","",""],["CUP_60Rnd_556x45_SureFire"]],
		["",["","","",""],[""]],
		["CUP_hgun_Colt1911",["","","",""],["CUP_7Rnd_45ACP_1911"]]
	],
	
	[
		["cwr3_b_uniform_m81_woodland",["CUP_60Rnd_556x45_SureFire","","",""]],
		["cwr3_b_vest_pasgt_alice_od_crew",["CUP_7Rnd_45ACP_1911","CUP_HandGrenade_M67","CUP_HandGrenade_M67","","",""]],
		["cwr3_b_backpack_alice",["FirstAidKit","CUP_60Rnd_556x45_SureFire"]]],
		["cwr3_b_headgear_cap_m81_woodland",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];



// Medic
missionNamespace setVariable ["cti_WEST_DefaultGearMedic", [
	[
		["CUP_arifle_M16A1E1",["","","",""],["CUP_30Rnd_556x45_Stanag"]],
		["cwr3_launch_m72a3_loaded",["","","",""],["cwr3_m72a3_m"]],
		["CUP_hgun_Colt1911",["","","",""],["CUP_7Rnd_45ACP_1911"]]
	],
	
	[
		["cwr3_b_uniform_m81_woodland",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","",""]],
		["cwr3_b_vest_pasgt_alice_od_crew",["CUP_7Rnd_45ACP_1911","CUP_HandGrenade_M67","CUP_HandGrenade_M67","","",""]],
		["cwr3_b_backpack_m5_medic_empty",["Medikit",""]]],
		["cwr3_b_headgear_cap_m81_woodland",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];

// Specops
missionNamespace setVariable ["cti_WEST_DefaultGearSpecops", [
	[
		["cwr3_arifle_xm177e2",["","","",""],["CUP_30Rnd_556x45_Stanag"]],
		["",["","","",""],[""]],
		["CUP_hgun_Colt1911",["","","",""],["CUP_7Rnd_45ACP_1911"]]
	],

	[
		["cwr3_b_uniform_m81_woodland",["CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag","",""]],
		["cwr3_b_vest_pasgt_alice_od_crew",["CUP_7Rnd_45ACP_1911","LIB_1Rnd_flare_white","CUP_HandGrenade_M67","CUP_HandGrenade_M67","",""]],
		["cwr3_b_backpack_alice",["FirstAidKit","","CUP_30Rnd_556x45_Stanag","CUP_30Rnd_556x45_Stanag",""]]],
		["cwr3_b_headgear_cap_m81_woodland",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];


// UKTeamleader
missionNamespace setVariable ["cti_WEST_DefaultGearUKTeamleader", [
	[
		["cwr3_arifle_l1a1",["","","",""],["CUP_20Rnd_762x51_FNFAL_M"]],
		["cwr3_launch_m72a3_loaded",["","","",""],["cwr3_m72a3_m"]],
		["CUP_hgun_Browning_HP",["","","",""],["CUP_13Rnd_9x19_Browning_HP"]]
	],
	
	[
		["cwr3_b_uk_uniform_dpm_weathered",["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","",""]],
		["cwr3_b_uk_vest_58webbing_belt",["CUP_13Rnd_9x19_Browning_HP","CUP_HandGrenade_L109A1_HE","CUP_HandGrenade_L109A1_HE","","",""]],
		["cwr3_b_uk_backpack",["FirstAidKit","CUP_20Rnd_762x51_FNFAL_M"]]],
		["cwr3_b_uk_headgear_mk5_helmet_scrim_camo",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];



//UKEngineer
missionNamespace setVariable ["cti_WEST_DefaultGearUKEngineer", [
	[
		["cwr3_smg_sterling",["","","",""],["cwr3_30rnd_sterling_m"]],
		["cwr3_launch_m72a3_loaded",["","","",""],["cwr3_m72a3_m"]],
		["CUP_hgun_Browning_HP",["","","",""],["CUP_13Rnd_9x19_Browning_HP"]]
	],
	
	[
		["cwr3_b_uk_uniform_dpm_weathered",["cwr3_30rnd_sterling_m","cwr3_30rnd_sterling_m",""]],
		["cwr3_b_uk_vest_58webbing_belt",["CUP_13Rnd_9x19_Browning_HP","CUP_HandGrenade_L109A1_HE","CUP_HandGrenade_L109A1_HE","","",""]],
		["cwr3_b_uk_backpack",["FirstAidKit","CUP_Mine_M"]]],
		["cwr3_b_uk_headgear_mk5_helmet_scrim_camo",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];

// UKMachinegunner
missionNamespace setVariable ["cti_WEST_DefaultGearUKMachinegunner", [
	[
		["cwr3_lmg_bren",["","","",""],["cwr3_30rnd_762x51_bren_m"]],
		["",["","","",""],[""]],
		["CUP_hgun_Browning_HP",["","","",""],["CUP_13Rnd_9x19_Browning_HP"]]
	],
	
	[
		["cwr3_b_uk_uniform_dpm_weathered",["cwr3_30rnd_762x51_bren_m","cwr3_30rnd_762x51_bren_m","",""]],
		["cwr3_b_uk_vest_58webbing_belt",["CUP_13Rnd_9x19_Browning_HP","CUP_HandGrenade_L109A1_HE","CUP_HandGrenade_L109A1_HE","","",""]],
		["cwr3_b_uk_backpack",["FirstAidKit"]]],
		["cwr3_b_uk_headgear_mk5_helmet_scrim_camo",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];



// UKMedic
missionNamespace setVariable ["cti_WEST_DefaultGearUKMedic", [
	[
		["cwr3_arifle_l1a1",["","","",""],["CUP_20Rnd_762x51_FNFAL_M"]],
		["cwr3_launch_m72a3_loaded",["","","",""],["cwr3_m72a3_m"]],
		["CUP_hgun_Browning_HP",["","","",""],["CUP_13Rnd_9x19_Browning_HP"]]
	],
	
	[
		["cwr3_b_uk_uniform_dpm_weathered",["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","",""]],
		["cwr3_b_uk_vest_58webbing_medic",["CUP_13Rnd_9x19_Browning_HP","CUP_HandGrenade_L109A1_HE","CUP_HandGrenade_L109A1_HE","","",""]],
		["cwr3_b_uk_backpack_medic_empty",["Medikit"]]],
		["cwr3_b_uk_headgear_mk5_helmet_scrim_camo",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];

// UKSpecops
missionNamespace setVariable ["cti_WEST_DefaultGearUKSpecops", [
	[
		["cwr3_arifle_l1a1",["","","",""],["CUP_20Rnd_762x51_FNFAL_M"]],
		["",["","","",""],[""]],
		["CUP_hgun_Browning_HP",["","","",""],["CUP_13Rnd_9x19_Browning_HP"]]
	],

	[
		["cwr3_b_uk_uniform_dpm_weathered",["CUP_20Rnd_762x51_FNFAL_M","CUP_20Rnd_762x51_FNFAL_M","",""]],
		["cwr3_b_uk_vest_58webbing_belt",["CUP_13Rnd_9x19_Browning_HP","CUP_HandGrenade_L109A1_HE","CUP_HandGrenade_L109A1_HE","","",""]],
		["cwr3_b_uk_backpack",["FirstAidKit","CUP_20Rnd_762x51_FNFAL_M"]]],
		["cwr3_b_uk_headgear_mk5_helmet_scrim_camo",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];

/*
// ArtOperator
missionNamespace setVariable ["cti_WEST_DefaultGearArtOperator", [
	[
		["rhs_weap_m16a4",["","","rhsusf_acc_ACOG_RMR",""],["rhs_mag_30Rnd_556x45_Mk318_Stanag"]],
		["rhs_weap_M136_hedp",["","","",""],[""]],
		["LIB_FLARE_PISTOL",["","","",""],["rhsusf_mag_17Rnd_9x19_JHP"]]
	],

	[
		["rhs_uniform_FROG01_d",["rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag"]],
		["vest__",["rhsusf_mag_17Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_JHP","rhsusf_mag_17Rnd_9x19_JHP","rhs_mag_m67","rhs_mag_m67"]],
		["backpack__",["FirstAidKit"]]],
		["helmet__",""],
		[["","Rangefinder"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];
*/