/*
	Get enemies in area according to sides.
	 Parameters:
		- Units/Objects array.
		- Friendly Side.
		- {Ignored sides}
*/

Private ["_count","_sides","_sideFriendly","_sideIgnored","_units","_all_sides"];

_units = _this select 0;
_sideFriendly = _this select 1;
_sideIgnored = if (count _this > 2) then {_this select 2} else {[]};
_all_sides = missionNamespace getVariable "cti_C_TOWNS_ALL_SIDES";

_sides =  _all_sides - [_sideFriendly] - _sideIgnored;
_count = 0;

{_count = _count + (_x countSide _units);} forEach _sides;

_count