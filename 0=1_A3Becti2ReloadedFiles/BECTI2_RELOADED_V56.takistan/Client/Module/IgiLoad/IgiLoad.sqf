//if true then show debug globalChat (TODO add more hints)
IL_DevMod = False;

//waitUntil { !(isNull player) };
waitUntil { time > 0 };
IL_Script_Inst = time;

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" IN.", IL_Script_Inst];
};

//if (isDedicated) exitwith {};
//if (isServer) exitwith {};

//	VARIABLES
_obj_main = _this select 0;
_obj_main_type = (typeOf _obj_main);

if (isnil "IL_Variables") then
{
	IL_Variables = true;

	//Check new vehicles time
	IL_Check_Veh_Min = 30;
	IL_Check_Veh_Max = 60;
		
	//Dealing with cargo damage
	//-1 - do nothing
	//0 - set to 0
	//1 - keep such as before loading/unloading
	IL_CDamage = -1;

	//AddAction menu position
	IL_Action_LU_Priority = 30; //Load and (para)unload
	IL_Action_O_Priority = 0;	//Open and close
	IL_Action_S_Priority = 0; //Setup

	//Maximum capacity for vehicles

	IL_Num_Slots_MAZ = -8;
	
	IL_Num_Slots_M939 = -4;
	
	IL_Num_Slots_FV620 = -2;

	//Player addScore after loading and unloading
	IL_Load_Score = 20;
	//Para unload score = 2 * IL_Unload_Score
	IL_Unload_Score = 10;

	//The minimum altitude for the drop with parachute
	IL_Para_Drop_ATL = 50;
	IL_Para_Jump_ATL = 30;
	//The minimum altitude for parachute opening
	IL_Para_Drop_Open_ATL = 150;
	IL_Para_Jump_Open_ATL = 150;
	//Parachute get velocity from player or cargo
	IL_Para_Drop_Velocity = true;
	IL_Para_Jump_Velocity = true;

	//Set smoke and light for parachute drop.
	IL_Para_Smoke = true;
	IL_Para_Light = true;
	//Additional smoke after landing
	IL_Para_Smoke_Add = true;
	//Additional light after landing
	IL_Para_Light_Add = true;
	//Smoke and light color
	IL_Para_Smoke_Default = "SmokeshellGreen";
	IL_Para_Light_Default = "Chemlight_green";
	IL_Para_Smoke_Veh = "SmokeshellBlue";
	IL_Para_Light_Veh = "Chemlight_blue";

	//This allows for loading or unloading, if a player is in the area of loading or copilot
	IL_Can_Inside = True;
	IL_Can_CoPilot = false;
	IL_Can_Outside = true;

	
	IL_SDistL = 10;   // increasing this from 2.5 to 4 to extend the radius of gathering loot
	IL_SDistL_Heli_offset = 1;

	//Load and unload (not para) max speed in km/h
	IL_LU_Speed = 10;
	//Load and unload (not para) max height in m
	IL_LU_Alt = 3;
	//Enable or disable usable cargo ramp in CH-49
	IL_Ramp = true;

	//Enable change of vehicle mass
	IL_Mass = true;


	IL_Turnlist= [
//CIV
	'cwr3_c_bicycle'
	,'C_Quadbike_01_F'
	,'CUP_C_TT650_TK_CIV'
	,'CUP_BOX_TK_WpsSpecial_F'

//RES
	,'pook_MAARS_AA12_IND'
	,'pook_AdunokM_GL_IND'
	,'pook_AdunokM_DSHK_IND'
	,'pook_Adunok_IND'
	,'pook_MAARS_M240_IND'

	,"I_HMG_02_F"
	,"cwr3_i_dshkm_low"
	,"CUP_I_DSHKM_MiniTriPod_AAF"

	
	,"CUP_I_M2StaticMG_MiniTripod_RACS"
	,"cwr3_i_ags30"
	,"CUP_I_AGS_AAF"
	
	
	,"cwr3_i_spg9"
//RU	
	,"pook_MRK27BT"	
	,"cwr3_o_nsv_low"
	,"CUP_O_KORD_RU"
	,"cwr3_o_ags30"
	,"cwr3_o_spg9"
	,"cwr3_o_konkurs_tripod"
	,"CUP_O_Metis_RU"
	,"CUP_I_Metis_AAF"
	
	,"CUP_O_TT650_CHDKZ"	
	,"O_Quadbike_01_F"	

//UK_US
	,'pook_MAARS_M240'	
	,"cwr3_b_uk_l7a2_low"
	,"cwr3_b_uk_l111a1_low"
	,"CUP_B_L16A2_BAF_DDPM"
	,"CUP_B_MK19_TriPod_USMC"
	,"CUP_I_MK19_TriPod_AAF"
	
	,"cwr3_b_m2hb_low"
	,"CUP_I_M2StaticMG_MiniTripod_AAF"
	
	,"CUP_I_L134A1_TriPod_AAF"
	,"cwr3_b_uk_l111a1_low"
	,"CUP_I_L111A1_MiniTripod_AAF"
	
	
	
	
	,"CUP_B_M2StaticMG_MiniTripod_USMC"
	,"CUP_B_L111A1_MiniTripod_BAF_WDL"
	,"CUP_B_L134A1_TriPod_BAF_DDPM"
	,'CUP_B_M134_A_GB'
	,'CUP_B_M134_A_US_ARMY'
	
	,'CUP_B_M1030_USA'
	,'B_Quadbike_01_F'
	];
	
	
	IL_x_reduce_list_plus_0_30=[
	"CUP_O_Igla_AA_pod_RU"
	,"CUP_O_TT650_CHDKZ"
	,'CUP_C_TT650_TK_CIV'
	];
	
	IL_x_reduce_list_minus_0_15=[
	"CUP_O_ZU23_RU"
	,"pook_ZU23_base"
	,"pook_ZU23M_base"	
	,"cwr3_i_zu23"
	,"CUP_O_Kornet_RU"
	];
	
	IL_x_reduce_list_minus_0_35=[
	"pook_A222_OPFOR"
	,"pook_9K58_OPFOR"
	

	
	];
	
	IL_x_reduce_list_minus_0_75=[
	'pook_Pandur_Mk19_BLUFOR'
	,'pook_Pandur_M2_BLUFOR'
	,'pook_Pandur_AT_BLUFOR'
	,'pook_Pandur_AMB_BLUFOR'
	,'pook_Pandur_SP30_BLUFOR'
	,'pook_Pandur_RWS_BLUFOR'
	,'pook_Pandur_Mortar_BLUFOR'	
	,'pook_Pandur_RCWS30_BLUFOR'
	,'pook_Pandur_MGS_BLUFOR'
	,'pook_Pandur_AA_BLUFOR'

	];
	
	
	
	IL_Supported_plus_loaddistance_1_0=[	
	'O_Radar_System_02_F'
	,'B_Radar_System_01_F'
		,"CUP_O_ZU23_RU"
	,"pook_ZU23_base"
	,"pook_ZU23M_base"	
	,"cwr3_i_zu23"
	
	];
	IL_Supported_plus_loaddistance_0_5=[	
	'O_SAM_System_04_F'
	,'CUP_B_Mastiff_LMG_GB_W'
	,'CUP_B_Mastiff_HMG_GB_W'
	,'CUP_B_Mastiff_GMG_GB_W'
	,'B_SAM_System_03_F'
	,"CUP_B_BAF_Coyote_L2A1_W"
	,"CUP_B_BAF_Coyote_GMG_W"
	
	
	];
	
	IL_Supported_minus_loaddistance_0_5=[	
	"pook_A222_OPFOR"
	,"pook_9K58_OPFOR"
	,"pook_su24_base"
	,"UK3CB_BAF_MAN_HX58_Transport_Green"
	,'pook_MEADS_base'
	,'CUP_B_M7Bradley_USA_W'
	,'cwr3_b_uk_fv4201'
	,'CUP_B_M2Bradley_USA_W'
	,'CUP_B_M270_HE_BAF_WOOD'
	,'cwr3_b_uk_fv4030'
	,'CUP_B_M270_HE_USMC'
	,'CUP_B_M2A3Bradley_USA_W'
	,'CUP_B_Challenger2_2CW_BAF'
	,'CUP_B_M6LineBacker_USA_W'
	,'CUP_B_AW159_Unarmed_RN_Grey'
	,'cwr3_b_kiowa_dyn'
	,'CUP_B_AV8B_DYN_USMC'
	,'FIR_AV8B'
	,'CUP_B_AH1_DL_BAF'
	,'FMX_AV8B2_GR9_SQN3_A_UK'
	//,'UK3CB_BAF_Apache_AH1_Generic'
	,'UK3CB_BAF_Apache_AH1_JS'
	

	
	];
	
	IL_Supported_minus_loaddistance_0_75=[
	"pook_NASAMS_BASE"
	,'cwr3_b_m939'
	,'cwr3_b_m939_reammo'
	,'cwr3_b_m939_repair'	
	,'pook_CRAM_BASE'
	,'pook_MLRS_BLUFOR'
	,'cwr3_b_f4e'
	,'cwr3_b_uk_f4m'
	,'CUP_B_AW159_GB'
	,'FIR_F14A_NSAWC'
	,'Tornado_AWS_camo_uk'
	,'cwr3_b_ah64'
	,'CUP_B_A10_DYN_USA'
	,'EA18G_141CAG'
	,'cwr3_b_frs1'
	,'CUP_B_GR9_DYN_GB'
	,'CUP_B_AH1Z_Dynamic_USMC'
	,'CUP_B_AH64D_DL_USA'
	,'FIR_F22_FF'
	,'CUP_B_F35B_USMC'
	,'CUP_B_F35B_Stealth_USMC'
	,'FIR_F35B_DarkGrey'
	,'FIR_F35B_RAF01'
	,'CUP_B_F35B_BAF'
	,'CUP_B_F35B_Stealth_BAF'
	,"cwr3_o_fia_ural_empty"
	,"cwr3_b_m939_empty"
		
	];
	
	IL_Supported_minus_loaddistance_1=[	
	"pook_MIG21_INDFOR"
	,"CUP_O_Ka60_Grey_RU"
	,"pook_MIG21_OPFOR"
	,"CUP_O_Ka50_DL_RU"
	,"CUP_O_Ka52_RU"
	,"CUP_O_Ka52_Blk_RU"
	
	,"pook_YAK38_OPFOR"
	,"CUP_O_Su25_Dyn_RU"
	,"pook_MIG29_OPFOR"
	,"pook_MIG35_OPFOR"
	,"pook_MIG31_OPFOR"
	,"CUP_O_SU34_RU"
	,"pook_CAESAR_BLUFOR"
	,"CUP_B_MV22_USMC"
	,"cwr3_b_uh60"
	,'cwr3_b_uk_puma_hc1'
	,'cwr3_b_uk_lynx_ah7_transport'
	,'CUP_B_UH1Y_MEV_USMC'
	,'CUP_B_MH60L_DAP_4x_USN'
	,'CUP_B_UH1Y_Gunship_Dynamic_USMC'
	,'cwr3_b_uh60_mev'
	,'cwr3_b_ah1f'
	,'cwr3_b_uk_lynx_ah7_tow'
	,'UK3CB_BAF_Wildcat_AH1_6_Generic'
	,'cwr3_b_f16c'
	,'UK3CB_BAF_Wildcat_AH1_8_Generic'
	,'FIR_F23A_Black'
	,'pook_AN26_OPFOR'
	];
	
	IL_Supported_minus_loaddistance_2=[	
	"CUP_I_Mi24_Mk3_ION"
	,"CUP_I_Mi24_Mk4_ION"
	,"CUP_I_Mi24_D_Dynamic_ION"
	,"cwr3_i_mi8_mtv3"
	,"CUP_O_Mi8_RU"
	,"CUP_O_Mi8AMT_RU"
	,"cwr3_o_mi8_mev"	
	,'cwr3_o_mi24d'
	,'CUP_O_Mi24_V_Dynamic_RU'
	,'CUP_O_Mi24_P_Dynamic_RU'	
	,"pook_S70"
	,'UK3CB_BAF_Merlin_HC3_24'
	,'UK3CB_BAF_Merlin_HC4_CSAR'	
	,"UK3CB_BAF_MAN_HX60_Cargo_Green_A"	
	];
	
	IL_Supported_minus_loaddistance_3=[
	"cwr3_o_su17m4"
	,"pook_Su22_OPFOR_P"
	,"pook_Mig23_OPFOR"
	,'CUP_B_CH53E_USMC'
	,'cwr3_o_an12'
	];
	
	
	IL_z_reduce_list_minus_3_60=[
	"cwr3_i_uaz_aa"	
	,"cwr3_i_uaz_ags30"
	,"CUP_O_UAZ_AGS30_RU"
	,"CUP_O_UAZ_AA_RU"
	,'CUP_B_A10_DYN_USA'
	];
	
	IL_z_reduce_list_minus_3_30=[
	"cwr3_i_uaz_spg9"	
	,"CUP_O_UAZ_SPG9_RU"	
	];
		
	
	IL_z_reduce_list_2_60=[
	"CUP_C_UAZ_Unarmed_TK_CIV"
	,'CUP_C_UAZ_Open_TK_CIV'
	,"cwr3_i_uaz_dshkm"
	,"CUP_O_UAZ_METIS_RU"
	,"cwr3_o_uaz_mev"
	,"CUP_O_UAZ_Open_RU"
	,"CUP_O_UAZ_MG_RU"
	,"pook_Mig23_OPFOR"
	];
	
	
	IL_z_reduce_list_minus_1_50= [
	"cwr3_o_bmp2_mev"	
	,'cwr3_o_mi24d'
	,'CUP_O_Mi24_V_Dynamic_RU'
	,'CUP_O_Mi24_P_Dynamic_RU'
	,'pook_Pandur_Mk19_BLUFOR'
	,'pook_Pandur_M2_BLUFOR'
	,'pook_Pandur_SP30_BLUFOR'
	,'pook_Pandur_MGS_BLUFOR'
	,'pook_MAARS_M240'
	,'cwr3_b_frs1'
	,'pook_AN26_OPFOR'
	];
	
	
	IL_z_reduce_list_minus_1_25= [
	'pook_Adunok_IND'
	,"pook_BTR80MWS_INDFOR"
	,"pook_BTR80_INDFOR"
	,"pook_BTR80_2A42_INDFOR"
	,"pook_MIG21_INDFOR"
	,"CUP_I_Mi24_D_Dynamic_ION"
	,"pook_BTR80MWS_OPFOR"
	,"pook_MIG21_OPFOR"
	,"CUP_O_Pchela1T_RU"
	,'pook_MEADS_base'
	,'FIR_F22_FF'	
	];
	
	IL_z_reduce_list_minus_1_00=[
	"pook_S60_base_IND"
	,"pook_S70"
	,"pook_S60_base"
	,'pook_KS12_base'
	,'pook_KS19_base'		
	];
	
	
	IL_z_reduce_list_minus_0_55= [
	"CUP_I_T72_NAPA"
	,"cwr3_i_t72b1"
	,"cwr3_i_t72a"
	,"CUP_I_Mi24_Mk3_ION"
	,"CUP_I_Mi24_Mk4_ION"
	,"cwr3_i_mi8_mtv3"
	,"cwr3_o_t64b"	
	,"cwr3_o_t64bv"
	,"CUP_O_T72_RU"
	,"cwr3_o_t72a"	
	,"cwr3_o_t72b1"
	,"CUP_O_Mi8_RU"
	,"CUP_O_Mi8AMT_RU"
	,"cwr3_o_mi8_mev"
	,"cwr3_o_su17m4"	
	,"pook_Su22_OPFOR_P"
	,'CUP_B_M7Bradley_USA_W'
	,'CUP_B_M60A3_USMC'
	,'CUP_B_M2Bradley_USA_W'
	,'CUP_B_M2A3Bradley_USA_W'
	,'CUP_B_M60A3_TTS_USMC'
	,'CUP_B_M6LineBacker_USA_W'	
	,'CUP_B_AW159_Unarmed_RN_Grey'
	,'cwr3_b_uk_lynx_ah7_transport'
	,'CUP_B_AW159_GB'
	,'cwr3_b_uk_lynx_ah7_tow'
	,'FIR_F14A_NSAWC'
	,'EA18G_141CAG'
	,'FIR_F23A_Black'
	,'FIR_F35B_DarkGrey'
	,'FIR_F35B_RAF01'
	];
	
	IL_z_reduce_list_minus_0_30=[
	"pook_A222_OPFOR"
	,"pook_9K58_OPFOR"
	,"pook_TOS1A_OPFOR"
	,"CUP_O_Ka60_Grey_RU"
	,"cwr3_o_an2"
	,"CUP_O_SU34_RU"
	,'pook_Pandur_AT_BLUFOR'
	,'pook_Pandur_AMB_BLUFOR'
	,'pook_Pandur_RWS_BLUFOR'
	,'pook_Pandur_Mortar_BLUFOR'
	,'pook_Pandur_RCWS30_BLUFOR'
	,'pook_Pandur_AA_BLUFOR'
	,'cwr3_b_uk_puma_hc1'
	,'CUP_B_UH1Y_Gunship_Dynamic_USMC'
	,'cwr3_b_f16c'
	,'EAWS_EF2000_rafhist_CAP'
	,'CUP_B_F35B_USMC'
	,'CUP_B_F35B_Stealth_USMC'
	,'CUP_B_F35B_BAF'
	,'CUP_B_F35B_Stealth_BAF'
	,'cwr3_o_an12'
	,'cwr3_o_mi6t'
	
	];
	
	IL_z_reduce_list_minus_0_15=[
	"cwr3_o_t55"
	,"cwr3_o_t55a"
	,"cwr3_o_t55amv"
	,"CUP_I_T55_TK_GUE"
	,"cwr3_i_t55a"
	,"cwr3_o_zsu"
	,"CUP_O_Ka50_DL_RU"
	,'CUP_B_nM1097_AVENGER_USA_WDL'
	,'CUP_B_M1135_ATGMV_Woodland'
	,'CUP_B_M1133_MEV_Woodland'
	,'CUP_B_M113A3_USA'
	,'cwr3_b_m113a3_mev_des'
	,'CUP_B_M1128_MGS_Woodland'
	,'CUP_B_M163_Vulcan_USA'
	,'cwr3_b_uk_fv4201'
	,'cwr3_b_uk_fv4030'
	,'cwr3_b_m901_itv'
	,'cwr3_b_fia_m41a1'
	,'CUP_B_AH1Z_Dynamic_USMC'	
	,"cwr3_o_fia_ural_empty"
	,"cwr3_b_m939_empty"
	,"CUP_B_M1152_WDL_USA"
	,"CUP_B_M1165_GMV_WDL_USA"
	];
	
	IL_WIDE_UNLOAD =[
	"CUP_O_SU34_RU"
	,'cwr3_b_ch47'
	,"cwr3_b_uk_hc1"
	,"FIR_F14A_NSAWC"
	,'Tornado_AWS_camo_uk'
	,'FIR_F15A'
	,'EA18G_141CAG'
	,'EAWS_EF2000_rafhist_CAP'
	,'FIR_F23A_Black'
	,'FIR_F22_FF'
	,'pook_AN26_OPFOR'	
	,'cwr3_o_mi6t'
	,'pook_M777'
	,'pook_M777_IND'
	];
	
	IL_EXTRA_WIDE_UNLOAD=[
	'cwr3_o_an12'
	,'CUP_B_C130J_USMC'
	,'CUP_B_C130J_GB'
	];
//________________________________________________________________________________LOADVEH DEF____________________________________________________
//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/		
	// Supported vehicles
//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/		
//________________________________________________________________________________LOADVEH DEF____________________________________________________

	
	//------------------8 SLOTS----------------------------
	IL_Supported_Vehicles_MAZ = [			
	"pook_MAZ7910_base"
	,"pook_MAZ7910_base_BLUFOR"
	];

	//-------------------4 SLOTS---------------------------

	IL_Supported_Vehicles_M939 = [
	"cwr3_b_m939_empty"
	,'C_Van_01_transport_F'
	];
	
	IL_Supported_Vehicles_MAN = [
	"UK3CB_BAF_MAN_HX60_Cargo_Green_A"
	];
	
	
	IL_Supported_Vehicles_URAL = [
	"cwr3_o_fia_ural_empty"
	,"cwr3_c_ural_empty"
	];
	
	//-------------------2 SLOTS----------------------------
	IL_Supported_Vehicles_FV620 = [
	"cwr3_b_uk_fv620_transport"
	
	];
	
	IL_Supported_Vehicles_HUMMER = [
	"CUP_B_M1152_WDL_USA"	
	];
	
	IL_Supported_Vehicles_HILUX = [
	"CUP_O_Hilux_unarmed_CHDKZ"
	,'CUP_C_Pickup_unarmed_CIV'
	,'C_Offroad_01_F'
	,'CUP_O_Hilux_unarmed_TK_CIV'
	
	];
	IL_Supported_Vehicles_UAZ = [
	'CUP_C_UAZ_Open_TK_CIV'
	,"CUP_O_UAZ_Open_RU"
	];
	
	
	//-------------------2 SLOTS----------------------------ARMED
	
	IL_Supported_Vehicles_HUMMERA = [	
	"CUP_B_M1165_GMV_WDL_USA"
	
	];
	
	IL_Supported_Vehicles_BTR40 = [	
	"cwr3_o_fia_btr40_dshkm"	
	];
	
	IL_Supported_Vehicles_COYOTE = [	
	"CUP_B_BAF_Coyote_L2A1_W"
	,"CUP_B_BAF_Coyote_GMG_W"
	];
	
	IL_Supported_Vehicles_WOLF = [	
	"CUP_B_Wolfhound_GMG_GB_W"
	,"CUP_B_Wolfhound_HMG_GB_W"
	,"CUP_B_Wolfhound_LMG_GB_W"
	];
	
	IL_Supported_Vehicles_HUSKY = [	
	"UK3CB_BAF_Husky_Passenger_GMG_Green"
	,"UK3CB_BAF_Husky_Passenger_GPMG_Green"
	
	];
	
	IL_Supported_Vehicles_DATSUN = [	
	"CUP_O_Datsun_PK"	
	,'CUP_C_Datsun_4seat'
	,"CUP_C_Datsun"
	];
	
	IL_Supported_Vehicles_SOV = [	
	"CUP_B_nM1025_SOV_M2_USA_WDL"
	,"CUP_B_nM1025_SOV_Mk19_USA_WDL"
	];
	
	IL_Supported_Vehicles_All = 
	
	IL_Supported_Vehicles_MAZ
	+IL_Supported_Vehicles_M939
	+IL_Supported_Vehicles_MAN
	+IL_Supported_Vehicles_URAL
	+IL_Supported_Vehicles_FV620
	+IL_Supported_Vehicles_HUMMER
	+IL_Supported_Vehicles_HILUX
	+IL_Supported_Vehicles_UAZ
	+IL_Supported_Vehicles_HUMMERA
	+IL_Supported_Vehicles_BTR40
	+IL_Supported_Vehicles_COYOTE
	+IL_Supported_Vehicles_WOLF
	+IL_Supported_Vehicles_HUSKY
	+IL_Supported_Vehicles_DATSUN
	+IL_Supported_Vehicles_SOV
	;

	// Vehicles with the ability to dropping the load on the parachute
	IL_Para_Drop_Vehicles = [];


//________________________________________________________________________________CARGOVEH DEF____________________________________________________
//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/		
	// Cargo vehicles
//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/		
//________________________________________________________________________________CARGOVEH DEF____________________________________________________

	
	IL_Supported_1_slots = [
//CIV
	'cwr3_c_bicycle'
	,'CUP_C_TT650_TK_CIV'	
//RES
	,'pook_MAARS_AA12_IND'
	,'pook_MAARS_M240_IND'
//RU
	,'O_Static_Designator_02_F'
	,'CUP_O_TT650_CHDKZ'
//UK_US
	,'pook_MAARS_M240'
	,'B_Static_Designator_01_F'	
	,'CUP_B_M1030_USA'	
	];


	IL_Supported_2_slots =[//__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2__2
//CIV
	'C_Quadbike_01_F'
	,'CUP_BOX_TK_WpsSpecial_F'
	,'CUP_BOX_GB_WpsSpecial_F'
	,'CUP_BOX_US_ARMY_WpsSpecial_F'
//RES
	,'pook_MRK27BT_IND'
	,'pook_AdunokM_GL_IND'
	,'pook_AdunokM_DSHK_IND'
	,'pook_Adunok_IND'	
	,"CUP_I_M2StaticMG_RACS"
	,"I_HMG_02_high_F"
	,"cwr3_i_dshkm_high"
	
	,"CUP_I_DSHKM_AAF"
	,"CUP_I_DSHKM_MiniTriPod_AAF"
	
	,"I_HMG_02_F"
	,"cwr3_i_dshkm_low"		
	,"CUP_I_M2StaticMG_MiniTripod_RACS"
	,"cwr3_i_ags30"
	
	,"CUP_I_AGS_AAF"
	
	
	,"cwr3_i_spg9"	
	,"cwr3_i_zu23"
//RU	
	,"O_Quadbike_01_F"	
	,"pook_MRK27BT"	
	,"cwr3_o_searchlight"
	
	
	
	,"CUP_O_SearchLight_static_RU"
	,"cwr3_o_nsv_low"
	,"cwr3_o_nsv_high"
	,"CUP_O_KORD_RU"
	,"CUP_O_KORD_high_RU_M_BeigeDigital"
	,"cwr3_o_ags30"
	,"cwr3_o_spg9"
	,"cwr3_o_konkurs_tripod"
	,"CUP_O_Kornet_RU"
	,"CUP_I_Kornet_AAF"
	
	
	,"CUP_O_Igla_AA_pod_RU"
	
	,"CUP_O_Metis_RU"
	,"CUP_I_Metis_AAF"
	
	
	
	
	,"CUP_O_2b14_82mm_RU"			
	,"CUP_I_2b14_82mm_AAF"		
	,"cwr3_o_2b14"		
	
	
	,"CUP_O_ZU23_RU"
	,"pook_ZU23_base"
	,"pook_ZU23M_base"		
//UK_US
	,"cwr3_b_uk_searchlight"
	,"CUP_B_SearchLight_static_BAF_DDPM"	
	,"cwr3_b_uk_l7a2_low"
	,"cwr3_b_uk_l111a1_low"
	,"CUP_B_L16A2_BAF_DDPM"
	,"CUP_B_MK19_TriPod_USMC"
	,"CUP_B_M2StaticMG_MiniTripod_USMC"
	,"CUP_B_L111A1_MiniTripod_BAF_WDL"	
	,"cwr3_b_uk_l111a1_high"	
	,"CUP_B_L134A1_TriPod_BAF_DDPM"
	,"cwr3_b_searchlight"
	,"CUP_B_SearchLight_static_USMC"	
	,"CUP_B_M2StaticMG_USMC"	
	,"CUP_B_TOW2_TriPod_USMC"
	,"cwr3_b_uk_javelin_lml"
	,"CUP_B_L111A1_BAF_DDPM"	
	,"CUP_B_TOW_TriPod_USMC"
	,"CUP_B_Stinger_AA_pod_Base_USMC"
	,"CUP_B_M252_USMC"
	
	,"cwr3_b_m252"
	,"CUP_I_M252_AAF"
	
	,"cwr3_b_mk19"
	,"CUP_I_MK19_TriPod_AAF"
	
	
	,"cwr3_b_m2hb_high"
	,"cwr3_b_m2hb_low"
	,"CUP_I_M2StaticMG_MiniTripod_AAF"
	,"CUP_I_M2StaticMG_AAF"
	,"CUP_I_L16A2_AAF"
	,"CUP_I_TOW2_TriPod_AAF"
	
	
	,"CUP_I_L134A1_TriPod_AAF"
	,"cwr3_b_uk_l111a1_high"
	,"cwr3_b_uk_l111a1_low"
	,"CUP_I_L111A1_MiniTripod_AAF"
	,"CUP_I_L111A1_AAF"
	,"cwr3_b_tow"
	,"CUP_I_TOW_TriPod_AAF"
	
	
	
	,"CUP_B_M134_A_GB"	
	,"CUP_B_M134_A_US_ARMY"
	,"B_Quadbike_01_F"	
	];

	IL_Supported_4_slots =[//__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4__4
//CIV
	'CUP_C_Lada_GreenTK_CIV'
	,'CUP_C_Golf4_green_Civ'
	,'CUP_C_UAZ_Unarmed_TK_CIV'	
	,'CUP_C_UAZ_Open_TK_CIV'
//RES
	,"cwr3_i_uaz_aa"
	,"cwr3_i_uaz_dshkm"
	,"cwr3_i_uaz_spg9"
	,"cwr3_i_uaz_ags30"	
	
	,"CUP_I_Type072_Turret"	
	,"CUP_I_M119_RACS"
	,"CUP_I_D30_TK_GUE"
	,"pook_M777_IND"
//RU	
	,"CUP_O_UAZ_Open_RU"
	,"CUP_O_UAZ_MG_RU"
	,"CUP_O_UAZ_AGS30_RU"
	,"CUP_O_UAZ_SPG9_RU"
	,"cwr3_o_uaz_mev"
	,"CUP_O_UAZ_METIS_RU"
	,"CUP_O_UAZ_AA_RU"
	,"CUP_O_Pchela1T_RU"
	,'CUP_O_D30_RU'
	,'O_Radar_System_02_F'
//UK_US
	,"cwr3_b_m151"
	,"cwr3_b_m151_m2"	
	,'pook_M777'
	,'cwr3_b_uk_l118'
	,'B_Radar_System_01_F'
	,'CUP_WV_B_CRAM'
	,"B_AAA_System_01_F"
	];




	IL_Supported_6_slots=[//__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6__6
//CIV
	'C_Van_01_fuel_F'
	,'C_Van_01_transport_F'
	,'CUP_C_Ural_Civ_01'
	,'C_Truck_02_transport_F'
	,'CUP_C_V3S_Open_TKC'
	,'CUP_C_Bus_City_TKCIV'
	,'C_SUV_01_F'
	,'CUP_C_Datsun_4seat'
	,'CUP_C_Pickup_unarmed_CIV'
	,'C_Offroad_01_F'
	,'CUP_O_Hilux_unarmed_TK_CIV'	
	,'CUP_C_S1203_CIV'
	,'CUP_C_Octavia_CIV'
	,'C_Hatchback_01_F'
	,'CUP_C_Volha_Gray_TKCIV'
	,'C_Hatchback_01_sport_F'
	,'CUP_C_SUV_TK'
	,'UK3CB_Civ_LandRover_Soft_Blue_A'
	,'UK3CB_Civ_LandRover_Hard_Red_A'
	,'CUP_C_LR_Transport_CTK'	
	,"CUP_C_Datsun"
//RES	
	,"CUP_I_BRDM2_TK_Gue"
	,"cwr3_i_brdm2"
	,"CUP_I_BTR80_ION"
	,"cwr3_i_btr60"
	,"CUP_I_BTR80A_ION"		
	,"CUP_I_BRDM2_ATGM_TK_Gue"
	,"cwr3_i_brdm2_atgm"
	,"CUP_I_SUV_Armored_ION"
	,"CUP_I_RG31_M2_W_GC_ION"
	,"CUP_I_RG31_M2_W_ION"	
	,"CUP_I_RG31E_M2_W_ION"
	,"CUP_I_RG31_Mk19_W_ION"
	,"CUP_I_RG31_M2_GC_ION"
	,"CUP_I_RG31_M2_ION"
	,"CUP_I_RG31E_M2_ION"	
	,"CUP_I_RG31_Mk19_ION"
	,"CUP_I_BTR40_MG_TKG"
	,"cwr3_i_btr40_dshkm"
	,"cwr3_i_ural_zu23"
	,"CUP_I_Hilux_zu23_TK"	
	,"CUP_I_Ural_ZU23_TK_Gue"
	,"CUP_I_Datsun_AA_TK_Random"
	,"CUP_I_Hilux_igla_TK"
	,"CUP_I_Datsun_AA_TK"	
	,"CUP_I_Hilux_SPG9_TK"
	,"CUP_I_Hilux_metis_TK"
	,"CUP_I_nM1036_TOW_ION_WIN"
	,"CUP_I_nM1036_TOW_ION"	
	,"CUP_B_nM1025_SOV_M2_ION"
	,"CUP_I_Hilux_M2_TK"
	,"CUP_I_Hilux_DSHKM_TK"
	,"CUP_I_nM1025_M2_ION_WIN"
	,"CUP_B_nM1025_SOV_M2_ION_WIN"
	,"CUP_I_nM1025_M2_ION"	
	,"CUP_I_nM1025_Mk19_ION"
	,"CUP_I_Hilux_AGS30_TK"	
	,"CUP_I_nM1025_Mk19_ION_WIN"
	,"CUP_I_nM1025_M240_ION_WIN"
	,"CUP_I_Datsun_PK_TK_Random"
	,"CUP_I_Datsun_PK_TK"
	,"CUP_I_nM1025_M240_ION"	
	,"CUP_I_Hilux_podnos_TK"
	,"CUP_I_Hilux_MLRS_TK"
	,"BRDM2IMPM240_INDFOR"
	,"BRDM2IMPPKM_INDFOR"
	,"pook_BTRMWS_INDFOR"
	,"pook_BTR80MWS_INDFOR"
	,"BRDM2MAGS_INDFOR"	
	,"BRDM2IMPMk19_INDFOR"
	,"BRDM2IMPM2_INDFOR"
	,"pook_BTR60_INDFOR"
	,"BRDM2IMPDSHK_INDFOR"
	,"BRDM2M_INDFOR"	
	,"pook_BTR80_INDFOR"
	,"BRDM2IMP_INDFOR"
	,"pook_BPM2A42_INDFOR"
	,"pook_BTR2A42_INDFOR"
	,"pook_BTR80_2A42_INDFOR"	
	,"BRDM2IMPAT3_INDFOR"
	,"BRDM2IMPRKT_INDFOR"
	,"BRDM2IMPAT2_INDFOR"
	,"BRDM2IMPTOW_INDFOR"
	,"BRDM2IMPAT3c_INDFOR"	
	,"BRDM2IMPAT5_INDFOR"
	,"BRDM2IMPAA_INDFOR"
	,"BRDM2IMP_9K31_INDFOR"
	,"CUP_I_Hilux_UB32_TK"	
	,"cwr3_i_mtlb_sa13"
	,"cwr3_i_bmp2_zu23"
	,"cwr3_i_mtlb_repair"
	,"cwr3_i_mtlb_pk"
	,"CUP_I_MTLB_pk_NAPA"
	,"cwr3_i_bmp2"	
	,"CUP_I_BMP2_NAPA"
	,"cwr3_i_bmp1"
	,"CUP_I_BMP1_TK_GUE"	
	,"pook_S60_base_IND"	
//RU
	,"cwr3_o_uaz452"
	,"cwr3_o_uaz452_mev"	
	,"CUP_O_Ural_RU"
	,"cwr3_o_ural_zu23"
	,"CUP_O_GAZ_Vodnik_PK_RU"
	,"CUP_O_GAZ_Vodnik_AGS_RU"
	,"cwr3_o_ural_reammo"	
	,"cwr3_o_brdm2um"
	,"BRDM2IMPPKM_OPFOR"
	,"CUP_O_Ural_Repair_RU"
	,"CUP_O_GAZ_Vodnik_KPVT_RU"
	,"BRDM2IMPDSHK_OPFOR"	
	,"CUP_O_BRDM2_RUS"
	,"BRDM2IMPAT2_OPFOR"
	,"BRDM2IMPAT3_OPFOR"
	,"CUP_O_GAZ_Vodnik_MedEvac_RU"
	,"CUP_O_GAZ_Vodnik_BPPU_RU"	
	,"pook_BTRMWS_OPFOR"
	,"cwr3_o_btr80"
	,"BRDM2MAGS_OPFOR"
	,"pook_BTR80MWS_OPFOR"
	,"pook_BTR2A42_OPFOR"	
	,"CUP_O_BM21_RU"
	,"pook_96K6_root"
	,"BRDM2IMP_9K31_OPFOR"
	,"CUP_O_BRDM2_ATGM_RUS"
	,"cwr3_o_mtlb_mev"	
	,"CUP_O_BTR90_RU"
	,"pook_9K57M_OPFOR"	
	,"CUP_O_MTLB_pk_WDL_RU"
	,"cwr3_o_bmp2_zu23"
	,"cwr3_o_bmp1"
	,"cwr3_o_bmp1p"
	,"cwr3_o_bmp2_mev"	
	,"cwr3_o_bmp2"
	,"cwr3_o_mtlb_sa13"
	,"CUP_O_BMP3_RU"
	,'O_SAM_System_04_F'	
	,"pook_S60_base"
	,"pook_KS12_base"
	,'pook_KS19_base'
	,"CUP_O_BTR90_HQ_RU"
	,"Land_Device_slingloadable_F"
	,"CUP_O_Hilux_unarmed_CHDKZ"
	,"cwr3_o_fia_btr40_dshkm"
	,"CUP_O_Datsun_PK"
	
//UK_US
	,'UK3CB_BAF_LandRover_Soft_Green_B'
	,'UK3CB_BAF_LandRover_WMIK_GMG_Green_B'
	,'UK3CB_BAF_Panther_GPMG_Green_A'
	,'UK3CB_BAF_Husky_Passenger_GMG_Green'	
	,'UK3CB_BAF_Husky_Passenger_GPMG_Green'
	,'CUP_B_Jackal2_L2A1_GB_W'
	,'CUP_B_Jackal2_GMG_GB_W'
	,'cwr3_b_uk_fv620_reammo'
	,'cwr3_b_uk_fv432_gpmg'		
	,'UK3CB_BAF_LandRover_Soft_MERT_A'
	,'UK3CB_BAF_LandRover_Amb_Green_A'
	,'UK3CB_BAF_MAN_HX60_Repair_Green'
	,'pook_Pandur_Mk19_BLUFOR'	
	,'pook_Pandur_M2_BLUFOR'
	,'CUP_B_Ridgback_LMG_GB_W'
	,'UK3CB_BAF_LandRover_WMIK_Milan_Green_B'
	,'pook_Pandur_AT_BLUFOR'
	,'pook_Pandur_AMB_BLUFOR'	
	,'CUP_I_LR_AA_AAF'
	,'pook_Pandur_RWS_BLUFOR'
	,'pook_Pandur_SP30_BLUFOR'
	,'CUP_B_Ridgback_HMG_GB_W'
	,'CUP_B_Ridgback_GMG_GB_W'
	,'CUP_B_Mastiff_LMG_GB_W'
	,'cwr3_b_uk_fv432_peak'
	,'pook_Pandur_Mortar_BLUFOR'	
	,'CUP_B_FV432_GB_Ambulance'
	,'cwr3_b_uk_fv620_repair'
	,'CUP_B_Mastiff_HMG_GB_W'
	,'CUP_B_Mastiff_GMG_GB_W'
	,'pook_Pandur_RCWS30_BLUFOR'
	,'pook_Pandur_MGS_BLUFOR'
	,'pook_Pandur_AA_BLUFOR'	
	,'UK3CB_BAF_LandRover_Panama_Green_A'	
	,'CUP_B_nM1038_DF_USMC_WDL'	
	,'CUP_B_nM1025_M240_USMC_WDL'
	,'CUP_B_M1165_GMV_USMC'
	,'CUP_B_nM1025_Mk19_DF_USMC_WDL'
	,'CUP_B_nM1025_M2_DF_USMC_WDL'
	,'CUP_B_M1151_Mk19_USMC'	
	,'CUP_B_M1151_M2_USMC'
	,'CUP_B_M113A1_USA'
	,'CUP_B_nM997_DF_USMC_WDL'
	,'CUP_B_RG31_M2_OD_USMC'
	,'CUP_B_RG31_Mk19_OD_USMC'	
	,'CUP_B_nM1036_TOW_DF_USMC_WDL'
	,'CUP_B_M1135_ATGMV_Woodland'
	,'CUP_B_M1133_MEV_Woodland'
	,'CUP_B_nM1097_AVENGER_USA_WDL'
	,'CUP_B_M113A3_USA'	
	,'CUP_B_LAV25_USMC'
	,'CUP_B_M1126_ICV_M2_Woodland'
	,'CUP_B_M1126_ICV_MK19_Woodland'
	,'CUP_B_M1129_MC_MK19_Woodland'
	,'cwr3_b_m113a3_mev_des'
	,'CUP_B_M1128_MGS_Woodland'
	,'CUP_B_M163_Vulcan_USA'
	,'CUP_B_FV432_Bulldog_GB_W_RWS'
	,'UK3CB_BAF_FV432_Mk3_GPMG_Green'
	,'CUP_B_AAV_USMC'
	,'cwr3_b_uk_fv510'
	,'cwr3_b_uk_fv107'
	,'cwr3_b_uk_fv101'
	,'CUP_B_M7Bradley_USA_W'	
	,'CUP_B_MCV80_GB_W'
	,'CUP_B_M2Bradley_USA_W'
	,'cwr3_b_m163'
	,'CUP_B_MCV80_GB_W_SLAT'
	,'CUP_B_FV510_GB_W'
	,'CUP_B_M2A3Bradley_USA_W'
	,'CUP_B_M6LineBacker_USA_W'
	,'CUP_B_FV510_GB_W_SLAT'
	,'cwr3_b_m901_itv'	
	,'B_SAM_System_03_F'
	,"CUP_B_LAV25_HQ_USMC"
//OTHER	unused atm, maybe i add ofps spawncontainer later
	,"Land_Pod_Heli_Transport_04_medevac_F"
	,"B_Slingload_01_Medevac_F"	
	
	,"cwr3_b_uk_fv620_transport"
	,"CUP_B_M1152_WDL_USA"
	,"CUP_B_M1165_GMV_WDL_USA"
	,"CUP_B_BAF_Coyote_L2A1_W"
	,"CUP_B_BAF_Coyote_GMG_W"
	,"CUP_B_nM1025_SOV_M2_USA_WDL"
	,"CUP_B_nM1025_SOV_Mk19_USA_WDL"
	
	];
	
	IL_Supported_8_slots=[//__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8__8
//CIV
	'CUP_C_Ikarus_TKC'
	,"cwr3_c_ural_empty"
//RES
	,"CUP_I_ZSU23_Afghan_AAF"
	,"pook_ZSU57_base_IND"
	,"pook_ZSU_base_IND"	
	,"CUP_I_T72_NAPA"	
	,"cwr3_i_m41a1"
	,"CUP_I_T34_TK_GUE"
	,"cwr3_i_pt76b"
	,"cwr3_i_t72b1"
	,"cwr3_i_t72a"
	,"CUP_I_T55_TK_GUE"
	,"cwr3_i_t55a"
	,"cwr3_i_t34"			
	,"pook_MIG21_INDFOR"
	,"cwr3_i_l39_cap"
	,"cwr3_i_l39_s5"
	,"cwr3_i_cessna_t41_armed"
	,"CUP_I_Ka60_GL_Blk_ION"	
	,"CUP_I_Mi24_Mk3_ION"
	,"CUP_I_Mi24_Mk4_ION"
	,"CUP_I_Mi24_D_Dynamic_ION"
	,"CUP_I_Ka60_GL_Blk_ION"
	,"CUP_I_UH60L_RACS"	
	,"CUP_I_UH1H_armed_TK_GUE"
	,"CUP_I_UH1H_gunship_TK_GUE"
	,"cwr3_i_mi8_mtv3"
	,"pook_Mi28_INDFOR"
	,"cwr3_i_an2"	
//RU
	,"pook_A222_OPFOR"
	,"pook_9K58_OPFOR"	
	,"cwr3_o_pt76b"
	,"cwr3_o_t55"
	,"cwr3_o_t55a"
	,"cwr3_o_t55amv"
	,"pook_TOS1A_OPFOR"	
	,"cwr3_o_zsu"	
	,"cwr3_o_t64b"
	,"cwr3_o_t64bv"
	,"CUP_O_T72_RU"
	,"cwr3_o_t72a"	
	,"cwr3_o_t72b1"
	,"CUP_O_T90_RU"
	,"CUP_O_2S6M_RU"	
	,"CUP_O_Su25_Dyn_RU"
	,"CUP_O_SU34_RU"	
	,"CUP_O_Ka60_Grey_RU"
	,"cwr3_o_an2"
	,"CUP_O_Mi8AMT_RU"
	,"cwr3_o_mi8_mev"
	,"CUP_O_Mi8_RU"	
	,"pook_MIG21_OPFOR"
	,"cwr3_o_mi24d"
	,"CUP_O_Ka50_DL_RU"
	,"cwr3_o_su17m4"
	,"pook_Su22_OPFOR_P"	
	,"CUP_O_Mi24_V_Dynamic_RU"
	,"CUP_O_Mi24_P_Dynamic_RU"
	,"pook_Mig23_OPFOR"
	,"CUP_O_Ka52_RU"
	,"CUP_O_Ka52_Blk_RU"
	,"pook_YAK38_OPFOR"	
	,"pook_MIG31_OPFOR"	
	,"pook_MIG29_OPFOR"
	,"pook_su24_base"
	,"pook_S70"	
	,"pook_MIG35_OPFOR"	
	,'pook_AN26_OPFOR'
	,'cwr3_o_an12'	
	,'cwr3_o_mi6t'
	,"cwr3_o_fia_ural_empty"
//UK_US	
	,"UK3CB_BAF_MAN_HX58_Transport_Green"
	,"pook_NASAMS_BASE"
	,"pook_CAESAR_BLUFOR"
	,'cwr3_b_m939'
	,'cwr3_b_m939_reammo'
	,'cwr3_b_m939_repair'	
	,'pook_CRAM_BASE'
	,'pook_MEADS_base'
	,'pook_MLRS_BLUFOR'	
	,'CUP_B_M60A3_USMC'
	,'cwr3_b_uk_fv4201'	
	,'cwr3_b_m1'
	,'CUP_B_M270_HE_BAF_WOOD'	
	,'cwr3_b_uk_fv4030'
	,'CUP_B_M270_HE_USMC'	
	,'CUP_B_M1A1FEP_Woodland_USMC'
	,'CUP_B_M1A1SA_Woodland_US_Army'
	,'CUP_B_M60A3_TTS_USMC'	
	,'CUP_B_Challenger2_2CW_BAF'
	,'CUP_B_M1A1EP_TUSK_Woodland_USMC'
	,'CUP_B_M1A2SEP_TUSK_II_Woodland_US_Army'
	,'cwr3_b_fia_m41a1'	
	,'cwr3_b_mh6j'
	,'CUP_B_AW159_Unarmed_RN_Grey'	
	,'CUP_B_CESSNA_T41_UNARMED_AIRFORCE_USA'
	,'CUP_B_MV22_USMC'
	,'CUP_B_CH53E_USMC'
	,'cwr3_b_ch47'
	,'cwr3_b_uh60'	
	,'cwr3_b_camel'
	,'UK3CB_BAF_Merlin_HC3_24'
	,'cwr3_b_uk_hc1'
	,'cwr3_b_uk_puma_hc1'
	,'cwr3_b_uk_lynx_ah7_transport'	
	,'CUP_B_CESSNA_T41_ARMED_USA'
	,'CUP_B_UH1Y_MEV_USMC'
	,'cwr3_b_ah6j'
	,'CUP_B_MH60L_DAP_4x_USN'
	,'CUP_B_UH1Y_Gunship_Dynamic_USMC'
	,'cwr3_b_f4e'	
	,'UK3CB_BAF_Merlin_HC4_CSAR'
	,'cwr3_b_uh60_mev'
	,'CUP_B_AW159_GB'
	,'cwr3_b_uk_F4M'	
	,'cwr3_b_ah1f'
	,'cwr3_b_kiowa_dyn'
	,'FIR_F14A_NSAWC'	
	,'cwr3_b_uk_lynx_ah7_tow'
	,'UK3CB_BAF_Wildcat_AH1_6_Generic'
	,'Tornado_AWS_camo_uk'		
	,'cwr3_b_ah64'
	,'FIR_F15A'
	,'FIR_AV8B'
	,'CUP_B_AV8B_DYN_USMC'
	,'CUP_B_A10_DYN_USA'
	,'cwr3_b_f16c'	
	,'EA18G_141CAG'
	,'CUP_B_AH6X_USA'
	,'UK3CB_BAF_Wildcat_AH1_8_Generic'
	,'CUP_B_AH1_DL_BAF'
	,'cwr3_b_frs1'
	,'FMX_AV8B2_GR9_SQN3_A_UK'
	,'CUP_B_GR9_DYN_GB'
	,'EAWS_EF2000_rafhist_CAP'	
	,'CUP_B_AH1Z_Dynamic_USMC'
	,'CUP_B_AH64D_DL_USA'
	,'CUP_B_USMC_DYN_MQ9'
	,'FIR_F22_FF'
	,'FIR_F23A_Black'
	,'CUP_B_F35B_USMC'
	,'CUP_B_F35B_Stealth_USMC'
	,'FIR_F35B_DarkGrey'
	//,'UK3CB_BAF_Apache_AH1_Generic'	
	
	,'UK3CB_BAF_Apache_AH1_JS'	
	
	
	,'UK3CB_BAF_MQ9_Reaper_Generic'
	,'FIR_F35B_RAF01'
	,'CUP_B_F35B_BAF'
	,'CUP_B_F35B_Stealth_BAF'	
	,'CUP_B_C130J_USMC'
	,'CUP_B_C130J_GB'	
	
	
	,"UK3CB_BAF_MAN_HX60_Cargo_Green_A"
	,"cwr3_b_m939_empty"
	,"CUP_B_Wolfhound_GMG_GB_W"
	,"CUP_B_Wolfhound_HMG_GB_W"
	,"CUP_B_Wolfhound_LMG_GB_W"
	];
	
	IL_Supported_MAZ=[];
	IL_Supported_M939=[];
	
//________________________________________________________________________________

	//---- CARGO DEFINITION ----

//________________________________________________________________________________	
	
	

	
	IL_Supported_Cargo_Veh_MAZ = [];
	/*
	IL_Supported_1_slots
	+IL_Supported_2_slots 
	+ IL_Supported_4_slots
	+IL_Supported_6_slots
	+IL_Supported_8_slots;
	*/
	
	IL_Supported_Cargo_NonVeh_MAZ = 
	IL_Supported_8_slots
	+IL_Supported_6_slots
	+IL_Supported_4_slots
	+IL_Supported_2_slots
	+IL_Supported_1_slots;
	
	/*
	IL_Supported_1_slots
	+IL_Supported_2_slots 
	+ IL_Supported_4_slots 
	+ IL_Supported_6_slots
	+IL_Supported_8_slots;
	*/
	
	IL_Supported_Cargo_MAZ = 
	IL_Supported_Cargo_Veh_MAZ + 
	IL_Supported_Cargo_NonVeh_MAZ;
	
IL_Supported_Cargo_Veh_M939 =//used for all 4 slot vehicles
	IL_Supported_4_slots
	+IL_Supported_2_slots
	+IL_Supported_1_slots;
	/*
	IL_Supported_1_slots
	+IL_Supported_2_slots 
	+ IL_Supported_4_slots;
	*/
	IL_Supported_Cargo_M939=
	IL_Supported_Cargo_Veh_M939;

IL_Supported_Cargo_Veh_FV620 =//used for all 2 slot vehicles
	IL_Supported_1_slots
	+IL_Supported_2_slots;



};



