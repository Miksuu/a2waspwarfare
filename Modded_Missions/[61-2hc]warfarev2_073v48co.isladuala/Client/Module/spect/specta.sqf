//
// Spectating Script for Armed Assault
// by Kegetys <kegetys [�t] dnainternet.net>
//

_player = _this select 0;
_killer = _this select 1;
_seagull = _this select 2;

// If seagull is valid we came from the respawn scene
if(typeName _seagull != "string") then {
	_seagull setpos[-1000, -1000, 1000];
	sleep 1.5;
	titleCut["","BLACK OUT", 1.5];
};

// Globals etc.
spectate_events = compile loadfile "Client\Module\spect\specta_events.sqf";
KEGsMouseButtons = [false, false];
KEGsMouseScroll = 0;
KEGsMouseCoord = [0.5, 0.5];
KEGsUseNVG = false;
KEGsMissileCamActive = false;
KEGsUseMissileCam = true;
KEGsMarkerNames = false; // True = display marker names and arrows
KEGsMarkerType = 1; // 0 = disabled, 1 = names, 2 = types
KEGsTags = false; // Particlesource tags
KEGsAIfilter = false; // Filter AI units (only players displayed)
KEGsClientAddonPresent = false; // Is client-side addon present?
KEGsMarkerSize = 1.0; // Full map marker size
KEGsMinimapZoom = 0.5; // Minimap zoom
KEGsSelect = 0; // Used to change selected target
KEGs1stGunner = false; // Gunner view on 1st person camera?
KEGsDroppedCamera = false; // Free camera dropped (non-targeted with free motion)?
KEGsCamForward = false;
KEGsCamBack = false;
KEGsCamLeft = false;
KEGsCamRight = false;
KEGsNeedUpdateLB = false;
_mouseDeltaX = 0;
_mouseDeltaY = 0;
_sdistance = 1; // camera distance
_fangle  = 0; // Free camera angle
_fangleY = 15;
_flybydst = 35; // Distance of flyby camera (adjusted based on target speed)
_szoom = 0.976;
_markers = []; // Map markers showing positions of all units
KEGsTagSources = []; // Particle sources for tags
_lastTgt = 0;
_nameCache = []; // Used to store valid names since name command cannot be trusted

_maxDistance = 50;	// Maximum distance for camera
_maxZoom = 0.05;		// Maximum zoom level
_minZoom = 2;

// Unit sides shown - Show all if sides not set
if(format["%1", KEGsShownSides] == "scalar bool array string 0xe0ffffef") then {
	KEGsShownSides = [west, east];
};

deathCam = [];
_ehVehicles = []; // Used to keep track of added eventhandlers
KEGsAllUnits = [];

// Create trigger for retrieving all vehicles
_t = createTrigger["EmptyDetector", getpos player];
_t setTriggerType "NONE";
_t setTriggerStatements ["this", "KEGsAllUnits = thislist", ""];
_t setTriggerArea[50000, 50000, 0, false];
_t setTriggerActivation["ANY", "PRESENT", false];

// Wait until trigger assigns the array
waitUntil{count KEGsAllUnits > 0};

if(typeName _seagull != "string") then {
	sleep 1;
	titleCut ["","BLACK IN", 8];
} else {
	titleText["","BLACK IN", 0];	
};

// Create dialog & assign keyboard handler
createDialog "rscSpectate";
_disp = (findDisplay 55001);
_disp displaySetEventHandler["KeyDown", "[""KeyDown"",_this] call spectate_events"];
_disp displaySetEventHandler["KeyUp", "[""KeyUp"",_this] call spectate_events"];

// Hide menus by default
["ToggleCameraMenu",0] call spectate_events;
["ToggleTargetMenu",0] call spectate_events;
["ToggleHelp",0] call spectate_events;
["ToggleMap",1] call spectate_events;

// IDC's from rsc
_cCamera = 55002;
_cTarget = 55003;
_cName = 55004;
_cLBCameras = 55005;
_cLBTargets = 55006;
_cCamerasBG = 55007;
_cTargetsBG = 55008;
_cMap = 55013;
_cMapFull = 55014;
_cDebug = 55100;
_nearest = objNull;

