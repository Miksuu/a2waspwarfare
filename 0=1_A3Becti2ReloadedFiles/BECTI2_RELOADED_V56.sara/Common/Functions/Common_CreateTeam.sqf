Private ['_canCreate','_commander','_crews','_driver','_firstDone','_global','_gunner','_list','_lockVehicles','_position','_probability','_side','_sideID','_team','_type','_unit','_units','_vehicle','_vehicles','_rearmor'];

_list = _this select 0;
_position = _this select 1;
_side = _this select 2;
_sideID = (_side) Call cti_CO_FNC_GetSideID;
_lockVehicles = _this select 3;
_team = _this select 4;
_global = if (count _this > 5) then {_this select 5} else {true};
_probability = if (count _this > 6) then {_this select 6} else {-1};
_town = if (count _this > 7) then {_this select 7} else {nil};
_units = [];
_vehicles = [];
_crews = [];
_firstDone = false;

if (typeName _list == "STRING") then {_list = [_list]};

//--- Create.
if(isNil "_team")then{
   _team = createGroup[_side, true];
};

{
sleep 0.05;
	if (_x isKindOf 'Man') then {
		_unit = [_x,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
		_units pushBack _unit;
	} else {

		_roadList = _position nearRoads (100);
		if (count (_roadList) > 0) then {
			_position = getposatl (_roadList call BIS_fnc_selectRandom);
		};
		
		_vehicle = [_x, _position, _sideID, 0, _lockVehicles, true, _global, "FORM"] Call cti_CO_FNC_CreateVehicle;
		_type = if (_vehicle isKindOf 'Man') then {
			missionNamespace getVariable Format ['cti_%1SOLDIER',_side]
		} else {
			if (_vehicle isKindOf 'Air') then {
				missionNamespace getVariable Format ['cti_%1PILOT',_side]
			} else {
				missionNamespace getVariable Format ['cti_%1CREW',_side]
			};
		};

		if (_vehicle emptyPositions 'driver' > 0) then {
			_driver = [_type,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
			_driver moveInDriver _vehicle;
			_crews pushBack _driver
		};
		if (_vehicle emptyPositions 'gunner' > 0) then {
			_gunner = [_type,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
			_gunner moveInGunner _vehicle;
			_crews pushBack _gunner
		};
		if (_vehicle emptyPositions 'commander' > 0) then {
			_commander = [_type,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
			_commander moveInCommander _vehicle;
			_crews pushBack _commander
		};
		_vehicle engineOn true;
		_vehicles pushBack _vehicle;
	};
} forEach _list;

{_team addVehicle _x} forEach _vehicles; //--- Add vehicles.

[_units,_vehicles,_team,_crews]