//	PROCEDURES AND FUNCTIONS
if (isnil "IL_Procedures") then
{
	IL_Procedures = true;

	IL_Init_Veh =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Init_Veh.", IL_Script_Inst];
		};
		
		private["_obj", "_obj_type", "_force"];
		_obj = _this select 0;
		_force = if (count _this > 1) then {_this select 1} else {false};
		_obj_type = (typeOf _obj);

		if ((isNil {_obj getVariable "default_mass"}) || (_force)) then
			{
				if (isNil {_obj getVariable "default_mass"}) then
				{
					_obj setVariable["default_mass", getMass _obj, true];
				}
				else
				{
					_obj setMass (_obj getVariable "default_mass");
				};
			};

		
		if (_obj_type in IL_Supported_Vehicles_MAZ) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_MAZ, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.5, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -0.8, true];};
			
		};
		
		
		if (_obj_type in IL_Supported_Vehicles_M939) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_M939, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.5, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 2.9, true];};
			
		};
		
		if (_obj_type in IL_Supported_Vehicles_MAN) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_M939, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.4, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -0.4, true];};
			
		};
		
		if (_obj_type in IL_Supported_Vehicles_URAL) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_M939, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", 1.4, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 2.7, true];};
			
		};
		
		if (_obj_type in IL_Supported_Vehicles_FV620) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_FV620, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.5, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 2.9, true];};
			
		};
		
		if (_obj_type in IL_Supported_Vehicles_HUMMER) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_FV620, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.7, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 2.9, true];};
			
		};
		if (_obj_type in IL_Supported_Vehicles_HILUX) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_FV620, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.8, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 3.5, true];};
			
		};
		
		if (_obj_type in IL_Supported_Vehicles_UAZ) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_FV620, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", 0.7, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 2.5, true];};
			
		};
		
		if (_obj_type in IL_Supported_Vehicles_HUMMERA) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_FV620, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.5, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 3.9, true];};
			
		};
		
		if (_obj_type in IL_Supported_Vehicles_BTR40) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_FV620, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.9, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 2.9, true];};
			
		};
		
		if (_obj_type in IL_Supported_Vehicles_COYOTE) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_FV620, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", 1.0, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 4.9, true];};
			
		};
		
		if (_obj_type in IL_Supported_Vehicles_WOLF) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_FV620, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", 1.4, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 5.4, true];};
			
		};
		
		if (_obj_type in IL_Supported_Vehicles_HUSKY) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_FV620, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.3, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 3.6, true];};
			
		};
		
		if (_obj_type in IL_Supported_Vehicles_DATSUN) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_FV620, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.3, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 3.6, true];};
			
		};
		
		if (_obj_type in IL_Supported_Vehicles_SOV) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_FV620, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			
			
			
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -1.3, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 3.0, true];};
			
		};
		
	};
