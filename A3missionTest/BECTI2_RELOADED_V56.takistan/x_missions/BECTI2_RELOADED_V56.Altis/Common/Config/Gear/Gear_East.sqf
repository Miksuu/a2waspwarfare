private ["_faction", "_i", "_p", "_side", "_u"];

_side = _this;
_faction = "East";

_i = [];
_u = [];
_p = [];


_OpforContainer = [OTeamleader1,OTeamleader2,OTeamleader3,OTeamleader4,OTeamleader5,OEngineer1,OEngineer2,OEngineer3,OEngineer4,OEngineer5,OMachinegunner1_1,OMachinegunner1_2,OMachinegunner2_1,OMachinegunner2_2,OMachinegunner3_1,OMachinegunner3_2,OMachinegunner4_1,OMachinegunner4_2,OMachinegunner5_1,OMachinegunner5_2,OMedic1,OMedic2,OMedic3,OMedic4,OMedic5,OSpecOps1,OSpecOps2,OSpecOps3,OSpecOps4,OSpecOps5];

//CORE GEAR (UNITBASED MINIMUM,every gear from spawnable ai)= //UBM (UBM2 f.e. means ai on b level2, but ammo reduced to other level)

//EXTENDED CORE GEAR (STUFF FROM DEPLOYABLE GEARBOX)= //ABM

//level 0


_ru_level_0=9;	_opf_level_0=9;
_ru_level_1=9;	_opf_level_1=9;
_ru_level_2=9;	_opf_level_2=9;
_ru_level_3=9;	_opf_level_3=9;
_ru_level_4=9;	_opf_level_4=9;
_ru_level_5=9;	_opf_level_5=9;


if (player in _OpforContainer) then	{
_ru_level_0=0;_ru_level_1=1;_ru_level_2=2;_ru_level_3=3;_ru_level_4=4;_ru_level_5=5;
};



//88__________888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> WEAPONS <_888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__WEAPONS
//88__________888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________



_i pushBack  "O_UavTerminal"; 									_u pushBack  _ru_level_4;	_p pushBack  90;

//________________________________________________________________________________________
//__SMG__+__PUMPGUN
//________________________________________________________________________________________

_i pushBack  "CUP_smg_bizon_snds"; 								_u pushBack  _ru_level_3;	_p pushBack  23;//_______________________________UBM

_i pushBack  "CUP_sgun_Saiga12K"; 								_u pushBack  _ru_level_0;	_p pushBack  13;//_______________________________UBM2

//________________________________________________________________________________________
//__AK__
//________________________________________________________________________________________

_i pushBack  "CUP_arifle_AKS74U"; 								_u pushBack  _ru_level_0;	_p pushBack  12;//_______________________________UBM

_i pushBack  "CUP_arifle_AKS74UN_kobra_snds"; 					_u pushBack  _ru_level_3;	_p pushBack  14;//_______________________________UBM

_i pushBack  "cwr3_arifle_aks74_pso"; 							_u pushBack  _ru_level_1;	_p pushBack  20;//_______________________________UBM

_i pushBack  "CUP_arifle_AKS74_NSPU"; 							_u pushBack  _ru_level_3;	_p pushBack  15;//_______________________________UBM

_i pushBack  "CUP_arifle_AKS74_Goshawk"; 						_u pushBack  _ru_level_3;	_p pushBack  15;//_______________________________UBM

_i pushBack  "CUP_arifle_AK74"; 								_u pushBack  _ru_level_0;	_p pushBack  14;//_______________________________UBM

_i pushBack  "CUP_arifle_AK74_GL"; 								_u pushBack  _ru_level_1;	_p pushBack  18;//_______________________________UBM

_i pushBack  "CUP_arifle_AK74M_1p63"; 							_u pushBack  _ru_level_2;	_p pushBack  16;//_______________________________UBM

_i pushBack  "CUP_arifle_AK74M_pso"; 							_u pushBack  _ru_level_2;	_p pushBack  16;//_______________________________UBM

_i pushBack  "CUP_arifle_AK74M_pso_open"; 						_u pushBack  _ru_level_2;	_p pushBack  16;//_______________________________UBM

_i pushBack  "CUP_arifle_AK74M_GL_1p63"; 						_u pushBack  _ru_level_2;	_p pushBack  19;//_______________________________UBM

_i pushBack  "CUP_arifle_AK74M_GL_pso_open"; 					_u pushBack  _ru_level_2;	_p pushBack  19;//_______________________________UBM

_i pushBack  "CUP_arifle_RPK74_45"; 							_u pushBack  _ru_level_0;	_p pushBack  24;//_______________________________UBM

_i pushBack  "CUP_arifle_RPK74M_1p78"; 							_u pushBack  _ru_level_2;	_p pushBack  29;//_______________________________UBM

//________________________________________________________________________________________
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>_7.62x39_<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//________________________________________________________________________________________

_i pushBack  "CUP_arifle_AK109"; 								_u pushBack  _ru_level_3;	_p pushBack  49;

_i pushBack  "CUP_arifle_AK109_top_rail"; 						_u pushBack  _ru_level_3;	_p pushBack  50;

_i pushBack  "CUP_arifle_RPK74"; 								_u pushBack  _ru_level_1;	_p pushBack  36;//_______________________________ABM

_i pushBack  "CUP_arifle_RPK74_top_rail"; 						_u pushBack  _ru_level_2;	_p pushBack  39;

//________________________________________________________________________________________
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>_7.62x54 +_<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//________________________________________________________________________________________

_i pushBack  "CUP_lmg_PKM"; 									_u pushBack  _ru_level_1;	_p pushBack  31;//_______________________________ABM

_i pushBack  "CUP_lmg_PKMN"; 									_u pushBack  _ru_level_1;	_p pushBack  42;//_______________________________UBM

_i pushBack  "CUP_lmg_Pecheneg_PScope"; 						_u pushBack  _ru_level_2;	_p pushBack  68;//_______________________________UBM

_i pushBack  "CUP_lmg_Pecheneg_top_rail_B50_vfg"; 				_u pushBack  _ru_level_3;	_p pushBack  82;

_i pushBack  "CUP_srifle_SVD"; 									_u pushBack  _ru_level_1;	_p pushBack  37;//_______________________________ABM

