private ["_distance", "_found", "_sort", "_structure_type", "_structures", "_temp", "_type"];

_type = _this select 0;
_structures = _this select 1;
_sort = if (count _this > 2) then {_this select 2} else {false};
_distance = if (count _this > 3) then {_this select 3} else {-1};

_found = [];
{
	_structure_type = if (isNil{_x getVariable "cti_structure_type"}) then {""} else {_x getVariable "cti_structure_type"};
	if (_structure_type == _type) then { _found pushBack _x };
} forEach _structures;

if (count _found > 0 && typeName _sort in ["OBJECT","POSITION"]) then { 
	if (_distance != -1) then { 
		_temp = [];
		{ if (_x distance _sort <= _distance) then { _temp pushBack _x } } forEach _found;
		_found = _temp;
	};
	_found = [_sort, _found] call cti_CO_FNC_SortByDistance;
};

_found