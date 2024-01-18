/*
	Return the closest object among a list
	 Parameters:
		- Entity.
		- List.
*/

Private["_distance","_nearest","_object","_objects"];

_object = _this select 0;
_objects = _this select 1;

_nearest = objNull;
_distance = 100000;
{
    _spawnLoc = _x;
    if(typeName _x == "ARRAY")then{_spawnLoc = _x select 0;};
    if!(isNil '_spawnLoc')then{
        _currentDistance = _spawnLoc distance _object;
        if (_currentDistance < _distance) then {_nearest = _spawnLoc;_distance = _currentDistance;};
    };
} forEach _objects;

_nearest