Private ["_gear"];
//listed in initcommonconstants req too
_gear = [];
switch (typeOf _this) do 
{
    
	/*
	case "LIB_SOV_LC_rifleman":{
		
		
		removeAllWeapons _this; 
		removeUniform _this;  
		removeVest _this; 
		removeBackpack _this; 
		removeGoggles _this;  
		_this adduniform "U_LIB_NKVD_Efreitor"; 
		_this addheadgear "H_LIB_SOV_RA_Helmet"; 
		_this addGoggles "G_LIB_Dust_Goggles"; 
		_this addbackpack "B_LIB_US_M2Flamethrower"; 
		_this addWeapon "LIB_M2_Flamethrower";
		
		
		
	
	};
	 */
	 case "cwr3_o_spetsnaz_bizon_sd":{
		
		// toDo: adapt gear, inventory according to camo specification		
		_this addMagazine "Laserbatteries";
		_this addWeapon "CUP_LRTV";		
	    _this additem "ItemGPS";
		_this assignItem "ItemGPS";
	
	};
	
	 case "CUP_O_RU_Soldier_HAT_EMR":{
		
		// toDo: adapt gear, inventory according to camo specification		
		_this addSecondaryWeaponItem "Vorona_HE";
	};
	
	
	/*
	
	case "CUP_O_RU_Soldier_Engineer_Ratnik_BeigeDigital":{
		
		// toDo: adapt gear, inventory according to camo specification		
		
		removeBackpack _this;
		_this addBackpack "cwr3_i_bergen_backpack_khaki";   
		_this addItemToBackpack "LIB_TMI_42_MINE_mag"; 
		_this addItemToBackpack "LIB_TMI_42_MINE_mag"; 
		_this addItemToBackpack "LIB_TMI_42_MINE_mag"; 
		_this addItemToBackpack "LIB_TMI_42_MINE_mag"; 
		_this addItemToBackpack "LIB_TMI_42_MINE_mag"; 
		_this addItemToBackpack "LIB_TMI_42_MINE_mag";	

	
	
	
	};
	case "rhs_msv_machinegunner":{
		removeVest _this;
		_this addVest "rhs_6b23_6sh116_od";
		_this addItemToVest "rhs_100Rnd_762x54mmR";
		
		
	};
	case "rhs_msv_arifleman":{
		_this addItemToVest "rhs_100Rnd_762x54mmR";
	};
	case "rhs_vdv_des_machinegunner":{
		removeVest _this;
		_this addVest "rhs_6b23_6sh116";
		_this addItemToVest "rhs_100Rnd_762x54mmR";
	};
	case "rhs_vdv_mflora_machinegunner":{
		_this addItemToVest "rhs_100Rnd_762x54mmR";
	};
	case "rhs_vdv_des_arifleman":{
		removeVest _this;
		_this addVest "rhs_6b23_6sh116";
		_this addItemToVest "rhs_100Rnd_762x54mmR";
	};
	case "rhs_msv_machinegunner_assistant":{
		removeVest _this;
		_this addVest "rhs_6b23_6sh116_od";
		_this addItemToVest "rhs_100Rnd_762x54mmR";
	};
	*/
};

//[_this, _gear] call cti_CO_FNC_EquipUnit;