// Create cameras
_pos = [(getpos player select 0)-1+random 2, (getpos player select 1)-1+random 2, 2];
KEGscam_static = "camera" camCreate _pos;
KEGscam_target = "camera" camCreate _pos; // "Dummy" target camera for smooth transitions
KEGscam_free = "camera" camCreate _pos;
KEGscam_flyby = "camera" camCreate _pos;
KEGscam_topdown = "camera" camCreate _pos;
KEGscam_1stperson = "camera" camCreate _pos; // Dummy camera
KEGscam_missile = "camera" camCreate _pos; // Missile camera
KEGscam_fullmap = "camera" camCreate _pos; // Full map view camera
_cameras = [KEGscam_free, KEGscam_static, KEGscam_flyby, KEGscam_topdown, KEGscam_1stperson];
_cameraNames = ["Free", "Chase", "Flyby", "Top-down", "1st person"];
_dummy = "helihempty" createVehicleLocal [0,0,0]; // Dummy object for distance command
KEGscameras = _cameras; // Hack to allow access from events.sqf

// Add cameras to listbox
lbClear _cLBCameras;
{lbAdd[_cLBCameras, _x]} foreach _cameraNames;

// Add separator & toggles
_cLbSeparator = lbAdd[_cLBCameras, "---"];
lbSetColor[_cLBCameras, _cLbSeparator, [0.5, 0.5, 0.5, 0.5]];
_cLbMissileCam = lbAdd[_cLBCameras, "Missile camera"];
_cLbToggleNVG = lbAdd[_cLBCameras, "Night vision"];
_cLbToggleTags = lbAdd[_cLBCameras, "Unit tags"];
_cLbToggleAiFilter = lbAdd[_cLBCameras, "Filter AI"];

KEGs_tgtIdx = 0;
KEGs_cameraIdx = 0;
showcinemaborder false;
lbClear _cLBTargets;
onMapSingleClick "[""MapClick"",_pos] call spectate_events";

["EventLogAdd",["Initialize",[1,1,1,1]]] call spectate_events;

// Check for client side addon
_foo = "KEGsAddon10" createVehicleLocal[-1000,-1000,0];
//_foo = "KEGspect_bar_yellow" createVehicleLocal[-1000,-1000,0];
if(!isNull _foo) then {
	deletevehicle _foo;
	KEGsClientAddonPresent = true;	
};

// Spawn thread to display help reminder after a few seconds
[] spawn {sleep(3);if(dialog) then {cutText["\n\n\n\n\nPress F1 for help","PLAIN DOWN", 0.75]}};

_camSelLast = 0;
_tgtSelLast = 0;
_mouseLastX = 0.5;
_mouseLastY = 0.5;
_nNoDialog = 0;
_lastCheckNewUnits = -100;
_lastUpdateMarkers = -100;
_lastUpdateMarkerTypes = -100;
_lastUpdateTags = -100;
_lastAutoUpdateLB = time;
KEGsCamPos = [0,0,0];
_cxpos = 0;
_cypos = 0;
_czpos = 0;
_cspeedx = 0;
_cspeedy = 0;
_tbase = 0.1;
_h = 2;

