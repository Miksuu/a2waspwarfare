private ["_faction", "_i", "_p", "_side", "_u"];

_side = _this;
_faction = "West";

_i = [];
_u = [];
_p = [];





_BLUcontainer = [BTeamleader1,BTeamleader2,BTeamleader3,BTeamleader4,BTeamleader5,BEngineer1,BEngineer2,BEngineer3,BEngineer4,BEngineer5,BMachinegunner1_1,BMachinegunner1_2,BMachinegunner2_1,BMachinegunner2_2,BMachinegunner3_1,BMachinegunner3_2,BMachinegunner4_1,BMachinegunner4_2,BMachinegunner5_1,BMachinegunner5_2,BMedic1,BMedic2,BMedic3,BMedic4,BMedic5,BSpecOps1,BSpecOps2,BSpecOps3,BSpecOps4,BSpecOps5];
_UKContainer =[BTeamleader4,BTeamleader5,BEngineer4,BEngineer5,BMachinegunner4_1,BMachinegunner4_2,BMachinegunner5_1,BMachinegunner5_2,BMedic4,BMedic5,BSpecOps4,BSpecOps5];
_USContainer =_BLUcontainer - _UKContainer ;



_uk_level_0=9;	_us_level_0=9;	_blu_level_0=9;
_uk_level_1=9;	_us_level_1=9;	_blu_level_1=9;
_uk_level_2=9;	_us_level_2=9;	_blu_level_2=9;
_uk_level_3=9;	_us_level_3=9;	_blu_level_3=9;
_uk_level_4=9;	_us_level_4=9;	_blu_level_4=9;
_uk_level_5=9;	_us_level_5=9;	_blu_level_5=9;


if (player in _BLUcontainer) then{_blu_level_0=0;_blu_level_1=1;_blu_level_2=2;_blu_level_3=3;_blu_level_4=4;_blu_level_5=5;};

if (player in _UKContainer) then{_uk_level_0=0;_uk_level_1=1;_uk_level_2=2;_uk_level_3=3;_uk_level_4=4;_uk_level_5=5;};

if (player in _USContainer) then{_us_level_0=0;_us_level_1=1;_us_level_2=2;_us_level_3=3;_us_level_4=4;_us_level_5=5;};










//CORE GEAR (UNITBASED MINIMUM,every gear from spawnable ai)= //UBM ||Numbertag if reduced means f.e. UBM2 units on B2 level spawn with this object
//EXTENDED CORE GEAR (STUFF FROM DEPLOYABLE GEARBOX)= //ABM



//BOTH SIDES USED





//88__________888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> WEAPONS <_888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__WEAPONS
//88___US/UK__888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "CUP_smg_MP5A5";  									_u pushBack  _blu_level_2;	_p pushBack  30;//_______________________________UBM

_i pushBack  "CUP_smg_MP5SD6";  								_u pushBack  _blu_level_3;	_p pushBack  50;//_______________________________UBM


//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> LAUNCHER <_8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__LAUNCHER
//88___US/UK___88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

//SOME DIFFERENT LISTED HERE TO GET BETTER LOADORDER IN LIST FOR LAUNCHERLIST
//_______________________________________________________________________________________________________________________________
//__LAUNCHER__oneway_AT
//_______________________________________________________________________________________________________________________________


_i pushBack  "cwr3_launch_m72a3";  								_u pushBack  _blu_level_0;	_p pushBack  90;//_______________________________UBM

_i pushBack  "CUP_launch_M72a6";  								_u pushBack  _blu_level_1;	_p pushBack  95;

_i pushBack  "CUP_launch_M136";  								_u pushBack  _blu_level_2;	_p pushBack  120;//_______________________________UBM

_i pushBack  "CUP_launch_NLAW";  								_u pushBack  _uk_level_2;	_p pushBack  332;//_______________________________UBM

//_______________________________________________________________________________________________________________________________
//__LAUNCHER__oneway_AA
//_______________________________________________________________________________________________________________________________


_i pushBack  "cwr3_launch_redeye";  							_u pushBack  _us_level_1;	_p pushBack  180;//_______________________________UBM

_i pushBack  "CUP_launch_FIM92Stinger";  						_u pushBack  _blu_level_2;	_p pushBack  190;//_______________________________UBM


//_______________________________________________________________________________________________________________________________
//__LAUNCHER__reloadable
//_______________________________________________________________________________________________________________________________


_i pushBack  "cwr3_launch_m67_rcl";  							_u pushBack  _us_level_1;	_p pushBack  170;//_______________________________UBM

_i pushBack  "cwr3_launch_carlgustaf";  						_u pushBack  _blu_level_1;	_p pushBack  290;//_______________________________UBM

_i pushBack  "CUP_launch_Mk153Mod0_SMAWOptics"; 		 		_u pushBack  _us_level_2;	_p pushBack  250;//_______________________________UBM

_i pushBack  "CUP_launch_M47";  								_u pushBack  _us_level_1;	_p pushBack  380;//_______________________________UBM

_i pushBack  "CUP_launch_MAAWS"; 								_u pushBack  _uk_level_2;	_p pushBack  320;

_i pushBack  "launch_NLAW_F"; 									_u pushBack  _uk_level_2;	_p pushBack  280;

_i pushBack  "CUP_launch_Javelin";  							_u pushBack  _blu_level_3;	_p pushBack  605;//_______________________________UBM

_i pushBack  "cwr3_launch_javelin";  							_u pushBack  _uk_level_1;	_p pushBack  230;//_______________________________UBM

//_______________________________________________________________________________________________________________________________
//__LAUNCHER__unloaded_AT (listed for making ai templates)
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_launch_m72a3_loaded";  						_u pushBack  _blu_level_0;	_p pushBack  70;//_______________________________UBM

_i pushBack  "CUP_launch_M136_Loaded";  						_u pushBack  _blu_level_2;	_p pushBack  80;//_______________________________UBM

_i pushBack  "CUP_launch_NLAW_Loaded";  						_u pushBack  _uk_level_2;	_p pushBack  202;//_______________________________UBM

//_______________________________________________________________________________________________________________________________
//__LAUNCHER__unloaded_AA (listed for making ai templates)
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_launch_redeye_loaded";  						_u pushBack  _us_level_1;	_p pushBack  80;//_______________________________UBM

_i pushBack  "CUP_launch_FIM92Stinger_Loaded";  				_u pushBack  _blu_level_2;	_p pushBack  90;//_______________________________UBM


//88__________888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> PISTOLS <_888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__PISTOLS
//88___US/UK__88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "CUP_hgun_Colt1911"; 								_u pushBack  _blu_level_0;	_p pushBack  8;//_______________________________UBM

//88_________8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> SCOPES <_88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__SCOPES
//88__US/UK__8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "CUP_optic_ACOG";  								_u pushBack  _blu_level_2;	_p pushBack  30;//_______________________________UBM

_i pushBack  "CUP_bipod_Harris_1A2_L_BLK";  					_u pushBack  _blu_level_2;	_p pushBack  14;//_______________________________UBM

_i pushBack  "CUP_optic_AN_PAS_13c2";  							_u pushBack  _blu_level_3;	_p pushBack  54;//_______________________________UBM

_i pushBack  "CUP_bipod_Harris_1A2_L";  						_u pushBack  _blu_level_2;	_p pushBack  14;//_______________________________UBM

_i pushBack  "CUP_optic_MAAWS_Scope";  							_u pushBack  _blu_level_3;	_p pushBack  14;//_______________________________ABM
//_______________________________________________________________________________________________________________________________
//__Camo_for_Weapons
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_Mxx_camo_half";  								_u pushBack  _blu_level_2;	_p pushBack  11;//_______________________________UBM

_i pushBack  "CUP_Mxx_camo";  									_u pushBack  _blu_level_2;	_p pushBack  11;//_______________________________UBM

//88____________8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> MAGAZINES <_88888888888888888888888888888888888888888888888888888888888888888888888888888888888888__MAGAZINES
//88___US/UK____8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________


_i pushBack  "cwr3_carlgustaf_heat_m";  						_u pushBack  _blu_level_1;	_p pushBack  145;//_______________________________UBM

_i pushBack  "CUP_Javelin_M"; 									_u pushBack  _blu_level_1;	_p pushBack  445;//_______________________________UBM

_i pushBack  "B_IR_Grenade";  									_u pushBack  _blu_level_2;	_p pushBack  10;//_______________________________UBM

