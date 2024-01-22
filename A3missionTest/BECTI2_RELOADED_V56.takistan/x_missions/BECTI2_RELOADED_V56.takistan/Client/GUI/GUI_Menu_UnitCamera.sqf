disableSerialization;
_display = _this select 0;
WF_MenuAction = -1;
mouseButtonUp = -1;

_cameraModes = ["Internal","External","Gunner","Group"];

_n = 1;
{lbAdd[21002,Format["[%1] %2",_n,name (leader _x)]];_n = _n + 1} forEach cti_Client_Teams;
_id = cti_Client_Teams find cti_Client_Team;
lbSetCurSel[21002,_id];
_currentUnit = (player) Call cti_CO_FNC_GetUnitVehicle;
_currentMode = "Internal";
_currentUnit switchCamera _currentMode;
_units = (Units (group player) - [player]) Call cti_CO_FNC_GetLiveUnits;
{lbAdd[21004,Format["(%1) %2",getText (configFile >> "CfgVehicles" >> (typeOf (vehicle _x)) >> "displayName"),name _x]];_n = _n + 1} forEach _units;

//--Don't check difficultyEnabled. Use three cam modes every time.--
_type = ["Internal","External","Ironsight"];
{lbAdd[21006,_x]} forEach _type;
lbSetCurSel[21006,0];

_map = _display displayCtrl 21007;
_map ctrlMapAnimAdd [0,.25,getPos _currentUnit];
ctrlMapAnimCommit _map;

ctrlEnable [160003, false];

while {true} do {
	sleep 0.1;
	
	_cameraSwap = false;
	if (Side player != cti_Client_SideJoined || !dialog) exitWith {};

	//--- Map click.
	if (mouseButtonUp == 0) then {
		mouseButtonUp = -1;
		_near = _map PosScreenToWorld[mouseX,mouseY];
		_list = _near nearEntities [["Man","Car","Motorcycle","Ship","Tank","Air"],200];
		if (count _list > 0) then {
			_objects = [];
			{if (!(_x isKindOf "Man") && side _x != cti_Client_SideJoined) then {if (count (crew _x) == 0) then {_objects = _objects - [_x]}};if (side _x == cti_Client_SideJoined) then {_objects = _objects + [_x]}} forEach _list;
			if (count _objects > 0) then {
				_currentUnit = ([_near,_objects] Call cti_CO_FNC_GetClosestEntity) Call cti_CO_FNC_GetUnitVehicle;
				_cameraSwap = true;
			};
		};
	};	
	
	//--- Leader Selection.
	if (WF_MenuAction == 101) then {
		WF_MenuAction = -1;
		_selected = leader (cti_Client_Teams select (lbCurSel 21002));
		_currentUnit = (_selected) Call cti_CO_FNC_GetUnitVehicle;
		_n = 0;
		_units = (Units (group _selected) - [_selected]) Call cti_CO_FNC_GetLiveUnits;
		lbClear 21004;
		{lbAdd[21004,Format["(%1) %2",GetText (configFile >> "CfgVehicles" >> (typeOf (vehicle _x)) >> "displayName"),name _x]];_n = _n + 1} forEach _units;
		_cameraSwap = true;
	};
	
	//--- Leader commands AIs.
	if (WF_MenuAction == 102) then {
		WF_MenuAction = -1;
		_currentUnit = (_units select (lbCurSel 21004)) Call cti_CO_FNC_GetUnitVehicle;
		_vehicle = vehicle _currentUnit;
		_crew = crew _vehicle;		
		{ 
			if(_x in (units group player)) then { 
				ctrlEnable [160003, true];
				}
				else
				{	
					ctrlEnable [160003, false];
				}; 
		} forEach _crew;		
		_cameraSwap = true;
	};
	
	//--- Camera Modes
	if (WF_MenuAction == 103) then {
		WF_MenuAction = -1;
		_currentMode = (_cameraModes select (lbCurSel 21006));
		_cameraSwap = true;
	};
	
	//--- Unflip button clicked
	if (WF_MenuAction == 140 && !(isNil "_currentUnit")) then {
		WF_MenuAction = -1;
		if(!(isNil "_currentUnit")) then {
			if(!(isPlayer (_currentUnit))) then {
				_vehicle = vehicle _currentUnit;			
			
				_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, 0.5];
				_vehicle setVelocity [0,0,-0.5];				
			};			
		};	
		_cameraSwap = true;
	};
	
	if !(alive _currentUnit) then {
		_currentUnit = (player) Call cti_CO_FNC_GetUnitVehicle;
		_cameraSwap = true;
	};
	
	//--- Update the Camera.
	if (_cameraSwap) then {
		ctrlMapAnimClear _map;
		_map ctrlMapAnimAdd [1,.25,getPos _currentUnit];
		ctrlMapAnimCommit _map;
		_currentUnit switchCamera _currentMode;
	};
};

closeDialog 0;
((player) Call cti_CO_FNC_GetUnitVehicle) switchCamera _currentMode;