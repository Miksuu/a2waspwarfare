Private ["_ammo","_irLock","_missile","_source","_unit"];
_unit = _this select 0;
_ammo = _this select 1;
_source = _this select 2;
_missile= _this select 4;
//_missile = nearestObject [_source,_ammo];
if (isNull _missile) exitWith {};



if ((_source in ECM_SYNC_AREA_UNITS)||(_source in ECM_SYNC_AREA_VEHICLES)) then {


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


}else{



	_source = getPos _source;
	_distance = _unit distance _source;
	
	//_limit = missionNamespace getVariable "cti_C_GAMEPLAY_MISSILES_RANGE";
	
	_limit=3000;
	
	if (_distance > _limit) then {
		waitUntil {_missile distance _source > _limit};
		deleteVehicle _missile;
	};
};