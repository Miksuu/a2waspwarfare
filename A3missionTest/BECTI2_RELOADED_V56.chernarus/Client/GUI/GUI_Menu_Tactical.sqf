disableSerialization;

_display = _this select 0;
_lastRange = artyRange;
_lastUpdate = 0;
_listBox = 17019;

sliderSetRange[17005, 10, missionNamespace getVariable "cti_C_ARTILLERY_AREA_MAX"];
sliderSetPosition[17005, artyRange];

ctrlSetText [17025,localize "STR_WF_TACTICAL_ArtilleryOverview" + ":"];

_markers = [];
_FTLocations = [];
_checks = [];
_fireTime = 0;
_status = 0;
_canFT = false;
_forceReload = true;
_startPoint = objNull;

_marker = "artilleryMarker";
createMarkerLocal [_marker,artyPos];
_marker setMarkerTypeLocal "mil_destroy";
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerSizeLocal [1,1];

_area = "artilleryAreaMarker";
createMarkerLocal [_area,artyPos];
_area setMarkerShapeLocal "Ellipse";
_area setMarkerColorLocal "ColorRed";
_area setMarkerSizeLocal [artyRange,artyRange];

_map = _display DisplayCtrl 17002;
_listboxControl = _display DisplayCtrl _listBox;

_pard = missionNamespace getVariable "cti_C_PLAYERS_SUPPORT_PARATROOPERS_DELAY";
{lbAdd[17008,_x]} forEach (missionNamespace getVariable Format ["cti_%1_ARTILLERY_DISPLAY_NAME",cti_Client_SideJoinedText]);
lbSetCurSel[17008,0];

_IDCS = [17005,17006,17007,17008];
if ((missionNamespace getVariable "cti_C_ARTILLERY") == 0) then {{ctrlEnable [_x,false]} forEach _IDCS};

{ctrlEnable [_x, false]} forEach [17010,17011,17012,17013,17014,17015,17017,17018,17020];

_currentValue = -1;
_currentFee = -1;
_currentSpecial = "";
_currentFee = -1;

//--- Support List.
_lastSel = -1;
_addToList = [localize 'STR_WF_ICBM',localize 'STR_WF_TACTICAL_ParadropAmmo',localize 'STR_WF_TACTICAL_ParadropVehicle',localize 'STR_WF_TACTICAL_Paratroop',localize 'STR_WF_TACTICAL_UnitCam',localize 'STR_WF_TACTICAL_UAV',localize 'STR_WF_TACTICAL_UAVDestroy',localize 'STR_WF_TACTICAL_UAVRemoteControl'];
_addToListID = ["ICBM","Paradrop_Ammo","Paradrop_Vehicle","Paratroopers","Units_Camera","UAV","UAV_Destroy","UAV_Remote_Control"];
_addToListFee = [150000,9500,3500,2500,0,12500,0,0];
_addToListInterval = [1000,800,600,900,0,0,0,0];

for '_i' from 0 to count(_addToList)-1 do {
	lbAdd [_listBox,_addToList select _i];
	lbSetValue [_listBox, _i, _i];
};

lbSort _listboxControl;

//--- Artillery Mode.
_mode = missionNamespace getVariable 'cti_V_ARTILLERYMINMAP';
if (isNil '_mode') then {_mode = 2;missionNamespace setVariable ['cti_V_ARTILLERYMINMAP',_mode]};
_trackingArray = [];
_trackingArrayID = [];
_lastArtyUpdate = -60;
_minRange = 100;
_maxRange = 200;
_requestMarkerTransition = false;
_requestRangedList = true;
_startLoad = true;

//--- Startup coloration.
with uinamespace do {
	currentBEDialog = _display;
	switch (_mode) do {
		case 0: {(currentBEDialog displayCtrl 17023) ctrlSetTextColor [1,1,1,1]};
		case 1: {(currentBEDialog displayCtrl 17023) ctrlSetTextColor [0,0.635294,0.909803,1]};
		case 2: {(currentBEDialog displayCtrl 17023) ctrlSetTextColor [0.6,0.850980,0.917647,1]};
	};
};

lbSetCurSel[_listbox, 0];