_i pushBack  "CUP_srifle_SVD_pso"; 								_u pushBack  _ru_level_1;	_p pushBack  37;//_______________________________UBM

_i pushBack  "CUP_srifle_SVD_NSPU"; 							_u pushBack  _ru_level_3;	_p pushBack  50;//_______________________________UBM

_i pushBack  "CUP_srifle_SVD_des"; 								_u pushBack  _ru_level_2;	_p pushBack  73;//_______________________________ABM

_i pushBack  "CUP_srifle_SVD_wdl_ghillie"; 						_u pushBack  _ru_level_2;	_p pushBack  73;//_______________________________UBM

_i pushBack  "CUP_arifle_HK417_20_Wood"; 						_u pushBack  _ru_level_3;	_p pushBack  130;//______Balance DMR

_i pushBack  "CUP_srifle_ksvk"; 								_u pushBack  _ru_level_3;	_p pushBack  119;//_______________________________ABM

_i pushBack  "CUP_srifle_ksvk_PSO3"; 							_u pushBack  _ru_level_3;	_p pushBack  119;//_______________________________UBM

_i pushBack  "cwr3_smg_bizon_sd"; 								_u pushBack  _ru_level_3;	_p pushBack  18;//_______________________________UBM

_i pushBack  "CUP_arifle_AS_VAL"; 								_u pushBack  _ru_level_3;	_p pushBack  89;//_______________________________UBM

_i pushBack  "CUP_srifle_VSSVintorez_pso"; 						_u pushBack  _ru_level_3;	_p pushBack  89;//_______________________________UBM

_i pushBack  "CUP_arifle_AS_VAL_VFG_pso_open"; 					_u pushBack  _ru_level_3;	_p pushBack  89;//_______________________________UBM

_i pushBack  "CUP_glaunch_6G30"; 								_u pushBack  _ru_level_1;	_p pushBack  90;//_______________________________UBM

//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> LAUNCHER <_8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__LAUNCHER
//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

//________________________________________________________________________________________
//__LAUNCHER__oneway_AT
//________________________________________________________________________________________

_i pushBack  "cwr3_launch_rpg75"; 								_u pushBack  _ru_level_0;	_p pushBack  75;

_i pushBack  "CUP_launch_RPG18"; 								_u pushBack  _ru_level_0;	_p pushBack  90;//_______________________________UBM

_i pushBack  "CUP_launch_RShG2"; 								_u pushBack  _ru_level_1;	_p pushBack  85;

_i pushBack  "CUP_launch_RPG26"; 								_u pushBack  _ru_level_2;	_p pushBack  110;//_______________________________UBM

//________________________________________________________________________________________
//__LAUNCHER__oneway_AA
//________________________________________________________________________________________

_i pushBack  "CUP_launch_9K32Strela"; 							_u pushBack  _ru_level_1;	_p pushBack  324;//_______________________________UBM

_i pushBack  "CUP_launch_Igla"; 								_u pushBack  _ru_level_2;	_p pushBack  390;//_______________________________UBM

//________________________________________________________________________________________
//__LAUNCHER__reloadable
//________________________________________________________________________________________

_i pushBack  "CUP_launch_RPG7V"; 								_u pushBack  _ru_level_1;	_p pushBack  260;//_______________________________UBM

_i pushBack  "CUP_launch_RPG7V_PGO7V3"; 						_u pushBack  _ru_level_2;	_p pushBack  260;//_______________________________UBM

_i pushBack  "cwr3_launch_at4"; 								_u pushBack  _ru_level_1;	_p pushBack  214;//_______________________________UBM

_i pushBack  "launch_RPG32_F"; 									_u pushBack  _ru_level_2;	_p pushBack  300;

_i pushBack  "CUP_launch_Metis"; 								_u pushBack  _ru_level_2;	_p pushBack  572;//_______________________________UBM

//________________________________________________________________________________________
//__LAUNCHER__unloaded_AT (listed for making ai templates)
//________________________________________________________________________________________

_i pushBack  "CUP_launch_RPG18_Loaded"; 						_u pushBack  _ru_level_0;	_p pushBack  70;//_______________________________UBM

_i pushBack  "CUP_launch_RPG26_Loaded"; 						_u pushBack  _ru_level_2;	_p pushBack  80;//_______________________________UBM

//________________________________________________________________________________________
//__LAUNCHER__unloaded_AA (listed for making ai templates)
//________________________________________________________________________________________

_i pushBack  "CUP_launch_9K32Strela_Loaded"; 					_u pushBack  _ru_level_1;	_p pushBack  224;//_______________________________UBM

_i pushBack  "CUP_launch_Igla_Loaded"; 							_u pushBack  _ru_level_2;	_p pushBack  290;//_______________________________UBM

//88__________888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> PISTOLS <_888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__PISTOLS
//88__________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "CUP_hgun_Makarov"; 								_u pushBack  _ru_level_0;	_p pushBack  7;//_______________________________UBM

_i pushBack  "CUP_hgun_PB6P9"; 									_u pushBack  _ru_level_2;	_p pushBack  7;//_______________________________ABM

_i pushBack  "CUP_hgun_PB6P9_snds"; 							_u pushBack  _ru_level_2;	_p pushBack  7;//_______________________________UBM

_i pushBack  "hgun_Rook40_F"; 									_u pushBack  _ru_level_2;	_p pushBack  8;//_______________________________UBM

_i pushBack  "CUP_hgun_SA61"; 									_u pushBack  _ru_level_2;	_p pushBack  20;

_i pushBack  "CUP_hgun_SA61_RIS"; 								_u pushBack  _ru_level_3;	_p pushBack  25;

_i pushBack  "CUP_hgun_TaurusTracker455_gold"; 					_u pushBack  _ru_level_3;	_p pushBack  800;//_______________________________ABM

//88_________8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> SCOPES <_88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__SCOPES
//88_________8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "CUP_optic_Kobra"; 								_u pushBack  _ru_level_3;	_p pushBack  11;//_______________________________UBM

_i pushBack  "CUP_optic_MicroT1_OD"; 							_u pushBack  _ru_level_3;	_p pushBack  12;

_i pushBack  "CUP_optic_1p63"; 									_u pushBack  _ru_level_2;	_p pushBack  31;//_______________________________UBM

_i pushBack  "CUP_optic_PGO7V2"; 								_u pushBack  _ru_level_2;	_p pushBack  19;//_______________________________ABM