//	END IL_Init_Veh   SLOT DEFINITION FOR CARGO

	IL_Init_Box =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Init_Box.", IL_Script_Inst];
		};

		private["_obj", "_obj_type", "_bbr", "_p0", "_p1"];
		_obj = _this select 0;
		
		_obj setVariable["attachedPos", 0, true];
		_obj setVariable["attachedTruck", _obj, true];
		_obj setVariable["doors", "N", true];
		
		_obj setVariable["slots", 1, true];
		_obj setVariable["cargo_offset", 0, true];
		
		_bbr = boundingBoxReal _obj;
		_p0 = _bbr select 0;
		_p1 = _bbr select 1;
		_obj setVariable["zload_cargo", abs (_p0 select 2), true];
		
		_obj_type = (typeOf _obj);
		
	
		
		if (_obj_type in IL_Supported_MAZ)  then
		{
			_obj setVariable["slots", 10, true];
			_obj setVariable["cargo_offset", 4.2, true];
		};
		
		if (_obj_type in IL_Supported_M939)  then
		{
			_obj setVariable["slots", 8, true];
			_obj setVariable["cargo_offset", 4.2, true];
		};
		
	
		
		
		if (_obj_type in IL_z_reduce_list_minus_3_60) then
		{
			_obj setVariable["zload_cargo", (abs (_p0 select 2))-3.6, true];
		};
		
		if (_obj_type in IL_z_reduce_list_minus_3_30) then
		{
			_obj setVariable["zload_cargo", (abs (_p0 select 2))-3.3, true];
		};
		
		if (_obj_type in IL_z_reduce_list_2_60) then
		{
			_obj setVariable["zload_cargo", (abs (_p0 select 2))-2.6, true];
		};
		
		if (_obj_type in IL_z_reduce_list_minus_1_50) then
		{
			_obj setVariable["zload_cargo", (abs (_p0 select 2))-1.50, true];
		};
		
		
		if (_obj_type in IL_z_reduce_list_minus_1_25) then
		{
			_obj setVariable["zload_cargo", (abs (_p0 select 2))-1.25, true];
		};
		
		if (_obj_type in IL_z_reduce_list_minus_1_00) then
		{
			_obj setVariable["zload_cargo", (abs (_p0 select 2))-1.00, true];
		};
		
		
		if (_obj_type in IL_z_reduce_list_minus_0_55) then
		{
			_obj setVariable["zload_cargo", (abs (_p0 select 2))-0.55, true];
		};
		
		
		
		if (_obj_type in IL_z_reduce_list_minus_0_30) then
		{
			_obj setVariable["zload_cargo", (abs (_p0 select 2))-0.3, true];
		};
		
		if (_obj_type in IL_z_reduce_list_minus_0_15) then
		{
			_obj setVariable["zload_cargo", (abs (_p0 select 2))-0.15, true];
		};
		
		
		if (_obj_type in IL_Supported_1_slots) then
		{
			
			_obj setVariable["slots", 1, true];
			_obj setVariable["cargo_offset", 0.3, true];
			
			

		};
		
		

		if (_obj_type in IL_Supported_2_slots) then
		{
			
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 1, true];
			
			

		};
		
		 
		
		if (_obj_type in IL_Supported_4_slots) then
		{
			
			_obj setVariable["slots", 4, true];
			_obj setVariable["cargo_offset", 1.8, true];
			

		};
		
		
		
		if (_obj_type in IL_Supported_6_slots) then
		{
			
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2.6, true];
			

		};
		
		
		
		if (_obj_type in IL_Supported_8_slots) then
		{
			
			_obj setVariable["slots", 8, true];
			_obj setVariable["cargo_offset", 2.6, true];
			

		};
		
		
		
			//_turn = true;
		
	};
