/*
	File: taskDefend.sqf
	Author: Joris-Jan van 't Land

	

	Description:
	Group will man nearby static defenses and guard the position.

	Parameter(s):
	_this select 0: group (Group)
	_this select 1: defense position (Array)
	
	Returns:
	Boolean - success flag
*/

//Validate parameter count
if ((count _this) < 2) exitWith {debugLog "Log: [taskDefend] Function requires at least 2 parameters!"; false};

private ["_grp", "_pos"];
_grp = _this select 0;
_pos = _this select 1;

//Validate parameters
if ((typeName _grp) != (typeName grpNull)) exitWith {debugLog "Log: [taskDefend] Group (0) must be a Group!"; false};
if ((typeName _pos) != (typeName [])) exitWith {debugLog "Log: [taskDefend] Position (1) must be an Array!"; false};


//Spawn in closest Building
_leader=leader _grp;

 _unitsS = units _leader;  
 _house = nearestBuilding _leader;  
 _house = _house buildingPos -1; 
 _house = _house call BIS_fnc_arrayShuffle;  
 if (count _unitsS > count _house) then {_unitsS resize (count _house);}; 
 { 
  //doStop _x;
  _x setUnitPos selectRandom ["UP","UP","MIDDLE"]; 
  _x setPos (_house select _forEachIndex); 
  _x setDir random 360; 
 } foreach _unitsS;  
 










_grp setBehaviour "SAFE";

private ["_list", "_units"];
_list = _pos nearObjects ["StaticWeapon", 200];
_units = (units _grp) - [leader _grp]; //The leader should not man defenses
_staticWeapons = [];

//Find all nearby static defenses without a gunner
{
	if ((_x emptyPositions "gunner") > 0) then 
	{
		_staticWeapons = _staticWeapons + [_x];	
	};
} forEach _list;






//Have the group man most empty static defenses
{
	//Are there still units available?
	if ((count _units) > 0) then 
	{
		//Big random chance
		if ((random 1) > 0.2) then 
		{
			private ["_unit"];
			_unit = (_units select ((count _units) - 1));
			
			_unit assignAsGunner _x;
			[_unit] orderGetIn true;
			
			_units resize ((count _units) - 1);
		};
	};
} forEach _staticWeapons;

/*
//Give the rest a guard WP.
private ["_wp"];
_wp = _grp addWaypoint [_pos, 10];
_wp setWaypointType "GUARD";
*/

//_grp = group _unit;
 
_i = 1;
 
while { _i < 10} do {
 
    _distance = random 500;
    _wdir = random 360;
    _wx = (_pos select 0) + (_distance * (sin _wdir));
    _wy = (_pos select 1) + (_distance * (cos _wdir));
    _wp = _grp addWaypoint [ [_wx,_wy] , 10, _i ];
 
    if ( _i == 1 ) then {
        //[_grp, _i] setWaypointBehaviour "SAFE";
        
		
		[_grp, _i] setWaypointCombatMode "RED";
        [_grp, _i] setWaypointFormation "COLUMN";
		
		//[_grp, _i] setWaypointSpeed "LIMITED"; 
		
    };
    
   
 
    _i = _i + 1;
    
};
 
_wp = _grp addWaypoint [_pos,10,10];
[_grp, 10] setWaypointType "CYCLE";





private ["_handle"];
_handle = _units spawn 
{
	sleep 5;
	
	//Make some of the remaining unit sit down.
	{
		if ((random 1) > 0.4) then 
		{
			doStop _x;
			
			sleep 0.5;
			
			_x action ["SitDown", _x];	
		};	
	} forEach _this;
};

true