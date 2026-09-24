/*
	Author: Marty
	Return the closest friendly FOB within range, or objNull.
	 Parameters:
		- Entity.
		- Range.
*/

Private ["_closest","_distance","_entity","_range"];

_entity = _this select 0;
_range = _this select 1;

_closest = objNull;
_distance = _range;
{if ((_x distance _entity) <= _distance) then {_closest = _x; _distance = _x distance _entity}} forEach (Call WFBE_CL_FNC_FOB_GetList);

_closest
