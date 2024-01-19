Private ["_side"];

_side = "GUER";

//--- Generic.
missionNamespace setVariable [Format["cti_%1CREW", _side], 'cwr3_i_soldier_crew'];
missionNamespace setVariable [Format["cti_%1PILOT", _side], 'cwr3_i_soldier_pilot_jet'];
missionNamespace setVariable [Format["cti_%1SOLDIER", _side], 'CUP_I_GUE_Crew'];




//--- Flag texture.
//missionNamespace setVariable [Format["cti_%1FLAG", _side], 'flag_ger_co.paa'];
missionNamespace setVariable [Format["cti_%1FLAG", _side], '\A3\Data_F\Flags\flag_ion_co.paa'];



missionNamespace setVariable [Format["cti_%1AMBULANCES", _side], ['CUP_I_BTR40_MG_TKG']];
missionNamespace setVariable [Format["cti_%1REPAIRTRUCKS", _side], ['cwr3_i_btr40_dshkm']];
missionNamespace setVariable [Format["cti_%1AMMOTRUCKS", _side], ['CUP_I_RG31E_M2_W_ION']];

//--- Radio Announcers.
missionNamespace setVariable [Format ["cti_%1_RadioAnnouncers", _side], ['WFHQ_CZ0','WFHQ_CZ1','WFHQ_CZ2']];
missionNamespace setVariable [Format ["cti_%1_RadioAnnouncers_Config", _side], 'RadioProtocolCZ'];

//--- Paratroopers.
missionNamespace setVariable [Format["cti_%1PARACHUTELEVEL1", _side],['CUP_I_GUE_Soldier_AT','CUP_I_PMC_Soldier_AT','cwr3_i_soldier_at_at4','cwr3_i_soldier_gl','CUP_I_GUE_Soldier_MG','CUP_I_PMC_Winter_Medic']];
missionNamespace setVariable [Format["cti_%1PARACHUTELEVEL2", _side],['VIOC_I_LIB_FSJ_AT_soldier_para','CUP_I_TK_GUE_Soldier_HAT','cwr3_i_soldier_at_rpg7','CUP_I_PMC_Winter_Soldier_AT','cwr3_i_soldier_at_at4','CUP_I_GUE_Soldier_MG','CUP_I_GUE_Medic','cwr3_i_soldier_sapper','CUP_I_PMC_Sniper']];
missionNamespace setVariable [Format["cti_%1PARACHUTELEVEL3", _side],['VIOC_I_LIB_FSJ_AT_soldier_para','CUP_I_TK_GUE_Soldier_LAT','CUP_I_PMC_Soldier_AA','CUP_I_PMC_Winter_Soldier_AT','CUP_I_TK_GUE_Soldier_HAT','CUP_I_TK_GUE_Soldier_HAT','cwr3_i_soldier_at_rpg75','CUP_I_PMC_Soldier_MG','CUP_I_TK_GUE_Guerilla_Medic','cwr3_i_soldier_sapper','VIOC_I_LIB_FSJ_AT_grenadier_para','CUP_I_PMC_Sniper_KSVK']];

missionNamespace setVariable [Format["cti_%1PARACARGO", _side], 'cwr3_i_an2'];	//--- Paratroopers, Vehicle.
missionNamespace setVariable [Format["cti_%1REPAIRTRUCK", _side], 'cwr3_i_btr40_dshkm'];//--- Repair Truck model.
missionNamespace setVariable [Format["cti_%1STARTINGVEHICLES", _side], ['CUP_I_BTR40_MG_TKG']];//--- Starting Vehicles.
missionNamespace setVariable [Format["cti_%1PARAAMMO", _side], []];//--- Supply Paradropping, Dropped Ammunition.
missionNamespace setVariable [Format["cti_%1PARAVEHICARGO", _side], 'CUP_I_BTR40_MG_TKG'];//--- Supply Paradropping, Dropped Vehicle.
missionNamespace setVariable [Format["cti_%1PARAVEHI", _side], 'CUP_I_UH60L_RACS'];//--- Supply Paradropping, Vehicle
missionNamespace setVariable [Format["cti_%1PARACHUTE", _side], 'ParachuteC'];//--- Supply Paradropping, Parachute Model.

//--- Server only.
if (isServer) then {
	//--- Patrols.
	missionNamespace setVariable [Format["cti_%1_PATROL_LIGHT", _side], [
		['CUP_I_GUE_Commander','cwr3_i_soldier_hg','CUP_I_PMC_Winter_Soldier_MG_PKM','CUP_I_PMC_Soldier_AT'], 
		['cwr3_i_soldier_at_rpg75','CUP_I_GUE_Soldier_LAT','cwr3_i_soldier_marksman','CUP_I_TK_GUE_Guerilla_Medic','VIOC_I_LIB_GER_mgunner']
	]];

	missionNamespace setVariable [Format["cti_%1_PATROL_MEDIUM", _side], [
		['CUP_I_GUE_Soldier_MG','cwr3_i_soldier_at_at4','CUP_I_PMC_Winter_Soldier_MG_PKM','CUP_I_TK_GUE_Soldier_HAT']
	]];

	missionNamespace setVariable [Format["cti_%1_PATROL_HEAVY", _side], [
		['CUP_I_TK_GUE_Commander','cwr3_i_soldier_hg','CUP_I_GUE_Medic']
	]];
};

//--- Client only.
if (local player) then {
	//--- Default Faction (Buy Menu), this is the faction name defined in core_xxx.sqf files.
	missionNamespace setVariable [Format["cti_%1DEFAULTFACTION", _side], 'Guerilla'];
};

//--- Artillery.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Artillery\Artillery_GUE.sqf";
//--- Units.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Units\Units_GUE.sqf";
//--- Structures.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Structures\Structures_GUE.sqf";
//--- Upgrades.
(_side) Call Compile preprocessFileLineNumbers "Common\Config\Core_Upgrades\Upgrades_GUE.sqf";