// Main loop - Ugly double loop to avoid exit after 10000 iterations
while{dialog} do {
while{dialog} do {
	call {
		// Check for listbox selections
		if(_camSelLast != lbCurSel _cLBCameras) then {
			_cs = lbCurSel _cLBCameras;
			if(_cs == _cLbSeparator) then {_cs = _camSelLast};
			// Special for toggling missile camera 
			if(_cs == _cLbMissileCam) then {
				KEGsUseMissileCam = !KEGsUseMissileCam;
				_cs = _camSelLast;
			};
			// Special for toggling NVG
			if(_cs == _cLbToggleNVG) then {
				KEGsUseNVG = !KEGsUseNVG;
				_cs = _camSelLast;
			};			
			// Special for toggling tags
			if(_cs == _cLbToggleTags) then {
				KEGsTags = !KEGsTags;
				["ToggleTags", [KEGsTags, (_cameras select KEGs_cameraIdx)]] call spectate_events;
				_cs = _camSelLast;
			};			
			// Special for toggling AI filter
			if(_cs == _cLbToggleAiFilter) then {
				KEGsAIfilter = !KEGsAIfilter;
				_cs = _camSelLast;				
				KEGsNeedUpdateLB = true; // Request listbox update
			};			
			if(_cs != _camSelLast) then {
				// Selected another camera - disable dropped cam
				KEGsDroppedCamera = false;
			};
			KEGs_cameraIdx = _cs;	
		};
		
		if(lbCurSel _cLBTargets > lbSize _cLBTargets) then {
			lbSetCurSel[_cLBTargets, lbSize _cLBTargets];	// Selection outside listbox size
		};
					
		// Update selected target from listbox
		if(KEGsSelect != 0) then {			
			lbSetCurSel[_cLBTargets, ((lbCurSel _cLBTargets)+KEGsSelect)];
			KEGsSelect = 0;
		};		
		if(_tgtSelLast != lbCurSel _cLBTargets) then {
			KEGsDroppedCamera = false;
			KEGs_tgtIdx = lbValue[_cLBTargets, (lbCurSel _cLBTargets)];
		};			
		
		// Process mouse movement
		_mouseDeltaX = _mouseLastX - (KEGsMouseCoord select 0);
		_mouseDeltaY = _mouseLastY - (KEGsMouseCoord select 1);		
		if(!(KEGsMouseButtons select 0) and (KEGsMouseButtons select 1)) then {
			// Right mouse button - Adjust position
			_fangle = _fangle - (_mouseDeltaX*360);
			_fangleY=_fangleY + (_mouseDeltaY*180);
			if(_fangleY > 89) then {_fangleY = 89};
			if(_fangleY < -89) then {_fangleY = -89};		
		};
		if((KEGsMouseButtons select 0) and !(KEGsMouseButtons select 1)) then {
			// Left mouse button - Adjust distance
			_sdistance = _sdistance - (_mouseDeltaY*10);
			if(_sdistance > _maxDistance) then {_sdistance = _maxDistance};
			if(_sdistance < -_maxDistance) then {_sdistance = -_maxDistance};		
		};	
		if(KEGsMouseScroll != 0) then {
			// Mouse scroll wheel - Adjust distance
			_sdistance = _sdistance - (KEGsMouseScroll*0.11);		
			KEGsMouseScroll = KEGsMouseScroll * 0.75;
			if(_sdistance > _maxDistance) then {_sdistance = _maxDistance};
			if(_sdistance < -_maxDistance) then {_sdistance = -_maxDistance};						
		};
		if((KEGsMouseButtons select 0) and (KEGsMouseButtons select 1)) then {
			// Both mousebuttons - Adjust zoom
			_szoom = _szoom - (_mouseDeltaY*3);		
			if(_szoom > _minZoom) then {_szoom = _minZoom};
			if(_szoom < _maxZoom) then {_szoom = _maxZoom};		
		};
					
		// Check for new units every 2 seconds
		if(time - _lastCheckNewUnits > 2) then {
			_lastCheckNewUnits = time;
			_allUnits = [];
			_allVehicles = [];
			
			// Avoid game logics
			_foo = [];
			{if(side _x != sideLogic) then {_foo = _foo + [_x]}} foreach KEGsAllUnits;
			
			{_allUnits = _allUnits + (crew _x);_allVehicles = _allVehicles + [_x]} foreach _foo;
			_newUnits = _allUnits - deathCam;	
			_newVehicles = _allVehicles - _ehVehicles;
			if(count _newVehicles > 0) then {
				// Add event handlers to new vehicles
				_ehVehicles = _ehVehicles + _newVehicles;
				{
					// Add fired eventhandler for map indication
					_fh = _x addeventhandler["fired", {["UnitFired",_this] call spectate_events}];
					//_kh = _x addeventhandler["killed", {["UnitKilled",_this] call spectate_events}];
					_x setVariable["KEGsEHfired", _fh];
					//_x setVariable["KEGsEHkilled", _kh];
				} foreach _newVehicles;
			};
			if(count _newUnits > 0) then {
				// Add new units to end of list
				deathCam = deathCam + _newUnits;
				
				// Request listbox update
				KEGsNeedUpdateLB = true;
				
				// Create markers
				{
					// Crete marker
					_m = createMarkerLocal[format["KEGsMarker%1", count _markers], getpos player];
					_m setMarkerTypeLocal "Dot";			
					_m setMarkerSizeLocal[0.4, 0.4];
					_markers = _markers + [_m];
					
					// Set marker color
					if(side _x == west) then {_m setMarkerColorLocal "ColorBlue";};
					if(side _x == east) then {_m setMarkerColorLocal "ColorRed";};
					if(side _x == resistance) then {_m setMarkerColorLocal "ColorGreen";};
					if(side _x == civilian) then {_m setMarkerColorLocal "ColorWhite";};			
					
					// Create particle source
					_s = "#particlesource" createvehiclelocal (getpos _x);
					KEGsTagSources = KEGsTagSources + [[_x, _s]];
					
					// If tags are on, turn them off and back again to include new units
					if(KEGsTags) then {
						["ToggleTags",[false, (_cameras select KEGs_cameraIdx)]] call spectate_events;
						["ToggleTags",[true, (_cameras select KEGs_cameraIdx)]] call spectate_events;
					};					
				} foreach _newUnits;						
			};
		};
		
		// Request listbox update every 4 seconds to update dead units or jip player names
		if(time - _lastAutoUpdateLB > 4) then {
			_lastAutoUpdateLB = time;
			KEGsNeedUpdateLB = true;
		};
					
		if(KEGsNeedUpdateLB) then {
			// Clear and re-fill targets listbox
			lbClear _cLBTargets;	
			for "_idx" from 0 to ((count deathCam)-1) do {
				_x = deathCam select _idx;
				_name = "";
				if(alive _x) then {
					// Unit is alive, use name command
					_name = name _x;					
					_nameCache set[_idx, _name];					
				} else {
					// Dead unit, use cached name
					_name = _nameCache select _idx;
				};
				if((!KEGsAIfilter or isPlayer _x) and ((side _x) in KEGsShownSides)) then {
					_i = lbAdd[_cLBTargets, _name];					
					lbSetValue[_cLBTargets, _i, _idx]; // Value used to id unit
					
					if(side _x == west) then {lbSetColor[_cLBTargets, _i, [0.8,0.8,1,1]]};
					if(side _x == east) then {lbSetColor[_cLBTargets, _i, [1,0.8,0.8,1]]};
					if(side _x == resistance) then {lbSetColor[_cLBTargets, _i, [0.8,1,0.8,1]]};
					if(side _x == civilian) then {lbSetColor[_cLBTargets, _i, [1,1,1,1]]};					
					if(not alive _x) then {
						// Whoops, unit is dead, change color
						lbSetColor[_cLBTargets, _i, [0.5,0.5,0.5,1]];
					};
					
					//if(_x == KEGs_target) then {
						// Select target
						// Not a good idea
						//lbSetCurSel[_cLBTargets, _i];				
					//};
				};
			};			
			KEGsNeedUpdateLB = false;
		};

		// Check limits
		if(KEGs_tgtIdx >= count deathCam) then {KEGs_tgtIdx = (count deathCam)-1;};
		if(KEGs_tgtIdx < 0) then {KEGs_tgtIdx = 0};
		if(KEGs_cameraIdx < 0) then {KEGs_cameraIdx = 0};
		if(KEGs_cameraIdx >= count _cameras) then {KEGs_cameraIdx = (count _cameras)-1;};
	
		// Select camera, get target
		if(!KEGsMissileCamActive) then {
			(_cameras select KEGs_cameraIdx) cameraEffect["internal", "BACK"];
			KEGs_target = deathCam select KEGs_tgtIdx;
		};
		lbSetCurSel[_cLBCameras, KEGs_cameraIdx];	

		if(lbValue[_cLBTargets, (lbCurSel _cLBTargets)] != KEGs_tgtIdx) then {
			// Find listbox element with matching value
			for "_idx" from 0 to (lbSize _cLBTargets) do {
				if(lbValue[_cLBTargets, (lbCurSel _cLBTargets)] == KEGs_tgtIdx) then {
					lbSetCurSel[_cLBTargets, _idx];
					_found = true;
				};
			};
		};
		
		//if(lbCurSel _cLBTargets != KEGs_tgtIdx) then {
//			lbSetCurSel[_cLBTargets, KEGs_tgtIdx];	
//		};
		camUseNVG KEGsUseNVG;
		
		if(ctrlVisible _cMapFull) then {
			KEGscam_fullmap cameraEffect["internal", "BACK"];
		};
		
		//ctrlSetText[_cDebug, format["%1", count _markers]];			
		
		// Update tag particlesources
		if(time - _lastUpdateTags > (1/5)) then {
			_lastUpdateTags = time;
			if(KEGsTags) then {
				["ToggleTags", [true, (_cameras select KEGs_cameraIdx)]] call spectate_events;
			};
		};
		
		// Update markers 10fps
		_rate = 15;
		if(count _markers > 100) then {_rate = 7.5}; // Update large number of markers less often
		if(time - _lastUpdateMarkers > (1/_rate)) then {
			_lastUpdateMarkers = time;
			
			// setMarkerTypeLocal is very slow, call it only once per second
			_doMarkerTypes = false;
			if(time - _lastUpdateMarkerTypes > 1) then {
				_lastUpdateMarkerTypes = time;
				_doMarkerTypes = true; // Allow update marker types
			};
			
			if(ctrlVisible _cMapFull) then {
				// Position camera in the middle of full map, for sound and
				// smoother marker motion (distant objects appear less smooth)
				_mapFull = _disp displayctrl _cMapFull;
				_mappos = _mapFull posScreenToWorld[0.5, 0.5];
				KEGscam_fullmap camsettarget _mappos;
				KEGscam_fullmap camsetrelpos [0, -1, 150];
				KEGscam_fullmap camcommit 0;
			};
			
			_markedVehicles = []; // Keep track of vehicles with markers to avoid multiple markers for one vehicle
			for "_i" from 0 to ((count _markers)-1) do {
				_m = _markers select _i;
				_u = (deathCam select _i);
				_m setMarkerPosLocal (getpos vehicle _u);
				
				if(!((side _u) in KEGsShownSides)) then {
					// We arent' supposed to show this side unit - hide marker
					if(_doMarkerTypes) then {_m setMarkerTypeLocal "empty"};
				} else { 				
					if(KEGsMarkerNames or KEGsMinimapZoom < 0.15) then {
						// Set full screen map marker types - Also zoomed minimap
						if(ctrlVisible _cMapFull) then {
							switch(KEGsMarkerType) do {
								case 0: {	// No text
									_m setMarkerTextLocal "";
								};
								case 1: {	// Names
									if(alive (vehicle _u)) then {
										if(name (vehicle _u) != "Error: no unit") then {_m setMarkerTextLocal name ( _u)};
									};
								};
								case 2: {	// Types
									_m setMarkerTextLocal getText (configFile >> "CfgVehicles" >> format["%1", typeOf (vehicle _u)] >> "DisplayName");
								};
							};
						} else {
							// Minimap with detailed icons but no text
							_m setMarkerTextLocal "";
						};
						
						if(KEGsClientAddonPresent) then {
							// With client side addon use better icons
							_type = getText(configFile >> "CfgVehicles" >> format["%1", typeOf (vehicle _u)] >> "simulation");
							_icon = "Arrow";
							switch(_type) do {
								case "tank": {_icon = "KEGsTank"};
								case "car": {_icon = "KEGsCar"};
								case "soldier": {_icon = "KEGsMan"};
								case "ship": {_icon = "KEGsShip"};
								case "airplane": {_icon = "KEGsPlane"};
								case "helicopter": {_icon = "KEGsHelicopter"};
								case "motorcycle": {_icon = "KEGsMotorcycle"};
								case "parachute": {_icon = "KEGsParachute"};
							};
							if(_doMarkerTypes) then {_m setMarkerTypeLocal _icon};
							_m setMarkerSizeLocal[0.42*KEGsMarkerSize, 0.42*KEGsMarkerSize];
						} else {
							// No client side addon - basic markers
							if(_doMarkerTypes) then {_m setMarkerTypeLocal "Arrow"};						
							if(_u == vehicle _u) then {
								_m setMarkerSizeLocal[0.33*KEGsMarkerSize, 0.27*KEGsMarkerSize];
							} else {
								_m setMarkerSizeLocal[0.42*KEGsMarkerSize, 0.42*KEGsMarkerSize];
							};						
						};
						
						_m setMarkerDirLocal (getdir (vehicle _u));
					} else {
						_m setMarkerTextLocal "";
						if(_doMarkerTypes) then {_m setMarkerTypeLocal "Dot"};
						_m setMarkerSizeLocal[0.4,0.4];
					};		
				};
				
				if(not alive _u) then {
					if(KEGsClientAddonPresent) then {
						// Switch to darker color, cant use side since the unit is already dead
						if(getMarkerColor _m == "ColorBlue") then {_m setMarkerColorLocal "KEGsDarkBlue"};
						if(getMarkerColor _m == "ColorRed") then {_m setMarkerColorLocal "KEGsDarkRed"};
						if(getMarkerColor _m == "ColorGreen") then {_m setMarkerColorLocal "KEGsDarkGreen"};
						if(getMarkerColor _m == "ColorWhite") then {_m setMarkerColorLocal "KEGsGrey"};								
					} else {
						_m setMarkerColorLocal "ColorBlack"
					};
				};
				
				if(vehicle _u in _markedVehicles) then {
					// This vehicle was already marked, hide marker
					_m setMarkerTypeLocal "Empty";
				} else {
					_markedVehicles = _markedVehicles + [vehicle _u];
				};
			};
			
			// Follow target with small map			
			_map = _disp displayctrl _cMap;
			ctrlMapAnimClear _map;
			if(KEGsDroppedCamera) then {
				// Center on dropped camera position
				_map ctrlMapAnimAdd[0.3, KEGsMinimapZoom, [_cxpos, _cypos,0]];
			} else {
				// Center on target
				_map ctrlMapAnimAdd[0.3, KEGsMinimapZoom, getpos KEGs_target];
			};
			ctrlMapAnimCommit _map;					
		};
	
		// Check if target changed and center main map
		if(KEGs_tgtIdx != _lastTgt) then {
			_map = _disp displayctrl _cMapFull;
			ctrlMapAnimClear _map;
			_map ctrlMapAnimAdd [0.2, 1.0, getpos (deathcam select KEGs_tgtIdx)];
			ctrlMapAnimCommit _map;			
		};
		
		if((_cameras select KEGs_cameraIdx) == KEGscam_1stperson) then {
			// 1st person view
			if(KEGs1stGunner) then {
				(vehicle KEGs_target) switchCamera "GUNNER";
			} else {
				(vehicle KEGs_target) switchCamera "INTERNAL";
			};
			(vehicle KEGs_target) cameraEffect ["terminate","FRONT"];
		};
			
		// Get target properties
		_dir = getdir vehicle KEGs_target;
		_bb = boundingBox vehicle KEGs_target;
		//_h = ((_bb select 1) select 2) - ((_bb select 0) select 2); // Height
		_foo = ((_bb select 1) select 2) - ((_bb select 0) select 2); // Height
		_l = ((_bb select 1) select 1) - ((_bb select 0) select 1); // Length
		_w = ((_bb select 1) select 0) - ((_bb select 0) select 0); // Width
		
		_hstr = 0.15;		
		_h = (_foo*_hstr)+(_h*(1-_hstr));
		// Set UI texts
		_role = "";
		if(vehicle KEGs_target != KEGs_target) then {
			if(KEGs_target == driver vehicle KEGs_target) then {_role = "(Driver)"};
			if(KEGs_target == gunner vehicle KEGs_target) then {_role = "(Gunner)"};
			if(KEGs_target == commander vehicle KEGs_target) then {_role = "(Commander)"};
		};		
		_name = "Unknown";
		if(alive KEGs_target) then {
			_name = name KEGs_target;
			if(_name == "Error: no unit") then {_name = "Unknown"};
		};
		if(KEGsDroppedCamera and isNull _nearest) then {
			// Dropped camera mode - no target
			_name = "";
			_role = "";
		};
		ctrlSetText[_cName, format["%1 %2", _name, _role]];	
		ctrlSetText[_cCamera, format["Camera: %1", _cameraNames select KEGs_cameraIdx]];		
		
		// Set name color to gray if dropped cam
		_ccName = _disp displayctrl _cName;
		if(KEGsDroppedCamera) then {
			_ccName ctrlSetTextColor[0.6, 0.6, 0.6, 1];
		} else {
			_ccName ctrlSetTextColor[1, 1, 1, 1];
		};
		
		// Set toggle text color for camera menu		
		if(KEGsUseMissileCam) then {lbSetColor[_cLBCameras, _cLbMissileCam, [1, 0.5, 0, 1]]}
		else {lbSetColor[_cLBCameras, _cLbMissileCam, [1,1,1,0.33]]};
		
		if(KEGsUseNVG) then {lbSetColor[_cLBCameras, _cLbToggleNVG, [1, 0.5, 0, 1]]}
		else {lbSetColor[_cLBCameras, _cLbToggleNVG, [1,1,1,0.33]]};		
		
		if(KEGsTags) then {lbSetColor[_cLBCameras, _cLbToggleTags, [1, 0.5, 0, 1]]} 
		else {lbSetColor[_cLBCameras, _cLbToggleTags, [1,1,1,0.33]]};			

		if(KEGsAIfilter) then {lbSetColor[_cLBCameras, _cLbToggleAiFilter, [1, 0.5, 0, 1]]} 
		else {lbSetColor[_cLBCameras, _cLbToggleAiFilter, [1,1,1,0.33]]};			

		if(KEGsDroppedCamera) then {
			// Dropped free camera, moved with WSAD keys
			if(KEGs_cameraIdx != 0) then {
				// User changed camera
				KEGsDroppedCamera = false;
			};
			
			// Adjust speed from buttons held down
			_spd = (_sdistance max 1)*20;
			if(KEGsCamForward) then {
				_cspeedx = _cspeedx + ((_spd*_tbase)*sin _fangle);
				_cspeedy = _cspeedy + ((_spd*_tbase)*cos _fangle);
			};
			if(KEGsCamBack) then {
				_cspeedx = _cspeedx + ((-_spd*_tbase)*sin _fangle);
				_cspeedy = _cspeedy + ((-_spd*_tbase)*cos _fangle);
			};		
			if(KEGsCamLeft) then {
				_cspeedx = _cspeedx + ((_spd*_tbase)*sin (_fangle-90));
				_cspeedy = _cspeedy + ((_spd*_tbase)*cos (_fangle-90));
			};
			if(KEGsCamRight) then {
				_cspeedx = _cspeedx + ((-_spd*_tbase)*sin (_fangle-90));
				_cspeedy = _cspeedy + ((-_spd*_tbase)*cos (_fangle-90));
			};					
			// Move camera
			_cxpos = _cxpos + (_cspeedx*_tbase);
			_cypos = _cypos + (_cspeedy*_tbase);
			_czpos = 0;
			_h = 2; // Static camera height
			_l = 2.2;
			
			// Slow down
			_bstr = 5;
			_cspeedx = _cspeedx * ((1.0-(_tbase*_bstr)) max 0);
			_cspeedy = _cspeedy * ((1.0-(_tbase*_bstr)) max 0);
			
			// Check for nearby targets
			_dummy setpos[_cxpos, _cypos, 1.5];
			_objs = [_cxpos, _cypos, 1.5] nearObjects 5;
			_nearest = objNull;
			_dist = 10;
			{
				{
					_d = _dummy distance _x;
					if(_d < _dist and _x in deathCam and alive _x) then {_nearest = _x;_dist = _d;};					
				} foreach crew _x;
			} foreach _objs;
			if(!isNull _nearest) then {KEGs_tgtIdx = deathCam find _nearest};
		} else {		
			// Set targets for all cameras
			_cxpos = getpos vehicle KEGs_target select 0;
			_cypos = getpos vehicle KEGs_target select 1;
			_czpos = getpos vehicle KEGs_target select 2;
		};
		KEGscam_target camSetPos[_cxpos, _cypos, _czpos+(_h*0.7)];
		KEGscam_static camSetTarget KEGscam_target;	
		KEGscam_free camSetTarget[_cxpos, _cypos, _czpos+(_h*0.6)];	
		KEGscam_flyby camSetTarget KEGscam_target;	
		KEGscam_topdown camSetTarget[_cxpos, _cypos, _czpos+(_h*0.6)];	
		{_x camSetFov _szoom} foreach _cameras;		
	
		// Static camera, follows unit from behind
		KEGscam_static camSetRelPos[sin(_dir)*(-(_l*_sdistance)), cos(_dir)*(-(_l*_sdistance)), 0.6*abs _sdistance];
		
		// Free camera, user rotates camera around target
		_d = (-(_l*(0.3 max _sdistance)));
		_z = sin(_fangleY)*(_l*(0.3 max _sdistance));
		KEGscam_free camSetRelPos[(sin(_fangle)*_d)*cos(_fangleY), (cos(_fangle)*_d)*cos(_fangleY), _z];
		KEGscam_free camCommit 0;
		
		// Flyby camera, no user control except zoom
		if(KEGs_target distance KEGscam_flyby > (_flybydst*1.1)) then {
			_flybydst = 20+(speed vehicle KEGs_target);
			KEGscam_flyby camSetRelPos[sin(_dir)*_flybydst, cos(_dir)*_flybydst, 1+((random _h)*1.5)];
			KEGscam_flyby camCommit 0;	
			KEGscam_target camCommit 0;	
		};
		
		// Top-down camera
		KEGscam_topdown camSetRelPos[0.0, -0.01, 2+((0 max _sdistance)*15)];
		KEGscam_topdown camCommit 0;	
	
		// Commit static and flyby cameras
		_comSpeed = 1.0 - ((speed vehicle KEGs_target)/70);
		if(_comSpeed < 0.0) then {_comSpeed = 0.0;};
		if((vehicle KEGs_target) distance KEGscam_static > 650) then {_comSpeed = 0}; // Jump immediately to distant target
		KEGscam_static camCommit _comSpeed/2;
		KEGscam_target camCommit _comSpeed/3;
		KEGscam_flyby camCommit _comSpeed;
		
		_mouseLastX = KEGsMouseCoord select 0;
		_mouseLastY = KEGsMouseCoord select 1;
		_camSelLast = lbCurSel _cLBCameras;
		_tgtSelLast = lbCurSel _cLBTargets;
		_lastTgt = KEGs_tgtIdx;		
	};	
	
	// Wait a moment. 150fps ought to be enough for everyone :-)
	_tt = time;
	sleep(1/150);
	_tbase = time-_tt;
}};