//	END IL_Init_Box

	IL_Server_AddScore =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_AddScore.", IL_Script_Inst];
		};
		if (isServer) then
		{
			((_this select 1) select 0) addScore ((_this select 1) select 1);
		};
	};
//	END IL_Server_AddScore

	"IL_SetScore" addPublicVariableEventHandler IL_Server_AddScore;
//	END publicVariable "IL_SetScore";

	IL_Score = 
	{
		private ["_obj", "_score"];
		
		_obj = _this select 0;
		_score = _this select 1;
		
		if (_score != 0) then
		{
			IL_SetScore = [_obj, _score];
			if (isServer) then
			{
				["Cos", IL_SetScore] spawn IL_Server_AddScore;
			}
			else
			{
				publicVariableServer "IL_SetScore";
			};
		};
	};
//	END IL_Score

	IL_Server_SetDir =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_SetDir.", IL_Script_Inst];
		};
		private ["_obj", "_dir"];
		_obj = _this select 1 select 0;
		_dir = _this select 1 select 1;
		
		if (_dir < 0) then
		{
			_dir = _dir + 360;
		};
		if (_dir > 360) then
		{
			_dir = _dir - 360;
		};

		_obj setDir _dir;
		_obj setPos (getPos _obj);
	};
//	END IL_Server_Turn_Obj

	"IL_SetDir" addPublicVariableEventHandler IL_Server_SetDir;
