Private["_canMove","_count","_crew","_ignoreOwnerConflict","_member","_ownerConflict","_range","_team","_teamVehicles","_units","_vehicle"];

_team = _this select 0;
_canMove = _this select 1;

_member = objNull;
_range = 150;
if (count _this > 2) then {_member = _this select 2};
if (count _this > 3) then {_range = _this select 3};

_ignoreOwnerConflict = false;
if (count _this > 4) then {_ignoreOwnerConflict = _this select 4};

_teamVehicles = [];
_units = units _team;

 {
	_vehicle = vehicle _x;
 
 	if (_x != _vehicle && !(_vehicle in _teamVehicles)) then {_teamVehicles = _teamVehicles + [_vehicle]};
	if (_canMove && !canMove _vehicle) then {_teamVehicles = _teamVehicles - [_vehicle]};
	if (!IsNull _member && _member distance _vehicle > _range) then {_teamVehicles = _teamVehicles - [_vehicle]};

	_ownerConflict = false;
	_crew = crew _vehicle;
	{if (_x != leader _team && isPlayer _x) then {_ownerConflict = true}} forEach _crew;
	if (!_ignoreOwnerConflict && _ownerConflict) then {_teamVehicles = _teamVehicles - [_vehicle]};
 } forEach _units;

_teamVehicles


/* adapted a3 code (not fixed the artyproblem)
private["_center", "_group", "_local", "_move", "_range", "_vehicle", "_vehicles"];

_group = _this select 0;
_move = _this select 1;
_center = if (count _this > 2) then {_this select 2} else {objNull};
_range = if (count _this > 3) then {_this select 3} else {150};
_local = if (count _this > 4) then {_this select 4} else {false};

_vehicles = [];

{
	_vehicle = vehicle _x;
	
	if (_x != _vehicle && !(_vehicle in _vehicles)) then {_vehicles = _vehicles + [_vehicle]};
	if (_move && (!canMove _vehicle && !(_vehicle isKindOf "StaticWeapon"))) then {_vehicles = _vehicles - [_vehicle]};
	if (!isNull _center && _center distance _vehicle > _range) then {_vehicles = _vehicles - [_vehicle]};
	if (_local && !local _vehicle) then {_vehicles = _vehicles - [_vehicle]};
} forEach units _group;

_vehicles
*/




/*
  # HEADER #
	Script: 		Common\Functions\Common_GetTeamVehicles.sqf
	Alias:			CTI_CO_FNC_GetTeamVehicles
	Description:	Get the vehicles in use by a group
	Author: 		Benny, adapted from Mike Melvin
	Creation Date:	18-09-2013
	Revision Date:	17-10-2013
	
  # PARAMETERS #
    0	[Group]: The group
    1	[Boolean]: Retrieve only mobile vehicle (false for all)
    2	{Optionnal} [Object]: Exclude vehicles further than the entity (150 meters by default)
    3	{Optionnal} [Number]: Define the exclusion range
    4	{Optionnal} [Boolean]: Define whether non-local vehicles shall be skipped or not
	
  # RETURNED VALUE #
	[Array]: The current side upgrades
	
  # SYNTAX #
	(SIDE) call CTI_CO_FNC_GetSideUpgrades
	
  # EXAMPLE #
    _upgrades = (West) call CTI_CO_FNC_GetSideUpgrades
	  -> Return the current west upgrades levels
*/
/*
private["_center", "_group", "_local", "_move", "_range", "_vehicle", "_vehicles"];

_group = _this select 0;
_move = _this select 1;
_center = if (count _this > 2) then {_this select 2} else {objNull};
_range = if (count _this > 3) then {_this select 3} else {150};
_local = if (count _this > 4) then {_this select 4} else {false};

_vehicles = [];

{
	_vehicle = vehicle _x;
	
	if (_x != _vehicle && !(_vehicle in _vehicles)) then {_vehicles = _vehicles + [_vehicle]};
	if (_move && (!canMove _vehicle && !(_vehicle isKindOf "StaticWeapon"))) then {_vehicles = _vehicles - [_vehicle]};
	if (!isNull _center && _center distance _vehicle > _range) then {_vehicles = _vehicles - [_vehicle]};
	if (_local && !local _vehicle) then {_vehicles = _vehicles - [_vehicle]};
} forEach units _group;

_vehicles
*/