// Dialog closed with esc key
titleText["","BLACK IN", 0.5];

// Destroy cameras, markers, particlesources, etc.
{camDestroy _x} foreach _cameras;
deletevehicle KEGscam_target;
deletevehicle KEGscam_missile;
deletevehicle KEGscam_fullmap;
{deletemarkerlocal _x} foreach _markers;	 
deletevehicle _t;
camUseNVG false;
KEGsTags = false;
onMapSingleClick "";
{deletevehicle (_x select 1)} foreach KEGsTagSources;
KEGsTagSources = [];

// Remove eventhandlers TODO: does this work properly?
{
	_fh = _x getVariable "KEGsEHfired";
	//_kh = _x getVariable "KEGsEHkilled";
	if(typeName _fh == "SCALAR") then {_x removeEventHandler["fired", _fh]};
	//if(typeName _kh == "SCALAR") then {_x removeEventHandler["killed", _kh]};
} foreach _ehVehicles;

// Create a butterfly for player to fly with
_bpos = [(getpos (vehicle KEGs_target) select 0)-5+random 10, (getpos (vehicle KEGs_target) select 1)-5+random 10, 1];
_bird = "ButterFly" createVehicle _bpos;
_bird setvelocity[0,0,5];
_bird setpos _bpos;
_bird switchCamera "INTERNAL";
_bird cameraEffect["terminate","FRONT"];
_bird camCommand "manual on";

KEGsBird = _bird;
onMapSingleClick "KEGsBird setpos [_pos select 0, _pos select 1, 2];KEGsBird setvelocity[0,0,5];";

cutText["\n\n\n\n\nLand on ground to return to spectating\nClick at map to jump to location","PLAIN DOWN", 0.75];

// Wait until landed, delete bird & restart script
waitUntil{getpos _bird select 2 < 0.05 and speed _bird < 1};
onMapSingleClick "";

sleep(0.5);
titleText["","BLACK OUT", 0.5];
sleep(1);

_player switchCamera "INTERNAL";
_player cameraEffect["terminate","FRONT"];
deletevehicle _bird;
[_player, _killer, "noWait"] execVM "Client\Module\spect\specta.sqf";