_i pushBack  "CUP_optic_PGO7V3"; 								_u pushBack  _ru_level_2;	_p pushBack  19;//_______________________________UBM

_i pushBack "CUP_optic_PSO_1_AK";								_u pushBack  _ru_level_1;	_p pushBack 50;//_______________________________UBM

_i pushBack  "CUP_optic_PSO_1_AK_open"; 						_u pushBack  _ru_level_2;	_p pushBack  51;//_______________________________UBM

_i pushBack "CUP_optic_PSO_1";									_u pushBack  _ru_level_1;	_p pushBack 50;//_______________________________UBM

_i pushBack  "CUP_optic_PSO_1_1"; 								_u pushBack  _ru_level_3;	_p pushBack  51;//_______________________________UBM

_i pushBack  "CUP_optic_PSO_1_1_open"; 							_u pushBack  _ru_level_3;	_p pushBack  52;//_______________________________UBM

_i pushBack  "CUP_optic_PechenegScope"; 						_u pushBack  _ru_level_2;	_p pushBack  24;//_______________________________UBM

_i pushBack "CUP_optic_PSO_3";									_u pushBack  _ru_level_1;	_p pushBack 50;//_______________________________UBM

_i pushBack  "CUP_optic_NSPU"; 									_u pushBack  _ru_level_3;	_p pushBack  56;//_______________________________UBM

_i pushBack  "CUP_optic_GOSHAWK"; 								_u pushBack  _ru_level_3;	_p pushBack  131;//_______________________________UBM

_i pushBack  "CUP_muzzle_PB6P9"; 								_u pushBack  _ru_level_2;	_p pushBack  11;//_______________________________UBM

_i pushBack  "CUP_muzzle_Bizon"; 								_u pushBack  _ru_level_3;	_p pushBack  32;//_______________________________UBM

_i pushBack  "CUP_muzzle_PBS4"; 								_u pushBack  _ru_level_3;	_p pushBack  51;//_______________________________UBM

_i pushBack  "muzzle_snds_B"; 									_u pushBack  _ru_level_3;	_p pushBack  72;

_i pushBack  "CUP_muzzle_snds_KZRZP_PK"; 						_u pushBack  _ru_level_3;	_p pushBack  75;

_i pushBack  "CUP_muzzle_snds_SA61"; 							_u pushBack  _ru_level_3;	_p pushBack  22;

_i pushBack  "CUP_SVD_camo_g"; 									_u pushBack  _ru_level_2;	_p pushBack  31;//_______________________________UBM

_i pushBack  "CUP_SVD_camo_d"; 									_u pushBack  _ru_level_2;	_p pushBack  31;//_______________________________ABM

_i pushBack  "CUP_SVD_camo_g_half"; 							_u pushBack  _ru_level_2;	_p pushBack  23;

_i pushBack  "CUP_SVD_camo_d_half"; 							_u pushBack  _ru_level_2;	_p pushBack  23;

_i pushBack  "CUP_acc_ANPEQ_15_Flashlight_Black_L"; 			_u pushBack  _ru_level_2;	_p pushBack  24;

_i pushBack  "acc_pointer_IR"; 									_u pushBack  _ru_level_3;	_p pushBack  12;

_i pushBack  "CUP_bipod_VLTOR_Modpod_od"; 						_u pushBack  _ru_level_3;	_p pushBack  10;

_i pushBack  "optic_DMS"; 										_u pushBack  _ru_level_3;	_p pushBack  61;

_i pushBack  "optic_LRPS"; 										_u pushBack  _ru_level_3;	_p pushBack  95;

_i pushBack  "CUP_optic_AN_PVS_4"; 								_u pushBack  _ru_level_3;	_p pushBack  63;//_______________________________ABM

_i pushBack  "CUP_optic_GOSHAWK_RIS"; 							_u pushBack  _ru_level_3;	_p pushBack  92;

_i pushBack  "CUP_optic_NSPU_RPG"; 								_u pushBack  _ru_level_3;	_p pushBack  92;

//88____________8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> MAGAZINES <_88888888888888888888888888888888888888888888888888888888888888888888888888888888888888__MAGAZINES
//88____________8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "Vorona_HE"; 										_u pushBack  _ru_level_2;	_p pushBack  105;

_i pushBack  "CUP_OG7_M";										_u pushBack  _ru_level_1;	_p pushBack  25;

_i pushBack  "CUP_TBG7V_M"; 									_u pushBack  _ru_level_2;	_p pushBack  35;

_i pushBack  "CUP_PG7V_M"; 										_u pushBack  _ru_level_1;	_p pushBack  40;

_i pushBack  "CUP_PG7VM_M"; 									_u pushBack  _ru_level_1;	_p pushBack  55;

_i pushBack  "CUP_PG7VL_M";										_u pushBack  _ru_level_1;	_p pushBack  65;//_______________________________UBM

_i pushBack  "CUP_PG7VR_M"; 									_u pushBack  _ru_level_2;	_p pushBack  110;//_______________________________UBM

_i pushBack  "RPG32_HE_F"; 										_u pushBack  _ru_level_2;	_p pushBack  100;

_i pushBack  "RPG32_F";											_u pushBack  _ru_level_2;	_p pushBack  200;

_i pushBack  "cwr3_at4_heat_m"; 								_u pushBack  _ru_level_1;	_p pushBack  78;//_______________________________UBM

_i pushBack  "cwr3_at4_thermobaric_m";							_u pushBack  _ru_level_2;	_p pushBack  53;

_i pushBack  "CUP_AT13_M"; 										_u pushBack  _ru_level_3;	_p pushBack  500;//_______________________________UBM

_i pushBack  "O_IR_Grenade"; 									_u pushBack  _ru_level_2;	_p pushBack  7;//_______________________________UBM

_i pushBack  "CUP_HandGrenade_RGD5";							_u pushBack  _ru_level_0;	_p pushBack  4;//_______________________________UBM

_i pushBack  "CUP_6Rnd_HE_GP25_M";								_u pushBack  _ru_level_1;	_p pushBack  30;//_______________________________UBM

_i pushBack  "CUP_1Rnd_HE_GP25_M";								_u pushBack  _ru_level_0;	_p pushBack  5; //_______________________________UBM