_i pushBack  "CUP_1Rnd_HE_M203";  								_u pushBack  _blu_level_1;	_p pushBack  9;//_______________________________UBM

_i pushBack  "CUP_1Rnd_HEDP_M203";  							_u pushBack  _blu_level_2;	_p pushBack  11;//_______________________________UBM

_i pushBack  "CUP_1Rnd_Smoke_M203"; 							_u pushBack  _blu_level_1;	_p pushBack  5; //_______________________________UBM

_i pushBack  "CUP_1Rnd_SmokeGreen_M203";  						_u pushBack  _blu_level_1;	_p pushBack  5;//_______________________________UBM

_i pushBack  "CUP_1Rnd_SmokeYellow_M203";  						_u pushBack  _blu_level_1;	_p pushBack  5;//_______________________________UBM

_i pushBack  "CUP_1Rnd_SmokeRed_M203";  						_u pushBack  _blu_level_1;	_p pushBack  5;//_______________________________UBM

_i pushBack  "CUP_1Rnd_StarFlare_White_M203";  					_u pushBack  _blu_level_1;	_p pushBack  2;//_______________________________UBM

_i pushBack  "UGL_FlareCIR_F"; 									_u pushBack  _blu_level_2;	_p pushBack  2;//_______________________________UBM

_i pushBack  "CUP_1Rnd_StarFlare_Green_M203";  					_u pushBack  _blu_level_2;	_p pushBack  2;//_______________________________UBM

_i pushBack  "CUP_1Rnd_StarFlare_Red_M203";  					_u pushBack  _blu_level_2;	_p pushBack  2;//_______________________________UBM

_i pushBack  "CUP_1Rnd_StarFlare_White_M203";  					_u pushBack  _blu_level_2;	_p pushBack  2;//_______________________________UBM

_i pushBack  "CUP_1Rnd_StarCluster_Green_M203";  				_u pushBack  _blu_level_2;	_p pushBack  2;//_______________________________UBM

_i pushBack  "CUP_7Rnd_45ACP_1911";  							_u pushBack  _blu_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_30Rnd_9x19_MP5";  							_u pushBack  _blu_level_2;	_p pushBack  10;//_______________________________UBM

_i pushBack  "CUP_8Rnd_12Gauge_Pellets_No00_Buck";  			_u pushBack  _blu_level_0;	_p pushBack  5;//_______________________________UBM1

_i pushBack  "CUP_8Rnd_12Gauge_Slug";  							_u pushBack  _blu_level_0;	_p pushBack  5;//_______________________________UBM1

_i pushBack  "CUP_8Rnd_12Gauge_Pellets_No0_Buck";  				_u pushBack  _blu_level_0;	_p pushBack  5;

_i pushBack  "CUP_8Rnd_12Gauge_Pellets_No1_Buck";  				_u pushBack  _blu_level_0;	_p pushBack  5;

_i pushBack  "CUP_8Rnd_12Gauge_Pellets_No2_Buck";  				_u pushBack  _blu_level_0;	_p pushBack  5;

_i pushBack  "CUP_8Rnd_12Gauge_Pellets_No3_Buck";  				_u pushBack  _blu_level_0;	_p pushBack  5;

_i pushBack  "CUP_8Rnd_12Gauge_Pellets_No4_Buck";  				_u pushBack  _blu_level_0;	_p pushBack  5;

_i pushBack  "CUP_8Rnd_12Gauge_Pellets_No4_Bird";  				_u pushBack  _blu_level_0;	_p pushBack  5;

_i pushBack  "CUP_8Rnd_12Gauge_HE";  							_u pushBack  _blu_level_1;	_p pushBack  6;

_i pushBack  "CUP_30Rnd_556x45_Stanag";  						_u pushBack  _blu_level_0;	_p pushBack  10;//_______________________________UBM

_i pushBack  "CUP_30Rnd_556x45_Stanag_Mk16_Tracer_Red";  		_u pushBack  _blu_level_1;	_p pushBack  10;

_i pushBack  "CUP_100Rnd_556x45_BetaCMag_ar15";  				_u pushBack  _blu_level_2;	_p pushBack  30;

_i pushBack  "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag_ar15";  _u pushBack  _blu_level_2;	_p pushBack  30;

_i pushBack  "CUP_200Rnd_TE4_Red_Tracer_556x45_M249"; 			_u pushBack  _blu_level_1;	_p pushBack  55;//_______________________________UBM 

_i pushBack  "CUP_100Rnd_TE4_Red_Tracer_556x45_M249";  			_u pushBack  _blu_level_1;	_p pushBack  28;//_______________________________UBM

_i pushBack  "CUP_100Rnd_TE4_Green_Tracer_556x45_M249";  		_u pushBack  _blu_level_1;	_p pushBack  28;//_______________________________ABM

_i pushBack  "CUP_5Rnd_762x51_M24"; 							_u pushBack  _blu_level_1;	_p pushBack  2;//_______________________________UBM

_i pushBack  "20Rnd_762x51_Mag";  								_u pushBack  _blu_level_3;	_p pushBack  8;//_______________________________ABM

_i pushBack  "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";  	_u pushBack  _blu_level_1;	_p pushBack  45;//_______________________________UBM

_i pushBack  "cwr3_m72a3_m";  									_u pushBack  _blu_level_0;	_p pushBack  25;//_______________________________UBM

_i pushBack  "CUP_M136_M";  									_u pushBack  _blu_level_2;	_p pushBack  40;//_______________________________UBM

_i pushBack  "CUP_Stinger_M"; 									_u pushBack  _blu_level_0;	_p pushBack  100;//_______________________________UBM


//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> BINOMENU <_8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__BINOMENU
//88___US/UK___88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "CUP_NVG_PVS7";  									_u pushBack  _blu_level_1;	_p pushBack  83;//_______________________________UBM

_i pushBack  "CUP_SOFLAM";  									_u pushBack  _blu_level_3;	_p pushBack  290;//_______________________________UBM

_i pushBack  "B_UavTerminal";  									_u pushBack  _blu_level_4;	_p pushBack  90;//_______________________________UBM


//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> CLOTHES <_888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__CLOTHES
//88___US/UK___88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________


_i pushBack  "U_B_FullGhillie_lsh";  							_u pushBack  _blu_level_4;	_p pushBack  525;

_i pushBack  "U_B_FullGhillie_sard";  							_u pushBack  _blu_level_4;	_p pushBack  525;

_i pushBack  "U_B_FullGhillie_ard";  							_u pushBack  _blu_level_4;	_p pushBack  525;

_i pushBack  "U_B_GhillieSuit";  								_u pushBack  _blu_level_4;	_p pushBack  225;

_i pushBack  "cwr3_b_vest_ghillie";  							_u pushBack  _blu_level_1;	_p pushBack  125;//_______________________________UBM

_i pushBack  "CUP_H_SPH4";  									_u pushBack  _blu_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "cwr3_b_headgear_pilot_visor_white";  				_u pushBack  _blu_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_headgear_pilot";  							_u pushBack  _blu_level_0;	_p pushBack  1;//_______________________________UBM



//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________




//88__________888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> WEAPONS <_888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__WEAPONS
//88____UK____888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________


_i pushBack  "cwr3_smg_sterling";  								_u pushBack  _uk_level_0;	_p pushBack  16;//_______________________________UBM

_i pushBack  "CUP_sgun_SPAS12";  								_u pushBack  _uk_level_0;	_p pushBack  20;

_i pushBack  "cwr3_arifle_l1a1";  								_u pushBack  _uk_level_0;	_p pushBack  18;//_______________________________UBM

_i pushBack  "cwr3_arifle_l1a1_suit";  							_u pushBack  _uk_level_1;	_p pushBack  18;//_______________________________UBM

_i pushBack  "CUP_arifle_FNFAL5060_railed_woodland";  			_u pushBack  _uk_level_3;	_p pushBack  52;

//_______________________________________________________________________________________________________________________________
//__L85
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_arifle_L85A2";  								_u pushBack  _uk_level_2;	_p pushBack  26;//_______________________________UBM

_i pushBack  "CUP_arifle_L85A2_ACOG_Laser";  					_u pushBack  _uk_level_2;	_p pushBack  26;//_______________________________UBM

_i pushBack  "CUP_arifle_L85A2_Elcan_Laser";  					_u pushBack  _uk_level_2;	_p pushBack  26;//_______________________________UBM

