Private ["_side"];

_side = "EAST";

//--- Generic.
missionNamespace setVariable [Format["cti_%1CREW", _side], 'cwr3_o_soldier_crew'];
missionNamespace setVariable [Format["cti_%1PILOT", _side], 'cwr3_o_soldier_pilot'];
missionNamespace setVariable [Format["cti_%1SOLDIER", _side], 'cwr3_o_soldier_driver'];

//--- Flag texture.
//missionNamespace setVariable [Format["cti_%1FLAG", _side], '\Ca\Data\flag_rus_co.paa'];

missionNamespace setVariable [Format["cti_%1FLAG", _side], 'Rsc\Pictures\flag_su_co.paa'];



missionNamespace setVariable [Format["cti_%1AMBULANCES", _side], ['cwr3_o_uaz_mev','cwr3_o_uaz452_mev','CUP_O_GAZ_Vodnik_MedEvac_RU','cwr3_o_mtlb_mev','cwr3_o_bmp2_mev','cwr3_o_mi8_mev',"Land_Pod_Heli_Transport_04_medevac_F"]];
missionNamespace setVariable [Format["cti_%1REPAIRTRUCKS", _side], ['CUP_O_Ural_Repair_RU']];
missionNamespace setVariable [Format["cti_%1SALVAGETRUCK", _side], ['CUP_O_Ural_RU','UK3CB_BAF_MAN_HX58_Transport_Green','cwr3_b_m939']];
missionNamespace setVariable [Format["cti_%1SUPPLYTRUCKS", _side], []];
missionNamespace setVariable [Format["cti_%1UAV", _side], 'CUP_O_Pchela1T_RU'];
missionNamespace setVariable [Format["cti_%1AMMOTRUCKS", _side], ['cwr3_b_m939_reammo','cwr3_b_uk_fv620_reammo','cwr3_o_ural_reammo','CUP_BOX_GB_WpsSpecial_F','CUP_BOX_US_ARMY_WpsSpecial_F','CUP_BOX_TK_WpsSpecial_F']];

//only used for menucolor but i want keep the syntax in Client_UIFillListBuyUnits.sqf
missionNamespace setVariable [Format["cti_%1ARTYVEHICLE", _side], ['pook_TOS1A_OPFOR','pook_9K58_OPFOR','pook_A222_OPFOR','pook_9K57M_OPFOR','CUP_O_BM21_RU']];
missionNamespace setVariable [Format["cti_%1LIFTVEHICLE", _side], ["CUP_O_Mi8AMT_RU","cwr3_o_mi6t","cwr3_o_mi8_mev","cwr3_o_an12"]];
missionNamespace setVariable [Format["cti_%1CARGOVEHICLE", _side], ["pook_MAZ7910_base"]];
missionNamespace setVariable [Format["cti_%1ECMVEHICLE", _side], ["Land_Device_slingloadable_F"]];