_i pushBack  "CUP_1Rnd_SMOKE_GP25_M";							_u pushBack  _ru_level_1;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_1Rnd_SmokeGreen_GP25_M";						_u pushBack  _ru_level_1;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_1Rnd_SmokeRed_GP25_M";						_u pushBack  _ru_level_1;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_IlumFlareWhite_GP25_M";						_u pushBack  _ru_level_1;	_p pushBack  1;//_______________________________UBM

//________________________________________________________________________________________
//__PISTOLMAGS
//________________________________________________________________________________________

_i pushBack  "CUP_8Rnd_9x18_Makarov_M";							_u pushBack  _ru_level_0;	_p pushBack  1; //_______________________________UBM

_i pushBack  "CUP_8Rnd_9x18_MakarovSD_M";						_u pushBack  _ru_level_2;	_p pushBack  2;//_______________________________UBM

_i pushBack  "16Rnd_9x21_Mag";									_u pushBack  _ru_level_2;	_p pushBack  3;//_______________________________UBM

_i pushBack  "CUP_6Rnd_45ACP_M";								_u pushBack  _ru_level_2;	_p pushBack  6;//_______________________________ABM

_i pushBack  "CUP_50Rnd_B_765x17_Ball_M";						_u pushBack  _ru_level_2;	_p pushBack  14;

_i pushBack  "CUP_20Rnd_B_765x17_Ball_M";						_u pushBack  _ru_level_1;	_p pushBack  6;

_i pushBack  "CUP_10Rnd_B_765x17_Ball_M";						_u pushBack  _ru_level_1;	_p pushBack  3;

//________________________________________________________________________________________
//__WEAPONMAGS
//________________________________________________________________________________________

_i pushBack  "CUP_64Rnd_9x19_Bizon_M";							_u pushBack  _ru_level_3;	_p pushBack  32;//_______________________________UBM

_i pushBack  "cwr3_64rnd_bizon_m";								_u pushBack  _ru_level_3;	_p pushBack  32;//_______________________________UBM

_i pushBack  "CUP_64Rnd_Green_Tracer_9x19_Bizon_M";				_u pushBack  _ru_level_3;	_p pushBack  32;

_i pushBack  "CUP_5Rnd_B_Saiga12_Buck_00";						_u pushBack  _ru_level_0;	_p pushBack  10;//_______________________________UBM2

_i pushBack  "CUP_5Rnd_B_Saiga12_Slug";							_u pushBack  _ru_level_0;	_p pushBack  10;//_______________________________UBM2

_i pushBack  "CUP_5Rnd_B_Saiga12_Buck_0";						_u pushBack  _ru_level_0;	_p pushBack  10;

_i pushBack  "CUP_5Rnd_B_Saiga12_Buck_1";						_u pushBack  _ru_level_0;	_p pushBack  10;

_i pushBack  "CUP_5Rnd_B_Saiga12_Buck_2";						_u pushBack  _ru_level_0;	_p pushBack  10;

_i pushBack  "CUP_5Rnd_B_Saiga12_Buck_3";						_u pushBack  _ru_level_0;	_p pushBack  10;

_i pushBack  "CUP_5Rnd_B_Saiga12_Buck_4";						_u pushBack  _ru_level_0;	_p pushBack  10;

_i pushBack  "CUP_5Rnd_B_Saiga12_HE";							_u pushBack  _ru_level_2;	_p pushBack  10;

//________________________________________________________________________________________
//__Caliber 5.45x39mm
//________________________________________________________________________________________

_i pushBack  "CUP_30Rnd_545x39_AK_M";							_u pushBack  _ru_level_0;	_p pushBack  8;//_______________________________UBM

_i pushBack  "CUP_30Rnd_545x39_AK74_plum_M";					_u pushBack  _ru_level_0;	_p pushBack  8; //_______________________________UBM

_i pushBack  "CUP_30Rnd_545x39_AK74M_M";						_u pushBack  _ru_level_2;	_p pushBack  8;//_______________________________UBM

_i pushBack  "CUP_30Rnd_TE1_Green_Tracer_545x39_AK74M_M";		_u pushBack  _ru_level_2;	_p pushBack  9;//_______________________________UBM

_i pushBack  "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M";	_u pushBack  _ru_level_2;	_p pushBack  11;//_______________________________UBM

_i pushBack  "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";	_u pushBack  _ru_level_0;	_p pushBack  11;//_______________________________UBM

_i pushBack  "CUP_60Rnd_545x39_AK74M_M";						_u pushBack  _ru_level_0;	_p pushBack  12;

_i pushBack  "CUP_60Rnd_TE1_Green_Tracer_545x39_AK74M_M";		_u pushBack  _ru_level_0;	_p pushBack  12;

_i pushBack  "CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M";	_u pushBack  _ru_level_0;	_p pushBack  15;

//________________________________________________________________________________________
//__Caliber 7.62x39mm
//________________________________________________________________________________________

_i pushBack  "CUP_10Rnd_762x39_SaigaMk03_M";					_u pushBack  _ru_level_1;	_p pushBack  2;

_i pushBack  "CUP_20Rnd_762x39_AMD63_M";						_u pushBack  _ru_level_1;	_p pushBack  4;

_i pushBack  "CUP_30Rnd_762x39_AK47_M";							_u pushBack  _ru_level_1;	_p pushBack  6;

_i pushBack  "CUP_30Rnd_TE1_Green_Tracer_762x39_AK47_M";		_u pushBack  _ru_level_1;	_p pushBack  6;

_i pushBack  "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M";	_u pushBack  _ru_level_1;	_p pushBack  9;

_i pushBack  "75Rnd_762x39_Mag_F";								_u pushBack  _ru_level_2;	_p pushBack  12;

_i pushBack  "75rnd_762x39_AK12_Arid_Mag_F";					_u pushBack  _ru_level_3;	_p pushBack  12;

_i pushBack  "75rnd_762x39_AK12_Arid_Mag_Tracer_F";				_u pushBack  _ru_level_3;	_p pushBack  12;

_i pushBack  "75rnd_762x39_AK12_Lush_Mag_F";					_u pushBack  _ru_level_3;	_p pushBack  12;

_i pushBack  "75rnd_762x39_AK12_Lush_Mag_Tracer_F";				_u pushBack  _ru_level_2;	_p pushBack  12;

_i pushBack  "CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M";	_u pushBack  _ru_level_2;	_p pushBack  12;

