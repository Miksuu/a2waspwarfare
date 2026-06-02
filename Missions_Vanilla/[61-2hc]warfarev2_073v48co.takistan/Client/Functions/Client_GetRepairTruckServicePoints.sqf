/*
	Client helper: returns nearby service points that were built from a repair truck.
*/
Private ["_points","_range","_unit"];

_unit = _this select 0;
_range = missionNamespace getVariable "WFBE_C_UNITS_SUPPORT_RANGE";
_points = [];

{
	if (alive _x && (_x getVariable ["WFBE_RepairTruckServicePoint", false])) then {
		_points = _points + [_x];
	};
} forEach ((getPos _unit) nearEntities [["Base_WarfareBVehicleServicePoint"], _range]);

_points
