Private ["_availableSpawn","_camps_side","_camps_total","_side"];

_side = _this;
_availableSpawn = [];

{
	if ((_x Call cti_CO_FNC_GetTotalCamps) == ([_x, _side] Call cti_CO_FNC_GetTotalCampsOnSide)) then {_availableSpawn pushBack _x};
} forEach (_side Call cti_CO_FNC_GetSideTowns);

_availableSpawn