//________________________________________________________________________________________
//__Caliber 7.62x54mm
//________________________________________________________________________________________

_i pushBack  "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M";	_u pushBack  _ru_level_1;	_p pushBack  38;//_______________________________UBM

_i pushBack  "150Rnd_762x54_Box";								_u pushBack  _ru_level_3;	_p pushBack  49;

_i pushBack  "150Rnd_762x54_Box_Tracer";						_u pushBack  _ru_level_3;	_p pushBack  49;

_i pushBack  "CUP_10Rnd_762x54_SVD_M";							_u pushBack  _ru_level_1;	_p pushBack  11;//_______________________________UBM

_i pushBack  "CUP_20Rnd_762x51_HK417_Camo_Wood";				_u pushBack  _ru_level_3;	_p pushBack  20;

_i pushBack  "CUP_20Rnd_TE1_Green_Tracer_762x51_HK417";			_u pushBack  _ru_level_3;	_p pushBack  20;

_i pushBack  "CUP_5Rnd_127x108_KSVK_M";							_u pushBack  _ru_level_3;	_p pushBack  10;//_______________________________UBM

_i pushBack  "CUP_10Rnd_9x39_SP5_VSS_M";						_u pushBack  _ru_level_3;	_p pushBack  11;//_______________________________UBM

_i pushBack  "CUP_20Rnd_9x39_SP5_VSS_M";						_u pushBack  _ru_level_3;	_p pushBack  22;//_______________________________UBM

_i pushBack  "CUP_RPG18_M";										_u pushBack  _ru_level_0;	_p pushBack  25;//_______________________________UBM

_i pushBack  "CUP_RPG26_M";										_u pushBack  _ru_level_2;	_p pushBack  30;//_______________________________UBM

_i pushBack  "CUP_Strela_2_M";									_u pushBack  _ru_level_1;	_p pushBack  100;//_______________________________UBM

_i pushBack  "CUP_Igla_M";										_u pushBack  _ru_level_2;	_p pushBack  100;//_______________________________UBM

//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> BINOMENU <_8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__BINOMENU
//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "cwr3_o_nvg_pnv57"; 								_u pushBack  _ru_level_1;	_p pushBack  96;//_______________________________UBM

//_i pushBack  "CUP_NVG_HMNVS";									_u pushBack  _ru_level_3;	_p pushBack  71;//_______________________________UBM---common now

_i pushBack  "CUP_NVG_HMNVS_Hide";								_u pushBack  _ru_level_2;	_p pushBack  102;//_______________________________UBM

//_i pushBack  "CUP_NVG_PVS7_Hide"; 							_u pushBack  _ru_level_3;	_p pushBack  79;//_______________________________UBM

_i pushBack  "CUP_NVG_1PN138"; 									_u pushBack  _ru_level_3;	_p pushBack  62;//_______________________________UBM

_i pushBack  "Rangefinder";										_u pushBack  _ru_level_3;	_p pushBack  30;//_______________________________UBM

_i pushBack  "CUP_LRTV"; 										_u pushBack  _ru_level_3;	_p pushBack  230;

//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> CLOTHES <_888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__CLOTHES
//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

//________________________________________________________________________________________
//__SUPER NV HELMET todo:switch it to nv in gearmenu
//________________________________________________________________________________________

_i pushBack  "H_PilotHelmetFighter_O";							_u pushBack  _ru_level_4;	_p pushBack  300;

//________________________________________________________________________________________
//__Ghillie
//________________________________________________________________________________________

_i pushBack  "U_O_FullGhillie_lsh";								_u pushBack  _ru_level_4;	_p pushBack  525;

_i pushBack  "U_O_FullGhillie_sard";							_u pushBack  _ru_level_4;	_p pushBack  525;

_i pushBack  "U_O_FullGhillie_ard";								_u pushBack  _ru_level_4;	_p pushBack  525;

_i pushBack  "U_O_GhillieSuit"; 								_u pushBack  _ru_level_4;	_p pushBack  225;

_i pushBack  "CUP_U_O_RUS_Ghillie";								_u pushBack  _ru_level_2;	_p pushBack  15;//_______________________________UBM

_i pushBack  "CUP_U_O_TK_Ghillie";								_u pushBack  _ru_level_3;	_p pushBack  16;//_______________________________UBM

_i pushBack  "cwr3_o_vest_ghillie";								_u pushBack  _ru_level_1;	_p pushBack  115;//_______________________________UBM

//________________________________________________________________________________________
//__Uniforms_-->white&town camo
//________________________________________________________________________________________

_i pushBack  "CUP_U_O_RUS_Ratnik_Winter";						_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_U_O_CHDKZ_Commander";							_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "cwr3_o_uniform_m1983_ttsko";						_u pushBack  _ru_level_0;	_p pushBack  1;

//________________________________________________________________________________________
//__Uniforms_-->beige->green camo
//________________________________________________________________________________________

_i pushBack  "cwr3_o_uniform_m1969_collar";						_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "cwr3_o_uniform_m1982";							_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_U_O_RUS_BeigeDigital_MSV";					_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_U_O_RUS_KSOR_VDV";							_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_U_O_RUS_Gorka_Partizan_A_gloves2";			_u pushBack  _ru_level_0;	_p pushBack  1;

//________________________________________________________________________________________
//__Uniforms_-->black
//________________________________________________________________________________________

_i pushBack  "cwr3_o_uniform_m1972_tanker";						_u pushBack  _ru_level_0;	_p pushBack  1;

//________________________________________________________________________________________
//__Uniforms_-->barrack units todo:maybe order it by camo from white to black too (actual level is spawn level of units)
//________________________________________________________________________________________

_i pushBack  "CUP_U_O_RUS_Ratnik_Summer";						_u pushBack  _ru_level_3;	_p pushBack  10;//_______________________________UBM

_i pushBack  "CUP_U_O_TK_Green";								_u pushBack  _ru_level_3;	_p pushBack  10;//_______________________________UBM

_i pushBack  "cwr3_o_uniform_klmk_1957_birch_spn";				_u pushBack  _ru_level_3;	_p pushBack  10;//_______________________________UBM

_i pushBack  "cwr3_o_uniform_klmk_1957_birch_v1";				_u pushBack  _ru_level_0;	_p pushBack  5;//_______________________________UBM