_i pushBack  "CUP_arifle_L85A2_GL_Elcan_Laser";  				_u pushBack  _uk_level_2;	_p pushBack  26;//_______________________________UBM

_i pushBack  "CUP_arifle_L85A2_CWS_Laser";  					_u pushBack  _uk_level_3;	_p pushBack  26;//_______________________________UBM

//_______________________________________________________________________________________________________________________________
//__MG
//_______________________________________________________________________________________________________________________________


_i pushBack  "CUP_arifle_L86A2";  								_u pushBack  _uk_level_3;	_p pushBack  36;

_i pushBack  "CUP_lmg_minimipara"; 								_u pushBack  _uk_level_2;	_p pushBack  30;//_______________________________UBM

_i pushBack  "CUP_lmg_L110A1";  								_u pushBack  _uk_level_3;	_p pushBack  40;//_______________________________UBM

_i pushBack  "cwr3_lmg_bren";  									_u pushBack  _uk_level_0;	_p pushBack  28;//_______________________________UBM

_i pushBack  "CUP_lmg_L7A2_Flat";  								_u pushBack  _uk_level_1;	_p pushBack  32;//_______________________________UBM

_i pushBack  "CUP_lmg_L7A2";  									_u pushBack  _uk_level_2;	_p pushBack  33;//_______________________________UBM

_i pushBack  "CUP_srifle_L129A1_HG";  							_u pushBack  _uk_level_3;	_p pushBack  33;//_______________________________ABM

_i pushBack  "cwr3_srifle_l42a1_no23";  						_u pushBack  _uk_level_1;	_p pushBack  59;//_______________________________UBM

_i pushBack  "CUP_srifle_L129A1_HG_TA648_Bipod_w";  			_u pushBack  _uk_level_2;	_p pushBack  67;//_______________________________UBM

_i pushBack  "CUP_srifle_M24_wdl";  							_u pushBack  _uk_level_2;	_p pushBack  50;

_i pushBack  "CUP_srifle_AWM_des";  							_u pushBack  _uk_level_2;	_p pushBack  68;//_______________________________ABM

_i pushBack  "CUP_srifle_AWM_wdl";  							_u pushBack  _uk_level_2;	_p pushBack  68;//_______________________________ABM

_i pushBack  "CUP_srifle_AWM_wdl_SBPMII";  						_u pushBack  _uk_level_2;	_p pushBack  68;//_______________________________UBM

_i pushBack  "CUP_srifle_AS50";  								_u pushBack  _uk_level_3;	_p pushBack  180;//_______________________________ABM

_i pushBack  "CUP_srifle_AS50_SBPMII";  						_u pushBack  _uk_level_3;	_p pushBack  180;//_______________________________UBM

_i pushBack  "CUP_srifle_AS50_AMPAS13c2"; 						_u pushBack  _uk_level_3;	_p pushBack  180;//_______________________________UBM

_i pushBack  "CUP_glaunch_M32";  								_u pushBack  _uk_level_2;	_p pushBack  105;



//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> LAUNCHER <_8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__LAUNCHER
//88____UK_____88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________


/*placed in UK/US now for loadorderfix

*/

//88__________888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> PISTOLS <_888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__PISTOLS
//88____UK____88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "CUP_hgun_Browning_HP";  							_u pushBack  _uk_level_0;	_p pushBack  10;//_______________________________UBM

_i pushBack  "CUP_hgun_Glock17_blk";  							_u pushBack  _uk_level_2;	_p pushBack  14;//_______________________________UBM

_i pushBack  "CUP_hgun_MP7_woodland";  							_u pushBack  _uk_level_3;	_p pushBack  54;

//88_________8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> SCOPES <_88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__SCOPES
//88___UK____8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "cwr3_optic_suit";  								_u pushBack  _uk_level_1;	_p pushBack  10;//_______________________________UBM

_i pushBack  "CUP_optic_no23mk2";  								_u pushBack  _uk_level_1;	_p pushBack  34;//_______________________________UBM

_i pushBack  "CUP_optic_Elcan_reflex";  						_u pushBack  _uk_level_2;	_p pushBack  34;//_______________________________UBM

_i pushBack  "CUP_optic_ACOG_TA648_308_RDS_Wdl";  				_u pushBack  _uk_level_2;	_p pushBack  36;//_______________________________UBM

_i pushBack  "CUP_optic_SB_3_12x50_PMII";  						_u pushBack  _uk_level_2;	_p pushBack  44;//_______________________________UBM

_i pushBack  "CUP_optic_Leupold_VX3";  							_u pushBack  _uk_level_3;	_p pushBack  51;//_______________________________ABM

_i pushBack  "CUP_optic_CWS";  									_u pushBack  _uk_level_3;	_p pushBack  141;//_______________________________UBM

_i pushBack  "CUP_acc_LLM";  									_u pushBack  _uk_level_2;	_p pushBack  10;//_______________________________UBM

_i pushBack  "CUP_bipod_FNFAL";  								_u pushBack  _uk_level_3;	_p pushBack  10;

_i pushBack  "CUP_muzzle_snds_socom762rc";  					_u pushBack  _uk_level_3;	_p pushBack  30;

_i pushBack  "CUP_muzzle_snds_L85";  							_u pushBack  _uk_level_3;	_p pushBack  25;

_i pushBack  "CUP_muzzle_snds_MP7";  							_u pushBack  _uk_level_3;	_p pushBack  22;


//88____________8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> MAGAZINES <_88888888888888888888888888888888888888888888888888888888888888888888888888888888888888__MAGAZINES
//88_____UK_____8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "NLAW_F"; 											_u pushBack  _uk_level_2;	_p pushBack  140;

_i pushBack  "MRAWS_HE_F"; 										_u pushBack  _uk_level_2;	_p pushBack  100;

_i pushBack  "CUP_MAAWS_HEDP_M"; 								_u pushBack  _uk_level_2;	_p pushBack  130;

_i pushBack  "CUP_MAAWS_HEAT_M"; 								_u pushBack  _uk_level_2;	_p pushBack  145;

_i pushBack  "CUP_NLAW_M";  									_u pushBack  _uk_level_2;	_p pushBack  130;//_______________________________UBM

_i pushBack  "cwr3_javelin_m"; 									_u pushBack  _uk_level_1;	_p pushBack  110;//_______________________________UBM

_i pushBack  "CUP_HandGrenade_L109A1_HE";  						_u pushBack  _uk_level_0;	_p pushBack  3;//_______________________________UBM

_i pushBack  "CUP_6Rnd_HE_M203";  								_u pushBack  _uk_level_2;	_p pushBack  12;

_i pushBack  "CUP_6Rnd_FlareWhite_M203";  						_u pushBack  _uk_level_2;	_p pushBack  12;

_i pushBack  "CUP_6Rnd_FlareGreen_M203";  						_u pushBack  _uk_level_2;	_p pushBack  12;

_i pushBack  "CUP_6Rnd_FlareRed_M203";  						_u pushBack  _uk_level_2;	_p pushBack  12;

_i pushBack  "CUP_6Rnd_FlareYellow_M203";  						_u pushBack  _uk_level_2;	_p pushBack  12;

_i pushBack  "CUP_6Rnd_Smoke_M203";  							_u pushBack  _uk_level_2;	_p pushBack  12;

_i pushBack  "CUP_6Rnd_SmokeRed_M203";  						_u pushBack  _uk_level_2;	_p pushBack  12;

_i pushBack  "CUP_6Rnd_SmokeGreen_M203";  						_u pushBack  _uk_level_2;	_p pushBack  12;

_i pushBack  "CUP_6Rnd_SmokeYellow_M203";  						_u pushBack  _uk_level_2;	_p pushBack  12;

_i pushBack  "CUP_13Rnd_9x19_Browning_HP";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_17Rnd_9x19_glock17";  						_u pushBack  _uk_level_2;	_p pushBack  2;//_______________________________UBM

_i pushBack  "CUP_20Rnd_46x30_MP7";  							_u pushBack  _uk_level_2;	_p pushBack  5;

_i pushBack  "CUP_40Rnd_46x30_MP7";  							_u pushBack  _uk_level_2;	_p pushBack  10;

_i pushBack  "CUP_40Rnd_46x30_MP7_Red_Tracer";  				_u pushBack  _uk_level_2;	_p pushBack  10;

_i pushBack  "cwr3_30rnd_sterling_m";  							_u pushBack  _uk_level_0;	_p pushBack  3;//_______________________________UBM

