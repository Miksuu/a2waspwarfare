_logic = _this select 3;
_startPos = _this select 4;
_source = _this select 5;



if !(alive _source) exitWith {};

//--- Area limits.
_root = "REPAIR";
_hq = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQ;
if (_source == _hq) then {_root = "HQ"};

_tooFar = false;
if ((missionNamespace getVariable "cti_C_BASE_AREA") > 0) then {
	if (_source == _hq) then {
		if (count(cti_Client_Logic getVariable "cti_basearea") >= (missionNamespace getVariable "cti_C_BASE_AREA")) then {
			_startpos = [_startPos,cti_Client_Logic getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity;
			if (_source distance _startpos > (missionNamespace getVariable "cti_C_BASE_HQ_BUILD_RANGE")) exitWith {_tooFar = true};
		};
	};
};

if (isNil 'cti_COIN_Root') then {cti_COIN_Root = ""};
if (cti_COIN_Root != _root) then {lastBuilt = []};
cti_COIN_Root = _root;

if (_tooFar) exitWith {hint  (localize 'STR_WF_INFO_BaseArea_Reached')};//--- Base area reached.

//--- Call in the construction interface.
112200 cutrsc ["cti_ConstructionInterface","plain"]; //---added-MrNiceGuy
uiNamespace setVariable ["COIN_displayMain",finddisplay 46];

//--- Terminate of system is already running
if !(isNil {player getVariable "bis_coin_logic"}) exitWith {};
player setVariable ["bis_coin_logic",_logic];
bis_coin_player = player;

//--- Convert the startpos to array if needed (base area).
if (typeName _startPos == "OBJECT") then {_startPos = getPos _startPos};

_camera = nil;
if (isNil "BIS_CONTROL_CAM") then {
	_camera = "camconstruct" camCreate [position player select 0,position player select 1,15];
	_camera cameraEffect ["internal","back"];
	_camera camPrepareFov 0.900;
	_camera camPrepareFocus [-1,-1];
	_camera camCommitPrepared 0;
	cameraEffectEnableHUD true;
	_camera setdir direction player;
	[_camera,-30,0] call BIS_fnc_setPitchBank;
	_camera camConstuctionSetParams ([_startPos] + (_logic getVariable "BIS_COIN_areasize"));
};
BIS_CONTROL_CAM = _camera;
BIS_CONTROL_CAM_LMB = false;
BIS_CONTROL_CAM_RMB = false;

//--- Prevent uikey override for other mods.
WF_COIN_DEH1 = (uiNamespace getVariable "COIN_displayMain") displayAddEventHandler ["KeyDown",		"if !(isNil 'BIS_CONTROL_CAM_Handler') then {BIS_temp = ['keydown',_this,commandingMenu] spawn BIS_CONTROL_CAM_Handler; BIS_temp = nil;}"];
WF_COIN_DEH2 = (uiNamespace getVariable "COIN_displayMain") displayAddEventHandler ["KeyUp",		"if !(isNil 'BIS_CONTROL_CAM_Handler') then {BIS_temp = ['keyup',_this] spawn BIS_CONTROL_CAM_Handler; BIS_temp = nil;}"];
WF_COIN_DEH3 = (uiNamespace getVariable "COIN_displayMain") displayAddEventHandler ["MouseButtonDown",	"if !(isNil 'BIS_CONTROL_CAM_Handler') then {BIS_temp = ['mousedown',_this,commandingMenu] spawn BIS_CONTROL_CAM_Handler; BIS_temp = nil; BIS_CONTROL_CAM_onMouseButtonDown = _this; if (_this select 1 == 1) then {BIS_CONTROL_CAM_RMB = true}; if (_this select 1 == 0) then {BIS_CONTROL_CAM_LMB = true};}"];
WF_COIN_DEH4 = (uiNamespace getVariable "COIN_displayMain") displayAddEventHandler ["MouseButtonUp",	"if !(isNil 'BIS_CONTROL_CAM_Handler') then {BIS_CONTROL_CAM_RMB = false; BIS_CONTROL_CAM_LMB = false;}"];

BIS_CONTROL_CAM_keys = [];

if (isNil "BIS_CONTROL_CAM_ASL") then {
	createCenter sideLogic;
	_logicGrp = createGroup sidelogic;
	_logicASL = _logicGrp createUnit ["Logic",position player,[],0,"none"];
	BIS_CONTROL_CAM_ASL = _logicASL;
};

_logic setVariable ["BIS_COIN_selected",objNull];
_logic setVariable ["BIS_COIN_params",[]];
_logic setVariable ["BIS_COIN_tooltip",""];
_logic setVariable ["BIS_COIN_menu","#USER:BIS_Coin_categories_0"];
_logic setVariable ["WF_RequestUpdate",false];
_get = _logic getVariable 'WF_NVGPersistent';
_nvgstate = true;
if (isNil '_get') then {
	_nvgstate = if (daytime > 18.5 || daytime < 5.5) then {true} else {false};
	_logic setVariable ['WF_NVGPersistent',_nvgstate];
} else {
	_nvgstate = _logic getVariable 'WF_NVGPersistent';
};
camUseNVG _nvgstate;
_logic setVariable ["BIS_COIN_nvg",_nvgstate];

_bns = missionNamespace getVariable Format["cti_%1STRUCTURENAMES",cti_Client_SideJoinedText];
_greenList = missionNamespace getVariable "COIN_UseHelper";
//--- Building Limit Init.
_buildingsNames = _bns;
_buildingsNames = _buildingsNames - [_buildingsNames select 0];
_buildingsType = missionNamespace getVariable Format["cti_%1STRUCTURES",cti_Client_SideJoinedText];
_buildingsType = _buildingsType - [_buildingsType select 0];

//--- Open menu
_logic spawn {
	_logic = _this;
	waitUntil {!isNil {_this getVariable "BIS_COIN_fundsOld"}};
	while {!isNil "BIS_CONTROL_CAM"} do {
		waitUntil {
			_params = _logic getVariable "BIS_COIN_params";
			if (isNil "_params") then {_params = []};
			(commandingMenu == "" && count _params == 0 && !BIS_CONTROL_CAM_RMB) || isNil "BIS_CONTROL_CAM"
		};
		if (isNil "BIS_CONTROL_CAM") exitWith {};
		showCommandingMenu "#USER:BIS_Coin_categories_0";
		sleep 0.01;
	};
};

//--- Border - temporary solution
_createBorder = {
	Private ["_logic","_startpos"];
	_logic = _this select 0;
	_startpos = _this select 1;
	_oldBorder = missionNamespace getVariable "BIS_COIN_border";
	if (!isNil "_oldBorder") then {
		{deleteVehicle _x} forEach _oldBorder;
	};
	missionNamespace setVariable ["BIS_COIN_border",nil];

	_border = [];
	_center = _startpos;
	_size = (_logic getVariable "BIS_COIN_areasize") select 0;
	_width = 9.998;
	_width = 9.996;
	_width = 9.992;
	_width = 9.967;
	_width = 9.917;
	_width = 9.83;
	_width = 9.48;
	_width = 10 - (0.1/(_size * 0.2));
	_width = 10;

	_pi = 3.14159265358979323846;
	_perimeter = (_size * _pi);
	_perimeter = _perimeter + _width - (_perimeter % _width);
	_size = (_perimeter / _pi);
	_wallcount = _perimeter / _width * 2;
	_total = _wallcount;

	for "_i" from 1 to _total do {
		_dir = (360 / _total) * _i;
		_xpos = (_center select 0) + (sin _dir * _size);
		_ypos = (_center select 1) + (cos _dir * _size);
		_zpos = (_center select 2);

		_a = "transparentwall" createVehicleLocal [_xpos,_ypos,_zpos];
		_a setposasl [_xpos,_ypos,0];
		_a setdir (_dir + 90);
		_border pushBack _a;
	};
	missionNamespace setVariable ["BIS_COIN_border",_border];
};
//--- end of border init function

_createBorderScope = [_logic,_startpos] spawn _createBorder;

//--- This block is pretty important
if !(isNil "BIS_CONTROL_CAM_Handler") exitWith {endLoadingScreen};

//--- init of camera control handler
BIS_CONTROL_CAM_Handler = {
	_mode = _this select 0;
	_input = _this select 1;
	_logic = bis_coin_player getVariable "bis_coin_logic";
	
	_terminate = false;

  	if (isNil "_logic") exitWith {};

	_areasize = (_logic getVariable "BIS_COIN_areasize");
	_limitH = _areasize select 0;
	_limitV = _areasize select 1;

	_keysCancel	= actionKeys "ingamePause";

	_keysBanned	= [1];
	_keyNightVision		= actionKeys "NightVision";
	_keyAutoWallConstructing = actionKeys "Salute";

	//--- Mouse DOWN
	if (_mode == "mousedown") then {
		_key = _input select 1;
		if (_key == 1) then {_terminate = true};
	};

	//--- Key DOWN
	if (_mode == "keydown") then {

		_key = _input select 1;
		_ctrl = _input select 3;
		if !(_key in (BIS_CONTROL_CAM_keys + _keysBanned)) then {BIS_CONTROL_CAM_keys = BIS_CONTROL_CAM_keys + [_key]};

		//--- Terminate CoIn
		if (_key in _keysCancel && isNil "BIS_Coin_noExit") then {_terminate = true};

		//--- Start NVG
		if (_key in _keyNightVision) then {
			_NVGstate = !(_logic getVariable "BIS_COIN_nvg");
			_logic setVariable ["BIS_COIN_nvg",_NVGstate];
			_logic setVariable ['WF_NVGPersistent',_NVGstate];
			camUseNVG _NVGstate;
		};

		if(_key in _keyAutoWallConstructing)then{
			_isAutoWallConstructingEnabled = isAutoWallConstructingEnabled;
			_text = "";
			if(_isAutoWallConstructingEnabled)then{
				_isAutoWallConstructingEnabled = false;
				_text = "disabled";
			}else{
				_isAutoWallConstructingEnabled = true;
				_text = "enabled";
			};
			(format ["Auto Wall Construction is: %1", _text]) Call cti_CL_FNC_GroupChatMessage;
			[_isAutoWallConstructingEnabled, player] remoteExecCall ["cti_SE_PVF_RequestAutoWallConstructinChange",2];
		};

		//--- Last Built Defense (Custom Action #1).
		if ((_key in (actionKeys "BuldTurbo")) && count lastBuilt > 0) then {
			_deployed = true;
			if (cti_COIN_Root == "HQ") then {_deployed = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQDeployStatus};
			_currentCash = Call cti_CL_FNC_GetPlayerFunds;
			if (_currentCash > (lastBuilt select 2) select 1 && _deployed) then {
				showCommandingMenu '';
				_logic setVariable ["BIS_COIN_params",lastBuilt];
			};
		};

		//--- Manning Defense (Custom Action #2).
		if (_key in (actionKeys "BuldSwitchCamera")) then {
			if (manningDefense) then {manningDefense = false} else {manningDefense = true};
			_status = if (manningDefense) then {localize "STR_WF_On"} else {localize "STR_WF_Off"};
			_logic setVariable ["WF_RequestUpdate",true];
		};



		//--- Sell Defense. (Commander only) (Custom Action #3).
		if (_key in (actionKeys "CuratorDelete")  && !isNull(commanderTeam)) then {
			if(commanderTeam == cti_Client_Team) then {
				_preview = _logic getVariable "BIS_COIN_preview";
				if (isNil "_preview") then {//--- Proceed when there is no preview.
					_targeting = screenToWorld [0.5,0.5];
					_defense_list = missionNamespace getVariable Format["cti_%1DEFENSENAMES",cti_Client_SideJoinedText];
					
					_near = nearestObjects [_targeting,_defense_list,12];
					if (count _near > 0) then {

						_closest = _near select 0;
						_sold = _closest getVariable 'sold';
						_closestType = typeOf (_closest);
						_get = missionNamespace getVariable _closestType;
                      if ((player distance _closest) > ((_logic getVariable "BIS_COIN_areasize") select 0) || (_closest getVariable 'side') != cti_Client_SideJoined) exitWith {};
						if (!isNil '_get' && isNil '_sold') then {
							_closest setVariable ['sold',true];
							_price = _get select QUERYUNITPRICE;
							round(_price/2.5) Call cti_CL_FNC_ChangePlayerFunds;
							_area = [getPos (_closest),((cti_Client_SideJoined) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity2;
							_get = _area getVariable 'avail';

							if (!isNull _area && _get < missionNamespace getVariable "cti_C_BASE_AV_STRUCTURES") then {
							_commanderTeam =(cti_Client_SideJoined) Call cti_CO_FNC_GetCommanderTeam;
							_area setVariable [ "avail" ,_get +1];
							hintSilent parseText format ["Available Items : " +"<t color='#00FF00'>"+" %1"+"</t>", _area getVariable 'avail'];
							['Available', _area getVariable 'avail'] remoteExecCall ["cti_CL_FNC_HandleSpecial", leader commanderTeam];
							}
							
							;
							deleteVehicle _closest;
						};
					};
				};
			};
		};
	};
	//--- Key UP
	if (_mode == "keyup") then {
		_key = _input select 1;
		if (_key in BIS_CONTROL_CAM_keys) then {BIS_CONTROL_CAM_keys = BIS_CONTROL_CAM_keys - [_key]};
	};

	//--- Deselect or Close
	if (_terminate) then {
		_menu = _this select 2;

		//--- Close
		if (isNil "BIS_Coin_noExit") then {
			if (_menu == "#USER:BIS_Coin_categories_0") then {
				BIS_CONTROL_CAM cameraEffect ["terminate","back"];
				camDestroy BIS_CONTROL_CAM;
				BIS_CONTROL_CAM = nil;
			} else {
				_preview = _logic getVariable "BIS_COIN_preview";
				if !(isNil "_preview") then {deleteVehicle _preview};
				_logic setVariable ["BIS_COIN_preview",nil];
				_logic setVariable ["BIS_COIN_params",[]];
				_get = _logic getVariable 'cti_Helper';
				if !(isNil '_get') then {
					deleteVehicle _get;
					_logic setVariable ['cti_Helper',nil];
				};
			};
		};
	};

	//--- Camera no longer exists - terminate and start cleanup
	if (isNil "BIS_CONTROL_CAM" || player != bis_coin_player || !isNil "BIS_COIN_QUIT") exitWith {
		if !(isNil "BIS_CONTROL_CAM") then {BIS_CONTROL_CAM cameraEffect ["terminate","back"];camDestroy BIS_CONTROL_CAM;};
		BIS_CONTROL_CAM = nil;
		BIS_CONTROL_CAM_Handler = nil;
		1122 cuttext ["","plain"];
		_player = bis_coin_player;
		_player setVariable ["bis_coin_logic",nil];
		bis_coin_player = objNull;
		_preview = _logic getVariable "BIS_COIN_preview";
		if !(isNil "_preview") then {deleteVehicle _preview};
		_logic setVariable ["BIS_COIN_preview",nil];
		_get = _logic getVariable 'cti_Helper';
		if !(isNil '_get') then {
			deleteVehicle _get;
			_logic setVariable ['cti_Helper',nil];
		};
		_logic setVariable ["BIS_COIN_selected",nil];
		_logic setVariable ["BIS_COIN_params",nil];
		_logic setVariable ["BIS_COIN_lastdir",nil];
		_logic setVariable ["BIS_COIN_tooltip",nil];
		_logic setVariable ["BIS_COIN_fundsOld",nil];
		_logic setVariable ["BIS_COIN_nvg",nil];
		_logic setVariable ["WF_RequestUpdate",nil];
		showCommandingMenu "";
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["KeyDown",WF_COIN_DEH1];
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["KeyUp",WF_COIN_DEH2];
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonDown",WF_COIN_DEH3];
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonUp",WF_COIN_DEH4];

		//--- Behold the placeholders
		BIS_COIN_QUIT = nil;
		_border = missionNamespace getVariable "BIS_COIN_border";
		{deleteVehicle _x} forEach _border;
		missionNamespace setVariable ["BIS_COIN_border",nil];
	};
};
//--- end of init of camera control handler

waitUntil {scriptDone _createBorderScope};
endLoadingScreen;


///*** LOOOP ****
_canAffordCount = 0;
_canAffordCountOld = 0;

_oldMenu = commandingMenu;

_limitHOld = -1;
_limitVOld = -1;
_loaded = false;
_localtime = time;
_logic = bis_coin_player getVariable "bis_coin_logic";
_colorGreen = "#(argb,8,8,3)color(0,1,0,0.3,ca)";
_colorRed = "#(argb,8,8,3)color(1,0,0,0.3,ca)";
_colorGray = "#(argb,8,8,3)color(0,0,0,0.25,ca)";

_z_value=0;

while {!isNil "BIS_CONTROL_CAM"} do {

	if (isnull (uiNamespace getVariable 'cti_title_coin') && !_loaded) then { //---TEST MrNiceGuy
		cameraEffectEnableHUD true;
		1122 cutrsc ["constructioninterface","plain"];
		_loaded = true;
		_localtime = time;
	};

	if ((time - _localtime) >= 1 && _loaded) then {_loaded = false};
	_mode = "mousemoving";
	_camera = BIS_CONTROL_CAM;

	//--- Player dies on construction mode or the source die.
	if (!alive player || !alive _source) exitWith {
		startLoadingScreen [localize "str_coin_exit" + " " + localize "str_coin_name","RscDisplayLoadMission"];

		if !(isNil "BIS_CONTROL_CAM") then {BIS_CONTROL_CAM cameraEffect ["terminate","back"];camDestroy BIS_CONTROL_CAM;};
		BIS_CONTROL_CAM = nil;
		BIS_CONTROL_CAM_Handler = nil;
		1122 cuttext ["","plain"];
		_player = bis_coin_player;
		_player setVariable ["bis_coin_logic",nil];
		bis_coin_player = objNull;
		_preview = _logic getVariable "BIS_COIN_preview";
		if !(isNil "_preview") then {deleteVehicle _preview};
		_logic setVariable ["BIS_COIN_preview",nil];
		_get = _logic getVariable 'cti_Helper';
		if !(isNil '_get') then {
			deleteVehicle _get;
			_logic setVariable ['cti_Helper',nil];
		};
		_logic setVariable ["BIS_COIN_selected",nil];
		_logic setVariable ["BIS_COIN_params",nil];
		_logic setVariable ["BIS_COIN_lastdir",nil];
		_logic setVariable ["BIS_COIN_tooltip",nil];
		_logic setVariable ["BIS_COIN_fundsOld",nil];
		_logic setVariable ["BIS_COIN_nvg",nil];
		_logic setVariable ["WF_RequestUpdate",nil];
		showCommandingMenu "";

		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["KeyDown",WF_COIN_DEH1];
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["KeyUp",WF_COIN_DEH2];
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonDown",WF_COIN_DEH3];
		(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonUp",WF_COIN_DEH4];

		//--- Behold the placeholders
		BIS_COIN_QUIT = nil;
		WF_COIN_DEH1 = nil;
		WF_COIN_DEH2 = nil;
		WF_COIN_DEH3 = nil;
		WF_COIN_DEH4 = nil;
		_border = missionNamespace getVariable "BIS_COIN_border";
		{deleteVehicle _x} forEach _border;
		missionNamespace setVariable ["BIS_COIN_border",nil];
		endLoadingScreen;
	};

	_areasize = (_logic getVariable "BIS_COIN_areasize");
	_limitH = _areasize select 0;
	_limitV = _areasize select 1;
	_limitHOld = _limitH;
	_limitVOld = _limitV;

	_keysCancel		= actionKeys "ingamePause";
	_keysBanned		= [1];

	//--- Mouse moving or holding
	if (_mode == "mousemoving" || _mode == "mouseholding") then {
		//--- Check pressed keys
		_keys = BIS_CONTROL_CAM_keys;
		_ctrl = (29 in _keys) || (157 in _keys);
		_shift = (42 in _keys) || (54 in _keys);
		_alt = (56 in _keys);

		//--- Construction or Selection
		_params = _logic getVariable "BIS_COIN_params";
		_tooltip = "empty";
		_tooltipType = "empty";
		_selected = objNull;
		if (count _params > 0) then {
			//--- Basic colors
			_color = _colorGreen;

			//--- Class, Category, Cost, (preview class), (display name)
			_itemclass = _params select 0;
			_itemcategory = _params select 1;
			_itemcost = _params select 2;
			_itemcash = 0;
			if (typename _itemcost == "ARRAY") then {_itemcash = _itemcost select 0; _itemcost = _itemcost select 1};
			_funds = _logic getVariable "BIS_COIN_funds";
			if (typename _funds == "ARRAY") then {
				_a = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideSupply;
				_b = Call cti_CL_FNC_GetPlayerFunds;
				_funds = [_a]+[_b];
			} else {
				_funds = [Call cti_CL_FNC_GetPlayerFunds];
			};
			_itemFunds = _funds select _itemcash;
			_itemname = if (count _params > 3) then {_params select 3} else {getText (configFile >> "CfgVehicles" >> _itemclass >> "displayName")};
			_itemclass_preview = getText (configFile >> "CfgVehicles" >> _itemclass >> "ghostpreview");
			if (_itemclass_preview == "") then {_itemclass_preview = _itemclass};
			
			
			
			if (_itemclass isKindOf "StaticWeapon") then { _itemclass_preview = "M2StaticMGPreview"; };

			//--- Preview building
			
			/*
			if (isNil {_logic getVariable "BIS_COIN_preview"}) then 
			{_preview = camtarget BIS_CONTROL_CAM;
			}else{
			_preview = _logic getVariable "BIS_COIN_preview";
			};
			*/
			
			
				//Preview setPosASL (Ins select 0 select 0);
				//Preview setVectorUp (Ins select 0 select 1);
			
			
			_preview = camtarget BIS_CONTROL_CAM;
			
			Preview setPosASL (Ins select 0 select 0);
			Preview setVectorUp (Ins select 0 select 1);
			
			_new = false;
			if (typeof _preview != _itemclass_preview) then {
				//--- No preview
				deleteVehicle _preview;
				if !(isNil {_logic getVariable "BIS_COIN_preview"}) then {deleteVehicle (_logic getVariable "BIS_COIN_preview")}; //--- Serialization hack
				_get = _logic getVariable 'cti_Helper';
				if !(isNil '_get') then {
					deleteVehicle _get;
					_logic setVariable ['cti_Helper',nil];
				};
				_hqDeployed = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQDeployStatus;
				_index = _bns find _itemclass;
				if (_index == 0 && _hqDeployed) exitWith {
					_mhq = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQ;
					(_mhq) Spawn cti_CL_FNC_HandleHQAction;
					[cti_Client_SideJoined,_itemclass,[0,0,0],0] remoteExecCall ["cti_SE_PVF_RequestStructure",2];

					[missionNamespace getVariable "cti_C_BASE_COIN_AREA_HQ_UNDEPLOYED",false,MCoin] Call cti_CL_FNC_Init_Coin;

					_structuresCosts = missionNamespace getVariable Format["cti_%1STRUCTURECOSTS",cti_Client_SideJoinedText];
					[cti_Client_SideJoined,-(_structuresCosts select _index)] Call cti_CO_FNC_ChangeSideSupply;

					startLoadingScreen [localize "str_coin_exit" + " " + localize "str_coin_name","RscDisplayLoadMission"];

					if !(isNil "BIS_CONTROL_CAM") then {BIS_CONTROL_CAM cameraEffect ["terminate","back"];camDestroy BIS_CONTROL_CAM;};
					BIS_CONTROL_CAM = nil;
					BIS_CONTROL_CAM_Handler = nil;
					1122 cuttext ["","plain"];
					_player = bis_coin_player;
					_player setVariable ["bis_coin_logic",nil];
					bis_coin_player = objNull;
					_preview = _logic getVariable "BIS_COIN_preview";					
					if !(isNil "_preview") then {deleteVehicle _preview};
					_logic setVariable ["BIS_COIN_preview",nil];
					_logic setVariable ["BIS_COIN_selected",nil];
					_logic setVariable ["BIS_COIN_params",nil];
					_logic setVariable ["BIS_COIN_lastdir",nil];
					_logic setVariable ["BIS_COIN_tooltip",nil];
					_logic setVariable ["BIS_COIN_fundsOld",nil];
					_logic setVariable ["BIS_COIN_nvg",nil];
					_logic setVariable ["WF_RequestUpdate",nil];
					showCommandingMenu "";

					(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["KeyDown",WF_COIN_DEH1];
					(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["KeyUp",WF_COIN_DEH2];
					(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonDown",WF_COIN_DEH2];
					(uiNamespace getVariable "COIN_displayMain") displayRemoveEventHandler ["MouseButtonUp",WF_COIN_DEH3];

					//--- Behold the placeholders
					BIS_COIN_QUIT = nil;
					WF_COIN_DEH1 = nil;
					WF_COIN_DEH2 = nil;
					WF_COIN_DEH3 = nil;
					WF_COIN_DEH4 = nil;
					_border = missionNamespace getVariable "BIS_COIN_border";
					{deleteVehicle _x} forEach _border;
					missionNamespace setVariable ["BIS_COIN_border",nil];
					endLoadingScreen;
				};

				//_preview = _itemclass_preview createVehicleLocal (screenToWorld [0.5,0.5]);
				
				_preview = createVehicle [_itemclass_preview, (screenToWorld [0.5,0.5]), [], 0, "CAN_COLLIDE"];
				
	
				
			
				BIS_CONTROL_CAM camSetTarget _preview;
				BIS_CONTROL_CAM camCommit 0;
				_logic setVariable ["BIS_COIN_preview",_preview];
				_new = true;
				
				
				if (_itemclass isKindOf "StaticWeapon") then { 
				
				//--- Preview Helper.
				if (_itemclass in _greenList && _index != -1) then {
					_distance = (missionNamespace getVariable Format ["cti_%1STRUCTUREDISTANCES",cti_Client_SideJoinedText]) select _index;
					_direction = (missionNamespace getVariable Format ["cti_%1STRUCTUREDIRECTIONS",cti_Client_SideJoinedText]) select _index;
					_npos = [getPos _preview,_distance,getDir _preview + _direction] Call cti_CO_FNC_GetPositionFrom;
					_helper = "Sign_Danger" createVehicleLocal _npos;
					_helper setPos _npos;
					_helper setDir (_direction+65);
					//_array = _preview worldToModel (getPos _helper);
					//_array set [2,0];
					//_helper attachTo [_preview,_array];
					
					_helper attachTo [_preview];
					
					_logic setVariable ['cti_Helper',_helper];
				};
				
				}else{
				
					//--- Preview Helper.
				if (_itemclass in _greenList && _index != -1) then {
					_distance = (missionNamespace getVariable Format ["cti_%1STRUCTUREDISTANCES",cti_Client_SideJoinedText]) select _index;
					_direction = (missionNamespace getVariable Format ["cti_%1STRUCTUREDIRECTIONS",cti_Client_SideJoinedText]) select _index;
					_npos = [getPos _preview,_distance,getDir _preview + _direction] Call cti_CO_FNC_GetPositionFrom;
					_helper = "Sign_Danger" createVehicleLocal _npos;
					_helper setPos _npos;
					_helper setDir (_direction+65);
					_array = _preview worldToModel (getPos _helper);
					_array set [2,0];
					_helper attachTo [_preview,_array];
					_logic setVariable ['cti_Helper',_helper];
				};
				
				};
				
				
				

				_preview setObjectTexture [0,_colorGray];
				_preview setVariable ["BIS_COIN_color",_colorGray];

				//--- Exception - preview not created
				if (isnull _preview) then {
					deleteVehicle _preview;
					_logic setVariable ["BIS_COIN_preview",nil];
					_logic setVariable ["BIS_COIN_params",[]];
					_get = _logic getVariable 'cti_Helper';
					if !(isNil '_get') then {
						deleteVehicle _get;
						_logic setVariable ['cti_Helper',nil];
					};
				};

			} else {
				//--- Check zone
				if (([position _preview,_startPos] call BIS_fnc_distance2D) > _limitH) then {
					_color = _colorGray
				} else {
					//--- No money
					_funds = 0;
					call compile format ["_funds = %1;",_itemFunds];
					_fundsRemaining = _funds - _itemcost;
					if (_fundsRemaining < 0) then {_color = _colorRed};
					_color = [_itemcategory, _preview, _color] Call (missionNamespace getVariable "cti_C_STRUCTURES_PLACEMENT_METHOD");
				};


				if (_itemclass isKindOf "StaticWeapon") then { 


				_Ins = lineIntersectsSurfaces [ 
				  AGLToASL positionCameraToWorld [0,0,0], 
				  AGLToASL positionCameraToWorld [0,0,1000], 
				  _camera, 
				  objNull, 
				  true, 
				  1, 
				  "GEOM", 
				  "NONE" 
				 ]; 
				 if (count _ins == 0) exitWith { _preview setPosASL [0,0,0] }; 
				 _preview setPosASL (_Ins select 0 select 0);
				 
				 
				 
				 
				
				 
				// _preview setPosASL ([_Ins#0#0#0,_Ins#0#0#1,(_z_value+0.9)]);
				 
				 
				_preview setVectorUp (_Ins select 0 select 1);
				_logic setVariable ["BIS_COIN_preview",_preview];
				_dir = direction _preview;
				_logic setVariable ["BIS_COIN_lastdir",_dir];
				BIS_CONTROL_CAM camSetTarget _preview;
				//Preview=_preview;
				};

				_preview setObjectTexture [0,_color];
				_preview setVariable ["BIS_COIN_color",_color];
				_tooltip = _itemclass;
				_tooltipType = "preview";
				
				
				


				
				
				
				
				
			
				
				
				
				//--- Temporary solution
				_colorGUI = [1,1,1,0.1];
				if (_color == _colorGreen) then {_colorGUI = [0.3,1,0.3,0.3]};
				if (_color == _colorRed) then {_colorGUI = [1,0.2,0.2,0.4]};

				((uiNamespace getVariable "cti_title_coin") displayCtrl 112201) ctrlSetTextColor _colorGUI;
				((uiNamespace getVariable "cti_title_coin") displayCtrl 112201) ctrlCommit 0;
				
				
				
				//Preview setPosASL (Ins select 0 select 0);
				//Preview setVectorUp (Ins select 0 select 1);
				
				
			};

			//--- Place
			if (!_new && !isNil "_preview" &&  ((BIS_CONTROL_CAM_LMB && 65536 in (actionKeys "DefaultAction")) || {_x in (actionKeys "DefaultAction")} count BIS_CONTROL_CAM_keys > 0) && _color == _colorGreen) then {
				_pos = position _preview;
				_dir = direction _preview;
				deleteVehicle _preview;
				_logic setVariable ["BIS_COIN_preview",nil];
				_logic setVariable ["BIS_COIN_params",[]];
				_get = _logic getVariable 'cti_Helper';
				if !(isNil '_get') then {
					deleteVehicle _get;
					_logic setVariable ['cti_Helper',nil];
				};
				
				
				
				
				//--- Execute designer defined code
				[_logic,_itemclass,_pos,_dir,_params] spawn {
					_logic = _this select 0;
					_itemclass = _this select 1;
					_pos = _this select 2;
					_dir = _this select 3;
					_par = _this select 4;

					//--- Define the last direction used.
					_logic setVariable ["BIS_COIN_lastdir",_dir];

					//--- On Purchase.
					_structures = missionNamespace getVariable Format["cti_%1STRUCTURENAMES",cti_Client_SideJoinedText];
					_defenses = missionNamespace getVariable Format["cti_%1DEFENSENAMES",cti_Client_SideJoinedText];
					_costs = missionNamespace getVariable Format["cti_%1STRUCTURECOSTS",cti_Client_SideJoinedText];

					//--- Structures.
					_index = _structures find _itemclass;
					if (_index != -1) then {
						_price = _costs select _index;
						[cti_Client_SideJoined, -_price] Call cti_CO_FNC_ChangeSideSupply;

						if (_index == 0) then {
							_hqDeployed = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQDeployStatus;
							if (_hqDeployed) then {
								[missionNamespace getVariable "cti_C_BASE_COIN_AREA_HQ_UNDEPLOYED",false,MCoin] Call cti_CL_FNC_Init_Coin;
							} else {
								[missionNamespace getVariable "cti_C_BASE_COIN_AREA_HQ_DEPLOYED",true,MCoin] Call cti_CL_FNC_Init_Coin;
							};
							//_logic setVariable ["BIS_COIN_restart",true];
						} else {
							[player,score player + (missionNamespace getVariable "cti_C_PLAYERS_COMMANDER_SCORE_BUILD")] remoteExecCall ["cti_SE_PVF_RequestChangeScore",2];
						};
					};

					//--- Defense.
					_get = missionNamespace getVariable _itemclass;
					if !(isNil '_get') then {
						_price = _get select QUERYUNITPRICE;
						-(_price) Call cti_CL_FNC_ChangePlayerFunds;
					};

					//--- Execute designer defined code On Construct
					_deployed = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQDeployStatus;
					_structures = missionNamespace getVariable Format["cti_%1STRUCTURENAMES",cti_Client_SideJoinedText];
					_defenses = missionNamespace getVariable Format["cti_%1DEFENSENAMES",cti_Client_SideJoinedText];

					_find = _structures find _itemclass;
					if (_find != -1) then {
						//--- Increment the buildings.
						if ((_find - 1) > -1) then {
							_current = cti_Client_Logic getVariable "cti_structures_live";
							_current set [_find - 1, (_current select (_find-1)) + 1];
							cti_Client_Logic setVariable ["cti_structures_live", _current, true];
						};

						[cti_Client_SideJoined,_itemclass,_pos,_dir] remoteExecCall ["cti_SE_PVF_RequestStructure",2];
					};

					if (_itemclass in _defenses) then {
						[cti_Client_SideJoined,_itemclass,_pos,_dir,manningDefense] remoteExecCall ["cti_SE_PVF_RequestDefense",2];

						lastBuilt = _par;
						_area = [_pos,((cti_Client_SideJoined) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity2;
						_get = _area getVariable 'avail';
						if (!isNull _area && _get > 0) then {
							_commanderTeam =(cti_Client_SideJoined) Call cti_CO_FNC_GetCommanderTeam;
							_area setVariable [ "avail" ,_get -1];
							//hintSilent parseText format ["Available Items : " +"<t color='#00FF00'>"+" %1"+"</t>", _area getVariable 'avail'];
							[_area getVariable 'avail'] remoteExecCall ["cti_CL_FNC_Available",leader _commanderTeam];
						}
						;
					};
				};

				//--- Temporary solution
				_colorGUI = [1,1,1,0.1];
				((uiNamespace getVariable "cti_title_coin") displayCtrl 112201) ctrlSetTextColor _colorGUI;
				((uiNamespace getVariable "cti_title_coin") displayCtrl 112201) ctrlCommit 0;
			};
		} else {
			_colorGUI = [1,1,1,0.1];
			((uiNamespace getVariable "cti_title_coin") displayCtrl 112201) ctrlSetTextColor _colorGUI;
			((uiNamespace getVariable "cti_title_coin") displayCtrl 112201) ctrlCommit 0;
		};


		_oldTooltip = _logic getVariable "BIS_COIN_tooltip";
		if ((_tooltipType + _tooltip) != _oldTooltip || commandingMenu != _oldMenu || _logic getVariable "WF_RequestUpdate") then {
			_logic setVariable ["WF_RequestUpdate",false];

			//--- Description
			_type = _tooltip;

			//--- Header & preview picture
			_textHeader = "<t size='1.2'><br /></t>";
			_textPicture = "<t size='2.8'><br /></t><br /><br />";
			_fileIcon = getText (configFile >> "cfgvehicles" >> _type >> "icon");
			if (str(configFile >> "CfgVehicleIcons" >> _fileIcon) != "") then {_fileIcon = getText (configFile >> "CfgVehicleIcons" >> _fileIcon)};
			_filePicture = getText (configFile >> "cfgvehicles" >> _type >> "picture");
			if (str(configFile >> "CfgVehicleIcons" >> _filePicture) != "") then {_filePicture = "Rsc\Pictures\logo1.paa"};
			
			//Client\Images\con_depot.paa
			_testpicture = "Rsc\Pictures\logo1.paa";
			
			
			_control1= localize"str_coin_fuck_this_syntax" + localize"str_coin_manning" + call compile (keyname 210) + localize"str_coin_fuck_this_syntax" ;
			_control2= localize"str_coin_buildagain" + call compile (keyname 42) + localize"str_coin_fuck_this_syntax"  ;
			_control3=  localize"str_coin_templateswitch" + call compile (keyname 43) + localize"str_coin_fuck_this_syntax" ;
			
			
			
			
			_maincontrols = (
				_control1 +
				
				_control2 +
				
				_control3 +
				""
			);
			
			
			if (_tooltipType != "empty") then {
				_textHeader = format ["<t color='#00e2ff' shadow='1' align='center' size='1.8'> %1 </t><br />",
					getText (configFile >> "cfgvehicles" >> _type >> "displayname")
					
					//,
					//if (isnull _selected) then {""} 
					//else {str round ((1 - damage _selected) * 100) + "%"}
				];
				_textPicture = format ["<t color='#00e2ff' shadow='2' align='left' size='2.8'><img image='%1'/></t> ",_filePicture];
			}
			else {
			_textPicture = format ["<t color='#00e2ff' shadow='2' align='left' size='2.8'><img image='%1'/></t> ",_testpicture];
			_textHeader = format ["<t color='#00e2ff' shadow='2'align='center'size='1.0'> %1 </t><br />",_maincontrols];
			
			//gold hex=#504315
			//lightblue=#00e2ff
			
			};
			
			//localize "str_coin_build" + "<t >" + call compile (actionKeysNames ["DefaultAction",1]) + "</t></t><br />"
			
			//rechtsbündig  ":<t align='right'>" + _status + "</t></t><br />"
			
			//automanning = BuldSwitchCamera=insert=210
			//str_coin_manning
			
			
			
			
			_status = if (manningDefense) then {localize "STR_WF_On"} else {localize "STR_WF_Off"};
			_text1 = if (count _params > 0) then {"<t color='#00e2ff' shadow='2'>" + localize "str_coin_build" + "<t align='right'>" + call compile (actionKeysNames ["DefaultAction",1]) + "</t></t><br />"} else {"<t color='#00e2ff' shadow='2'>" + localize "STR_WF_AutoDefense" + ":<t align='right'>" + _status + "</t></t><br />"};

			_text2 = if (count _params > 0) then {"<t color='#00e2ff' shadow='2'>" + localize "str_coin_rotate" + "<t align='right'>" + call compile (keyname 29) + "</t></t><br />"} else
			{"<t color='#00e2ff' shadow='2'>" + localize "str_coin_sell" + "<t align='right'>" + call compile (keyname 211) + "</t></t><br />"};
			


			_text3 = if (commandingMenu != "#USER:BIS_Coin_categories_0") then {
				//--- Back hint
				if (isNil "BIS_Coin_noExit") then {
					"<t color='#00e2ff' shadow='2'>" + localize "str_coin_back" + "<t align='right'>" + call compile (actionKeysNames ["opticsTemp",1]) + "</t></t>";
				} else {""};
			} else {
				//--- Exit hint
				if (isNil "BIS_Coin_noExit") then {
					"<t color='#00e2ff' shadow='2'>" + localize "str_coin_exit" + "<t align='right'>" + call compile (actionKeysNames ["opticsTemp",1]) + "</t></t>";
				} else {""};
			};
			//menublue #42b6ff
			
			//dark gold #504315
			//yellow #eee544
			
			//---check
			//sell defense =CuratorDelete =delete= 211
			//str_coin_sell
			
			
			//--todo
			
			//automanning = BuldSwitchCamera=insert=210
			//str_coin_manning
			
			//build last defense =bulldozer turbo=lshift= 42
			//str_coin_buildagain
			
			
			
			//AutoWallConstructing = salute key =raute = 43
			//str_coin_templateswitch
			
			//--- Compose text
			_textHint = (
			 	_textPicture +
				_textHeader +
				""
			);

			_textControls = (
				_text1 +
				_text2 +
				_text3 +
				""
			);
			
			
			
			//--- Set box
			//itemlimit count,nobody want count items
			//((uiNamespace getVariable "CTI_title_coin") displayCtrl 112211) ctrlShow true;
			//((uiNamespace getVariable "CTI_title_coin") displayCtrl 112211) ctrlCommit 0;
			
			//main
			((uiNamespace getVariable "CTI_title_coin") displayCtrl 112214) ctrlSetStructuredText (parseText _textHint);
			((uiNamespace getVariable "CTI_title_coin") displayCtrl 112214) ctrlShow true;
			((uiNamespace getVariable "CTI_title_coin") displayCtrl 112214) ctrlCommit 0;
			
			
			//right corner
			((uiNamespace getVariable "CTI_title_coin") displayCtrl 112215) ctrlSetStructuredText (parseText _textControls);
			((uiNamespace getVariable "CTI_title_coin") displayCtrl 112215) ctrlShow true;
			((uiNamespace getVariable "CTI_title_coin") displayCtrl 112215) ctrlCommit 0;
		
		
		
		
		};



		//--- Amount of funds changed
		_funds = _logic getVariable "BIS_COIN_funds";
		if (typename _funds == "ARRAY") then {
			_a = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideSupply;
			_b = Call cti_CL_FNC_GetPlayerFunds;
			_funds = [_a]+[_b];
		} else {
			_funds = [Call cti_CL_FNC_GetPlayerFunds];
		};
		_fundsDescription = _logic getVariable "BIS_COIN_fundsDescription";
		_cashValues = [];
		{_cashValues pushBack (_x)} forEach _funds;
		_cashValuesOld = _logic getVariable "BIS_COIN_fundsOld";
		if (isNil "_cashValuesOld") then {_cashValuesOld = []; _cashValuesOld set [count _cashValues - 1,-1]};

		if (!([_cashValues,_cashValuesOld] call bis_fnc_arraycompare)) then {
			_cashValuesCount = count _cashValues;
			_cashSize = if (_cashValuesCount <= 1) then {2} else {2.8 / _cashValuesCount};
			_cashText = format ["<t color='#56db33' shadow='2' size='%1' align='left' valign='middle'>",_cashSize];
			_cashLines = 0;
			for "_i" from 0 to (count _funds - 1) do {
				_cashValue = _cashValues select _i;
				_cashDescription = if (count _fundsDescription > _i) then {_fundsDescription select _i} else {"?"};
				_cashText = _cashText + format ["%1 %2<br />",_cashDescription,round _cashValue];
				_cashLines = _cashLines + 0.05;
			};
			_cashText = _cashText + "</t>";
			_cashPos = ctrlPosition ((uiNamespace getVariable "cti_title_coin") displayCtrl 112224);
			((uiNamespace getVariable "cti_title_coin") displayCtrl 112224) ctrlSetStructuredText (parseText _cashText);
			((uiNamespace getVariable "cti_title_coin") displayCtrl 112224) ctrlSetPosition [_cashPos select 0,_cashPos select 1,_cashPos select 2,(_cashPos select 3)/*0.1*/ + _cashLines];
			((uiNamespace getVariable "cti_title_coin") displayCtrl 112224) ctrlShow true;
			((uiNamespace getVariable "cti_title_coin") displayCtrl 112224) ctrlCommit 0;

			//--- Categories menu
			_categories = +(_logic getVariable "BIS_COIN_categories");
			_categoriesMenu = [];
		


		//--- Ammo Upgrade.
			_upgrades = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideUpgrades;
			if (_upgrades select cti_UP_AMMOCOIN < 1) then {_categories = _categories - [localize 'STR_WF_Ammo']};

//--- Defense Upgrades.

if (_upgrades select cti_UP_DEFENSE < 1) then {_categories = _categories - [localize 'STR_WF_Defense60er'] - [localize 'STR_WF_Defense80er']};

if (_upgrades select cti_UP_DEFENSE < 2) then {_categories = _categories - [localize 'STR_WF_Defense80er']};

//--- Invisible sell container for backpackstatics,it should be invisible now
if (_upgrades select cti_UP_DEFENSE < 9) then {_categories = _categories - ["nowhere"]};




			for "_i" from 0 to (count _categories - 1) do { _categoriesMenu pushBack _i; };
			[["Categories",true],"BIS_Coin_categories",[_categoriesMenu,_categories],"#USER:BIS_Coin_%1_items_0","",""] call BIS_fnc_createmenu;

			//--- Items menu
			_items = _logic getVariable "BIS_COIN_items";
			_canAffordCountOld = _canAffordCount;
			_canAffordCount = 0;
			for "_i" from 0 to (count _categories - 1) do {
				_category = _categories select _i;
				_arrayNames = [];
				_arrayNamesLong = [];
				_arrayEnable = [];
				_arrayParams = [];
				_j = 0;
				{
					_itemclass = _x select 0;
					_itemcategory = _x select 1;
					if (typename _itemcategory == typename "") then {//--- Backward compatibility
						_itemcategory = _categories find _itemcategory;
					};

					if (_itemcategory < count _categories) then {
						_itemcost = _x select 2;
						_itemcash = 0;

						if (typename _itemcost == "ARRAY") then {_itemcash = _itemcost select 0; _itemcost = _itemcost select 1};
						_cashValue = _cashValues select _itemcash;
						_cashDescription = if (count _fundsDescription > _itemcash) then {_fundsDescription select _itemcash} else {"?"};
						_itemname = if (count _x > 3) then {_x select 3} else {getText (configFile >> "CfgVehicles" >> _itemclass >> "displayName")};
						//--- Build Limit reached?
						_buildLimit = false;
						_find = _buildingsNames find _itemclass;
						if (_find != -1) then {
							_current = cti_Client_Logic getVariable "cti_structures_live";
							_limit = missionNamespace getVariable (Format['cti_C_STRUCTURES_MAX_%1',(_buildingsType select _find)]);
							if (isNil '_limit') then {_limit = 4}; //--- Default.
							if ((_current select _find) >= _limit) then {_buildLimit = true};
						};
						if (_itemcategory == _i && !isNil "_itemcost") then {
							_canAfford = if (_cashValue - _itemcost >= 0 && !_buildLimit) then {1} else {0};
							_canAffordCount = _canAffordCount + _canAfford;
							_text = parseText(Format ['%1 <t align="right"><t color="#ffc342">%2</t> <t color="#efff42">%3</t></t>',_itemname,_cashDescription,_itemcost] + "          ");
							_arrayNames pushBack _text;
							_arrayNamesLong pushBack _text;
							_arrayEnable pushback _canAfford;
							_arrayParams pushBack ([_logic getVariable "BIS_COIN_ID"] + [_x,_i]);
						};
						_j = _j + 1;
					};
				} forEach _items;

				[[_category,true],format ["BIS_Coin_%1_items",_i],[_arrayNames,_arrayNamesLong,_arrayEnable],"","
					BIS_CONTROL_CAM_LMB = false;
					scopename 'main';
					_item = '%1';
					_id = %2;
					_array = (call compile '%3') select _id;
					_logic = call compile ('BIS_COIN_'+ str (_array select 0));

					_params = _array select 1;
					_logic setVariable ['BIS_COIN_params',_params];
					_logic setVariable ['BIS_COIN_menu',commandingMenu];
					showCommandingMenu '';

				",_arrayParams] spawn BIS_fnc_createmenu;
			};

			if (_canAffordCount != _canAffordCountOld) then {showCommandingMenu (commandingMenu)}; //<-- Open menu again to show disabled items
		};
		_logic setVariable ["BIS_COIN_fundsOld",_cashValues];
		_logic setVariable ["BIS_COIN_tooltip",_tooltipType + _tooltip];
	};
	_oldMenu = commandingMenu;
	sleep 0.05;
};
//--- end of loop

112200 cuttext ["","plain"]; //---added-MrNiceGuy
showCommandingMenu '';