_i pushBack  "cwr3_o_uniform_pilot_jet";						_u pushBack  _ru_level_0;	_p pushBack  5;//_______________________________UBM

_i pushBack  "cwr3_o_uniform_pilot";							_u pushBack  _ru_level_0;	_p pushBack  5;//_______________________________UBM

_i pushBack  "cwr3_o_uniform_m1972_tanker";						_u pushBack  _ru_level_0;	_p pushBack  5;//_______________________________UBM

_i pushBack  "cwr3_o_uniform_klmk_1957_splats_v1";				_u pushBack  _ru_level_0;	_p pushBack  5;//_______________________________UBM

//1//uniforms--------------------------
_i pushBack  "cwr3_o_uniform_kzs_v1";							_u pushBack  _ru_level_1;	_p pushBack  6;//_______________________________UBM

_i pushBack  "cwr3_o_uniform_kzs_v1";							_u pushBack  _ru_level_1;	_p pushBack  6;//_______________________________UBM

_i pushBack  "cwr3_o_uniform_kzs_coverall";						_u pushBack  _ru_level_1;	_p pushBack  6;//_______________________________UBM


//2//uniforms--------------------------

_i pushBack  "CUP_U_O_RUS_EMR_1";								_u pushBack  _ru_level_2;	_p pushBack  9;//_______________________________UBM

_i pushBack  "CUP_U_O_RUS_EMR_1_VDV";							_u pushBack  _ru_level_2;	_p pushBack  9;//_______________________________UBM

_i pushBack  "CUP_U_O_RUS_Soldier_VKPO_VDV_EMR_gloves_pads";	_u pushBack  _ru_level_2;	_p pushBack  9;//_______________________________UBM

_i pushBack  "CUP_U_O_RUS_Soldier_VKPO_VDV_EMR_rolled_up_gloves_pads"; _u pushBack  _ru_level_2;_p pushBack  9;//_______________________________UBM

//3//uniforms--------------------------

_i pushBack  "CUP_U_O_RUS_Gorka_Partizan";						_u pushBack  _ru_level_3;	_p pushBack  10;//_______________________________UBM

_i pushBack  "CUP_U_O_RUS_Gorka_Green";							_u pushBack  _ru_level_3;	_p pushBack  10;//_______________________________UBM

//________________________________________________________________________________________
//__Vests_-->white&town camo
//________________________________________________________________________________________

//0//vests----------------------

_i pushBack  "V_HarnessO_gry";									_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_O_SLA_6B3_1_DES";							_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_O_SLA_6B3_1_URB";							_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_O_SLA_6B3_4_DES";							_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_O_SLA_6B3_4_URB";							_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_O_SLA_6B3_3_DES";							_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_O_SLA_6B3_3_URB";							_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_CDF_6B3_2_SNW";								_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_CDF_6B3_5_SNW";								_u pushBack  _ru_level_0;	_p pushBack  6;

//________________________________________________________________________________________
//__Vests_-->Desert
//________________________________________________________________________________________

_i pushBack  "CUP_V_I_RACS_Carrier_Rig_2";						_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_RUS_Smersh_New_Buttpack";					_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_CDF_6B3_1_DST";								_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_RUS_6B45_1_BeigeDigital";					_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_RUS_6B45_2_BeigeDigital";					_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_RUS_6B45_3_BeigeDigital";					_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_RUS_6B45_4_BeigeDigital";					_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_BeigeDigital";			_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_PKP_Del_BeigeDigital";	_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_PKP_Nut_BeigeDigital";	_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_PKP_Full_BeigeDigital";	_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_Del_Desert";				_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_PKP_Full_Desert";			_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_Full_Desert";				_u pushBack  _ru_level_0;	_p pushBack  6;

//________________________________________________________________________________________
//__Vests_-->Green
//________________________________________________________________________________________

_i pushBack  "cwr3_o_vest_chicom_beltkit_light_ak74";			_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "CUP_V_RUS_Smersh_New_Light_Spectre";				_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "cwr3_o_vest_6b2";									_u pushBack  _ru_level_0;	_p pushBack  6;

_i pushBack  "cwr3_o_vest_chicom_beltkit_ak74";					_u pushBack  _ru_level_3;	_p pushBack  7;//_______________________________UBM

_i pushBack  "cwr3_o_vest_6b2_ak74";							_u pushBack  _ru_level_0;	_p pushBack  6;//_______________________________UBM

_i pushBack  "cwr3_o_vest_6b2_medic";							_u pushBack  _ru_level_0;	_p pushBack  6;//_______________________________UBM

_i pushBack  "cwr3_o_vest_6b2_sapper";							_u pushBack  _ru_level_0;	_p pushBack  6;//_______________________________UBM

_i pushBack  "cwr3_o_vest_6b2_chicom_ak74";						_u pushBack  _ru_level_0;	_p pushBack  6;//_______________________________UBM

//1//vests----------------------
_i pushBack  "cwr3_o_vest_6b2_chicom_light_ak74";				_u pushBack  _ru_level_1;	_p pushBack  7;//_______________________________UBM

_i pushBack  "cwr3_o_vest_6b2_gl";								_u pushBack  _ru_level_1;	_p pushBack  7;//_______________________________UBM

_i pushBack  "cwr3_o_vest_6b2_mg";								_u pushBack  _ru_level_1;	_p pushBack  7;//_______________________________UBM

_i pushBack  "cwr3_o_vest_6b2_svd";								_u pushBack  _ru_level_1;	_p pushBack  7;//_______________________________UBM

_i pushBack  "cwr3_o_vest_6b2_officer";							_u pushBack  _ru_level_1;	_p pushBack  7;//_______________________________UBM

_i pushBack  "cwr3_o_vest_6b3";									_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_RUS_6B3_1";									_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_RUS_6B3_Flora_1";							_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_Vest_RUS_6B45_Sh117";							_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_Nut";						_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_Del";						_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_Del_Nut";					_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_Full";					_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

//3//vests----------------------

_i pushBack  "CUP_V_RUS_6B3_3";									_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_VOG_full";				_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_VOG_Del";					_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_Vest_RUS_6B45_Sh117_PKP";						_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

_i pushBack  "V_PlateCarrierIAGL_oli";							_u pushBack  _ru_level_0;	_p pushBack  1;