_i pushBack  "CUP_30Rnd_556x45_Stanag_L85";  					_u pushBack  _uk_level_2;	_p pushBack  9;//_______________________________UBM

_i pushBack  "150Rnd_556x45_Drum_Green_Mag_F";  				_u pushBack  _uk_level_3;	_p pushBack  43;

_i pushBack  "150Rnd_556x45_Drum_Green_Mag_Tracer_F";  			_u pushBack  _uk_level_3;	_p pushBack  43;

_i pushBack  "CUP_20Rnd_762x51_FNFAL_M";  						_u pushBack  _uk_level_0;	_p pushBack  7;//_______________________________UBM

_i pushBack  "CUP_20Rnd_762x51_FNFAL_Woodland_M"; 				_u pushBack  _uk_level_3;	_p pushBack  7;

_i pushBack  "CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_Woodland_M";_u pushBack  _uk_level_3;	_p pushBack  7;

_i pushBack  "CUP_30Rnd_762x51_FNFAL_M"; 						_u pushBack  _uk_level_3;	_p pushBack  11;

_i pushBack  "CUP_30Rnd_TE1_Red_Tracer_762x51_FNFAL_M"; 		_u pushBack  _uk_level_3;	_p pushBack  11;

_i pushBack  "cwr3_30rnd_762x51_bren_m";  						_u pushBack  _uk_level_0;	_p pushBack  10;//_______________________________UBM

_i pushBack  "CUP_20Rnd_762x51_L129_M";  						_u pushBack  _uk_level_2;	_p pushBack  8;//_______________________________UBM

_i pushBack  "CUP_5Rnd_86x70_L115A1";  							_u pushBack  _uk_level_2;	_p pushBack  5;//_______________________________UBM

_i pushBack  "CUP_5Rnd_127x99_as50_M"; 							_u pushBack  _uk_level_3;	_p pushBack  5;//_______________________________UBM

//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> BINOMENU <_8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__BINOMENU
//88____UK_____88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________




//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> CLOTHES <_888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__CLOTHES
//88____UK_____88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

//SUPER NV HELMET

_i pushBack  "FIR_JHMCS_Type2"; 								_u pushBack  _uk_level_4;	_p pushBack  300;
//_______________________________________________________________________________________________________________________________
//0//uniforms--------------------------
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_U_B_BAF_DDPM_GHILLIE"; 						_u pushBack  _uk_level_2;	_p pushBack  55;//_______________________________UBM

_i pushBack  "CUP_U_B_BAF_DPM_GHILLIE";  						_u pushBack  _uk_level_2;	_p pushBack  55;//_______________________________UBM


//_______________________________________________________________________________________________________________________________
//white&town camo
//_______________________________________________________________________________________________________________________________
_i pushBack  "CUP_U_B_BDUv2_Winter"; 							_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "cwr3_i_uniform_winter_gloves"; 					_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "U_B_CTRG_1"; 										_u pushBack  _uk_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//beige->green camo
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_U_I_RACS_PilotOverall"; 						_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_I_B_PARA_Unit_7"; 							_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_U_B_BAF_DDPM_UBACSLONG_Gloves"; 				_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_U_B_BAF_MTP_UBACSLONG_Gloves"; 				_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uk_uniform_olive";  						_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_uniform_pilot";  						_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_i_uniform_coverall_grey";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_uniform_dpm_weathered";  				_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_uniform_dpm_weathered_olive";  			_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_U_B_BAF_DPM_UBACSLONG";  						_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_U_B_BAF_DPM_UBACSROLLED";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_U_B_BAF_DPM_UBACSTSHIRTKNEE";  				_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_U_B_BAF_DPM_UBACSLONGKNEE";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_U_B_BAF_DPM_UBACSROLLEDKNEE";  				_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "cwr3_b_uk_uniform_dpm_gloves";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM3

//_______________________________________________________________________________________________________________________________
//---black
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_i_uniform_coverall_grey"; 					_u pushBack  _uk_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//0//vests----------------------
//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________
//---White $ TOWN
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_V_PMC_CIRAS_Winter_Empty";  					_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_PMC_CIRAS_Winter_Veh";  					_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_PMC_CIRAS_Winter_Grenadier";  				_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_PMC_CIRAS_Winter_Patrol";  					_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_PMC_CIRAS_Winter_TL";  						_u pushBack  _uk_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//---Desert
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_V_B_BAF_DDPM_Osprey_Mk3_Empty";  				_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_BAF_DDPM_Osprey_Mk3_Pilot";  				_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_BAF_DDPM_Osprey_Mk3_Crewman";  			_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_BAF_DDPM_Osprey_Mk3_AutomaticRifleman";  	_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_BAF_DDPM_Osprey_Mk3_Engineer";  			_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_BAF_DDPM_Osprey_Mk3_Grenadier";  			_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_BAF_DDPM_Osprey_Mk3_Medic";  				_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_BAF_DDPM_Osprey_Mk3_Rifleman";  			_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_BAF_DDPM_Osprey_Mk3_Scout";  				_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "V_PlateCarrierL_CTRG";  							_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "V_PlateCarrierH_CTRG";  							_u pushBack  _uk_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//---Green
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_V_B_BAF_MTP_Osprey_Mk4_Belt";  				_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_BAF_MTP_Osprey_Mk4_Webbing";  			_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_BAF_DPM_Osprey_Mk3_Empty";  				_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_BAF_DPM_Osprey_Mk3_Pilot";  				_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_BAF_DPM_Osprey_Mk3_Crewman";  			_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_BAF_DPM_Osprey_Mk3_Grenadier";  			_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_BAF_DPM_Osprey_Mk3_Engineer";  			_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_BAF_DPM_Osprey_Mk3_Medic";  				_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_BAF_DPM_Osprey_Mk3_Officer";  			_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_BAF_DPM_Osprey_Mk3_Rifleman";  			_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_BAF_DPM_Osprey_Mk3_Scout";  				_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_BAF_DPM_Osprey_Mk3_AutomaticRifleman";  	_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_BAF_MTP_Osprey_Mk4_Crewman";  			_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_BAF_MTP_Osprey_Mk4_Rifleman";  			_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_BAF_MTP_Osprey_Mk4_Medic";  				_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uk_vest_58webbing_belt";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_vest_pilot";  								_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_vest_58webbing";  						_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_vest_58webbing_medic";  				_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_vest_58webbing_sapper";  				_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_vest_58webbing_mg";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_vest_58webbing_officer";  				_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM1

//_______________________________________________________________________________________________________________________________
//---black
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_b_vest_pilot";  								_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_Interceptor_Base_Grey";  					_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_PMC_CIRAS_Black_Empty";  					_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_PMC_CIRAS_Black_Grenadier";  				_u pushBack  _uk_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//0//backpacks----------------------------
//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________
//---WHITE & TOWN
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_B_US_IIID_UCP"; 								_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "B_Carryall_oucamo"; 								_u pushBack  _uk_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//---BEIGE & DESERT
//_______________________________________________________________________________________________________________________________

_i pushBack  "B_Kitbag_tan"; 									_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "B_TacticalPack_ocamo"; 							_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_US_IIID_OCP"; 								_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_Bergen_BAF"; 								_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "B_Kitbag_cbr"; 									_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_US_IIID_OEFCP"; 							_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_Motherlode_MTP"; 							_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_Predator_MTP"; 								_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "B_TacticalPack_mcamo"; 							_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "B_Kitbag_mcamo"; 									_u pushBack  _uk_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//---Green
//_______________________________________________________________________________________________________________________________

_i pushBack  "B_Kitbag_sgg"; 									_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "B_Kitbag_rgr"; 									_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "B_TacticalPack_oli"; 								_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "B_TacticalPack_rgr"; 								_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_TacticalPack_TTS"; 							_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_TacticalPack_CCE"; 							_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uk_backpack";  							_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_backpack_medic_empty";  				_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_B_ACRPara_dpm"; 								_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_GER_Medic_Flecktarn"; 						_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "B_Carryall_oli"; 									_u pushBack  _uk_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//---BLACK
//_______________________________________________________________________________________________________________________________

_i pushBack  "B_TacticalPack_blk"; 								_u pushBack  _uk_level_0;	_p pushBack  1;


//_______________________________________________________________________________________________________________________________
//0//backpacks---prefilled-------------------------
//_______________________________________________________________________________________________________________________________


