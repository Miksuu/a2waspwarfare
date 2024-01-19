Private ["_lock","_position","_side","_type","_vehicle"];
_vehicle = _this;
_type = typeof _vehicle;

switch (_type) do {

	case "rhsgref_nat_uaz_ags": {
		if !(WF_Camo) then {
			_vehicle setObjectTextureGlobal [0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"];
			_vehicle setObjectTextureGlobal [1,"rhsafrf\addons\rhs_a2port_car\UAZ\Data\uaz_mount_co.paa"];
		};
	};
	
	case "rhsgref_nat_uaz_dshkm": {
		if !(WF_Camo) then {
			_vehicle setObjectTextureGlobal [0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"];
			_vehicle setObjectTextureGlobal [1,"rhsafrf\addons\rhs_a2port_car\UAZ\Data\uaz_mount_co.paa"];
		};
	};
	
	case "rhsgref_nat_uaz_ags": {
		if !(WF_Camo) then {
			_vehicle setObjectTextureGlobal [0,"rhsafrf\addons\rhs_a2port_car\uaz\data\uaz_main_co.paa"];
		};
	};
	
	case "rhsgref_cdf_btr60": {
		if !(WF_Camo) then {
			_vehicle setObjectTextureGlobal [0,"rhsafrf\addons\rhs_a2port_armor_camo\data\btr60_body_3tone_co.paa"];
			_vehicle setObjectTextureGlobal [1,"rhsafrf\addons\rhs_a2port_armor_camo\data\btr60_details_3tone_co.paa"];
		};
	};
	
	case "rhsgref_cdf_bmp1": {
		if !(WF_Camo) then {
			_vehicle setObjectTextureGlobal [0,"rhsafrf\addons\rhs_bmp_camo\data\BMP_1_desert_co.paa"];
			_vehicle setObjectTextureGlobal [1,"rhsafrf\addons\rhs_bmp_camo\data\BMP_2_desert_co.paa"];
			_vehicle setObjectTextureGlobal [2,"rhsafrf\addons\rhs_bmp_camo\data\BMP_3_desert_co.paa"];
			_vehicle setObjectTextureGlobal [3,"rhsafrf\addons\rhs_bmp_camo\data\BMP_4_desert_co.paa"];
			_vehicle setObjectTextureGlobal [4,"rhsafrf\addons\rhs_bmp_camo\data\BMP_5_desert_co.paa"];
			_vehicle setObjectTextureGlobal [5,"rhsafrf\addons\rhs_bmp_camo\data\BMP_6_desert_co.paa"];
			_vehicle setObjectTextureGlobal [6,"rhsafrf\addons\rhs_decals\Data\Labels\Misc\no_ca.paa"];
		};
	};
	
	case "rhsgref_cdf_bmp2e": {
		if !(WF_Camo) then {
			_vehicle setObjectTextureGlobal [0,"rhsafrf\addons\rhs_bmp_camo\data\BMP_1_desert_co.paa"];
			_vehicle setObjectTextureGlobal [1,"rhsafrf\addons\rhs_bmp_camo\data\BMP_2_desert_co.paa"];
			_vehicle setObjectTextureGlobal [2,"rhsafrf\addons\rhs_bmp_camo\data\BMP_3_desert_co.paa"];
			_vehicle setObjectTextureGlobal [3,"rhsafrf\addons\rhs_bmp_camo\data\BMP_4_desert_co.paa"];
			_vehicle setObjectTextureGlobal [4,"rhsafrf\addons\rhs_bmp_camo\data\BMP_5_desert_co.paa"];
			_vehicle setObjectTextureGlobal [5,"rhsafrf\addons\rhs_bmp_camo\data\BMP_6_desert_co.paa"];
		};
	};
	
	case "rhsgref_BRDM2": {
		if !(WF_Camo) then {
			_vehicle setObjectTextureGlobal [0,"\rhsgref\addons\rhsgref_a2port_armor\brdm2\data\BRDM2_3tone_01_co.paa"];
			_vehicle setObjectTextureGlobal [1,"\rhsgref\addons\rhsgref_a2port_armor\brdm2\data\brdm2_3tone_02_co.paa"];

		};
	};
	
	case "rhsgref_BRDM2_ATGM": {
		if !(WF_Camo) then {
			_vehicle setObjectTextureGlobal [0,"\rhsgref\addons\rhsgref_a2port_armor\brdm2\data\BRDM2_ATGM_01_TKA_CO.paa"];
			_vehicle setObjectTextureGlobal [1,"\rhsgref\addons\rhsgref_a2port_armor\brdm2\data\brdm2_02_camo_co.paa"];
		};
	};
	
	case "rhsgref_cdf_t72ba_tv": {
		if !(WF_Camo) then {
			_vehicle setObjectTextureGlobal [0,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_01a_sand_co.paa"];
			_vehicle setObjectTextureGlobal [1,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_02a_sand_co.paa"];
			_vehicle setObjectTextureGlobal [2,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_03_sand_co.paa"];
			_vehicle setObjectTextureGlobal [3,"rhsafrf\addons\rhs_t72_camo\data\rhs_t72b_04_sand_co.paa"];
		};
	};
	
	case "rhsgref_cdf_gaz66_zu23": {
		if !(WF_Camo) then {
			_vehicle setObjectTextureGlobal [0,"\rhsafrf\addons\rhs_gaz66_camo\data\gaz66_sand_co.paa"];
			_vehicle setObjectTextureGlobal [1,"\rhsafrf\addons\rhs_gaz66\data\tent_co.paa"];
			_vehicle setObjectTextureGlobal [2,"\rhsafrf\addons\rhs_gaz66_camo\data\rhs_gaz66_kung_sand_co.paa"];
			_vehicle setObjectTextureGlobal [3,"\rhsafrf\addons\rhs_gaz66_camo\data\rhs_gaz66_ap2kung_sand_co.paa"];
			_vehicle setObjectTextureGlobal [4,"\rhsafrf\addons\rhs_gaz66_camo\data\rhs_gaz66_repkung_sand_co.paa"];
		};
	};
	
	case "rhsgref_cdf_ural_Zu23": {
		if !(WF_Camo) then {
			_vehicle setObjectTextureGlobal [0,"rhsafrf\addons\rhs_a2port_car_camo\data\ural_kabina_sand_co.paa"];
			_vehicle setObjectTextureGlobal [1,"rhsafrf\addons\rhs_a2port_car_camo\data\ural_open_sand_co.paa"];
		};
	};
	
	case "rhsgref_cdf_zsu234": {
		if !(WF_Camo) then {
			_vehicle setObjectTextureGlobal [0,"rhsafrf\addons\rhs_a2port_armor_camo\data\zsu_01_des_co.paa"];
			_vehicle setObjectTextureGlobal [1,"rhsafrf\addons\rhs_a2port_armor_camo\data\zsu_02_des_co.paa"];
			_vehicle setObjectTextureGlobal [2,"rhsafrf\addons\rhs_a2port_armor_camo\data\zsu_03_des_co.paa"];
		};
	};
	
	
};

_vehicle