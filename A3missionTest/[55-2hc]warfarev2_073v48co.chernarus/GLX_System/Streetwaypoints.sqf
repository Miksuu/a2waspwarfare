// Example [this, getPos this, 300, 10] execVM "taskPatrol.sqf";
 
// Unit that should patrol
_unit   = _this select 0;
 
// Starting location
_start  = _this select 1;
 
// Maximum range
_range  = _this select 2;
 
// Amount of waypoints
_amount = _this select 3;
 
_grp = group _unit;

 //systemChat "Debug";
 
_i = 1;
 
while { _i < _amount} do {
 
    _distance = random _range;
    _wdir = random 360;
    _wx = (_start select 0) + (_distance * (sin _wdir));
    //systemChat str _wx;
	
	_wy = (_start select 1) + (_distance * (cos _wdir));
	//systemChat str _wy;
	
	//_wp = _grp addWaypoint [ [_wx,_wy] , 10, _i ];
 
	
	_POSasl=getTerrainHeightASL [_wx,_wy];
	//systemChat str _POSasl;
	
	_temppos2=ASLToATL [_wx,_wy,_POSasl];
	//systemChat str _temppos2;
	
	
	//hint _temppos2;
	_nearestRoad = [_temppos2, _range+600] call BIS_fnc_nearestRoad;
	//systemChat str _nearestRoad;
	
	
	sleep 0.1;
	
	_nearestRoadPosition= getPosATL _nearestRoad;
	//systemChat str _nearestRoadPosition;
	
	_nrx=_nearestRoadPosition#0;
	
	_nry=_nearestRoadPosition#1;
	
	
	_wp = _grp addWaypoint [ [_nrx,_nry] , 10, _i ];
 
 
    if ( _i == 1 ) then {
        //[_grp, _i] setWaypointBehaviour "SAFE";
        [_grp, _i] setWaypointCombatMode "RED";
        [_grp, _i] setWaypointFormation "COLUMN";
		//[_grp, _i] setWaypointSpeed "LIMITED"; 
    };
    
	/*
    _string = format["Waypoint %1",_i];
    _marker = createMarker [ _string, [_nrx,_nry] ];
    _string setMarkerColor "ColorBlue";
    _string setMarkerType "mil_dot";
    _string setMarkerText _string;
	*/
    _i = _i + 1;
    
};
 
_wp = _grp addWaypoint [_start,10,_amount];
[_grp, _amount] setWaypointType "CYCLE";

