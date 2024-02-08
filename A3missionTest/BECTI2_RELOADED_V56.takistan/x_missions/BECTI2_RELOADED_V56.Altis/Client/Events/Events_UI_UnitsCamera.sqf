private ["_action"];
_action = _this select 0;
true call CTI_CL_FNC_UpdateBaseVariables;
switch (_action) do {
	case "onLoad": {
		_groups = (cti_Client_SideJoined) call CTI_CO_FNC_GetSideGroups;
		
		
		//changed cam code to much better a2 code,so good fps now for watching planes or other fast units
		
		UIcurrentUnit = (player) Call cti_CO_FNC_GetUnitVehicle;
		UIcurrentMode = "Internal";
		UIcurrentUnit switchCamera UIcurrentMode;
		UItype = ["Internal","External","Ironsight"];
		
		
		//init load player ai
		uiNamespace setVariable ["cti_dialog_ui_unitscam_screenselect", objNull];
		//--- Load the AI Members
		_ais = (Units (group player) - [player]) Call cti_CO_FNC_GetLiveUnits;
		uiNamespace setVariable ["cti_dialog_ui_unitscam_groups_ai", _ais];
		{
			private _ai_text = [];
			{_ai_text pushback (parseNumber ((str _x splitString ":") select 1))} foreach _ais;
			//--- Add AI vehicle status
			_vehicle =  "";
			_status = "";
			_class=typeOf (vehicle _x);
			_currentUnit = missionNamespace getVariable _class;
			_unitdescription = _currentUnit select QUERYUNITLABEL;
			if (isnull objectParent _x) then {
			
	
			if (_unitdescription=="")then{
			_status = GetText (configFile >> "CfgVehicles" >> (typeOf (vehicle _x)) >> "displayName");
			}else{_status=_unitdescription;};
			
			
			} else {
				_d=localize "STR_WF_DriverUC";_g=localize "STR_WF_GunnerUC";_c=localize "STR_WF_CommanderUC";
				
				if (_unitdescription=="")then{
				_vehicle =  getText(configFile >> "CfgVehicles" >> typeOf objectParent _x >> "displayName");
				}else{_vehicle=_unitdescription;};
				
				switch (true) do { 
					case ((driver objectParent _x) isEqualto _x) : {_status = _d}; 
					case ((gunner objectParent _x) isEqualto _x)  : {_status = _g };
					case ((commander objectParent _x) isEqualto _x)  : {_status = _c };
					default {_status = ""}; 
				};	
			}; 
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180101) lbAdd format["%1 %2 %3", _ai_text select _forEachIndex, _status, _vehicle];

			if (alive _origin && _x isEqualTo _origin) then {((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180101) lbSetCurSel _forEachIndex};
		} forEach (_ais);
		

		if !(isNil {uiNamespace getVariable "cti_dialog_ui_unitscam_origin"}) then {
			uiNamespace setVariable ["cti_dialog_ui_unitscam_origin", nil];
		} else {
			if !(isNull (uiNamespace getVariable "cti_dialog_ui_unitscam_screenselect")) then {
				((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180101) lbSetCurSel (_ais find (uiNamespace getVariable "cti_dialog_ui_unitscam_screenselect"));
				uiNamespace setVariable ["cti_dialog_ui_unitscam_screenselect", objNull];
			} else {
				if (alive leader _group) then {
					switch (uiNamespace getVariable "cti_dialog_ui_unitscam_camview") do { case "internal": {(vehicle leader _group) switchCamera "INTERNAL"}; case "ironsight": {(vehicle leader _group) switchCamera "GUNNER"}};
					((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180011) ctrlSetText format["Feed: %1", leader _group];
					//uiNamespace setVariable ["cti_dialog_ui_unitscam_focus", leader _group];
					
				};
			};
		};	
		
		ctrlSetFocus ((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180001);
		
		_groups = (cti_Client_SideJoined) call CTI_CO_FNC_GetSideGroups;
		uiNamespace setVariable ["cti_dialog_ui_unitscam_groups", _groups];
		
		
		
		_origin = uiNamespace getVariable "cti_dialog_ui_unitscam_origin";
		if (isNil '_origin') then { _origin = objNull };
		
		
		
		{
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180100) lbAdd format ["%2 ",_x getVariable [CTI_PLAYER_DEFAULT_ALIAS], if (isPlayer leader _x) then {name leader _x} else {"AI"}];
			if (isNull _origin) then {
				if (group _track isEqualTo _x) then {((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180100) lbSetCurSel _forEachIndex};
			} else {
				if (group _origin isEqualTo _x) then {if (_origin isEqualTo leader _x) then {uiNamespace setVariable ["cti_dialog_ui_unitscam_origin", nil]}; ((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180100) lbSetCurSel _forEachIndex};
			};
		} forEach _groups;
		
		
		
		if (isNil {uiNamespace getVariable "cti_dialog_ui_unitscam_showgroups"}) then {uiNamespace setVariable ["cti_dialog_ui_unitscam_showgroups", true]};
		if (uiNamespace getVariable "cti_dialog_ui_unitscam_showgroups") then {
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180007) ctrlSetText "Hide Teams";
		} else {
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180007) ctrlSetText "Show Teams";
			{((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl _x) ctrlShow false} forEach [180002, 180003, 180004, 180005, 180006, 180100, 180101];
		};
		
		if (isNil {uiNamespace getVariable "cti_dialog_ui_unitscam_showmap"}) then {uiNamespace setVariable ["cti_dialog_ui_unitscam_showmap", true]};
		if (uiNamespace getVariable "cti_dialog_ui_unitscam_showmap") then {
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180008) ctrlSetText "Hide Map";
		} else {
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180008) ctrlSetText "Show Map";
			{((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl _x) ctrlShow false} forEach [180009, 180010];
		};
		
		if (isNil {uiNamespace getVariable "cti_dialog_ui_unitscam_showinfo"}) then {uiNamespace setVariable ["cti_dialog_ui_unitscam_showinfo", false]};
		

		
		
		//--- Render in. Where the bloody hell is the dialog option to render thing invisible at first? visible = 0 ?!?!
		//{((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl _x) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.01), SafeZoneY + (SafezoneH * 0.06), SafeZoneW * 0.31, SafeZoneH * 0.6]; ((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl _x) ctrlCommit 0} forEach [180016, 180018];
		((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180009) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.8), SafeZoneY + (SafezoneH * 0.62), SafeZoneW * 0.19, SafeZoneH * 0.32]; ((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180009) ctrlCommit 0;
		((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180010) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.805), SafeZoneY + (SafezoneH * 0.63), SafeZoneW * 0.18, SafeZoneH * 0.30]; ((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180010) ctrlCommit 0;
		((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180002) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.8), SafeZoneY + (SafezoneH * 0.06), SafeZoneW * 0.19, SafeZoneH * 0.55]; ((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180002) ctrlCommit 0;
		((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180003) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.805), SafeZoneY + (SafezoneH * 0.0605), SafeZoneW * 0.19, SafeZoneH * 0.03]; ((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180003) ctrlCommit 0;
		{((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl _x) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.805), SafeZoneY + (SafeZoneH * 0.10), SafeZoneW * 0.18, SafeZoneH * 0.3]; ((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl _x) ctrlCommit 0} forEach [180004, 180100];
		((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180005) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.805), SafeZoneY + (SafezoneH * 0.41), SafeZoneW * 0.19, SafeZoneH * 0.03]; ((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180005) ctrlCommit 0;
		{((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl _x) ctrlSetPosition [SafeZoneX + (SafeZoneW * 0.805), SafeZoneY + (SafezoneH * 0.45), SafeZoneW * 0.18, SafeZoneH * 0.15]; ((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl _x) ctrlCommit 0} forEach [180006, 180101];
		
		
		// Remote Control
		((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180024) ctrlEnable (_ai call CTI_CL_FNC_CanRemoteUnit);

		UCAMSWITCH=True;
		execVM "Client\GUI\GUI_UCAMLOOP.sqf";
		
		
	};
	case "onUnitsLBSelChanged": {
		_changeto = _this select 1;
	
		_group = (uiNamespace getVariable "cti_dialog_ui_unitscam_groups") select _changeto;
		lbClear ((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180101);
		
		_origin = uiNamespace getVariable "cti_dialog_ui_unitscam_origin";
		if (isNil '_origin') then { _origin = objNull };
		
		//jump to player if clicked
		UIcurrentUnit=leader _group;
		
		//--- Load the AI Members
		_ais = (units _group - [leader _group]) call CTI_CO_FNC_GetLiveUnits;	
		uiNamespace setVariable ["cti_dialog_ui_unitscam_groups_ai", _ais];
		{
			private _ai_text = [];
			{_ai_text pushback (parseNumber ((str _x splitString ":") select 1))} foreach _ais;
			//--- Add AI vehicle status
			_vehicle =  "";
			_status = "";
			_class=typeOf (vehicle _x);
			_currentUnit = missionNamespace getVariable _class;
			_unitdescription = _currentUnit select QUERYUNITLABEL;
			
			
			if (isnull objectParent _x) then {
			
			if (_unitdescription=="")then{
			_status = GetText (configFile >> "CfgVehicles" >> (typeOf (vehicle _x)) >> "displayName");
			}else{_status=_unitdescription;};
			
			
			} else {
				_d=localize "STR_WF_DriverUC";_g=localize "STR_WF_GunnerUC";_c=localize "STR_WF_CommanderUC";
				
				if (_unitdescription=="")then{
				_vehicle =  getText(configFile >> "CfgVehicles" >> typeOf objectParent _x >> "displayName");
				}else{_vehicle=_unitdescription;};
				
				switch (true) do { 
					case ((driver objectParent _x) isEqualto _x) : {_status = _d}; 
					case ((gunner objectParent _x) isEqualto _x)  : {_status = _g };
					case ((commander objectParent _x) isEqualto _x)  : {_status = _c };
					default {_status = ""}; 
				};	
			}; 
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180101) lbAdd format["%1 %2 %3", _ai_text select _forEachIndex, _status, _vehicle];

			if (alive _origin && _x isEqualTo _origin) then {((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180101) lbSetCurSel _forEachIndex};
		} forEach (_ais);
		
		if !(isNil {uiNamespace getVariable "cti_dialog_ui_unitscam_origin"}) then {
			uiNamespace setVariable ["cti_dialog_ui_unitscam_origin", nil];
		} else {
			if !(isNull (uiNamespace getVariable "cti_dialog_ui_unitscam_screenselect")) then {
				((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180101) lbSetCurSel (_ais find (uiNamespace getVariable "cti_dialog_ui_unitscam_screenselect"));
				uiNamespace setVariable ["cti_dialog_ui_unitscam_screenselect", objNull];
			} else {
				if (alive leader _group) then {
					switch (uiNamespace getVariable "cti_dialog_ui_unitscam_camview") do { case "internal": {(vehicle leader _group) switchCamera "INTERNAL"}; case "ironsight": {(vehicle leader _group) switchCamera "GUNNER"}};
					((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180011) ctrlSetText format["Feed: %1", leader _group];
					uiNamespace setVariable ["cti_dialog_ui_unitscam_focus", leader _group];
					
				};
			};
		};
		
		// Remote Control
		((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180024) ctrlEnable (_ai call CTI_CL_FNC_CanRemoteUnit);
			
		
	};
	case "onUnitsAILBSelChanged": {
		_changeto = _this select 1;
		
		
		_ai = (uiNamespace getVariable "cti_dialog_ui_unitscam_groups_ai") select _changeto;
		if (alive _ai) then {
			
			uiNamespace setVariable ["cti_dialog_ui_unitscam_focus", _ai];//needed for remote

			//jump to ai if clicked
			UIcurrentUnit=_ai;
			
			
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180011) ctrlSetText format["Feed: %1", _ai];
			
		};
		// Remote Control
		((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180024) ctrlEnable (_ai call CTI_CL_FNC_CanRemoteUnit);
	
		
		
	};
	case "onToggleGroup": {
		_changeto = !(uiNamespace getVariable "cti_dialog_ui_unitscam_showgroups");
		uiNamespace setVariable ["cti_dialog_ui_unitscam_showgroups", _changeTo];
		
		_hide=localize "STR_WF_HIDETEAMS"; 
		_show=localize "STR_WF_SHOWTEAMS";
		if (_changeto) then {
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180007) ctrlSetText _hide;
			{((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl _x) ctrlShow true} forEach [180002, 180003, 180004, 180005, 180006, 180100, 180101];
		} else {
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180007) ctrlSetText _show;
			{((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl _x) ctrlShow false} forEach [180002, 180003, 180004, 180005, 180006, 180100, 180101];
		};
	};
	case "onToggleMap": {
		_changeto = !(uiNamespace getVariable "cti_dialog_ui_unitscam_showmap");
		uiNamespace setVariable ["cti_dialog_ui_unitscam_showmap", _changeTo];
		
		_hide=localize "STR_WF_HIDEMAP"; 
		_show=localize "STR_WF_SHOWMAP";
		
		if (_changeto) then {
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180008) ctrlSetText _hide;
			{((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl _x) ctrlShow true} forEach [180009, 180010];
		} else {
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180008) ctrlSetText _show;
			{((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl _x) ctrlShow false} forEach [180009, 180010];
		};
	};

	case "onViewModeChanged": {
		_mode = (uiNamespace getVariable "cti_dialog_ui_unitscam_viewmode") + 1;
		if (_mode > 1) then { _mode = 0 };
		uiNamespace setVariable ["cti_dialog_ui_unitscam_viewmode", _mode];
		switch (_mode) do { 
			case 1: {_mode = "NVG"; camUseNVG true}; 
			default {_mode = "Normal"; camUseNVG false};
		};
		((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180013) ctrlSetText _mode;
	};

	case "onRemote": {
		_who = uiNamespace getVariable "cti_dialog_ui_unitscam_focus";
		if (_who call CTI_CL_FNC_CanRemoteUnit) then {
			closeDialog 0;
			(_who) spawn CTI_CL_FNC_RemoteControl;
		};
	};
	
	case "onCamChange": {
		_changeto = _this select 1;
		//_track = uiNamespace getVariable "cti_dialog_ui_unitscam_focus";
		_track="whatever";
		
		
		if !(isNil '_track') then {
			switch (_changeto) do {
				case "ironsight": {
					UIcurrentMode="gunner";
				};
				case "internal": {
					UIcurrentMode="internal";
				};
				case "external": {
					UIcurrentMode="external";
				};
			};
		};
	};
	case "onUnitDisband": {
		_who = uiNamespace getVariable "cti_dialog_ui_unitscam_focus";
		if (!(isPlayer _who) && (alive _who)) then {
			_who setDammage 1;
		};
	};
	
	case "onUnitUnflip": {
	
		if(!(isNil "UIcurrentUnit")) then {
			if(!(isPlayer (UIcurrentUnit))) then {
				_vehicle = vehicle UIcurrentUnit;			
			
				_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, 0.5];
				_vehicle setVelocity [0,0,-0.5];				
			};			
		};	
		
	};
	case "onUnload": {

	closeDialog 0;
    ((player) Call cti_CO_FNC_GetUnitVehicle) switchCamera UIcurrentMode;
	UCAMSWITCH=false;
	
	};
};