//________________________________________________________________________________________
//__Vests_-->black
//________________________________________________________________________________________

_i pushBack  "V_BandollierB_blk";								_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "V_TacVestIR_blk";									_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "V_PlateCarrier1_blk";								_u pushBack  _ru_level_0;	_p pushBack  1;

//--------------------------------------------------------------------------

_i pushBack  "cwr3_o_vest_beltkit_ak74";						_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_V_RUS_Smersh_1";								_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_V_O_TK_Vest_2";								_u pushBack  _ru_level_3;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_V_O_TK_Vest_1";								_u pushBack  _ru_level_3;	_p pushBack  1;//_______________________________UBM

//________________________________________________________________________________________
//__Backpacks_-->white&town camo
//________________________________________________________________________________________

//0//backpacks----------------------------

_i pushBack  "CUP_O_RUS_Patrol_bag_Winter";						_u pushBack  _ru_level_1;	_p pushBack  1;

_i pushBack  "B_FieldPack_oucamo";								_u pushBack  _ru_level_1;	_p pushBack  1;

//________________________________________________________________________________________
//__Backpacks_-->BEIGE & DESERT
//________________________________________________________________________________________

_i pushBack  "CUP_O_RUS_Patrol_bag_BeigeDigital";				_u pushBack  _ru_level_1;	_p pushBack  1;

_i pushBack  "CUP_O_RUS_Patrol_bag_Desert";						_u pushBack  _ru_level_1;	_p pushBack  1;

_i pushBack  "B_FieldPack_cbr";									_u pushBack  _ru_level_1;	_p pushBack  1;

_i pushBack  "cwr3_o_backpack_rd54";							_u pushBack  _ru_level_1;	_p pushBack  1;

_i pushBack  "cwr3_o_backpack_rd54_medic_empty";				_u pushBack  _ru_level_1;	_p pushBack  1;

_i pushBack  "B_FieldPack_ocamo";								_u pushBack  _ru_level_1;	_p pushBack  1;

_i pushBack  "CUP_B_RPGPack_Khaki";								_u pushBack  _ru_level_2;	_p pushBack  1;

_i pushBack  "cwr3_o_backpack_veshmeshok";						_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_o_backpack_veshmeshok_medic_empty";			_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "B_Carryall_cbr";									_u pushBack  _ru_level_4;	_p pushBack  1;

_i pushBack  "B_Carryall_ocamo";								_u pushBack  _ru_level_4;	_p pushBack  1;

_i pushBack  "cwr3_o_backpack_gasmask";							_u pushBack  _ru_level_1;	_p pushBack  1;

_i pushBack  "cwr3_o_backpack_rpg7";							_u pushBack  _ru_level_1;	_p pushBack  1;

_i pushBack  "B_FieldPack_khk";									_u pushBack  _ru_level_1;	_p pushBack  1;

//________________________________________________________________________________________
//__Backpacks_-->Green
//________________________________________________________________________________________

_i pushBack  "cwr3_o_backpack_harness_roll";					_u pushBack  _ru_level_1;	_p pushBack  1;

_i pushBack  "B_FieldPack_oli";									_u pushBack  _ru_level_1;	_p pushBack  1;

_i pushBack  "CUP_O_RUS_Patrol_bag_Green";						_u pushBack  _ru_level_1;	_p pushBack  1;

_i pushBack  "CUP_B_RUS_Backpack";								_u pushBack  _ru_level_1;	_p pushBack  1;

_i pushBack  "CUP_B_HikingPack_Civ";							_u pushBack  _ru_level_3;	_p pushBack  1;

_i pushBack  "CUP_O_RUS_Patrol_bag_Summer";						_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

//________________________________________________________________________________________
//__Backpacks_-->BLACK
//________________________________________________________________________________________

_i pushBack  "B_FieldPack_blk";									_u pushBack  _ru_level_1;	_p pushBack  1;

//________________________________________________________________________________________
//__Backpacks_-->prefilled
//________________________________________________________________________________________
//+//backpacks-----------ammo-----------------
//________________________________________________________________________________________

_i pushBack  "cwr3_o_backpack_veshmeshok_ak74";					_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_o_backpack_veshmeshok_rpk";					_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_o_backpack_veshmeshok_pk";					_u pushBack  _ru_level_1;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_o_backpack_veshmeshok_hg";					_u pushBack  _ru_level_1;	_p pushBack  1;//_______________________________UBM

//________________________________________________________________________________________
//+//backpacks---------medic-------------------
//________________________________________________________________________________________

_i pushBack  "cwr3_o_backpack_veshmeshok_medic";				_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_O_RUS_Patrol_bag_Summer_Medic";				_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

//________________________________________________________________________________________
//+//backpacks----------mines------------------
//________________________________________________________________________________________

_i pushBack  "cwr3_o_backpack_veshmeshok_engineer";				_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM

//________________________________________________________________________________________
//+//backpacks-----explosives------------------
//________________________________________________________________________________________

_i pushBack  "cwr3_o_backpack_veshmeshok_sapper";				_u pushBack  _ru_level_1;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_O_RUS_Patrol_bag_Summer_Shovel_Engineer";		_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_o_backpack_rd54_saboteur";					_u pushBack  _ru_level_3;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_O_RUS_Patrol_bag_Summer_Shovel_ReconExp";		_u pushBack  _ru_level_3;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_B_RUS_Pack_Saboteur";							_u pushBack  _ru_level_3;	_p pushBack  1;//_______________________________UBM

//________________________________________________________________________________________
///+//backpacks-----at------------------
//________________________________________________________________________________________

_i pushBack  "cwr3_o_backpack_rpg7_pg7vl";						_u pushBack  _ru_level_1;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_B_RUS_Pack_AT";								_u pushBack  _ru_level_2;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_o_backpack_veshmeshok_at4";					_u pushBack  _ru_level_1;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_O_RUS_Patrol_bag_Summer_Shovel_HAT";			_u pushBack  _ru_level_3;	_p pushBack  1;//_______________________________UBM

//________________________________________________________________________________________
//__Helmets_-->WINTER & TOWN
//________________________________________________________________________________________

_i pushBack  "cwr3_o_ushanka";									_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_ZSH_Shield_Up";							_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_o_headgear_zsh5_visor";						_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_o_headgear_zsh5";							_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_o_headgear_ssh68_winter";					_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_6B47_v2_Winter";						_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_6B47_v2_GogglesDown_Winter";			_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_SLA_Helmet_URB_worn";						_u pushBack  _ru_level_0;	_p pushBack  1;

