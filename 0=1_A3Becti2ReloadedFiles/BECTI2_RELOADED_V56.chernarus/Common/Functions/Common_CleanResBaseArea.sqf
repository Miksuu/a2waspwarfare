Private ['_side', '_structure'];

_side = _this select 0;
_structure = _this select 1;

sleep 30;
_objectsToFind = cti_C_GARBAGE_OBJECTS + cti_C_STATIC_DEFENCE_FOR_COMPOSITIONS;
_objects = nearestObjects [getPosATL _structure, _objectsToFind, 150];

{
    if (_x isKindOf "StaticWeapon") then {
        _unit = gunner _x;
        if (alive _unit) then {
            deleteVehicle _unit;
        };
    };
    deleteVehicle _x;
} forEach _objects;