//	END publicVariable "IL_SetDir";

	IL_Rotate = 
	{
		private ["_obj", "_to", "_change"];
		
		_obj = _this select 0;
		_to = _this select 1;
		_change = _this select 2;
		
		_change = (getDir _obj + _change) - getDir _to;
		
		IL_SetDir = [_obj, _change];
		if (local _obj) then
		{
			["Cos", IL_SetDir] spawn IL_Server_SetDir;
		}
		else
		{
			if (isDedicated) then
			{
				(owner _obj) publicVariableClient "IL_SetDir";
			}
			else
			{
				publicVariableServer "IL_SetDir";
			};
		};
	};
//	END IL_Rotate
	
	IL_Server_SetMass =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_SetMass.", IL_Script_Inst];
		};
		private ["_obj", "_mass"];
		_obj = _this select 1 select 0;
		_mass = _this select 1 select 1;
		if ((getMass _obj) != _mass) then
		{
			_obj setMass _mass;
		};
	};
//	END IL_Server_SetMass
	
	"IL_SetMass" addPublicVariableEventHandler IL_Server_SetMass;
//	END publicVariable "IL_SetMass";

	IL_GetCargoMass =
	{
		private ["_v", "_cargo_mass"];
		_v = _this select 0;
		_cargo_mass = 0;
		if (count(attachedObjects _v) > 0) then
		{
			{
				_cargo_mass = _cargo_mass + getMass _x;
			} forEach attachedObjects _v;
		};
		_cargo_mass;
	};
