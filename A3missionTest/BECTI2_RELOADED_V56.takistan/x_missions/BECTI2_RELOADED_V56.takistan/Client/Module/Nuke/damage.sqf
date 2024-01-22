//--- Nuke destruction.
Private ["_array","_blackListed","_target","_z"];
_target = _this select 0;

[_target] Spawn {
	Private ["_array","_range","_target"];
	_target = _this select 0;
	_blackListed = [];
	_blackListed pushback (missionNamespace getVariable "cti_C_DEPOT");
	_blackListed pushback "LocationCamp_F";
	
	_range = 1500;
	_array = _target nearEntities [["Man","Car","Motorcycle","Tank","Ship","Air","StaticWeapon"], _range];
	
	{if ((typeOf _x) in _blackListed) then {_array deleteAt _forEachIndex}} forEach _array;
	
	{
		{_x setDamage  [1, false]} forEach crew _x;
		_x setDamage [1, false];
	} forEach _array;
	
	for [{_z = 0},{_z < 5},{_z = _z + 1}] do {
		_arrayStatic = _target nearObjects ["Static", _range];
		{_x setDamage [1, false]} forEach _arrayStatic;
		
		_arrayHouse = _target nearObjects ["House", _range];
		{_x setDamage [1, false]} forEach _arrayHouse;
		
		_arrayHouseEP = _target nearObjects ["House_EP1", _range];
		{_x setDamage [1, false]} forEach _arrayHouseEP;
		
		sleep 3;
	};
	//--- Radiations.
	[_target] Spawn cti_CO_FNC_NukeRadiation;
};