_i pushBack  "cwr3_b_uk_backpack_ammo";  						_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_backpack_medic";  						_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_backpack_engineer";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_backpack_l4a3";  						_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_backpack_l7a2"; 						_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_b_uk_backpack_carlgustaf";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_b_uk_backpack_javelin";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_b_uk_backpack_sapper";  						_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "CUP_B_Predator_RLAT_MTP";  						_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_B_Predator_Radio_MTP";  						_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_B_Motherlode_Radio_MTP";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_B_Motherlode_Medic_MTP";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_B_Motherlode_Engineer_MTP";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "cwr3_b_uk_backpack_specop";  						_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM3

_i pushBack  "CUP_B_Predator_AT_MTP";  							_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM3

//_______________________________________________________________________________________________________________________________
//0//helmets-----------------------------
//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________
//winter_TOWN
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_H_PASGTv2_winter";  							_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_PASGTv2_NVG_winter";  						_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_CDF_H_PASGT_SNW";  							_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_PASGTv2_NVG_Urban";  						_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_PASGTv2_Urban";  							_u pushBack  _uk_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//Desert
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_b_uk_headgear_mk5_helmet_net";  				_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uk_headgear_m76_olive";  					_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "H_Cap_khaki_specops_UK";  						_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uk_headgear_m76_olive_net";  				_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uk_headgear_mk5_helmet_scrim_burlap";  	_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uk_headgear_mk5_helmet_net_medic";  		_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_BAF_DDPM_Mk6_EMPTY";  						_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_BAF_DDPM_Mk6_NETTING_PRR";  				_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_BAF_MTP_Mk6_EMPTY";  						_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_BAF_MTP_Mk7_PRR_SCRIM_A";  					_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_BAF_MTP_Mk7_PRR_SCRIM_B";  					_u pushBack  _uk_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//GREEN
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_b_uk_headgear_mk5_helmet";  					_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uk_headgear_m76_dpm_camo";  				_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uk_headgear_parahelmet_camo";  			_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uk_headgear_mk5_helmet_scrim_burlap_camo";	_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_b_uk_headgear_mk5_helmet_dpm_net";  			_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uk_headgear_mk5_helmet_scrim_camo";  		_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_H_HIL_HelmetACH_TTS";  						_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_BAF_DPM_Mk6_EMPTY";  						_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_H_BAF_DPM_Mk6_CREW_PRR";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_H_BAF_DPM_Mk6_GLASS_PRR";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_H_BAF_DPM_Mk6_EMPTY_PRR";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_H_BAF_DPM_Mk6_NETTING_PRR";  					_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM2

//_______________________________________________________________________________________________________________________________
//black
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_b_uk_headgear_beret_headset_tank";  			_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uk_headgear_parahelmet_black";  			_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "FIR_HGU84P_Black";  								_u pushBack  _uk_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_Ger_M92_Black";  							_u pushBack  _uk_level_0;	_p pushBack  1;

//--------------------------

//_______________________________________________________________________________________________________________________________
//0//facewear-----------------------------
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_b_facewear_scrimnet_scarf_olive";  			_u pushBack  _uk_level_0;	_p pushBack  1;//_______________________________UBM1








//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________



//88__________888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> WEAPONS <_888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__WEAPONS
//88____US____888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________


_i pushBack  "CUP_smg_M3A1";  									_u pushBack  _us_level_0;	_p pushBack  12;//_______________________________UBM

_i pushBack  "CUP_sgun_M1014";  								_u pushBack  _us_level_0;	_p pushBack  22;//_______________________________UBM2

_i pushBack  "cwr3_arifle_xm177e2";  							_u pushBack  _us_level_0;	_p pushBack  23;//_______________________________UBM

_i pushBack  "cwr3_arifle_xms";  								_u pushBack  _us_level_1;	_p pushBack  25;//_______________________________UBM

_i pushBack  "CUP_arifle_M4A1";  								_u pushBack  _us_level_2;	_p pushBack  28;//_______________________________UBM

_i pushBack  "CUP_arifle_M4A1_Aim";  							_u pushBack  _us_level_2;	_p pushBack  28;//_______________________________UBM

_i pushBack  "CUP_arifle_M4A1_M203_ANPAS13c1_Laser";  			_u pushBack  _us_level_3;	_p pushBack  28;//_______________________________UBM

_i pushBack  "CUP_arifle_M4A1_Standard_Black_ACOG_Laser_snds";  _u pushBack  _us_level_3;	_p pushBack  28;//_______________________________UBM
//M16
_i pushBack  "CUP_arifle_M16A1E1";  							_u pushBack  _us_level_0;	_p pushBack  26;//_______________________________UBM

_i pushBack  "cwr3_arifle_m16a1e1_lsw";  						_u pushBack  _us_level_0;	_p pushBack  29;//_______________________________UBM

_i pushBack  "CUP_arifle_M16A1E1GL";  							_u pushBack  _us_level_1;	_p pushBack  31;//_______________________________UBM

_i pushBack  "CUP_arifle_M16A4_Aim_Laser";  					_u pushBack  _us_level_2;	_p pushBack  34;//_______________________________UBM

_i pushBack  "CUP_arifle_M16A4_GL_ACOG_Laser";  				_u pushBack  _us_level_2;	_p pushBack  34;//_______________________________UBM

_i pushBack  "CUP_arifle_M16A4_ACOG_Laser";  					_u pushBack  _us_level_2;	_p pushBack  34;//_______________________________UBM

_i pushBack  "CUP_lmg_M249_E1";  								_u pushBack  _us_level_1;	_p pushBack  35;//_______________________________UBM

_i pushBack  "CUP_lmg_M249"; 									_u pushBack  _us_level_2;	_p pushBack  38;//_______________________________UBM

_i pushBack  "CUP_lmg_m249_pip1";  								_u pushBack  _us_level_3;	_p pushBack  38;//_______________________________ABM

_i pushBack  "CUP_lmg_m249_pip4";  								_u pushBack  _us_level_3;	_p pushBack  40;//_______________________________ABM

_i pushBack  "CUP_lmg_M60";  									_u pushBack  _us_level_1;	_p pushBack  42;//_______________________________UBM

_i pushBack  "CUP_lmg_M240";  									_u pushBack  _us_level_2;	_p pushBack  49;//_______________________________UBM

_i pushBack  "CUP_lmg_M240_B";  								_u pushBack  _us_level_3;	_p pushBack  51;//_______________________________ABM

_i pushBack  "CUP_lmg_Mk48_des";  								_u pushBack  _us_level_3;	_p pushBack  60;//_______________________________ABM

_i pushBack  "CUP_srifle_M14";  								_u pushBack  _us_level_1;	_p pushBack  29;//_______________________________UBM

_i pushBack  "CUP_srifle_M21_artel";  							_u pushBack  _us_level_1;	_p pushBack  53;//_______________________________UBM

_i pushBack  "CUP_srifle_DMR_LeupoldMk4";  						_u pushBack  _us_level_2;	_p pushBack  73;//_______________________________UBM

_i pushBack  "CUP_arifle_Mk17_STD_FG";  						_u pushBack  _us_level_3;	_p pushBack  64;//_______________________________ABM

_i pushBack  "CUP_arifle_Mk20";  								_u pushBack  _us_level_3;	_p pushBack  68;//_______________________________ABM

_i pushBack  "CUP_arifle_mk18_m203_black";  					_u pushBack  _us_level_3;	_p pushBack  66;//_______________________________ABM

_i pushBack  "CUP_srifle_Mk18_blk";  							_u pushBack  _us_level_3;	_p pushBack  68;//_______________________________ABM

_i pushBack  "CUP_srifle_M110_Shortdot_bipod_snds";  			_u pushBack  _us_level_3;	_p pushBack  60;//_______________________________UBM

_i pushBack  "CUP_srifle_M110_ANPVS10";  						_u pushBack  _us_level_3;	_p pushBack  60;//_______________________________UBM

_i pushBack  "CUP_srifle_M110_ANPAS13c2";  						_u pushBack  _us_level_3;	_p pushBack  60;//_______________________________UBM

_i pushBack  "CUP_srifle_M40A3_bipod";  						_u pushBack  _us_level_2;	_p pushBack  52;//_______________________________UBM

_i pushBack  "CUP_srifle_M107_Base";  							_u pushBack  _us_level_3;	_p pushBack  144;//_______________________________ABM

_i pushBack  "CUP_srifle_M107_LeupoldVX3";  					_u pushBack  _us_level_3;	_p pushBack  144;//_______________________________UBM

