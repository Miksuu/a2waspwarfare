/*
	Get units in an area regarding of the given sides.
	 Parameters:
		- Units
		- Sides to get.
*/

Private ["_count","_sides","_sideFriendly","_sideIgnored","_units"];

_units = _this select 0;
_sides = _this select 1;

_return = [];
for '_i' from 1 to count _sides do {_return pushBack []};

{
	_find = _sides find (side _x);
	if (_find != -1) then {(_return select _find) pushBack _x};
} forEach _units;

_return