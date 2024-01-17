/*
	Return the known gear of a vehicle.
	 Parameters:
		- Vehicle
*/

Private ["_return"];

_return = [[],[],[]];

if (alive _this) then {
	_u = 0;
	{
		_content = _x select 0;
		_prefix = _x select 1;
		
		_items = _content select 0;
		_count = _content select 1;
		
		for '_i' from 0 to count(_items)-1 do {
			if (isNil {missionNamespace getVariable Format ["%1%2",_prefix,_items select _i]}) then {_items deleteAt _i;_count deleteAt _i};
		};
		
		_return set [_u, [_items, _count]];
		
		_u = _u + 1;
	} forEach [[getWeaponCargo _this, ""],[getMagazineCargo _this, "Mag_"],[getBackpackCargo _this, ""]];
};

_return