_i pushBack  "cwr3_glaunch_mm1";  								_u pushBack  _us_level_1;	_p pushBack  70;//_______________________________UBM

//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> LAUNCHER <_8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__LAUNCHER
//88____US_____88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

/*listed in US/UK now for fix loadorder

*/

//88__________888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> PISTOLS <_888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__PISTOLS
//88____US____88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "CUP_hgun_M9";  									_u pushBack  _us_level_0;	_p pushBack  9;//_______________________________UBM

_i pushBack  "CUP_hgun_mk23_snds_lam";  						_u pushBack  _us_level_3;	_p pushBack  15;//_______________________________UBM

_i pushBack  "CUP_hgun_UZI";  									_u pushBack  _us_level_2;	_p pushBack  45;//_______________________________UBM

//88_________8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> SCOPES <_88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__SCOPES
//88____US___8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

//_______________________________________________________________________________________________________________________________
//NV SCOPE FOR SMAW
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_optic_Elcan_SpecterDR_black";  				_u pushBack  _us_level_2;	_p pushBack  24;

_i pushBack  "cwr3_optic_xms_cross";  							_u pushBack  _us_level_1;	_p pushBack  18;//_______________________________UBM

_i pushBack  "CUP_optic_CompM2_low";  							_u pushBack  _us_level_2;	_p pushBack  20;//_______________________________UBM

_i pushBack  "CUP_acc_ANPEQ_15_Black";  						_u pushBack  _us_level_2;	_p pushBack  12;//_______________________________UBM

_i pushBack  "CUP_acc_ANPEQ_15";  								_u pushBack  _us_level_3;	_p pushBack  12;//_______________________________ABM

_i pushBack  "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L";  			_u pushBack  _us_level_3;	_p pushBack  12;//_______________________________ABM

_i pushBack  "CUP_acc_ANPEQ_15_Black_Top";  					_u pushBack  _us_level_3;	_p pushBack  12;//_______________________________UBM

_i pushBack  "CUP_acc_ANPEQ_2_desert";  						_u pushBack  _us_level_3;	_p pushBack  13;//_______________________________ABM

_i pushBack  "CUP_acc_mk23_lam_l";  							_u pushBack  _us_level_3;	_p pushBack  11;//_______________________________UBM

_i pushBack  "CUP_acc_ANPEQ_2";  								_u pushBack  _us_level_3;	_p pushBack  13;//_______________________________UBM

//_______________________________________________________________________________________________________________________________
//---Bipods
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_bipod_VLTOR_Modpod";  						_u pushBack  _us_level_3;	_p pushBack  9;//_______________________________UBM

_i pushBack  "CUP_bipod_VLTOR_Modpod_black";  					_u pushBack  _us_level_3;	_p pushBack  9;//_______________________________UBM

//_______________________________________________________________________________________________________________________________
//---Scopes
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_optic_ACOG2";  								_u pushBack  _us_level_2;	_p pushBack  9;//_______________________________UBM

_i pushBack  "CUP_optic_ElcanM145";  							_u pushBack  _us_level_3;	_p pushBack  9;//_______________________________ABM

_i pushBack  "CUP_optic_LeupoldMk4";  							_u pushBack  _us_level_2;	_p pushBack  38;//_______________________________UBM

_i pushBack  "CUP_optic_SMAW_Scope";  							_u pushBack  _us_level_2;	_p pushBack  28;//_______________________________UBM

_i pushBack  "CUP_optic_artel_m14";  							_u pushBack  _us_level_1;	_p pushBack  68;//_______________________________UBM

_i pushBack  "CUP_optic_SB_11_4x20_PM";  						_u pushBack  _us_level_3;	_p pushBack  51;//_______________________________UBM

_i pushBack  "CUP_optic_LeupoldMk4_25x50_LRT";  				_u pushBack  _us_level_3;	_p pushBack  64;//_______________________________UBM

_i pushBack  "CUP_optic_AN_PVS_10";  							_u pushBack  _us_level_3;	_p pushBack  51;//_______________________________UBM

_i pushBack  "CUP_optic_AN_PAS_13c1";  							_u pushBack  _us_level_3;	_p pushBack  64;//_______________________________UBM

//_______________________________________________________________________________________________________________________________
//---Silencer
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_muzzle_snds_mk23";  							_u pushBack  _us_level_3;	_p pushBack  21;//_______________________________UBM

_i pushBack  "CUP_muzzle_snds_M110_black";  					_u pushBack  _us_level_3;	_p pushBack  41;//_______________________________UBM

_i pushBack  "CUP_muzzle_snds_M16";  							_u pushBack  _us_level_3;	_p pushBack  31;//_______________________________UBM

_i pushBack  "CUP_muzzle_snds_M14";  							_u pushBack  _us_level_3;	_p pushBack  39;

_i pushBack  "CUP_muzzle_snds_SCAR_H";  						_u pushBack  _us_level_3;	_p pushBack  37;//_______________________________ABM

_i pushBack  "CUP_muzzle_snds_UZI";  							_u pushBack  _us_level_3;	_p pushBack  30;

//88____________8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> MAGAZINES <_88888888888888888888888888888888888888888888888888888888888888888888888888888888888888__MAGAZINES
//88_____US_____8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "cwr3_m67_rcl_heat_m";  							_u pushBack  _us_level_1;	_p pushBack  135;//_______________________________UBM

_i pushBack  "CUP_SMAW_HEDP_M";  								_u pushBack  _us_level_2;	_p pushBack  175;//_______________________________UBM

_i pushBack  "CUP_SMAW_HEAA_M";  								_u pushBack  _us_level_2;	_p pushBack  215;//_______________________________UBM

_i pushBack  "CUP_SMAW_NE_M";  									_u pushBack  _us_level_2;	_p pushBack  105;

_i pushBack  "CUP_SMAW_Spotting";  								_u pushBack  _us_level_2;	_p pushBack  15;//_______________________________UBM

_i pushBack  "CUP_Dragon_EP1_M";  								_u pushBack  _us_level_1;	_p pushBack  375;//_______________________________UBM

_i pushBack  "cwr3_12rnd_mm1_m";  								_u pushBack  _us_level_1;	_p pushBack  70;//_______________________________UBM

_i pushBack  "CUP_HandGrenade_M67";  							_u pushBack  _us_level_0;	_p pushBack  5;//_______________________________UBM

_i pushBack  "CUP_15Rnd_9x19_M9";  								_u pushBack  _us_level_0;	_p pushBack  2;//_______________________________UBM

_i pushBack  "CUP_12Rnd_45ACP_mk23";  							_u pushBack  _us_level_3;	_p pushBack  2;//_______________________________UBM

//_______________________________________________________________________________________________________________________________
//---Caliber OTHER
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_30Rnd_45ACP_M3A1_M";  						_u pushBack  _us_level_0;	_p pushBack  4;//_______________________________UBM

_i pushBack  "CUP_72Rnd_9x19_UZI_M";  							_u pushBack  _us_level_2;	_p pushBack  3;

_i pushBack  "CUP_32Rnd_9x19_UZI_M";  							_u pushBack  _us_level_2;	_p pushBack  3;

//_______________________________________________________________________________________________________________________________
//---Caliber 5.56x45mm
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_60Rnd_556x45_SureFire";  						_u pushBack  _us_level_0;	_p pushBack  17;//_______________________________UBM

_i pushBack  "CUP_60Rnd_556x45_SureFire_Tracer_Red";  			_u pushBack  _us_level_0;	_p pushBack  17;

//_______________________________________________________________________________________________________________________________
//---Caliber 7.62x51mm
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_20Rnd_762x51_DMR";  							_u pushBack  _us_level_1;	_p pushBack  10;//_______________________________UBM

_i pushBack  "CUP_20Rnd_TE1_Red_Tracer_762x51_DMR";  			_u pushBack  _us_level_1;	_p pushBack  10;

_i pushBack  "CUP_20Rnd_762x51_B_M110";  						_u pushBack  _us_level_3;	_p pushBack  10;//_______________________________UBM

_i pushBack  "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR";  			_u pushBack  _us_level_3;	_p pushBack  10;//_______________________________ABM

_i pushBack  "CUP_50Rnd_762x51_B_SCAR";  						_u pushBack  _us_level_3;	_p pushBack  25;

_i pushBack  "CUP_50Rnd_TE1_Red_Tracer_762x51_SCAR";  			_u pushBack  _us_level_3;	_p pushBack  25;

_i pushBack  "CUP_10Rnd_127x99_M107";  							_u pushBack  _us_level_3;	_p pushBack  10;//_______________________________UBM

