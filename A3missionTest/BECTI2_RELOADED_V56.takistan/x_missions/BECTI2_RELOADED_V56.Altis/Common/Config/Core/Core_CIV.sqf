/* CIV Configuration */
Private ['_c','_get','_i','_p','_z'];

_c = [];
_i = [];
//_i ["Sonderezeichnung in Liste","Vermutlich Beschreibungstext",Preis,Buildtime,1für defense -1 für men -2 für vehicle,Upgradelevel,0=inf und defense |1-3=lf-af,Skill,Registerbezeichnung,?,optionale Camonummer]

_light_buildtime=25;

_c pushBack'cwr3_c_bicycle';
_i pushBack['','',50,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'C_Van_01_fuel_F';
_i pushBack['','',1550,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'C_Van_01_transport_F';
_i pushBack['','',550,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_TT650_TK_CIV';
_i pushBack['','',250,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_S1203_CIV';
_i pushBack['','',450,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_Ural_Civ_01';
_i pushBack['','',1050,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'C_Truck_02_transport_F';
_i pushBack['','',980,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_V3S_Open_TKC';
_i pushBack['','',850,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_Lada_GreenTK_CIV';
_i pushBack['','',130,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Golf4_green_Civ';
_i pushBack['','',2550,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Octavia_CIV';
_i pushBack['','',1350,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'C_Hatchback_01_F';
_i pushBack['','',3580,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Volha_Gray_TKCIV';
_i pushBack['','',200,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'C_Hatchback_01_sport_F';
_i pushBack['','',5750,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'C_SUV_01_F';
_i pushBack['','',4100,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Datsun_4seat';
_i pushBack['','',310,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Datsun';
_i pushBack['','',310,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'C_Quadbike_01_F';
_i pushBack['','',350,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_Pickup_unarmed_CIV';
_i pushBack['','',850,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'C_Offroad_01_F';
_i pushBack['','',2470,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_O_Hilux_unarmed_TK_CIV';
_i pushBack['','',780,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_Bus_City_TKCIV';
_i pushBack['','',900,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_Ikarus_TKC';
_i pushBack['','',1120,_light_buildtime,-2,0,1,0,'Civilians',[]];

_c pushBack'CUP_C_UAZ_Unarmed_TK_CIV';
_i pushBack['','',490,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_SUV_TK';
_i pushBack['','',5550,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'UK3CB_Civ_LandRover_Soft_Blue_A';
_i pushBack['','',2770,_light_buildtime,-2,0,1,0,'Civilians',[]];


_c pushBack'UK3CB_Civ_LandRover_Hard_Red_A';
_i pushBack['','',3050,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_LR_Transport_CTK';
_i pushBack['','',1550,_light_buildtime,-2,0,1,0,'Civilians',[]];
_c pushBack'CUP_C_UAZ_Open_TK_CIV';
_i pushBack['','',350,_light_buildtime,-2,0,1,0,'Civilians',[]];


_c pushBack'cwr3_c_ural_empty';
_i pushBack['','',350,_light_buildtime,-2,0,1,0,'Civilians',[]];



//ammo

_c = _c + ['CUP_BOX_TK_WpsSpecial_F'];
_i = _i + [[localize "STR_WF_ALL_CA1",'',7200,0,0,0,'Ammo',0,'whatever',[]]];

_c = _c + ['CUP_BOX_GB_WpsSpecial_F'];
_i = _i + [[localize "STR_WF_ALL_CA1",'',7200,0,0,0,'Ammo',0,'whatever',[]]];

_c = _c + ['CUP_BOX_US_ARMY_WpsSpecial_F'];
_i = _i + [[localize "STR_WF_ALL_CA1",'',7200,0,0,0,'Ammo',0,'whatever',[]]];


//BOTH SIDES SIMILAR

//forti

_c = _c + ['Fort_Nest'];	_i = _i + [[localize "STR_WF_ALL_CF1",'',115,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['TK_WarfareBBarrier10xTall_EP1'];	_i = _i + [[localize "STR_WF_ALL_CF2",'',275,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['TK_WarfareBBarrier5x_EP1'];	_i = _i + [[localize "STR_WF_ALL_CF3",'',175,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_HBarrier_large'];	_i = _i + [[localize "STR_WF_ALL_CF4",'',220,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_HBarrier5'];	_i = _i + [[localize "STR_WF_ALL_CF5",'',150,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_HBarrier3'];	_i = _i + [[localize "STR_WF_ALL_CF6",'',130,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_HBarrier1'];	_i = _i + [[localize "STR_WF_ALL_CF7",'',100,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['cwr3_bagfence_corner'];	_i = _i + [[localize "STR_WF_ALL_CF8",'',80,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['cwr3_bagfence'];	_i = _i + [[localize "STR_WF_ALL_CF9",'',50,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['pook_Land_fort_rampart_DES'];	_i = _i + [[localize "STR_WF_ALL_CF10",'',120,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_fort_artillery_nest_EP1'];	_i = _i + [[localize "STR_WF_ALL_CF11",'',235,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['pook_Land_fort_artillery_nest_DES'];	_i = _i + [[localize "STR_WF_ALL_CF12",'',255,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Hhedgehog_concreteBig'];	_i = _i + [[localize "STR_WF_ALL_CF13",'',435,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['land_cwr3_vez'];	_i = _i + [[localize "STR_WF_ALL_CF14",'',275,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['land_cwr3_lampa_sidl_3'];	_i = _i + [[localize "STR_WF_ALL_CF15",'',75,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Concrete_Wall_EP1'];	_i = _i + [[localize "STR_WF_ALL_CF16",'',95,0,1,0,'Fortification',0,'USA',[]]];


if ((missionNamespace getVariable "cti_C_BUNKER_SWITCH") == 1) then {
//BUNKER
_c = _c + ['Land_Target_Concrete_Support_01_F'];	
_i = _i + [[localize "STR_WF_ALL_CF17",'',1000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_01_blocks_1_F'];	
_i = _i + [[localize "STR_WF_ALL_CF18",'',1000,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_Bunker_01_blocks_3_F'];	
_i = _i + [[localize "STR_WF_ALL_CF19",'',2500,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_PillboxWall_01_3m_round_F'];	
_i = _i + [[localize "STR_WF_ALL_CF20",'',3000,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_CncBarrierMedium4_F'];	
_i = _i + [[localize "STR_WF_ALL_CF21",'',3200,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_PetroglyphWall_02_F'];	
_i = _i + [[localize "STR_WF_ALL_CF22",'',4150,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_i_Garage_V2_F'];	
_i = _i + [[localize "STR_WF_ALL_CF23",'',5000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_PillboxWall_01_6m_round_F'];	
_i = _i + [[localize "STR_WF_ALL_CF24",'',5300,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_CncWall4_F'];	
_i = _i + [[localize "STR_WF_ALL_CF25",'',6700,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Podesta_1_stairs4'];	
_i = _i + [[localize "STR_WF_ALL_CF26",'',7000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Platform_Stairs_30'];	
_i = _i + [[localize "STR_WF_ALL_CF27",'',7900,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Platform_Stairs_20'];	
_i = _i + [[localize "STR_WF_ALL_CF28",'',8200,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_ConcreteRamp'];	
_i = _i + [[localize "STR_WF_ALL_CF29",'',8950,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_ConcreteBlock'];	
_i = _i + [[localize "STR_WF_ALL_CF30",'',9000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Platform_Base'];	
_i = _i + [[localize "STR_WF_ALL_CF31",'',10750,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_BasaltWall_01_d_left_F'];	
_i = _i + [[localize "STR_WF_ALL_CF32",'',10800,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_BasaltWall_01_gate_F'];	
_i = _i + [[localize "STR_WF_ALL_CF33",'',12500,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_PillboxBunker_01_rectangle_F'];	
_i = _i + [[localize "STR_WF_ALL_CF34",'',15750,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_PillboxBunker_01_hex_F'];	
_i = _i + [[localize "STR_WF_ALL_CF35",'',17400,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_Bunker_02_light_right_F'];	
_i = _i + [[localize "STR_WF_ALL_CF36",'',20000,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_Bunker_02_right_F'];	
_i = _i + [[localize "STR_WF_ALL_CF37",'',20000,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_Bunker_02_light_double_F'];	
_i = _i + [[localize "STR_WF_ALL_CF38",'',22000,0,1,0,'Fortification',0,'Civilians',[]]];
_c = _c + ['Land_Bunker_02_light_left_F'];	
_i = _i + [[localize "STR_WF_ALL_CF39",'',20000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_02_left_F'];	
_i = _i + [[localize "STR_WF_ALL_CF40",'',20000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_02_double_F'];	
_i = _i + [[localize "STR_WF_ALL_CF41",'',22000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_01_small_F'];	
_i = _i + [[localize "STR_WF_ALL_CF42",'',25250,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Podesta_1_stairs2'];	
_i = _i + [[localize "STR_WF_ALL_CF43",'',28000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_01_big_F'];	
_i = _i + [[localize "STR_WF_ALL_CF44",'',33000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_01_HQ_F'];	
_i = _i + [[localize "STR_WF_ALL_CF45",'',35000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['land_cwr3_ammostore2'];	
_i = _i + [[localize "STR_WF_ALL_CF46",'',35750,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_PillboxBunker_01_big_F'];	
_i = _i + [[localize "STR_WF_ALL_CF47",'',37000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['Land_Bunker_01_tall_F'];	
_i = _i + [[localize "STR_WF_ALL_CF48",'',42000,0,1,0,'Fortification',0,'USA',[]]];
_c = _c + ['land_cwr3_garaz_bez_tanku'];	
_i = _i + [[localize "STR_WF_ALL_CF49",'',45000,0,1,0,'Fortification',0,'USA',[]]];
};


//for backpackstatic sell skill
_c = _c + ['cwr3_b_searchlight'];	_i = _i + [['','',20,0,1,0,'nowhere',0,'whatever',[]]];





//Strategic


_c = _c + ['Land_PedestrianCrossing_01_6m_6str_F'];	_i = _i + [[localize "STR_WF_ALL_CS1",'',200,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_HelipadSquare_F'];	_i = _i + [[localize "STR_WF_ALL_CS2",'',200,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_HelipadRescue_F'];	_i = _i + [[localize "STR_WF_ALL_CS3",'',200,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_HelipadCivil_F'];	_i = _i + [[localize "STR_WF_ALL_CS4",'',200,0,1,0,'Strategic',0,'USA',[]]];

_c = _c + ['TK_GUE_WarfareBVehicleServicePoint_Base_EP1'];	_i = _i + [[localize "STR_WF_ALL_CS5",'',5600,0,1,0,'Strategic',0,'USA',[]]];

//minefield scripted in construction_stationarydefense.sqf
_c = _c + ['Sign_Danger'];	_i = _i + [[localize "STR_WF_ALL_CS6",'',5000,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Sign_DangerMines_ACR'];	_i = _i + [[localize "STR_WF_ALL_CS7",'',3800,0,1,0,'Strategic',0,'USA',[]]];

_c = _c + ['land_cwr3_tent1_mash'];	_i = _i + [[localize "STR_WF_ALL_CS8",'',200,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_radar_EP1'];	_i = _i + [[localize "STR_WF_ALL_CS9",'',370,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['CamoNet_wdl_big_F'];	_i = _i + [[localize "STR_WF_ALL_CS10",'',175,0,1,0,'Strategic',0,'USA',[]]];
_c = _c + ['Land_IRMaskingCover_01_F'];	_i = _i + [[localize "STR_WF_ALL_CS11",'',375,0,1,0,'Strategic',0,'USA',[]]];



for '_z' from 0 to (count _c)-1 do {
	if (isClass (configFile >> 'CfgVehicles' >> (_c select _z))) then {
		_get = missionNamespace getVariable (_c select _z);
		if (isNil '_get') then {
			if ((_i select _z) select 0 == '') then {(_i select _z) set [0, [_c select _z,'displayName'] Call cti_CO_FNC_GetConfigInfo]};
			if (typeName ((_i select _z) select 4) == 'SCALAR') then {
				if (((_i select _z) select 4) == -2) then {
					_ret = (_c select _z) Call Compile preprocessFile "Common\Functions\Common_GetConfigVehicleCrewSlot.sqf";
					(_i select _z) set [4, _ret select 0];
					(_i select _z) set [9, _ret select 1];
				};
			};
			if (WF_Debug) then {(_i select _z) set [3,1]};
			_p = if ((_c select _z) isKindOf 'Man') then {'portrait'} else {'picture'};
			(_i select _z) set [1, [_c select _z,_p] Call cti_CO_FNC_GetConfigInfo];
			missionNamespace setVariable [_c select _z, _i select _z];
		};
	} else {
		diag_log Format ["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_CIV: Element '%1' is not a valid class.",(_c select _z),diag_frameno,diag_tickTime];
	};
};

diag_log Format ["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_CIV: Initialization (%1 Elements) - [Done]",count _c,diag_frameno,diag_tickTime];