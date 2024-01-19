Private ["_ammo","_missile","_source","_unit","_destroyed","_ECMdir"];
_unit = _this select 0;
_ammo = _this select 1;
_source = _this select 2;
_missile= _this select 4;

//systemChat str _ammo;


	if (isNull _missile) exitWith {};
	if(_missile distance _unit < 15)then {deleteVehicle _missile;};	
	_destroyed=False;
waitUntil {
				if ((_destroyed)||( _missile distance _unit < 20)) exitWith { true }; 
				_destroyed=!alive _missile;
				//systemChat str _destroyed;
				
				_ECMdir = getdir _missile;
				_ECMdir = _ECMdir - (random 20);
				_missile setdir _ECMdir;
				_ECMdir = getdir _missile;
				_ECMdir = _ECMdir + (random 20);
				_missile setdir _ECMdir;
				sleep random 0.1;
				false
		 };	
	if !(_destroyed == True) then { deleteVehicle _missile;};
	//systemChat "läuft durch";
		