if ((missionNamespace getVariable "cti_C_ARTILLERY") == 0) then {
	(_display displayCtrl 17016) ctrlSetStructuredText (parseText Format['<t align="right" color="#FF4747">%1</t>',localize 'STR_WF_Disabled']);
};

_textAnimHandler = [] spawn {};

WF_MenuAction = -1;
mouseButtonUp = -1;

while {alive player && dialog} do {
	if (side player != cti_Client_SideJoined) exitWith {deleteMarkerLocal _marker;deleteMarkerLocal _area;{deleteMarkerLocal _x} forEach _markers;closeDialog 0};
	if (!dialog) exitWith {deleteMarkerLocal _marker;deleteMarkerLocal _area;{deleteMarkerLocal _x} forEach _markers};
	
	_currentUpgrades = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideUpgrades;
	
	_currentSel = lbCurSel(_listBox);
	
	//--- Special changed or a reload is requested.
	if (_currentSel != _lastSel || _forceReload) then {
		_currentValue = lbValue[_listBox, _currentSel];
		
		_currentSpecial = _addToListID select _currentValue;
		_currentFee = _addToListFee select _currentValue;
      

		_currentInterval = _addToListInterval select _currentValue;
		
		_forceReload = false;
		_controlEnable = false;
		
		_funds = Call cti_CL_FNC_GetPlayerFunds;
		
		//ctrlSetText[17021,Format ["%1: $%2",localize 'STR_WF_Price',_currentFee]]; //---old
		ctrlSetText[17021,Format ["$%1",_currentFee]]; //---added-MrNiceGuy
		
		//--- Enabled or disabled?
		switch (_currentSpecial) do {
			case "ICBM": {
				if ((missionNamespace getVariable "cti_C_MODULE_cti_ICBM") > 0) then {
					_commander = false;
					if (!isNull(commanderTeam)) then {
						if (commanderTeam == group player) then {_commander = true};
					};
					_currentLevel = _currentUpgrades select cti_UP_ICBM;
					_controlEnable = if (_currentLevel > 0 && _commander && _funds >= _currentFee) then {true} else {false};
				};
			};
			case "Paratroopers": {
				_currentLevel = _currentUpgrades select cti_UP_PARATROOPERS;
				_controlEnable = if (_funds >= _currentFee && _currentLevel > 0 && time - lastParaCall > _currentInterval) then {true} else {false};
			};
			case "Paradrop_Ammo": {
				_currentLevel = _currentUpgrades select cti_UP_SUPPLYPARADROP;
				_controlEnable = if (_funds >= _currentFee && _currentLevel > 0 && time - lastSupplyCall > _currentInterval) then {true} else {false};
			};
			case "Paradrop_Vehicle": {
				_currentLevel = _currentUpgrades select cti_UP_SUPPLYPARADROP;
				_controlEnable = if (_funds >= _currentFee && _currentLevel > 0 && time - lastSupplyCall > _currentInterval) then {true} else {false};
			};
			case "UAV": {
				_currentLevel = _currentUpgrades select cti_UP_UAV;
				_controlEnable = if (_funds >= _currentFee && _currentLevel > 0 && !(alive playerUAV)) then {true} else {false};
			};
			case "UAV_Destroy": {
				_controlEnable = if (alive playerUAV) then {true} else {false};
			};
			case "UAV_Remote_Control": {
				_controlEnable = if (alive playerUAV) then {true} else {false};
			};
			case "Units_Camera": {
				_controlEnable = commandInRange;
			};
		};
		
		ctrlEnable[17020, _controlEnable];
		WF_MenuAction = -1;
	};
	
	//--- Request Asset.
	if (WF_MenuAction == 20) then {
		WF_MenuAction = -1;
		
		//--- Output.
		switch (_currentSpecial) do {
			case "ICBM": {
				WF_MenuAction = 8;
				if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
				_textAnimHandler = [17022,localize 'STR_WF_TACTICAL_ClickOnMap',10,"ff9900"] spawn cti_CL_FNC_SetControlFadeAnim;
			};
			case "Paratroopers": {
				WF_MenuAction = 3;
				if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
				_textAnimHandler = [17022,localize 'STR_WF_TACTICAL_ClickOnMap',10,"ff9900"] spawn cti_CL_FNC_SetControlFadeAnim;
			};
			case "Paradrop_Ammo": {
				WF_MenuAction = 10;
				if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
				_textAnimHandler = [17022,localize 'STR_WF_TACTICAL_ClickOnMap',10,"ff9900"] spawn cti_CL_FNC_SetControlFadeAnim;
			};
			case "Paradrop_Vehicle": {
				WF_MenuAction = 9;
				
				if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
				_textAnimHandler = [17022,localize 'STR_WF_TACTICAL_ClickOnMap',10,"ff9900"] spawn cti_CL_FNC_SetControlFadeAnim;
			};
			case "UAV": {
				closeDialog 0;
				call WFVE_fnc_uav;
			};
			case "UAV_Destroy": {
				if !(isNull playerUAV) then {
					{_x setDammage 1} forEach (crew playerUAV);
					playerUAV setDammage 1;
					playerUAV = objNull;
				};
			};
			case "UAV_Remote_Control": {
				closeDialog 0;
				call WFVE_fnc_uav;
			};
			case "Units_Camera": {
				closeDialog 0;
				createDialog "RscMenu_UnitCamera";
			};
		};
		
		// _forceReload = true;
	};
	
	artyRange = floor (sliderPosition 17005);
	if (_lastRange != artyRange) then {_area setMarkerSizeLocal [artyRange,artyRange];};
	
	if (mouseButtonUp == 0) then {
		mouseButtonUp = -1;
		//--- Set Artillery Marker on map.
		if (WF_MenuAction == 1) then {
			WF_MenuAction = -1;
			artyPos = _map posScreenToWorld[mouseX,mouseY];
			_marker setMarkerPosLocal artyPos;
			_area setMarkerPosLocal artyPos;
			_requestRangedList = true;
		};
		//--- Paratroops.
		if (WF_MenuAction == 3) then {
			WF_MenuAction = -1;
			_forceReload = true;
			if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
			[17022] Call cti_CL_FNC_SetControlFadeAnimStop;
			_callPos = _map posScreenToWorld[mouseX,mouseY];
			if (!surfaceIsWater _callPos) then {
				lastParaCall = time;
				-(_currentFee) Call cti_CL_FNC_ChangePlayerFunds;
				["Paratroops",cti_Client_SideJoined,_callPos,cti_Client_Team] remoteExecCall ["cti_SE_PVF_RequestSpecial",2];
				hint (localize "STR_WF_INFO_Paratroop_Info");
			};
		};
		
		//--- ICBM Strike.
		if (WF_MenuAction == 8) then {
			_forceReload = true;
			if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
			[17022] Call cti_CL_FNC_SetControlFadeAnimStop;
			WF_MenuAction = -1;
			-_currentFee Call cti_CL_FNC_ChangePlayerFunds;
			_callPos = _map PosScreenToWorld[mouseX,mouseY];
			_obj = "HeliHEmpty" createVehicle _callPos;
			_nukeMarker = createMarkerLocal ["icbmstrike", _callPos];
			_nukeMarker setMarkerTypeLocal "mil_warning";
			_nukeMarker setMarkerTextLocal "Nuclear Strike";
			_nukeMarker setMarkerColorLocal "ColorRed";
			
			[_obj,_nukeMarker] Spawn cti_CO_FNC_NukeIncomming;
		};
		//--- Vehicle Paradrop.
		if (WF_MenuAction == 9) then {
			_forceReload = true;
			if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
			[17022] Call cti_CL_FNC_SetControlFadeAnimStop;
			WF_MenuAction = -1;
			lastSupplyCall = time;
			-_currentFee Call cti_CL_FNC_ChangePlayerFunds;
			_callPos = _map PosScreenToWorld[mouseX,mouseY];
			["ParaVehi",cti_Client_SideJoined,_callPos,cti_Client_Team] remoteExecCall ["cti_SE_PVF_RequestSpecial",2];
		};
		//--- Ammo Paradrop.
		if (WF_MenuAction == 10) then {
			_forceReload = true;
			if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
			[17022] Call cti_CL_FNC_SetControlFadeAnimStop;
			WF_MenuAction = -1;
			lastSupplyCall = time;
			-_currentFee Call cti_CL_FNC_ChangePlayerFunds;
			_callPos = _map PosScreenToWorld[mouseX,mouseY];
			["ParaAmmo",cti_Client_SideJoined,_callPos,cti_Client_Team] remoteExecCall ["cti_SE_PVF_RequestSpecial",2];
		};
	};
	
	//--- Update the Artillery Status.
	if ((missionNamespace getVariable "cti_C_ARTILLERY") > 0) then {
		_fireTime = (missionNamespace getVariable "cti_C_ARTILLERY_INTERVALS") select (_currentUpgrades select cti_UP_ARTYTIMEOUT);
		_status = round(_fireTime - (time - fireMissionTime));
		_txt = if (time - fireMissionTime > _fireTime) then {Format['<t align="left" color="#73FF47">%1</t>',localize 'STR_WF_TACTICAL_Available']} else {Format ['<t align="left" color="#4782FF">%1 %2</t>',_status,localize 'STR_WF_Seconds']};
		(_display displayCtrl 17016) ctrlSetStructuredText (parseText _txt);
		_enable = if (_status > 0) then {false} else {true};
		if(WF_Debug) then { _enable = true; };
		ctrlEnable [17007,_enable];
	};
	
	
	
		_artygroup = Group player;

	if (leader commanderTeam == player) then {
	//_artyarray = format ['cti_%1_ARTILLERY_CLASSNAMES',side player] call GetNamespace;
	//_artyarray = missionNamespace getVariable "cti_%1_ARTILLERY_CLASSNAMES"
_artyarray = missionNamespace getVariable Format ["cti_%1_ARTILLERY_CLASSNAMES",side player];

	_artynames = [];
	{_artynames = _artynames + _x} forEach _artyarray select 1;
		{
		if ((leader _x != player) AND (side leader _x == side leader commanderTeam)) then {
			{if (typeOf vehicle (vehicle _x) in _artynames) then {_artygroup = _x}} forEach units _x;
		};
		} forEach allGroups;

		{if (typeOf vehicle (vehicle _x) in _artynames) then {_artygroup = Group player}} forEach units group player;
	};
	
	/*
		//--- Request Fire Mission.
	if (Warfare_MenuAction == 2) then {
		Warfare_MenuAction = -1;
		_units = [_artygroup,false,lbCurSel(17008),sideJoinedText] Call GetTeamArtillery;
		if (Count _units > 0) then {
			fireMissionTime = time;
			[GetMarkerPos "artilleryMarker",lbCurSel(17008),_artygroup] Spawn RequestFireMission;
		} else {
			hint (localize "STR_WF_INFO_NoArty");
		};			
	};
	*/
	
	
	
	
	//--- Request Fire Mission.
	if (WF_MenuAction == 2) then {
		WF_MenuAction = -1;
		_units = [_artygroup,false,lbCurSel(17008),cti_Client_SideJoinedText] Call cti_CO_FNC_GetTeamArtillery;
		if (Count _units > 0) then {
			fireMissionTime = time;
			[GetMarkerPos "artilleryMarker",lbCurSel(17008),_artygroup] Spawn cti_CL_FNC_RequestFireMission;
		} else {
			hint (localize "STR_WF_INFO_NoArty");
		};			
	};
	
	//--- Arty Combo Change or Script init.
	if (WF_MenuAction == 200 || _startLoad) then {
		WF_MenuAction = -1;
		
 		_index= lbCurSel(17008);
		_minRange = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_RANGES_MIN",cti_Client_SideJoined]) select _index;
		_maxRange = round(((missionNamespace getVariable Format ["cti_%1_ARTILLERY_RANGES_MAX",cti_Client_SideJoined]) select _index) / (missionNamespace getVariable "cti_C_ARTILLERY"));
		
		
		
		
		
		_trackingArray = [_artygroup,true,lbCurSel(17008),cti_Client_SideJoined] Call cti_CO_FNC_GetTeamArtillery;
		
						
				
		
		
		_requestMarkerTransition = true;
		_requestRangedList = true;
		_startLoad = false;
	};
	
	//--- Focus on an artillery cannon.
	if (WF_MenuAction == 60) then {
		WF_MenuAction = -1;
		
		ctrlMapAnimClear _map;
		_map ctrlMapAnimAdd [1,.475,getPos(_trackingArray select (lnbCurSelRow 17024))];
		ctrlMapAnimCommit _map;
	};
	
	//--- Flush on change.
	if (_requestMarkerTransition) then {
		_requestMarkerTransition = false;
		
		{
			_track = (_x select 0);
			_vehicle = (_x select 1);

			_vehicle setVariable ['cti_A_Tracked', nil];
			deleteMarkerLocal Format ["cti_A_Large%1",_track];
			deleteMarkerLocal Format ["cti_A_Small%1",_track];
		} forEach _trackingArrayID;
		_trackingArrayID = [];
	};
	
	//--- Artillery List.
	if ((missionNamespace getVariable "cti_C_ARTILLERY") > 0 && (_requestRangedList || time - _lastArtyUpdate > 3)) then {
		_requestRangedList = false;
		
		//--- No need to update the list all the time.
		if (time - _lastArtyUpdate > 5) then {
			_lastArtyUpdate = time;
			_trackingArray = [_artygroup,true,lbCurSel(17008),cti_Client_SideJoined] Call cti_CO_FNC_GetTeamArtillery;
		};
		
		//--- Clear & Fill;
		lnbClear 17024;
		_i = 0;
		{
			
			
			_indexnumber=((missionNamespace getVariable Format ["cti_%1_ARTILLERY_CLASSNAMES",cti_Client_SideJoined])select [1,20]) find [(typeOf _x )]; 
			_indexshift=_indexnumber +1;
			_maxRange= round(((missionNamespace getVariable Format ["cti_%1_ARTILLERY_RANGES_MAX",cti_Client_SideJoined]) select  _indexshift) / (missionNamespace getVariable "cti_C_ARTILLERY"));
			_minRange=(missionNamespace getVariable Format ["cti_%1_ARTILLERY_RANGES_MIN",cti_Client_SideJoined]) select _indexshift;
							
			
			
			
			_distance = _x distance (getMarkerPos _marker);
			_color = [0, 0.875, 0, 0.8];
			_text = localize 'STR_WF_TACTICAL_ArtilleryInRange'; 																		//---changed-MrNiceGuy //"In Range";
			if (_distance > _maxRange) then {_color = [0.875, 0, 0, 0.8];_text = localize 'STR_WF_TACTICAL_ArtilleryOutOfRange'}; 		 //---changed-MrNiceGuy //"Out of Range"};
			if (_distance <= _minRange) then {_color = [0.875, 0.5, 0, 0.8];_text = localize 'STR_WF_TACTICAL_ArtilleryRangeTooClose'}; //---changed-MrNiceGuy //"Too close"};
			lnbAddRow [17024,[[typeOf _x, 'displayName'] Call cti_CO_FNC_GetConfigInfo,_text]];
			lnbSetPicture [17024,[_i,0],[typeOf _x, 'picture'] Call cti_CO_FNC_GetConfigInfo];
			
			
			
			
			lnbSetColor [17024,[_i,0],_color];
			lnbSetColor [17024,[_i,1],_color];
			
			_i = _i + 1;
		} forEach _trackingArray;
	};
	
	//--- Artillery map toggle.
	if (WF_MenuAction == 40) then {
		WF_MenuAction = -1;
		if (_mode == -1) then {_mode = 0};
		_mode = if (_mode == 2) then {0} else {_mode + 1};
		with uinamespace do {
			switch (_mode) do {
				case 0: {(currentBEDialog displayCtrl 17023) ctrlSetTextColor [1,1,1,1]};
				case 1: {(currentBEDialog displayCtrl 17023) ctrlSetTextColor [0,0.635294,0.909803,1]};
				case 2: {(currentBEDialog displayCtrl 17023) ctrlSetTextColor [0.6,0.850980,0.917647,1]};
			};
		};
		
		if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
		_textAnimHandler = [17022,localize 'STR_WF_TACTICAL_ArtilleryMinimapInfo',7,"ff9900"] spawn cti_CL_FNC_SetControlFadeAnim;
		
		missionNamespace setVariable ['cti_V_ARTILLERYMINMAP',_mode];
		
		_requestMarkerTransition = true;
	};
	
	//--- Update artillery display.
	if (_mode != -1) then {
	
		//--- Nothing.
		if (_mode == 0) then {
			_requestMarkerTransition = true;
			_mode = -1;
		};
			
		//--- Filled Content.
		if (_mode == 1 || _mode == 2) then {
			//--- Remove if dead or null or sel changed.
			{
				_track = (_x select 0);
				_vehicle = (_x select 1);
				
				if !(alive _vehicle) then {
					deleteMarkerLocal Format ["cti_A_Large%1",_track];
					deleteMarkerLocal Format ["cti_A_Small%1",_track];
				};
			} forEach _trackingArrayID;
			
			//--- No need to update the marker all the time.
			if (time - _lastArtyUpdate > 5) then {
				_lastArtyUpdate = time;
				_trackingArray = [_artygroup,true,lbCurSel(17008),cti_Client_SideJoined] Call cti_CO_FNC_GetTeamArtillery;
			};
			
			//--- Live Feed.
			_trackingArrayID = [];
			{
				_track = _x getVariable 'cti_A_Tracked';
				if (isNil '_track') then {
	
					
					_track = buildingMarker;
					buildingMarker = buildingMarker + 1;
					
					
					
					_x setVariable ['cti_A_Tracked', _track];
					
					
					_dmarker = Format ["cti_A_Large%1",_track];
					createMarkerLocal [_dmarker, getPos _x];
					_dmarker setMarkerColorLocal "ColorBlue";
					_dmarker setMarkerShapeLocal "ELLIPSE";
					_brush = "SOLID";
					if (_mode == 1) then {_brush = "SOLID"};
					if (_mode == 2) then {_brush = "BORDER"};
					_dmarker setMarkerBrushLocal _brush;
					_dmarker setMarkerAlphaLocal 0.4;

					
					
					_indexnumber=((missionNamespace getVariable Format ["cti_%1_ARTILLERY_CLASSNAMES",cti_Client_SideJoined])select [1,20]) find [(typeOf _x )]; 
					_indexshift=_indexnumber +1;
					_maxRange= round(((missionNamespace getVariable Format ["cti_%1_ARTILLERY_RANGES_MAX",cti_Client_SideJoined]) select  _indexshift) / (missionNamespace getVariable "cti_C_ARTILLERY"));
					
					
					

					_dmarker setMarkerSizeLocal [_maxRange,_maxRange];
					
					
					_dmarker = Format ["cti_A_Small%1",_track];
					createMarkerLocal [_dmarker, getPos _x];
					_dmarker setMarkerColorLocal "ColorBlack";
					_dmarker setMarkerShapeLocal "ELLIPSE";
					_dmarker setMarkerBrushLocal "SOLID";
					_dmarker setMarkerAlphaLocal 0.4;
					
					_minRange=(missionNamespace getVariable Format ["cti_%1_ARTILLERY_RANGES_MIN",cti_Client_SideJoined]) select _indexshift;
					
					_dmarker setMarkerSizeLocal [_minRange,_minRange];
					

					
					
					
				} else {
				
					_dmarker = Format ["cti_A_Large%1",_track];
					_dmarker setMarkerPosLocal (getPos _x);
					_dmarker = Format ["cti_A_Small%1",_track];
					_dmarker setMarkerPosLocal (getPos _x);
				};
				_trackingArrayID = _trackingArrayID + [[_track,_x]];
			} forEach _trackingArray;
		};
	};
	
	_lastRange = artyRange;
	_lastSel = lbCurSel(_listbox);
	sleep 0.1;
	
	//--- Back Button.
	if (WF_MenuAction == 30) exitWith { //---added-MrNiceGuy
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "WF_Menu";
	};
};

deleteMarkerLocal _marker;
deleteMarkerLocal _area;
{deleteMarkerLocal _x} forEach _markers;

if !(scriptDone _textAnimHandler) then {terminate _textAnimHandler};
//--- Remove Markers.
{
	_track = (_x select 0);
	_vehicle = (_x select 1);
	
	_vehicle setVariable ['cti_A_Tracked', nil];

	deleteMarkerLocal Format ["cti_A_Large%1",_track];
	deleteMarkerLocal Format ["cti_A_Small%1",_track];
} forEach _trackingArrayID;