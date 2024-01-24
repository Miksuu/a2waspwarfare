{ctrlEnable [_x, false]} forEach [11002, 11005, 11006, 11007, 11008];

_enable = false;
if ((barracksInRange || lightInRange || heavyInRange || aircraftInRange || hangarInRange || depotInRange) && (player == leader cti_Client_Team)) then {_enable = true};
ctrlEnable [11001,_enable];
ctrlEnable [11006,commandInRange && (player == leader cti_Client_Team)]; //--- Special Menu

WF_MenuAction = -1;
cti_ForceUpdate = true;

while {alive player && dialog} do {
	//if (side player != cti_Client_SideJoined) exitWith {closeDialog 0};
	if (!dialog) exitWith {};

	//--- Build Units.
	_enable = false;
	if ((barracksInRange || lightInRange || heavyInRange || aircraftInRange || hangarInRange || depotInRange) && (player == leader cti_Client_Team)) then {_enable = true};
	ctrlEnable [11001,_enable];
	ctrlEnable [11002,gearInRange];
	ctrlEnable [11011,gearInRange];

	_enable = false; //added-MrNiceGuy
	if (!isNull(commanderTeam)) then {if (commanderTeam == group player) then {_enable = true}};
	ctrlEnable [11005,_enable]; //--- Team Orders
	ctrlEnable [11008,_enable]; //--- Commander Menu
	ctrlEnable [11006,commandInRange && (player == leader cti_Client_Team)]; //--- Special Menu
	ctrlEnable [11007,commandInRange]; //--- Upgrade Menu

	//--- Uptime.
	_uptime = Call cti_CL_FNC_GetTime; //added-MrNiceGuy
	ctrlSetText [11015,Format[localize 'STR_WF_MAIN_Uptime',_uptime select 0,_uptime select 1,_uptime select 2, _uptime select 3]];

	//--- Buy Units.
	if (WF_MenuAction == 1) exitWith {
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_BuyUnits";
	};

	//--- Buy Gear.
	if (WF_MenuAction == 2) exitWith {
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "cti_BuyGearMenu";
	};

	//--- Team Menu.
	if (WF_MenuAction == 3) exitWith {
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_Team";
	};

	//--- Role Menu.UC Menu now
    if (WF_MenuAction == 14) exitWith {
	
        WF_MenuAction = -1;
        closeDialog 0;
        createDialog "CTI_UCRscUnitsCamera";
        /*
		waitUntil {sleep 0.1; !isNull (findDisplay 2800)};
        [] call WSW_fnc_updateRolesMenu;
        _selectedRole = WSW_gbl_boughtRoles select 0;
        if(isnil '_selectedRole')then{
            lbSetCurSel [2801, 0];
        };
		*/
    };

	//--- Voting Menu.
	if (WF_MenuAction == 4) exitWith {
		WF_MenuAction = -1;
		if(!isNull(commanderTeam))then{
			if(commanderTeam == group player)then{
				if((cti_Client_Logic getVariable "cti_votetime") <= 0)then{
					ctrlEnable [509101,true];
					closeDialog 0;
					createDialog "cti_Commander_VoteMenu";

				}else{
					ctrlEnable [509101,false];
				};
			}else{
				_skip = false;
				if ((cti_Client_Logic getVariable "cti_votetime") <= 0) then {_skip = true};
				if (!_skip) then {
					closeDialog 0;
					createDialog "cti_VoteMenu";
				};

				if !(_skip) exitWith {};
				[cti_Client_SideJoined, name player] remoteExecCall ["cti_SE_PVF_RequestCommanderVote",2];
				voted = true;
				waitUntil {(cti_Client_Logic getVariable "cti_votetime") > 0 || !dialog || !alive player};
				if (!alive player || !dialog) exitWith {};
				closeDialog 0;
				createDialog "cti_VoteMenu";
			};
		}else{
			_skip = false;
			if ((cti_Client_Logic getVariable "cti_votetime") <= 0) then {_skip = true};
			if (!_skip) then {
				closeDialog 0;
				createDialog "cti_VoteMenu";
			};

			if !(_skip) exitWith {};
			[cti_Client_SideJoined, name player] remoteExecCall ["cti_SE_PVF_RequestCommanderVote",2];
			voted = true;
			waitUntil {(cti_Client_Logic getVariable "cti_votetime") > 0 || !dialog || !alive player};
			if (!alive player || !dialog) exitWith {};
			closeDialog 0;
			createDialog "cti_VoteMenu";
		};
	};

	//--- Unflip Vehicle.
	if (WF_MenuAction == 10) then { //added-MrNiceGuy
		WF_MenuAction = -1;
		_vehicle = vehicle player;
		if (player != _vehicle) then {
			if (getPos _vehicle select 2 > 3 && !surfaceIsWater (getPos _x)) then {
				[_vehicle, getPos _vehicle, 15] Call cti_CO_FNC_PlaceSafe;
			} else {
				_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, 0.5];
				_vehicle setVelocity [0,0,-0.5];
			};
		};
		if (player == _vehicle) then {
			_objects = player nearEntities[["Car","Motorcycle","Tank"],10];
			if (count _objects > 0) then {
				{
					if (getPos _x select 2 > 3 && !surfaceIsWater (getPos _x)) then {
						[_x, getPos _x, 15] Call cti_CO_FNC_PlaceSafe;
					} else {
						_x setPos [getPos _x select 0, getPos _x select 1, 0.5];
						_x setVelocity [0,0,-0.5];
					};
				} forEach _objects;
			};
		};
	};

	//--- Headbug Fix. changed to hudpatchoption
	if (WF_MenuAction == 11) then { //added-MrNiceGuy#changed to hudpatchcode by 0=1
		
		WF_MenuAction = -1;
		closeDialog 0;
		/*
		titleCut["","BLACK FADED",0];
		_pos = position player;
		_vehi = "Lada1" createVehicle [0,0,0];
		player moveInCargo _vehi;
		deleteVehicle _vehi;
		player setPos _pos;
		titleCut["","BLACK IN",5];
		*/
		profilenamespace setvariable ['map_blufor_b',0.6]; 
profilenamespace setvariable ['map_independent_a',1.0]; 
profilenamespace setvariable ['map_unknown_presetdefault',"PresetA3"]; 
profilenamespace setvariable ['map_unknown_b',0.0];
profilenamespace setvariable ['igui_grid_stance_x',1.1738367]; 
profilenamespace setvariable ['igui_grid_vehicle_y',-0.08675383]; 
profilenamespace setvariable ['igui_grid_bar_y',0.9082354]; 
profilenamespace setvariable ['igui_grid_comm_x',-0.28267977]; 
profilenamespace setvariable ['igui_grid_gaugestability_x',0.6275]; 
profilenamespace setvariable ['igui_grid_mission_y',0.6682354]; 
profilenamespace setvariable ['gui_grid_center_x',-0.099999994]; 
profilenamespace setvariable ['rscdisplayconfigure_cursel',0.0];
profilenamespace setvariable ['igui_tactping_rgb_a',1.0]; 
profilenamespace setvariable ['map_blufor_r',0.0];
profilenamespace setvariable ['map_independent_b',0.0];
profilenamespace setvariable ['map_unknown_r',0.7];
profilenamespace setvariable ['subtitles_text_presetdefault',"White"]; 
profilenamespace setvariable ['igui_grid_stance_y',-0.087843135]; 
profilenamespace setvariable ['igui_grid_comm_y',0.24901968];
profilenamespace setvariable ['igui_grid_gaugestability_y',0.6202354];
profilenamespace setvariable ['igui_grid_custominforight_w',0.3]; 
profilenamespace setvariable ['igui_grid_custominforight_h',0.39999998];
profilenamespace setvariable ['gui_grid_center_y',0.0]; 
profilenamespace setvariable ['igui_bcg_rgb_g',0.2588]; 
profilenamespace setvariable ['igui_text_rgb_preset',"PresetA2"];
profilenamespace setvariable ['igui_tactping_rgb_b',0.2];
profilenamespace setvariable ['map_independent_presetdefault',"PresetA3"];
profilenamespace setvariable ['map_independent_r',0.0]; 
profilenamespace setvariable ['map_unknown_preset',"PresetA3"]; 
profilenamespace setvariable ['subtitles_text_g',1.0]; 
profilenamespace setvariable ['igui_grid_custominforight_x',-0.2839542];
profilenamespace setvariable ['iguipresetdefault',"Arma3"];
profilenamespace setvariable ['igui_warning_rgb_presetdefault',"PresetA3"];
profilenamespace setvariable ['igui_tactping_rgb_r',1.0];
profilenamespace setvariable ['map_blufor_presetdefault',"PresetA3"];
profilenamespace setvariable ['igui_grid_custominforight_y',0.078300744];
profilenamespace setvariable ['guipresetdefault',"Arma3"];
profilenamespace setvariable ['igui_grid_gaugealt_w',0.0];
profilenamespace setvariable ['igui_grid_gaugealt_h',0.0];
profilenamespace setvariable ['igui_tactping_rgb_presetdefault',"PresetA3"];
profilenamespace setvariable ['igui_tactping_rgb_preset',"PresetA2"];
profilenamespace setvariable ['map_blufor_preset',"PresetA3"];
profilenamespace setvariable ['igui_grid_gaugealt_x',0.14749998]; 
profilenamespace setvariable ['rscdisplaygameoptions_listtagscursel',0.0]; 
profilenamespace setvariable ['igui_grid_notification_w',0.0]; 
profilenamespace setvariable ['igui_grid_notification_h',0.0]; 
profilenamespace setvariable ['igui_grid_gaugecompass_w',0.0]; 
profilenamespace setvariable ['igui_grid_gaugecompass_h',0.0]; 
profilenamespace setvariable ['igui_warning_rgb_a',1.0];
profilenamespace setvariable ['igui_error_rgb_preset',"PresetA2"]; 
profilenamespace setvariable ['gui_bcg_rgb_a',0.8]; 
profilenamespace setvariable ['map_blufor_g',0.3];
profilenamespace setvariable ['map_civilian_presetdefault',"PresetA3"]; 
profilenamespace setvariable ['map_civilian_a',1.0]; 
profilenamespace setvariable ['map_unknown_g',0.6];
profilenamespace setvariable ['igui_grid_notification_x',0.32]; 
profilenamespace setvariable ['igui_grid_gaugealt_y',0.6202354]; 
profilenamespace setvariable ['igui_grid_gaugecompass_x',0.8675]; 
profilenamespace setvariable ['iguipreset',""];
profilenamespace setvariable ['igui_text_rgb_a',1.0];
profilenamespace setvariable ['igui_warning_rgb_b',0.0]; 
profilenamespace setvariable ['igui_error_rgb_a',1.0]; 
profilenamespace setvariable ['gui_bcg_rgb_b',0.08];
profilenamespace setvariable ['gui_titletext_rgb_presetdefault',"PresetRCgold"]; 
profilenamespace setvariable ['map_independent_g',0.5]; 
profilenamespace setvariable ['map_civilian_b',0.5];
profilenamespace setvariable ['igui_grid_notification_y',0.17176467]; 
profilenamespace setvariable ['igui_grid_gaugecompass_y',0.6202354]; 
profilenamespace setvariable ['igui_grid_gaugehorizon_w',0.0]; 
profilenamespace setvariable ['igui_grid_gaugehorizon_h',0.0];
profilenamespace setvariable ['igui_bcg_rgb_presetdefault',"PresetA3"]; 
profilenamespace setvariable ['igui_text_rgb_b',0.47];
profilenamespace setvariable ['igui_warning_rgb_r',0.863];
profilenamespace setvariable ['igui_error_rgb_presetdefault',"PresetA3"]; 
profilenamespace setvariable ['igui_error_rgb_b',0.0196]; 
profilenamespace setvariable ['igui_tactping_rgb_g',0.8]; 
profilenamespace setvariable ['gui_bcg_rgb_r',0.035628892]; 
profilenamespace setvariable ['gui_titletext_rgb_a',1.0];
profilenamespace setvariable ['map_opfor_presetdefault',"PresetA3"]; 
profilenamespace setvariable ['map_opfor_a',1.0];
profilenamespace setvariable ['map_civilian_r',0.4];
profilenamespace setvariable ['subtitles_background_preset',"White"]; 
profilenamespace setvariable ['subtitles_background_a',0.0];
profilenamespace setvariable ['igui_grid_gaugehorizon_x',0.38750002]; 
profilenamespace setvariable ['guipreset',""];
profilenamespace setvariable ['igui_grid_custominfoleft_w',0.3];
profilenamespace setvariable ['igui_grid_custominfoleft_h',0.39999998]; 
profilenamespace setvariable ['igui_text_rgb_presetdefault',"PresetA3"]; 
profilenamespace setvariable ['igui_text_rgb_r',0.6];
profilenamespace setvariable ['igui_error_rgb_r',0.706]; 
profilenamespace setvariable ['gui_titletext_rgb_b',0.0];
profilenamespace setvariable ['map_opfor_preset',"PresetA3"]; 
profilenamespace setvariable ['map_opfor_b',0.0];
profilenamespace setvariable ['subtitles_background_b',0.0];
profilenamespace setvariable ['igui_grid_gaugehorizon_y',0.6202354]; 
profilenamespace setvariable ['igui_grid_custominfoleft_x',0.9872224]; 
profilenamespace setvariable ['igui_grid_hint_w',0.0]; 
profilenamespace setvariable ['igui_grid_hint_h',0.0]; 
profilenamespace setvariable ['igui_grid_menu_w',0.135]; 
profilenamespace setvariable ['igui_grid_menu_h',0.432];
profilenamespace setvariable ['igui_grid_gaugespeed_w',0.0]; 
profilenamespace setvariable ['igui_grid_gaugespeed_h',0.0]; 
profilenamespace setvariable ['gui_titletext_rgb_r',0.0]; 
profilenamespace setvariable ['map_opfor_r',0.5];
profilenamespace setvariable ['subtitles_background_r',0.0]; 
profilenamespace setvariable ['igui_grid_hint_x',0.8943138]; 
profilenamespace setvariable ['igui_grid_menu_x',-0.28261447];
profilenamespace setvariable ['igui_grid_gaugespeed_x',-0.09250003];
profilenamespace setvariable ['igui_grid_custominfoleft_y',0.045621037];
profilenamespace setvariable ['igui_grid_weapon_w',0.3];
profilenamespace setvariable ['igui_grid_weapon_h',0.17999999];
profilenamespace setvariable ['igui_grid_stamina_w',0.3];
profilenamespace setvariable ['igui_grid_stamina_h',0.04];
profilenamespace setvariable ['subtitles_background_presetdefault',"White"];
profilenamespace setvariable ['subtitles_text_preset',"White"];
profilenamespace setvariable ['igui_grid_weapon_x',0.8741046];
profilenamespace setvariable ['igui_grid_stamina_x',0.333255];
profilenamespace setvariable ['igui_grid_hint_y',0.15176468];
profilenamespace setvariable ['igui_grid_menu_y',0.4897603];
profilenamespace setvariable ['igui_grid_gaugespeed_y',0.6202354];
profilenamespace setvariable ['gui_grid_w',1.2]; 
profilenamespace setvariable ['gui_grid_h',1.0];
profilenamespace setvariable ['igui_bcg_rgb_a',0.75];
profilenamespace setvariable ['igui_warning_rgb_g',0.584];
profilenamespace setvariable ['gui_bcg_rgb_preset',""];
profilenamespace setvariable ['gui_bcg_rgb_g',0.448111]; 
profilenamespace setvariable ['gui_titletext_rgb_preset',""];
profilenamespace setvariable ['map_civilian_g',0.0]; 
profilenamespace setvariable ['subtitles_text_a',1.0];
profilenamespace setvariable ['igui_grid_weapon_y',-0.087843165];
profilenamespace setvariable ['igui_grid_stamina_y',-0.092902005];
profilenamespace setvariable ['igui_grid_chat_w',0.6];
profilenamespace setvariable ['igui_grid_chat_h',0.19999999];
profilenamespace setvariable ['gui_grid_x',-0.28431377];
profilenamespace setvariable ['igui_bcg_rgb_b',0.149];
profilenamespace setvariable ['igui_text_rgb_g',0.84];
profilenamespace setvariable ['igui_error_rgb_g',0.0745]; 
profilenamespace setvariable ['gui_bcg_rgb_presetdefault',"PresetRCgold"];
profilenamespace setvariable ['subtitles_text_b',1.0];
profilenamespace setvariable ['igui_grid_chat_x',-0.047614455]; 
profilenamespace setvariable ['gui_grid_y',0.08823538]; 
profilenamespace setvariable ['igui_bcg_rgb_preset',"PresetA2"];
profilenamespace setvariable ['igui_bcg_rgb_r',0.1882]; 
profilenamespace setvariable ['gui_titletext_rgb_g',0.0];
profilenamespace setvariable ['map_opfor_g',0.0];
profilenamespace setvariable ['map_independent_preset',"PresetA3"];
profilenamespace setvariable ['subtitles_background_g',0.0];
profilenamespace setvariable ['subtitles_text_r',1.0];
profilenamespace setvariable ['igui_grid_chat_y',0.70854044];
profilenamespace setvariable ['igui_grid_vehicle_w',0.3];
profilenamespace setvariable ['igui_grid_vehicle_h',0.17999999]; 
	profilenamespace setvariable ['igui_grid_bar_w',0.0]; 
	profilenamespace setvariable ['igui_grid_bar_h',0.0];
	profilenamespace setvariable ['igui_grid_mission_w',0.0]; 
	profilenamespace setvariable ['igui_grid_mission_h',0.0];
	profilenamespace setvariable ['igui_warning_rgb_preset',"PresetA2"];
	profilenamespace setvariable ['map_blufor_a',1.0];
	profilenamespace setvariable ['map_civilian_preset',"PresetA3"]; 
	profilenamespace setvariable ['map_unknown_a',1.0];
	profilenamespace setvariable ['igui_grid_vehicle_x',-0.2840196]; 
	profilenamespace setvariable ['igui_grid_bar_x',-0.25431377]; 
	profilenamespace setvariable ['igui_grid_mission_x',0.6543138]; 
	profilenamespace setvariable ['gui_grid_center_w',1.2]; 
	profilenamespace setvariable ['gui_grid_center_h',1.0];
	profilenamespace setvariable ['igui_grid_stance_w',0.11100001];
	profilenamespace setvariable ['igui_grid_stance_h',0.148];
	profilenamespace setvariable ['igui_grid_comm_w',0.045];
	profilenamespace setvariable ['igui_grid_comm_h',0.59999996]; 
	profilenamespace setvariable ['igui_grid_gaugestability_w',0.0];
	profilenamespace setvariable ['igui_grid_gaugestability_h',0.0];
	_uiscale= getResolution;
	_uiscale=_uiscale#5;
	if (!((_uiscale) > 0.84)|| !((_uiscale) < 0.86))  then {
	//titleText ["PLEASE SET YOUR MENU SCALE ON BIG NOW AND JOIN AGAIN AFTER ARMA RESTART", "BLACK FADED", 20];
	titleText ["PLEASE SET YOUR MENU SCALE ON LARGE NOW AND JOIN AGAIN AFTER ARMA RESTART", "PLAIN", 20];
	["<img align = 'center' img size='18' image='RSC\Pictures\helppicture.paa' />",0,0,99999,5,0,9459] spawn bis_fnc_dynamicText;
	9459 cutText ["","PLAIN",0];
	
	
	sleep 20;
	failMission "END1";
		
	}else{
	titleText ["PLEASE RESTART ARMA NOW", "PLAIN", 20];
	sleep 10;
	failMission "END1";
	};	
		
		
		
	};

	//--- Display Parameters.
	if (WF_MenuAction == 12) exitWith { //added-MrNiceGuy
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "RscDisplay_Parameters";
	};

	//--- Command Menu.
	if (WF_MenuAction == 5) exitWith { //added-MrNiceGuy
		WF_MenuAction = -1;
		closeDialog 0;
		//createDialog "RscMenu_Command";
	};

	//--- Tactical Menu.
	if (WF_MenuAction == 6) exitWith { //added-MrNiceGuy
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_Tactical";
	};

	//--- Upgrade Menu.
	if (WF_MenuAction == 7) exitWith { //added-MrNiceGuy
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "cti_UpgradeMenu";
	};

	//--- Economy Menu.
	if (WF_MenuAction == 8) exitWith { //added-MrNiceGuy
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_Economy";
	};

	//--- Service Menu.
	if (WF_MenuAction == 9) exitWith { //added-MrNiceGuy
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_Service";
	};

	//--- Help Menu
	if (WF_MenuAction == 13) exitWith { //added-spayker
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_Help";
	};

	if (WF_MenuAction == 17) then {
		WF_MenuAction = -1;
	if ( zoomgps < 1 ) then { zoomgps = (zoomgps + 0.025); hint "zoom OUT";} else { zoomgps = 1; hint "GPS Zoom: \n MAX Value";};
	};
	if (WF_MenuAction == 18) then {
		WF_MenuAction = -1;
	if ( zoomgps >= 0.025) then { zoomgps = (zoomgps - 0.025); hint "zoom IN";} else { zoomgps = 0.025; hint "GPS Zoom: \n MIN Value";};
	};
	
	sleep 0.1;
};