//________________________________________________________________________________________
//__Helmets_-->Desert
//________________________________________________________________________________________

_i pushBack  "cwr3_o_headgear_sidecap_m1973";					_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "cwr3_o_headgear_sidecap_m1973_field";				_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_o_headgear_fieldcap_m1982";					_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_o_headgear_fieldcap_m1982_v3";				_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_6B27_cover_BeigeDigital";				_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_6B47_v2_BeigeDigital";					_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_6B47_desert";							_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_6B47_SF_headset_desert";				_u pushBack  _ru_level_0;	_p pushBack  1;

//________________________________________________________________________________________
//__Helmets_-->Green
//________________________________________________________________________________________

//armor 0

_i pushBack  "cwr3_o_bandanna_od";								_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM3

_i pushBack  "CUP_H_RUS_Bandana_HS";							_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM3

_i pushBack  "cwr3_o_bandanna_klmk";							_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "cwr3_o_headgear_ssh68_camo";						_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "cwr3_o_headgear_ssh68_cover_klmk";				_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "cwr3_o_headgear_ssh68_cover";						_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "cwr3_o_headgear_ssh68_net";						_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "CUP_H_RUS_6B27_olive";							_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM3

_i pushBack  "CUP_H_RUS_SSH68_cover_vsr84_dubok";				_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_SSH68_cover_vsr93";						_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_SSH68_cover_vsr98";						_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_ZSH_1";									_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_6B27";									_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "cwr3_o_headgear_ssh68";							_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_H_RUS_6B47_v2_GogglesUp_Summer";				_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_H_RUS_6B47_v2_GogglesClosed_Summer";			_u pushBack  _ru_level_0;	_p pushBack  1; //_______________________________UBM2

_i pushBack  "CUP_H_RUS_6B47_v2_GogglesDown_Summer";			_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_H_RUS_6B47_v2_Summer";						_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_H_RUS_6B47_v2_Summer";						_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM3

_i pushBack  "CUP_H_RUS_6B47_v2_GogglesClosed_Summer";			_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM3

_i pushBack  "CUP_H_RUS_6B47_SF_headset";						_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_6B47";									_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_K6_3";									_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_K6_3_Shield_Down";						_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_K6_3_Shield_Down_khaki";				_u pushBack  _ru_level_0;	_p pushBack  1;

//________________________________________________________________________________________
//__Helmets_-->black
//________________________________________________________________________________________

_i pushBack  "cwr3_o_headgear_tsh3";							_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "cwr3_o_headgear_tsh4";							_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "H_Tank_black_F";									_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_H_TK_Helmet";									_u pushBack  _ru_level_0;	_p pushBack  1;//_______________________________UBM3

_i pushBack  "CUP_H_RUS_6B47_SF_headset_goggles_black";			_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_6B47_SF_headset_black";					_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_K6_3_black";							_u pushBack  _ru_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_RUS_K6_3_Shield_Down_black";				_u pushBack  _ru_level_0;	_p pushBack  1;

//________________________________________________________________________________________
//__Backpacks_-->STATICS & UAV
//________________________________________________________________________________________

//mg
_i pushBack  "CUP_B_DShkM_Gun_Bag";								_u pushBack  _ru_level_1;	_p pushBack  45;

_i pushBack  "CUP_B_DShkM_TripodHigh_Bag";						_u pushBack  _ru_level_1;	_p pushBack  5;

_i pushBack  "CUP_B_DShkM_TripodLow_Bag";						_u pushBack  _ru_level_1;	_p pushBack  5;

_i pushBack  "cwr3_backpack_dshkm_high";						_u pushBack  _ru_level_2;	_p pushBack  170;

_i pushBack  "cwr3_backpack_dshkm_low";							_u pushBack  _ru_level_2;	_p pushBack  165;
//he
_i pushBack  "CUP_B_AGS30_Gun_Bag";								_u pushBack  _ru_level_1;	_p pushBack  65;

_i pushBack  "CUP_B_AGS30_Tripod_Bag";							_u pushBack  _ru_level_1;	_p pushBack  5;

_i pushBack  "cwr3_backpack_ags30";								_u pushBack  _ru_level_2;	_p pushBack  265;
//at
_i pushBack  "cwr3_backpack_spg9";								_u pushBack  _ru_level_3;	_p pushBack  400;

_i pushBack  "cwr3_backpack_at5";								_u pushBack  _ru_level_4;	_p pushBack  430;

_i pushBack  "CUP_B_Metis_Gun_Bag";								_u pushBack  _ru_level_2;	_p pushBack  550;

_i pushBack  "CUP_B_Metis_Tripod_Bag";							_u pushBack  _ru_level_2;	_p pushBack  5;

_i pushBack  "CUP_B_Kornet_Gun_Bag";							_u pushBack  _ru_level_2;	_p pushBack  570;

_i pushBack  "CUP_B_Kornet_Tripod_Bag";							_u pushBack  _ru_level_2;	_p pushBack  5;
//MORTAR
_i pushBack  "CUP_B_Podnos_Gun_Bag";							_u pushBack  _ru_level_1;	_p pushBack  875;

_i pushBack  "CUP_B_Podnos_Bipod_Bag";							_u pushBack  _ru_level_1;	_p pushBack  5;

_i pushBack  "cwr3_backpack_2b14";								_u pushBack  _ru_level_4;	_p pushBack  1750;
//UAV
_i pushBack  "O_UAV_01_backpack_F";								_u pushBack  _ru_level_4;	_p pushBack  645;

//________________________________________________________________________________________
//________________________________________________________________________________________
//________________________________________________________________________________________
//________________________________________________________________________________________
//________________________________________________________________________________________
//________________________________________________________________________________________
//________________________________________________________________________________________
//________________________________________________________________________________________
//________________________________________________________________________________________
//________________________________________________________________________________________
//________________________________________________________________________________________
//________________________________________________________________________________________






[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";

//--- Templates (Those lines can be generated in the RPT on purchase by uncommenting the diag_log in Events_UI_GearMenu.sqf >> "onPurchase").
_t = [];

[_faction, _t] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Template_Set.sqf"; 