//--- Radio Announcers.
missionNamespace setVariable [Format ["cti_%1_RadioAnnouncers", _side], ['WFHQ_RU0','WFHQ_RU1','WFHQ_RU2']];
missionNamespace setVariable [Format ["cti_%1_RadioAnnouncers_Config", _side], 'RadioProtocolRU'];
missionNamespace setVariable [Format ["cti_%1_RadioAnnouncers_Type", _side], [['\CUP_Dubbing_Radio_RU\RadioProtocol\CUP_D_MALE01_RU\', 'wss'],
																			   ['\CUP_Dubbing_Radio_RU\RadioProtocol\CUP_D_MALE02_RU\', 'wss'],
																			   ['\CUP_Dubbing_Radio_RU\RadioProtocol\CUP_D_MALE03_RU\', 'wss'],
																			   ['\CUP_Dubbing_Radio_RU\RadioProtocol\CUP_D_MALE04_RU\', 'wss'],
																			   ['\CUP_Dubbing_Radio_RU\RadioProtocol\CUP_D_MALE05_RU\', 'wss'],
																			   ['\CUP_Dubbing_Radio_RU\RadioProtocol\Male01RU\', 'wss'],
																			   ['\CUP_Dubbing_Radio_RU\RadioProtocol\Male02RU\', 'wss'],
																			   ['\CUP_Dubbing_Radio_RU\RadioProtocol\Male03RU\', 'wss']]];



//--- Paratroopers.
missionNamespace setVariable [Format["cti_%1PARACHUTELEVEL1", _side],['cwr3_o_soldier_sniper','cwr3_o_soldier_at_rpg18','cwr3_o_soldier_mg','cwr3_o_soldier_ar','cwr3_o_soldier_engineer','cwr3_o_soldier_medic']];
missionNamespace setVariable [Format["cti_%1PARACHUTELEVEL2", _side],['CUP_O_RU_Sniper_VDV_M_EMR','CUP_O_RU_Soldier_LAT_M_VDV_EMR_V2','CUP_O_RU_Soldier_MG_M_VDV_EMR_V2','CUP_O_RU_Soldier_AR_M_VDV_EMR_V2','CUP_O_RU_Soldier_Engineer_M_VDV_EMR_V2','CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2','CUP_O_RU_Soldier_AT_M_VDV_EMR_V2','CUP_O_RU_Soldier_AA_M_VDV_EMR_V2','CUP_O_RU_Spotter_VDV_M_EMR']];
missionNamespace setVariable [Format["cti_%1PARACHUTELEVEL3", _side],['CUP_O_TK_Sniper_KSVK','CUP_O_RU_Soldier_AT_M_VDV_EMR_V2','CUP_O_RU_Soldier_MG_M_VDV_EMR_V2','CUP_O_RU_Soldier_AR_M_VDV_EMR_V2','CUP_O_RU_Soldier_Engineer_M_VDV_EMR_V2','CUP_O_RU_Soldier_Medic_M_VDV_EMR_V2','CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2','CUP_O_RU_Soldier_AA_M_VDV_EMR_V2','CUP_O_RUS_SpecOps_Scout','CUP_O_RU_Soldier_HAT_M_VDV_EMR_V2','CUP_O_RU_Soldier_AA_M_VDV_EMR_V2','cwr3_o_spetsnaz_bizon_sd']];

missionNamespace setVariable [Format["cti_%1PARACARGO", _side], 'cwr3_o_an12'];//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["cti_%1REPAIRTRUCK", _side], 'CUP_O_Ural_Repair_RU'];//--- Repair Truck model.
missionNamespace setVariable [Format["cti_%1STARTINGVEHICLES", _side], ['CUP_O_GAZ_Vodnik_MedEvac_RU','cwr3_o_ural_reammo']];//--- Starting Vehicles.
missionNamespace setVariable [Format["cti_%1PARAAMMO", _side], 'CUP_BOX_TK_WpsSpecial_F'];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["cti_%1PARAVEHICARGO", _side], 'CUP_O_Ural_Repair_RU'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["cti_%1PARAVEHI", _side], 'cwr3_o_an12'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["cti_%1PARACHUTE", _side], 'O_Parachute_02_F'];//--- Supply Paradropping, Parachute Model.
//pook_AN26_OPFOR
//cwr3_o_an12

//--- Server only. (same here,nobody need patrols)
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["cti_%1_PATROL_LIGHT", _side], [
		['CUP_O_UAZ_Open_RU'],
		['CUP_O_UAZ_Open_RU'],
		['CUP_O_UAZ_Open_RU']
	]];

	missionNamespace setVariable [Format["cti_%1_PATROL_MEDIUM", _side], [
		['CUP_O_UAZ_Open_RU','CUP_O_UAZ_Open_RU'],
		['CUP_O_UAZ_Open_RU','CUP_O_UAZ_Open_RU'],
		['CUP_O_UAZ_Open_RU','CUP_O_UAZ_Open_RU']
	]];

	missionNamespace setVariable [Format["cti_%1_PATROL_HEAVY", _side], [
		['CUP_O_UAZ_Open_RU','CUP_O_UAZ_Open_RU','CUP_O_UAZ_Open_RU'],
		['CUP_O_UAZ_Open_RU','CUP_O_UAZ_Open_RU','CUP_O_UAZ_Open_RU'],
		['CUP_O_UAZ_Open_RU','CUP_O_UAZ_Open_RU','CUP_O_UAZ_Open_RU'],
		['CUP_O_UAZ_Open_RU','CUP_O_UAZ_Open_RU','CUP_O_UAZ_Open_RU']
	]];
};

//--- Base Patrols. (i dont spend time for unused shit,so all mg units now.if you want a secured base, just build statics.)
if ((missionNamespace getVariable "cti_C_BASE_PATROLS_INFANTRY") > 0) then {
	missionNamespace setVariable [Format["cti_%1BASEPATROLS_0", _side],['cwr3_o_soldier_mg']];
	missionNamespace setVariable [Format["cti_%1BASEPATROLS_1", _side],['cwr3_o_soldier_mg','cwr3_o_soldier_mg']];
	missionNamespace setVariable [Format["cti_%1BASEPATROLS_2", _side],['cwr3_o_soldier_mg','cwr3_o_soldier_mg','cwr3_o_soldier_mg']];
	missionNamespace setVariable [Format["cti_%1BASEPATROLS_3", _side],['cwr3_o_soldier_mg','cwr3_o_soldier_mg','cwr3_o_soldier_mg','cwr3_o_soldier_mg']];
	missionNamespace setVariable [Format["cti_%1BASEPATROLS_4", _side],['cwr3_o_soldier_mg','cwr3_o_soldier_mg','cwr3_o_soldier_mg','cwr3_o_soldier_mg','cwr3_o_soldier_mg']];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["cti_%1DEFAULTFACTION", _side], 'LEVEL 0'];
};

//--- Artillery.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_RU.sqf";
//--- Units.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_RU.sqf";
//--- Structures.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_RU.sqf";
//--- Upgrades.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_RU.sqf";



// Teamleader
missionNamespace setVariable ["cti_EAST_DefaultGearTeamleader", [
	[
		["CUP_arifle_AK74",["","","",""],["CUP_30Rnd_545x39_AK_M"]],
		["CUP_launch_RPG18_Loaded",["","","",""],["CUP_RPG18_M"]],
		["CUP_hgun_Makarov",["","","",""],["CUP_8Rnd_9x18_Makarov_M"]]
	],
	
	[
		["cwr3_o_uniform_klmk_1957_birch_v1",["CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M","",""]],
		["cwr3_o_vest_6b2_ak74",["CUP_8Rnd_9x18_Makarov_M","CUP_8Rnd_9x18_Makarov_M","CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","",""]],
		["cwr3_o_backpack_veshmeshok",["FirstAidKit",""]]],
		["cwr3_o_headgear_ssh68",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];


//Engineer
missionNamespace setVariable ["cti_EAST_DefaultGearEngineer", [
	[
		["CUP_arifle_AKS74U",["","","",""],["CUP_30Rnd_545x39_AK_M"]],
		["",["","","",""],[""]],
		["CUP_hgun_Makarov",["","","",""],["CUP_8Rnd_9x18_Makarov_M"]]
	],
	
	[
		["cwr3_o_uniform_klmk_1957_birch_v1",["CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M"]],
		["cwr3_o_vest_6b2_ak74",["CUP_8Rnd_9x18_Makarov_M","CUP_8Rnd_9x18_Makarov_M","CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","",""]],
		["cwr3_o_backpack_veshmeshok",["FirstAidKit","CUP_MineE_M"]]],
		["cwr3_o_headgear_ssh68",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];

// Machinegunner
missionNamespace setVariable ["cti_EAST_DefaultGearMachinegunner", [
	[
		["CUP_arifle_RPK74_45",["","","",""],["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M"]],
		["",["","","",""],[""]],
		["CUP_hgun_Makarov",["","","",""],["CUP_8Rnd_9x18_Makarov_M"]]
	],
	
	[
		["cwr3_o_uniform_klmk_1957_birch_v1",["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M","CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M","",""]],
		["cwr3_o_vest_6b2_ak74",["CUP_8Rnd_9x18_Makarov_M","CUP_8Rnd_9x18_Makarov_M","CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","",""]],
		["cwr3_o_backpack_veshmeshok",["FirstAidKit",""]]],
		["cwr3_o_headgear_ssh68",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];



// Medic
missionNamespace setVariable ["cti_EAST_DefaultGearMedic", [
	[
		["CUP_arifle_AKS74U",["","","",""],["CUP_30Rnd_545x39_AK_M"]],
		["CUP_launch_RPG18_Loaded",["","","",""],["CUP_RPG18_M"]],
		["CUP_hgun_Makarov",["","","",""],["CUP_8Rnd_9x18_Makarov_M"]]
	],
	
	[
		["cwr3_o_uniform_klmk_1957_birch_v1",["CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M","",""]],
		["cwr3_o_vest_6b2_ak74",["CUP_8Rnd_9x18_Makarov_M","CUP_8Rnd_9x18_Makarov_M","CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","",""]],
		["cwr3_o_backpack_veshmeshok_medic_empty",["Medikit",""]]],
		["cwr3_o_headgear_ssh68",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];

// Specops
missionNamespace setVariable ["cti_EAST_DefaultGearSpecops", [
	[
		["CUP_arifle_AKS74U",["","","",""],["CUP_30Rnd_545x39_AK_M"]],
		["",["","","",""],[""]],
		["CUP_hgun_Makarov",["","","",""],["CUP_8Rnd_9x18_Makarov_M"]]
	],

	[
		["cwr3_o_uniform_klmk_1957_birch_v1",["CUP_30Rnd_545x39_AK_M","CUP_30Rnd_545x39_AK_M","",""]],
		["cwr3_o_vest_6b2_ak74",["CUP_8Rnd_9x18_Makarov_M","CUP_8Rnd_9x18_Makarov_M","CUP_HandGrenade_RGD5","CUP_HandGrenade_RGD5","",""]],
		["cwr3_o_backpack_veshmeshok",["FirstAidKit","","","",""]]],
		["cwr3_o_headgear_ssh68",""],
		[["","Binocular"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];

/*
// ArtOperator
missionNamespace setVariable ["cti_EAST_DefaultGearArtOperator", [
	[
		["rhs_weap_aks74n",["rhs_acc_dtk","","rhs_acc_pso1m21",""],["rhs_30Rnd_545x39_AK"]],
		["rhs_weap_rshg2",["","","",""],[""]],
		["rhs_weap_pya",["","","",""],["rhs_mag_9x19_17"]]
	],

	[
		["rhs_uniform_m88_patchless",["rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK"]],
		["rhs_6sh92_vsr",["rhs_mag_9x19_17","rhs_mag_9x19_17","rhs_mag_9x19_17","rhs_mag_9x19_17","rhs_mag_rgd5","rhs_mag_rgd5"]],
		["rhs_sidor",["FirstAidKit"]]],
		["rhs_fieldcap_khk",""],
		[["","Rangefinder"],["itemmap","","itemradio","itemcompass","itemwatch"]]
	]
];
*/