_i pushBack  "cwr3_redeye_m";  									_u pushBack  _us_level_1;	_p pushBack  100;//_______________________________UBM

//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> BINOMENU <_8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__BINOMENU
//88____US_____88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

_i pushBack  "CUP_NVG_PVS15_Hide";  							_u pushBack  _us_level_2;	_p pushBack  163;//_______________________________UBM

_i pushBack  "CUP_NVG_PVS14_Hide";  							_u pushBack  _us_level_3;	_p pushBack  129;//_______________________________UBM

//88___________88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________
//8_> CLOTHES <_888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888__CLOTHES
//88____US_____88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888___________

//_______________________________________________________________________________________________________________________________
//SUPER NV HELMET
//_______________________________________________________________________________________________________________________________

_i pushBack  "H_PilotHelmetFighter_B"; 							_u pushBack  _us_level_4;	_p pushBack  300;

//_______________________________________________________________________________________________________________________________
//0//uniforms--------------------------
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_U_B_CZ_DST_Ghillie";  						_u pushBack  _us_level_2;	_p pushBack  185;//_______________________________UBM

_i pushBack  "CUP_U_B_USArmy_Ghillie";  						_u pushBack  _us_level_3;	_p pushBack  55;//_______________________________UBM

_i pushBack  "CUP_U_B_USMC_Ghillie_WDL";  						_u pushBack  _us_level_2;	_p pushBack  55;//_______________________________UBM

//_______________________________________________________________________________________________________________________________
//white&town camo
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_b_uniform_winter"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_U_B_USArmy_ACU_Gloves_UCP"; 					_u pushBack  _us_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//beige->green camo
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_U_B_USMC_PilotOverall";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "cwr3_b_uniform_dcu"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uniform_desert_6color"; 					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_U_B_BDUv2_gloves_DCU_US"; 					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_U_B_BDUv2_gloves_desert_US"; 					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uniform_tanksuit";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uniform_m81_woodland";  					_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uniform_pilot_jet";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uniform_pilot";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_uniform_m81_woodland";  					_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_U_B_USMC_MCCUU_gloves";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_U_B_USMC_MCCUU_roll";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_U_B_USMC_MCCUU_roll_gloves";  				_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_U_CRYE_G3C_M81_US_V3";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM3

//_______________________________________________________________________________________________________________________________
//---black
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_b_uniform_black_gloves"; 					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_uniform_pilot_black";  					_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM3

//_______________________________________________________________________________________________________________________________
//0//vests----------------------
//_______________________________________________________________________________________________________________________________

//_______________________________________________________________________________________________________________________________
//---White $ TOWN
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_V_B_PASGT_no_bags_winter"; 					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "fir_usarmy_pilot_vest"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_IOTV_UCP_Empty_USArmy"; 					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_IOTV_UCP_Grenadier_USArmy"; 				_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_IOTV_UCP_MG_USArmy"; 						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_IOTV_UCP_Rifleman_Deltoid_USArmy"; 		_u pushBack  _us_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//---Desert
//_______________________________________________________________________________________________________________________________

_i pushBack  "V_HarnessO_gry";  								_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM3

_i pushBack  "CUP_V_B_PASGT_no_bags_desert"; 					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_vest_pasgt_6color_desert"; 				_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_vest_pasgt_alice_6color_desert"; 			_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_Interceptor_Grenadier_DCU"; 				_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_IOTV_OCP_Empty_USArmy"; 					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_IOTV_OCP_Grenadier_USArmy"; 				_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_IOTV_OCP_Rifleman_Deltoid_USArmy"; 		_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_IOTV_OEFCP_Empty_USArmy"; 				_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_IOTV_OEFCP_Grenadier_USArmy"; 			_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_IOTV_OEFCP_Rifleman_Deltoid_USArmy"; 		_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_Ciras_Coyote4"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_Ciras_Coyote_USSF"; 						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_vest_pasgt_alice_6color_desert_gl"; 		_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_MTV"; 									_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_MTV_MG"; 									_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_Armatus_BB_US_MCam"; 						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "V_PlateCarrierGL_mtp"; 							_u pushBack  _us_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//---Green
//_______________________________________________________________________________________________________________________________

_i pushBack  "V_BandollierB_oli";  								_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "cwr3_b_vest_alice_crew";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_V_B_Ciras_Khaki2"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_vest_lbv"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_vest_alice"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_vest_lbv_alice"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_vest_alice_gl"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_Delta_1"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_Interceptor_Rifleman"; 					_u pushBack  _us_level_0;	_p pushBack  1;
//-------------------------

_i pushBack  "CUP_V_B_RRV_Scout_CB";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM3

//_______________________________________________________________________________________________________________________________
//---with ARMOR
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_b_vest_pilot";  								_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_V_B_PilotVest";  								_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "cwr3_b_vest_pasgt_alice_od_crew";  				_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_vest_pasgt_alice_woodland_etool";  		_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_vest_pasgt_alice_woodland_light";  		_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_vest_pasgt_alice_woodland";  				_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_vest_pasgt_alice_woodland_officer";  		_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_b_vest_pasgt_alice_black";  					_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM3

_i pushBack  "cwr3_b_vest_pasgt_alice_woodland_ar";  			_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_vest_pasgt_alice_woodland_mg";  			_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_b_vest_pasgt_alice_woodland_mg";  			_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_b_vest_pasgt_alice_woodland_gl";  			_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "CUP_V_B_Eagle_SPC_Rifleman";  					_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_Eagle_SPC_Crew";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_Eagle_SPC_AT";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_Eagle_SPC_DMR";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_Eagle_SPC_Corpsman";  					_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_Eagle_SPC_TL";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_Eagle_SPC_SL";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_Eagle_SPC_Patrol";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_Eagle_SPC_AR";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_Eagle_SPC_MG";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_B_Eagle_SPC_GL";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_V_JPC_Fastbelt_coy";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM3


//-----------------
_i pushBack  "cwr3_b_vest_pasgt_woodland"; 						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_vest_pasgt_lbv_woodland"; 					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_Interceptor_Rifleman_M81"; 				_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_B_Interceptor_Grenadier_M81"; 				_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "V_PlateCarrier1_rgr"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "V_PlateCarrierGL_rgr"; 							_u pushBack  _us_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//---black
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_b_vest_pasgt_alice_black"; 					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_vest_tgfaust_alice_black"; 				_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_vest_tgfaust_black"; 						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_PMC_IOTV_Black_Empty"; 						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_PMC_IOTV_Black_AR"; 						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_V_PMC_IOTV_Black_Gren"; 						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "V_PlateCarrierSpec_blk"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "V_PlateCarrierGL_blk"; 							_u pushBack  _us_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//0//backpacks----------------------------
//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________
//---WHITE & TOWN
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_B_AssaultPack_ACU"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_MedicPack_ACU"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_US_Assault_UCP"; 							_u pushBack  _us_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//---BEIGE & DESERT
//_______________________________________________________________________________________________________________________________

_i pushBack  "B_Carryall_mcamo"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "B_AssaultPack_ocamo"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_AssaultPack_Coyote"; 						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_GER_Medic_Tropentarn"; 						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_US_Assault_OEFCP"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_AlicePack_Khaki"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_US_Assault_OCP"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "B_AssaultPack_cbr"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_USPack_Coyote"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_GER_Pack_Tropentarn"; 						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_AlicePack_Bedroll"; 						_u pushBack  _us_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//---Green
//_______________________________________________________________________________________________________________________________

_i pushBack  "B_AssaultPack_sgg"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "B_AssaultPack_khk"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "B_AssaultPack_Kerry"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "B_AssaultPack_rgr"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_USMC_AssaultPack"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_CivPack_WDL"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_Kombat_Olive"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_USMC_MOLLE_WDL"; 							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_USMC_MOLLE"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_GER_Pack_Flecktarn"; 						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_AlicePack_OD"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_backpack_alice";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_backpack_m5_medic_empty";  				_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

//_______________________________________________________________________________________________________________________________
//---BLACK
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_B_AssaultPack_Black"; 						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "B_AssaultPack_blk"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_B_USPack_Black"; 								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_backpack_alice_black"; 					_u pushBack  _us_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//------------------------prefilled Backpacks----------------------------------------

