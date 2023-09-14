Private['_bd','_built','_built_inf','_currentLevel','_currentUpgrades','_destination','_greenlight','_grp','_index','_paratroopers','_playerTeam','_ran','_ranDir','_ranPos','_side','_sideID','_starttime','_units','_vehicle','_vehicle_cargo','_vehicle_count','_vehicle_model','_vehicle_pilot','_vehicles'];

_side = _this select 1;
_destination = _this select 2;
_playerTeam = _this select 3;
_sideID = _side Call cti_CO_FNC_GetSideID;
_starttime = time;
_parachute = "B_parachute";

["INFORMATION", Format["Support_Paratroopers.sqf : [%1] Team [%2] has requested paratroopers.", _side, _playerTeam]] Call cti_CO_FNC_LogContent;

//--- Determine a random spawn location.
_ranPos = [];
_ranDir = [];
_bd = missionNamespace getVariable 'cti_BOUNDARIESXY';
if !(isNil '_bd') then {
	_ranPos = [
		[0+random(200),0+random(200),200+random(200)],
		[0+random(200),_bd-random(200),200+random(200)],
		[_bd-random(200),_bd-random(200),200+random(200)],
		[_bd-random(200),0+random(200),200+random(200)]
	];
	_ranDir = [45,145,225,315];
} else {
	_ranPos = [[0+random(200),0+random(200),400+random(200)],[15000+random(200),0+random(200),400+random(200)]];
	_ranDir = [45,315];
};

//--- Get the units and the air vehicle, exit if nil.
_currentUpgrades = (_side) Call cti_CO_FNC_GetSideUpgrades;
_currentLevel = _currentUpgrades select cti_UP_PARATROOPERS;
_units = missionNamespace getVariable Format ["cti_%1PARACHUTELEVEL%2", str _side, _currentLevel];
_vehicle_model = missionNamespace getVariable Format ["cti_%1PARACARGO", str _side];

if (isNil '_units' || isNil '_vehicle_model') exitWith {["ERROR", Format["Support_Paratroopers.sqf : [%1] Paratrooping vehicle or units are not defined.", _side]] Call cti_CO_FNC_LogContent};

//--- Determine how many vehicles do we need.
_vehicle_cargo = getNumber(configFile >> 'CfgVehicles' >> _vehicle_model >> 'transportSoldier');
if (_vehicle_cargo == 0) exitWith {["ERROR", Format["Support_Paratroopers.sqf : [%1] Paratrooping vehicle [%2] has no cargo capacity.", _side, _vehicle_model]] Call cti_CO_FNC_LogContent};
_vehicle_count = ceil((count _units) / _vehicle_cargo);

//--- Create the vehicles.
_vehicles = [];
_vehicle_pilot = missionNamespace getVariable Format ["cti_%1PILOT",str _side];
_ran = floor(random count _ranPos);
_grp = createGroup [_side, true];
_built = 0;
_dir = _ranDir select _ran;