//	END IL_GetCargoMass

	IL_GetDefaultMass =
	{
		private ["_v"];
		_v = _this select 0;
		_v getVariable "default_mass";
	};
//	END IL_GetDefaultMass

	IL_SetNewMass =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_SetMass", IL_Script_Inst];
		};
		
		if !(IL_Mass) ExitWith {};
		private ["_v", "_v_def_mass", "_cargo_mass"];
		_v = _this select 0;
		_v_def_mass =  if (count _this > 1) then {_this select 1} else {0};
		_cargo_mass =  if (count _this > 2) then {_this select 2} else {0};
		
		if (_v_def_mass == 0) then
		{
			_v_def_mass = [_v] call IL_GetDefaultMass;
		};
		if (_cargo_mass == 0) then
		{
			_cargo_mass = [_v] call IL_GetCargoMass;
		};
		
		if ((getMass _v) != (_v_def_mass + _cargo_mass)) then
		{
			IL_SetMass = [_v, (_v_def_mass + _cargo_mass)];
			if (local _v) then
			{
				["Cos", IL_SetMass] spawn IL_Server_SetMass;
			}
			else
			{
				if (isDedicated) then
				{
					(owner _v) publicVariableClient "IL_SetMass";
				}
				else
				{
					publicVariableServer "IL_SetMass";
				};
			};
		};
	};