_i pushBack  "cwr3_b_backpack_alice_m16";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_backpack_m5_medic";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_backpack_alice_engineer";  				_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_backpack_alice_m249";  					_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_b_backpack_alice_m60";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_b_backpack_alice_hg";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_b_backpack_alice_m67";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_b_backpack_alice_carlgustaf";  				_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_b_backpack_alice_m47";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "cwr3_b_backpack_alice_sapper";  					_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "CUP_B_USMC_MOLLE_AR";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_B_USMC_MOLLE_MG";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_B_USMC_MOLLE_Exp";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_B_USMC_AssaultPack_SMAW";  					_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_B_USMC_AssaultPack_Medic";  					_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_B_FR_MOLLE_Sab";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM3

_i pushBack  "cwr3_b_backpack_alice_specop_black";  			_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM3

//_______________________________________________________________________________________________________________________________
//0//helmets-----------------------------
//_______________________________________________________________________________________________________________________________
//_______________________________________________________________________________________________________________________________
//winter_TOWN
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_H_US_patrol_cap_winter";  					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_pasgt_winter";  					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_pasgt_winter_goggles";  			_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_US_patrol_cap_UCP";  						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_US_patrol_cap_urban";  						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_USArmy_Boonie_UCP";  						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_USArmy_HelmetACH_UCP";  					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_USArmy_MICH_UCP";  							_u pushBack  _us_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//Desert
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_b_headgear_boonie_dcu";  					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_boonie_desert_6color";  			_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_cap_dcu";  						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_cap_desert_6color";  				_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "H_Cap_tan_specops_US";  							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_USMC_BOONIE_2_DES";  						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_m1_desert_6color";  				_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_pasgt_dcu";  						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_pasgt_desert_6color";  			_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_pasgt_m81_woodland_camonet";  	_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_pasgt_m81_woodland_net";  		_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_m1_cover_net";  					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_LWHv2_MARPAT_des_comms";  					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_HIL_HelmetACH_CCE";  						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_USArmy_HelmetACH_OEFCP";  					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "H_HelmetB_camo";  								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "H_HelmetB_sand";  								_u pushBack  _us_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//GREEN
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_H_LWHv2_MARPAT_comms_cov_fr";  				_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_H_LWHv2_MARPAT_cov_fr";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_H_LWHv2_OD_ess_comms";  						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_USArmy_Helmet_M1_m81";  					_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_boonie_m81_woodland_early";  		_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_boonie_m81_sf_woodland_early";  	_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_cap_m81_sf_woodland_early";  		_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_m1_olive";  						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_m1_erdl";  						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_m1_woodland_army_early";  		_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_pasgt_m81_woodland_early";  		_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_pasgt_m81_woodland";  			_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_headgear_boonie_m81_woodland";  			_u pushBack  _us_level_1;	_p pushBack  1;//_______________________________UBM

_i pushBack  "CUP_H_FR_BoonieMARPAT";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM3

_i pushBack  "cwr3_b_headgear_cap_m81_woodland";  				_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_headgear_cvc";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM

_i pushBack  "cwr3_b_headgear_pasgt_m81_woodland_goggles";  	_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM1

_i pushBack  "CUP_H_CVC";  										_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_H_LWHv2_MARPAT_NVG_gog_cov2";  				_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM2

_i pushBack  "CUP_H_OpsCore_Spray_US_SF";  						_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM3

_i pushBack  "CUP_H_USArmy_ECH_MARPAT";  						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_LWHv2_MARPAT_comms";  						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_LWHv2_OD_comms";  							_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "cwr3_b_headgear_pasgt_m81_woodland_scrim";  		_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_OpsCore_Spray_US";  						_u pushBack  _us_level_0;	_p pushBack  1;

//_______________________________________________________________________________________________________________________________
//black
//_______________________________________________________________________________________________________________________________

_i pushBack  "cwr3_b_headgear_protec_full_plain";  				_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "FIR_HGU56P_Skull_Death";  						_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "FIR_HGU56P_Skull";  								_u pushBack  _us_level_0;	_p pushBack  1;

_i pushBack  "CUP_H_OpsCore_Black";  							_u pushBack  _us_level_0;	_p pushBack  1;


//-----------------------------------------------------------

//_______________________________________________________________________________________________________________________________
//---Facewear
//_______________________________________________________________________________________________________________________________

_i pushBack  "CUP_G_White_Scarf_GPS";  							_u pushBack  _us_level_0;	_p pushBack  1;//_______________________________UBM3


//0//backpacks---STATICS & UAV-------------------------
//_______________________________________________________________________________________________________________________________


//mg










//_______________________________________________________________________________________________________________________________
//0//backpacks---STATICS & UAV-------------------------
//_______________________________________________________________________________________________________________________________


//mg

_i pushBack  "cwr3_backpack_l7a2_low"; 							_u pushBack  _uk_level_2;	_p pushBack  100;


_i pushBack  "CUP_B_L111A1_Gun_Bag"; 							_u pushBack  _uk_level_1;	_p pushBack  45;

_i pushBack  "CUP_B_L111A1_Tripod_Bag"; 						_u pushBack  _uk_level_1;	_p pushBack  5;

_i pushBack  "CUP_B_L111A1_MiniTripod_Bag"; 					_u pushBack  _uk_level_1;	_p pushBack  5;


_i pushBack  "cwr3_backpack_l111a1_high"; 							_u pushBack  _uk_level_2;	_p pushBack  195;


_i pushBack  "cwr3_backpack_l111a1_low"; 							_u pushBack  _uk_level_2;	_p pushBack  175;




_i pushBack  "CUP_B_M2_Gun_Bag"; 								_u pushBack  _us_level_1;	_p pushBack  45;

_i pushBack  "CUP_B_M2_Tripod_Bag"; 							_u pushBack  _us_level_1;	_p pushBack  5;

_i pushBack  "CUP_B_M2_MiniTripod_Bag"; 						_u pushBack  _us_level_1;	_p pushBack  5;


_i pushBack  "cwr3_backpack_m2_high"; 							_u pushBack  _us_level_1;	_p pushBack  145;

_i pushBack  "cwr3_backpack_m2_low"; 							_u pushBack  _us_level_1;	_p pushBack  120;


//he
_i pushBack  "CUP_B_L134A1_Gun_Bag"; 							_u pushBack  _uk_level_1;	_p pushBack  65;

_i pushBack  "CUP_B_L134A1_Tripod_Bag"; 						_u pushBack  _uk_level_1;	_p pushBack  5;




_i pushBack  "CUP_B_Mk19_Gun_Bag"; 								_u pushBack  _us_level_1;	_p pushBack  65;

_i pushBack  "CUP_B_Mk19_Tripod_Bag"; 							_u pushBack  _us_level_1;	_p pushBack  5;

_i pushBack  "cwr3_backpack_mk19"; 								_u pushBack  _us_level_2;	_p pushBack  235;


//AT

_i pushBack  "CUP_B_Tow_Gun_Bag"; 								_u pushBack  _blu_level_2;	_p pushBack  570;

_i pushBack  "CUP_B_TOW2_Tripod_Bag"; 							_u pushBack  _uk_level_2;	_p pushBack  5;

_i pushBack  "CUP_B_TOW_Tripod_Bag"; 							_u pushBack  _us_level_2;	_p pushBack  5;


_i pushBack  "cwr3_backpack_tow"; 								_u pushBack  _blu_level_4;	_p pushBack  975;


//Mortar

_i pushBack  "CUP_B_L16A2_Gun_Bag"; 							_u pushBack  _uk_level_2;	_p pushBack  570;

_i pushBack  "CUP_B_L16A2_Bipod_Bag"; 							_u pushBack  _uk_level_2;	_p pushBack  5;


_i pushBack  "CUP_B_M252_Gun_Bag"; 								_u pushBack  _us_level_2;	_p pushBack  570;

_i pushBack  "CUP_B_M252_Bipod_Bag"; 							_u pushBack  _us_level_2;	_p pushBack  5;


_i pushBack  "cwr3_backpack_m252"; 								_u pushBack  _us_level_4;	_p pushBack  1370;



//UAV

_i pushBack  "B_UAV_01_backpack_F"; 							_u pushBack  _blu_level_4;	_p pushBack  645;

[_faction, _i, _u, _p] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Config_Set.sqf";

//--- Templates (Those lines can be generated in the RPT on purchase by uncommenting the diag_log in Events_UI_GearMenu.sqf >> "onPurchase").
_t = [];

[_faction, _t] call compile preprocessFileLineNumbers "Common\Config\Gear\Gear_Template_Set.sqf"; 