for '_i' from 1 to _vehicle_count do {
	//--- Spawn the vehicle.
	_vehicle = createVehicle [missionNamespace getVariable Format ["cti_%1PARACARGO",str _side],(_ranPos select _ran), [], _dir, "FLY"];
	_vehicle addEventHandler ['killed', Format["[_this select 0, _this select 1, %1] Spawn cti_CO_FNC_OnUnitKilled",_sideID]];
	[[[_vehicle,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
	_vehicles pushBack _vehicle;
	
	//--- Spawn the pilot.
	_pilot = [_vehicle_pilot, _grp, [100,12000,0], _sideID] Call cti_CO_FNC_CreateUnit;
	_pilot moveInDriver _vehicle;
	_pilot doMove _destination;
	_grp setBehaviour 'CARELESS';
	_grp setCombatMode 'STEALTH';
	{_pilot disableAI _x} forEach ["AUTOTARGET","TARGET"];
	_built = _built + 1;
	
	_vehicle flyInHeight 150;
	_vehicle lockDriver true;
};

[str _side, 'VehiclesCreated', _built] Call cti_CO_FNC_UpdateStatistics;

//--- Create the units.
_built_inf = 0;
_index = 0;
_vehicle = _vehicles select _index;
_paratroopers = [];
{
    if (_built_inf <= _vehicle_cargo) then {
        //--- Spawn the unit.
        _unit = [_x, _grp, [100,12000,0], _sideID] Call cti_CO_FNC_CreateUnit;
        _unit moveInCargo _vehicle;
        _built_inf = _built_inf + 1;
        _paratroopers pushBack _unit;
        [_unit] joinSilent (leader _playerTeam);
        //--- If the unit amount exceed the cargo cap, swap to the next vehicle then.
        _built = _built + _built_inf; _built_inf = 0;
    };
} forEach _units;

[str _side,'UnitsCreated', _built] Call cti_CO_FNC_UpdateStatistics;

//--- Tell the group to move.
[_grp, _destination, "MOVE", 10] Call cti_SE_FNC_AIMoveTo;

//--- Loop until death or arrival.
_greenlight = false;
while {true} do {
	sleep 1;
	
	if (({alive _x} count _vehicles) == 0) exitWith {};//--- Vehicle destruction.
	if (({alive driver _x} count _vehicles) == 0) exitWith {};//--- Pilots are dead.
	if (!(isPlayer (leader _playerTeam)) || time - _starttime > 300) exitWith {};//--- Timeout out AI Controlled.
	
	_vehicleCoord = [(getPos vehicle (leader _grp)) select 0, (getPos vehicle (leader _grp)) select 1];
	_positionCoord = [_destination select 0, _destination select 1];
	if (_vehicleCoord distance _positionCoord < 300) exitWith {_greenlight = true};//--- Destination reached.
};

//--- Units are ready to bail!
if (_greenlight) then {
	_delay = if (_vehicle_model isKindOf "Plane") then {0.35} else {0.1};
	
	{
		_vehicle = _x;
		{
		    [_x, _vehicle, _parachute, _dir] spawn {
		        _paratrooper = _this select 0;
		        _vehicle = _this select 1;
		        _parachute = _this select 2;
		        _dir = _this select 3;

		        _paratrooper allowDamage false;
		        _inv = name _paratrooper;// Get Unique name for Unit's loadout.
                [_paratrooper, [missionNamespace, format["%1%2", "Inventory",_inv]]] call BIS_fnc_saveInventory;// Save Loadout
                removeBackpack _paratrooper;
                _paratrooper disableCollisionWith _vehicle;// Sometimes units take damage when being ejected.
                _paratrooper addBackPack _parachute;
                unassignvehicle _paratrooper;
                moveout _paratrooper;
                _paratrooper action ["openParachute", _paratrooper];
                _paratrooper setDir (_dir + 90);
		        sleep 5;
		        _paratrooper allowDamage true;
		        [_paratrooper, [missionNamespace, format["%1%2", "Inventory",_inv]]] call BIS_fnc_loadInventory;// Reload Loadout.
		        _paratrooper setDamage 0;
		    };
			sleep 0.3;
		} forEach ((crew _vehicle) - [driver _vehicle, gunner _vehicle, commander _vehicle]);
	} forEach _vehicles;
	
	//--- Once done, the air units can fly back to their source.
	[_grp, (_ranPos select _ran), "MOVE", 5] Call cti_SE_FNC_AIMoveTo;
	
	//--- Loop until death or arrival.
	while {true} do {
		sleep 1;
		
		if (({alive _x} count _vehicles) == 0) exitWith {};//--- Vehicle destruction.
		if (({alive driver _x} count _vehicles) == 0) exitWith {};//--- Pilots are dead.
		
		_vehicleCoord = [(getPos vehicle (leader _grp)) select 0, (getPos vehicle (leader _grp)) select 1];
		_positionCoord = [(_ranPos select _ran) select 0, (_ranPos select _ran) select 1];
		if (_vehicleCoord distance _positionCoord < 300) exitWith {};//--- Destination reached.
	};
} else {
	//--- Everything failed, remove the paratroopers.
	{deleteVehicle _x} forEach _paratroopers;
};

//--- In any case, cleanup the transporters.
{
	{deleteVehicle _x} forEach crew _x;//--- Remove the crew.
	deleteVehicle _x;//--- Remove the vehicle.
} forEach _vehicles;

//---- Clear the group.
deleteGroup _grp;