//	END IL_SetNewMass
	
	IL_Vehicle_Chat =
	{
		private["_v", "_msg", "_mass_info", "_text", "_cargo_mass", "_v_def_mass"];
		_v = _this select 0;
		_msg = _this select 1;
		_mass_info =  if (count _this > 2) then {_this select 2} else {false};

		_v vehicleChat _msg;
		if (_mass_info && IL_Mass) then
		{
			_cargo_mass = 0;
			_v_def_mass = [_v] call IL_GetDefaultMass;
			_cargo_mass = [_v] call IL_GetCargoMass;
			
			_text = Format["<img image='%1' size='2' align='left'/>", getText(configFile >> "cfgVehicles" >> typeOf _v >> "picture")];
			_text = _text + Format ["<t color='#ff0000' size='1.2' shadow='1' shadowColor='#000000' align='center'>%1</t><br/>", getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")];

			_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Default mass: </t>";
			_text = _text + Format ["<t color='#ffff00' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _v_def_mass];

			_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Cargo   mass: </t>";
			_text = _text + Format ["<t color='#ffff00' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _cargo_mass];

			_text = _text + "<t color='#00aafd' size='1.2' shadow='1' shadowColor='#000000' align='left'>Current mass: </t>";
			_text = _text + Format ["<t color='#ffff00' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1</t><br/>", _v_def_mass + _cargo_mass];
		};
		if (vehicle Player != _v) then
		{
			if (_mass_info && IL_Mass) then
			{
				_text = _text + _msg;
				hint parseText (_text);
			}
			else
			{
				Hint Format ["%1", _msg];
			};
		}
		else
		{
			if (_mass_info && IL_Mass) then
			{
				hint parseText (_text);
			};
		};
	};
//	END IL_Vehicle_Chat
	
	IL_Move_Attach=
	{
		private ["_veh", "_obj", "_from", "_to", "_pos", "_step", "_steps", "_from_x", "_from_y", "_from_z", "_to_x", "_to_y", "_to_z", "_x", "_y", "_z", "_i", "_x_step", "_y_step", "_z_step", "_turn"];
		_veh = _this select 0;
		_obj = _this select 1;
		_from = _this select 2;
		_to = _this select 3;
		_step = _this select 4;
		_turn = if (count _this > 5) then {_this select 5} else {false};
		
		_from_x = _from select 0;
		_from_y = _from select 1;
		_from_z = _from select 2;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _from_x =""%2"", _from_y =""%3"", _from_z =""%4""", IL_Script_Inst, _from_x, _from_y, _from_z];
		};

		_to_x = _to select 0;
		_to_y = _to select 1;
		_to_z = _to select 2;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _to_x =""%2"", _to_y =""%3"", _to_z =""%4""", IL_Script_Inst, _to_x, _to_y, _to_z];
		};
		
		_x = _to_x - _from_x;
		_y = _to_y - _from_y;
		_z = _to_z - _from_z;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _x =""%2"", _y =""%3"", _z =""%4""", IL_Script_Inst, _x, _y, _z];
		};
		
		if (((abs _x) > (abs _y)) && ((abs _x) > (abs _z))) then
		{
			_steps = round ((abs _x) / _step);
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _x > _y and _z, _steps =""%2""", IL_Script_Inst, _steps];
			};
		}
		else
		{
			if ((abs _y) > (abs _z)) then
			{
				_steps = round ((abs _y) / _step);
				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _y > _z, _steps =""%2""", IL_Script_Inst, _steps];
				};
			}
			else
			{
				_steps = round ((abs _z) / _step);
				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _z > _y, _steps =""%2""", IL_Script_Inst, _steps];
				};
			};
		};

		_i = 0;
		_obj AttachTo [_veh, _from];
		while {_i < _steps} do
		{
			_i = _i + 1;
			_pos = [(((_x / _steps) * _i) + _from_x), (((_y / _steps) * _i) + _from_y), (((_z / _steps) * _i) + _from_z)];
			_obj AttachTo [_veh, _pos];
			if (_turn) then
			{
				[_obj, _veh, -90] call IL_Rotate;
				_turn = false;
			};
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _pos =""%2""", IL_Script_Inst, _pos];
			};
			sleep 0.25;
		};

		_obj AttachTo [_veh, _to];
	};
//	END IL_Move_Attach

	IL_Create_And_Attach =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_Create_And_Attach", IL_Script_Inst];
		};
		_type = _this select 0;
		_to = _this select 1;
		_x = if (count _this > 2) then {_this select 2} else {0};
		_y = if (count _this > 3) then {_this select 3} else {0};
		_z = if (count _this > 4) then {_this select 4} else {0};
		_m = createVehicle [_type, position _to, [], 0, "CAN_COLLIDE"];
		_m AttachTo [_to,[_x,_y,_z]];
		_m
	};
//	END IL_Create_And_Attach

	IL_Cargo_Para =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_Cargo_Para", IL_Script_Inst];
		};
		[Player, IL_Unload_Score] call IL_Score;
		private ["_smoke", "_light", "_damage", "_smoke_type", "_chemlight_type", "_cargo_pos", "_last_attach_pos", "_dist", "_velocity", "_tmp"];
		_cargo = _this select 0;
		_v = _this select 1;
		_last_attach_pos = _this select 2;
		if (((IL_Para_Smoke) || (IL_Para_Smoke_Add)) && (_cargo isKindOf "AllVehicles")) then
		{
			_smoke_type = IL_Para_Smoke_Veh;
		}
		else
		{
			_smoke_type = IL_Para_Smoke_Default;
		};
		if (((IL_Para_Light) || (IL_Para_Light_Add)) && (_cargo isKindOf "AllVehicles")) then
		{
			_chemlight_type = IL_Para_Light_Veh;
		}
		else
		{
			_chemlight_type = IL_Para_Light_Default;
		};

		_cargo_pos = [0,0,0];
		
		_damage = getDammage _cargo;
		detach _cargo;
		_dist = _v distance _cargo;
		_tmp = [_cargo] spawn
		{
			while {(getPosATL (_this select 0)) select 2 > IL_Para_Drop_Open_ATL} do
			{
				sleep 0.2;
			};
		};
		while {(_v distance _cargo) - _dist < 20} do
		{
			sleep 0.2;
		};
		if (IL_Para_Drop_Open_ATL > 0) then
		{
			while {(getPosATL _cargo) select 2 > (IL_Para_Drop_Open_ATL + ((velocity _cargo) select 2) * -0.5)} do
			{
				sleep 0.2;
			};
		};
		_chute = createVehicle ["B_Parachute_02_F", position _cargo, [], 0, "CAN_COLLIDE"];
		_chute attachTo [_cargo, _cargo_pos];
		_velocity = velocity _cargo;
		detach _chute;

		if (IL_Para_Drop_Velocity) then
		{
			_chute setVelocity _velocity;
		};
		_cargo attachTo [_chute, _cargo_pos];
		
		if (IL_Para_Smoke) then
		{
			_smoke = [_smoke_type, _cargo] call IL_Create_And_Attach;
		};
		if (IL_Para_Light) then
		{
			_light = [_chemlight_type, _cargo] call IL_Create_And_Attach;
		};
		while {(getPos _cargo) select 2 > 2} do
		{
			sleep 0.2;
		};
		detach _cargo;
		if (IL_Para_Smoke) then
		{
			_smoke attachTo [_cargo,[0,0,2]];
			detach _smoke;
		};
		if (IL_Para_Light) then
		{
			_light attachTo [_cargo,[0,0,2]];
			detach _light;
		};
		//Additional lights and smoke
		if (IL_Para_Smoke_Add) then
		{
			_smoke = [_smoke_type, _cargo] call IL_Create_And_Attach;
			_smoke attachTo [_cargo,[0,0,2]];
			detach _smoke;
		};
		if (IL_Para_Light_Add) then
		{
			_light = [_chemlight_type, _cargo] call IL_Create_And_Attach;
			_light attachTo [_cargo,[0,0,2]];
			detach _light;
		};
//	END IL_Cargo_Para
		
		_cargo setPosASL getPosASL _cargo;
		
		if (IL_CDamage == 0) then
		{
			_cargo setDamage 0;
		};
		
		if (IL_CDamage == 1) then
		{
			_cargo setDamage _damage;
			if (_damage != (getDammage _cargo)) then
			{
				sleep 1;
				_cargo setDamage _damage;
			};
		};
	};

	IL_Do_Load =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_Do_Load", IL_Script_Inst];
		};

		private["_NoBoxHint", "_v", "_supported_cargo", "_zload", "_x_cargo_offset", "_cargo_offset", "_sdist", "_spoint", "_slot_num", "_counter", "_done", "_obj_lst", "_damage", "_obj_type", "_doors", "_box_num", "_dummy", "_nic", "_turn", "_force", "_cargo"];
		_NoBoxHint = "The box is in the vicinity. Perhaps it is outside of the loading area.";
		_v = _this select 0;
		_supported_cargo = _this select 1;
		_doors = if (count _this > 2) then {_this select 2} else {"B"};
		_force = if (count _this > 3) then {_this select 3} else {false};
		_cargo = if (count _this > 4) then {_this select 4} else {ObjNull};
		
		_v setVariable["can_load", false, true];
		_zload = _v getVariable "zload";
		_obj_type = (typeOf _v);
		_sdist = 0;

		_counter = 0;
		_done = false;
		_turn = false;

		

		if ((_obj_type in IL_Supported_Vehicles_MAZ) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		
		
		if ((_obj_type in IL_Supported_Vehicles_M939) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		
		if ((_obj_type in IL_Supported_Vehicles_MAN) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		if ((_obj_type in IL_Supported_Vehicles_URAL) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
				
		if ((_obj_type in IL_Supported_Vehicles_FV620) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		if ((_obj_type in IL_Supported_Vehicles_HUMMER) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		if ((_obj_type in IL_Supported_Vehicles_HILUX) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		if ((_obj_type in IL_Supported_Vehicles_UAZ) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		
		if ((_obj_type in IL_Supported_Vehicles_HUMMERA) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		if ((_obj_type in IL_Supported_Vehicles_BTR40) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		if ((_obj_type in IL_Supported_Vehicles_COYOTE) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		if ((_obj_type in IL_Supported_Vehicles_WOLF) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		if ((_obj_type in IL_Supported_Vehicles_HUSKY) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		if ((_obj_type in IL_Supported_Vehicles_DATSUN) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		if ((_obj_type in IL_Supported_Vehicles_SOV) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		
		if !(_force) then
		{
			_obj_lst = nearestObjects[ _spoint, _supported_cargo, _sdist];
		}
		else
		{
			_obj_lst = [_cargo];
		};

		if (count (_obj_lst) > 0) then
		{
			{

				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". Cargo: ""%2"" found.", IL_Script_Inst, _x];
				};
				if (isNil {_x getVariable "attachedPos"}) then
				{
					if (IL_DevMod) then
					{
						Player globalChat Format ["IgiLoad ""%1"". Init box: ""%2"".", IL_Script_Inst, _x];
					};
					[_x] call IL_Init_Box;
				};
				
				
				
				if ((typeOf _x) in IL_Turnlist) then
				{
					_turn = True;
				};
				
				
				
				if ((typeOf _x) in IL_Supported_plus_loaddistance_1_0) then
				{

				_x setVariable["cargo_offset", 0.5, true];

				};
				
				
				if ((typeOf _x) in IL_Supported_plus_loaddistance_0_5) then
				{

				_x setVariable["cargo_offset", 1.8, true];

				};
				
				if ((typeOf _x) in IL_Supported_minus_loaddistance_0_5) then
				{

				_x setVariable["cargo_offset", +3.4, true];

				};
				
				if ((typeOf _x) in IL_Supported_minus_loaddistance_0_75) then
				{

				_x setVariable["cargo_offset", 4, true];

				};
				
				if ((typeOf _x) in IL_Supported_minus_loaddistance_1) then
				{

				_x setVariable["cargo_offset", +5.3, true];

				};
				
				if ((typeOf _x) in IL_Supported_minus_loaddistance_2) then
				{

				_x setVariable["cargo_offset", +7.3, true];

				};
				if ((typeOf _x) in IL_Supported_minus_loaddistance_3) then
				{

				_x setVariable["cargo_offset", +8.8, true];

				};
				

				
				
				//It allows you to load oversize loads, but they must be on the list of supported cargo!!!
				if ((abs(_slot_num - _box_num) < (_x getVariable "slots")) && (_box_num != 0)) then
				{
					[_v, "This cargo is to big. "] call IL_Vehicle_Chat;
				}
				else
				{
					if (IL_DevMod) then
					{
						Player globalChat Format ["IgiLoad ""%1"". _box_num: ""%2"" _slot_num: ""%3""", IL_Script_Inst,  _box_num, _slot_num];
					};
					
					
					
					if ((_box_num > _slot_num) && !_done) then
					{
						[_v, Format ["Loading ""%1"" on ""%2"" started", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")]] call IL_Vehicle_Chat;
						_done = true;
						_counter = (_box_num);
						_zload = (_v getVariable "zload") + (_x getVariable "zload_cargo");
						_cargo_offset = (_v getVariable "load_offset") + (_x getVariable "cargo_offset");
						
						
						_x_cargo_offset = 0;
						
						_damage = getDammage _x;
						
						
						if ((typeOf _x) in IL_x_reduce_list_plus_0_30) then
						{
							_x_cargo_offset = 0.30;
						};
						
						if ((typeOf _x) in IL_x_reduce_list_minus_0_15) then
						{
							_x_cargo_offset = -0.15;
						};
						
						
						
						if ((typeOf _x) in IL_x_reduce_list_minus_0_35) then
						{
							_x_cargo_offset = -0.35;
						};
						
						
						if ((typeOf _x) in IL_x_reduce_list_minus_0_75) then
						{
							_x_cargo_offset = -0.75;
						};
						
						
						if ((_obj_type in IL_Supported_Vehicles_MAZ) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.35,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						
						
							
						if ((_obj_type in IL_Supported_Vehicles_M939) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_MAN) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						
						
						if ((_obj_type in IL_Supported_Vehicles_URAL) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						
						
							
						if ((_obj_type in IL_Supported_Vehicles_FV620) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						
						
							
						if ((_obj_type in IL_Supported_Vehicles_HUMMER) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						

							
							
						if ((_obj_type in IL_Supported_Vehicles_HILUX) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_UAZ) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_HUMMERA) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_BTR40) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_COYOTE) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
			
						if ((_obj_type in IL_Supported_Vehicles_WOLF) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_HUSKY) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_DATSUN) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_SOV) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset+ 0.0,_counter + 2.65 - _cargo_offset,_zload+0.1], 1, _turn] call IL_Move_Attach;
						};
						
						_counter = _counter - (_x getVariable "slots");

						if (_doors == "B") then
						{
							_v setVariable["box_num", _counter, true];
						};
						
						
						
						
						[_v] call IL_SetNewMass;
						
						if (_x isKindOf "AllVehicles") then
						{
							_x forceSpeed 0;
						};
						
						_x setVariable["attachedPos", _counter, true];
						_x setVariable["attachedTruck", _v, true];
						_x setVariable["doors", _doors, true];
						
						if (IL_CDamage == 0) then
						{
							_x setDamage 0;
						};
						
						if (IL_CDamage == 1) then
						{
							_x setDamage _damage;
							if (_damage != (getDammage _x)) then
							{
								sleep 1;
								_x setDamage _damage;
							};
						};
						
						if (_counter > _slot_num) then
						{
							[_v, Format ["""%1"" is loaded onto ""%2"". Free slots: ""%3"".", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName"), abs(_slot_num - _counter)], true] call IL_Vehicle_Chat;
						}
						else
						{
							[_v, Format ["""%1"" is loaded onto ""%2"" There is no more space.", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")], true] call IL_Vehicle_Chat;
						};
						//player addScore IL_Load_Score;
						[Player, IL_Load_Score] call IL_Score;
					}
					else
					{
						if ((_box_num > _slot_num) && !_done) then
						{
							[_v, _NoBoxHint] call IL_Vehicle_Chat;
						};
					};
				};
				if (_done) exitWith {};
			} forEach (_obj_lst);
		}
		else
		{
			[_v, _NoBoxHint] call IL_Vehicle_Chat;
		};
		_v setVariable["can_load", true, true];
	};
