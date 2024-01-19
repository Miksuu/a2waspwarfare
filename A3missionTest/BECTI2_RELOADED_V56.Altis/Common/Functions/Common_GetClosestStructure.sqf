private ["_center", "_distance", "_closest", "_structures", "_type"];

_type = _this select 0;
_center = _this select 1;
_structures = _this select 2;
_distance = if (count _this > 3) then { _this select 3 } else { 0 };

_closest = objNull;
_structures = [_type, _structures] call cti_CO_FNC_GetSideStructuresByType;

if (count _structures > 0) then { _closest = [_center, _structures] call cti_CO_FNC_GetClosestEntity };

if (_distance > 0 && _closest distance _center > _distance) then { _closest = objNull };

_closest