//	END IL_Do_Load

	IL_Do_Unload =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Do_Unload.", IL_Script_Inst];
		};

		private ["_v", "_para", "_supported_cargo", "_doors", "_counter", "_done", "_obj_lst", "_zload", "_x_cargo_offset", "_cargo_offset", "_obj_type", "_damage", "_nic", "_free_slots", "_turn", "_skip", "_last_attach_pos"];
		_v = _this select 0;
		_para = if (count _this > 1) then {_this select 1} else {false};
		//_para = _this select 1;
		// _supported_cargo = _this select 2;
		// _doors = if (count _this > 3) then {_this select 3} else {"B"};
		_doors = if (count _this > 2) then {_this select 2} else {"B"};
		
		_v setVariable["can_load", false, true];
		_counter = 0;
		_done = false;
		_turn = false;
		_skip = true;
		_obj_lst = [];

		_obj_type = (typeOf _v);

		_obj_lst = attachedObjects _v;
	
		
		if (count (_obj_lst) > 0) then
		{
			{
				_obj_type = (typeOf _v);
				
				if (_x getVariable "doors" == _doors) then
				{
					if (_doors == "B") then
					{
						_counter = (_v getVariable "box_num");
					};
					if (_doors == "L") then
					{
						_counter = (_v getVariable "box_num_l");
					};
					if (_doors == "R") then
					{
						_counter = (_v getVariable "box_num_r");
					};
					if (((_x getVariable "attachedTruck") == _v) && ((_x getVariable "attachedPos") == (_counter)) && (_counter < 0) && !_done) then
					{
						[_v, Format ["Unloading ""%1"" from ""%2"" started", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")]] call IL_Vehicle_Chat;
						_done = true;
						_skip = false;
						_zload = (_v getVariable "zload") + (_x getVariable "zload_cargo");
						_cargo_offset = (_v getVariable "load_offset") + (_x getVariable "cargo_offset");
						_damage = getDammage _x;
						
						_x_cargo_offset = 0;
						

						_obj_type = (typeOf _v);
						
						// wide unload for su34 ...
						if ((typeOf _x) in IL_WIDE_UNLOAD) then
						{
							_cargo_offset = 7;
						};

						if ((typeOf _x) in IL_EXTRA_WIDE_UNLOAD) then
						{
							_cargo_offset = 13;
						};


						if ((_obj_type in IL_Supported_Vehicles_MAZ) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-10 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_M939) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_MAN) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_URAL) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						
						if ((_obj_type in IL_Supported_Vehicles_FV620) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_HUMMER) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_HILUX) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_UAZ) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_HUMMERA) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_BTR40) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_COYOTE) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_WOLF) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_HUSKY) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_DATSUN) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						if ((_obj_type in IL_Supported_Vehicles_SOV) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-5.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						
						
						if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
						{
							[_x, _v, _last_attach_pos] spawn IL_Cargo_Para;
						}
						else
						{
							sleep 0.2;
							detach _x;
							_x enableSimulationGlobal true;  // Lyrae: wtf is this
							_x setVelocity [0, 0, -0.2];
						};

						if (_x isKindOf "AllVehicles") then
						{
							_x forceSpeed -1;
						};
						
						_counter = _counter + (_x getVariable "slots");
						if (_doors == "B") then
						{
							_v setVariable["box_num", _counter, true];
							_free_slots = abs((_v getVariable "slots_num") - (_v getVariable "box_num"));
						};
						if (_doors == "L") then
						{
							_v setVariable["box_num_l", _counter, true];
							_v setVariable["box_l", _v, true];
							_free_slots = abs((_v getVariable "slots_num_l") - (_v getVariable "box_num_l"));
						};
						if (_doors == "R") then
						{
							_v setVariable["box_num_r", _counter, true];
							_v setVariable["box_r", _v, true];
							_free_slots = abs((_v getVariable "slots_num_r") - (_v getVariable "box_num_r"));
						};
						
						[_v] call IL_SetNewMass;
						
						_x setVariable["attachedPos", 0, true];
						_x setVariable["attachedTruck", _x, true];
						_x setVariable["doors", "N", true];

						if (IL_CDamage == 0) then
						{
							_x setDamage 0;
						};
						
						if (IL_CDamage == 1) then
						{
							_x setDamage _damage;
							if (_damage != (getDammage _x)) then
							{
								sleep 1;
								_x setDamage _damage;
							};
						};
						[_v, Format ["""%1"" was unloaded from the ""%2"". Free slots: ""%3"".", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName"), _free_slots], true] call IL_Vehicle_Chat;
						//player addScore IL_Unload_Score;
						[Player, IL_Unload_Score] call IL_Score;
						sleep 1;
					};
				};
				if (_done) exitWith {};
			} forEach (_obj_lst);
			if (_skip) then
			{
				[_v, "Can not find cargo. Try again."] call IL_Vehicle_Chat;
				
				if (_counter < 0) then
				{
					_counter = _counter + 1;
				};
				
				if (_doors == "B") then
				{
					_v setVariable["box_num", _counter, true];
					_free_slots = abs((_v getVariable "slots_num") - (_v getVariable "box_num"));
				};
				if (_doors == "L") then
				{
					_v setVariable["box_num_l", _counter, true];
					_v setVariable["box_l", _v, true];
					_free_slots = abs((_v getVariable "slots_num_l") - (_v getVariable "box_num_l"));
				};
				if (_doors == "R") then
				{
					_v setVariable["box_num_r", _counter, true];
					_v setVariable["box_r", _v, true];
					_free_slots = abs((_v getVariable "slots_num_r") - (_v getVariable "box_num_r"));
				};
			};
		}
		else
		{
			[_v, "BOX 404 error. Box not found O.o. Vehicle data reset..."] call IL_Vehicle_Chat;
			[_v, true] call IL_Init_Veh;
			[_v, "Vehicle data reset done."] call IL_Vehicle_Chat;
		};
		[_v] call IL_SetNewMass;
		_v setVariable["can_load", true, true];
	};
//	END IL_Do_Unload

	IL_GetOut =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_GetOut.", IL_Script_Inst];
		};

		private ["_v", "_player", "_para", "_chute",  "_backpack", "_pos", "_x_offset", "_dist", "_dist_out", "_dist_out_para", "_velocity"];
		_v = _this select 0;
		_player = _this select 1;
		_para = if (count _this > 2) then {_this select 2} else {false};


		_dist_out = 15;
		_dist_out_para = 20;
		
		
		_pos = (_v worldToModel (getPosATL _player));
		_x_offset = _pos select 0;
		if (_x_offset < 0) then
		{
		
			
				_x_offset = 8;
			
		}
		else
		{
		
				_x_offset = -8;
			
		};
//	END IL_GetOut
		
		_player allowDamage false;
		sleep 0.2;
		unassignVehicle _player;
		_player action ["EJECT",vehicle _player];
		sleep 0.5;
	 
		if !(_para) then
		{
			_player setDir ((getDir _v) + 180);
			_pos = ([_v, _dist_out, ((getDir _v) + 180 + _x_offset)] call BIS_fnc_relPos);
			_pos = [_pos select 0, _pos select 1, ((getPosATL _v) select 2)];
			_player setPosATL _pos;
		}
		else
		{
			_pos = ([_v, _dist_out_para, ((getDir _v) + 180 + _x_offset)] call BIS_fnc_relPos);
			_pos = [_pos select 0, _pos select 1, ((getPosATL _v) select 2)];
			_player setPosATL _pos;
			_dist = _v distance _player;
			while {(_v distance _player) - _dist < 20} do
			{
				sleep 0.2;
			};
			if (IL_Para_Jump_Open_ATL > 0) then
			{
				while {(getPosATL _player) select 2 > IL_Para_Jump_Open_ATL} do
				{
					sleep 0.2;
				};
			};
			if !(unitBackpack _player isKindOf "B_Parachute") then
			{
				_chute = createVehicle ["Steerable_Parachute_F", position _player, [], 0, "CAN_COLLIDE"];
//				_chute setPos getPos _player;
				_chute AttachTo [_player, [0,0,0]];
				detach _chute;
				_velocity = velocity _player;
				_player moveInDriver _chute;
				if (IL_Para_Jump_Velocity) then
				{
					_chute setVelocity _velocity;
				};
			};
		};
		_player allowDamage true;
		
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_GetOut.", IL_Script_Inst];
		};
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_GetOut. Player ATL: ""%2""", IL_Script_Inst, _pos];
		};
	};
};
//	END PROCEDURES AND FUNCTIONS

//	MAIN CODE
_vsupported = false;








if (_obj_main_type in IL_Supported_Vehicles_MAZ) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_MAZ.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_MAZ] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_MAZ, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};


if (_obj_main_type in IL_Supported_Vehicles_M939) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_M939] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_M939, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};


if (_obj_main_type in IL_Supported_Vehicles_MAN) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_M939] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_M939, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};

if (_obj_main_type in IL_Supported_Vehicles_URAL) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_M939] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_M939, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};

if (_obj_main_type in IL_Supported_Vehicles_FV620) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_FV620] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_FV620, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};



if (_obj_main_type in IL_Supported_Vehicles_HUMMER) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_FV620] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_FV620, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};

if (_obj_main_type in IL_Supported_Vehicles_HILUX) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_FV620] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_FV620, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};

if (_obj_main_type in IL_Supported_Vehicles_UAZ) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_FV620] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_FV620, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};


if (_obj_main_type in IL_Supported_Vehicles_HUMMERA) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_FV620] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_FV620, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};


if (_obj_main_type in IL_Supported_Vehicles_BTR40) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_FV620] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_FV620, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};

if (_obj_main_type in IL_Supported_Vehicles_COYOTE) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_FV620] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_FV620, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};

if (_obj_main_type in IL_Supported_Vehicles_WOLF) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_FV620] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_FV620, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};


if (_obj_main_type in IL_Supported_Vehicles_HUSKY) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_FV620] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_FV620, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};


if (_obj_main_type in IL_Supported_Vehicles_DATSUN) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_FV620] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_FV620, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};

if (_obj_main_type in IL_Supported_Vehicles_SOV) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_M939.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;


	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\load.paa' /><t color=""#007f0e"">  Load cargo on vehicle</t>",
	{
		[_this select 0, IL_Supported_Cargo_Veh_FV620] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_FV620, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];



	_obj_main addAction [
	"<img image='Client\Module\IgiLoad\images\unload.paa' /><t color=""#ff0000"">  Unload cargo from vehicle</t>",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Enable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"<t color=""#0000ff"">Disable loading from outside</t>",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};

if (!(_vsupported) && (IL_DevMod)) then
{
	Player globalChat Format["Object type: ""%1"" is not supported.", _obj_main_type];
};

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" END.", IL_Script_Inst];
};
//	EOF