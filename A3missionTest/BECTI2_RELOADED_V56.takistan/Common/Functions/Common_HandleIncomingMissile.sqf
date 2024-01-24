
/*
Private ["_ammo","_irLock","_missile","_source","_unit"];
_unit = _this select 0;
_ammo = _this select 1;
_source = _this select 2;

_missile = nearestObject [_source,_ammo];
if (isNull _missile) exitWith {};

_irLock = getNumber(configFile >> "CfgAmmo" >> _ammo >> "irLock"); //--- Get the ammo type.

if (_irLock == 1) then { //--- IR Lock is affected
	_source = getPos _source;
	_distance = _unit distance _source;
	
	_limit = missionNamespace getVariable "cti_C_GAMEPLAY_MISSILES_RANGE";
	
	if (_distance > _limit) then {
		waitUntil {_missile distance _source > _limit};
		deleteVehicle _missile;
	};
};
*/
Private ["_unit","_ammo","_source","_missile","_a","_b","_c","_d","_case1","_case2"];
_unit = _this select 0;
_ammo = _this select 1;
_source = _this select 2;
_missile= _this select 4;
//_missile = nearestObject [_source,_ammo];
if (isNull _missile) exitWith {};

//_unit ==target of missle

_a=_source in ECM_SYNC_AREA_UNITS;
_b=_source in ECM_SYNC_AREA_VEHICLES;
_c=_unit in OUTSIDE_SYNC_ECM_AREA_VEHICLES;//need be case handled
_d=_unit in ECM_SYNC_AREA_VEHICLES;//everytime


_case1=(_a==_c);//true if inf fire from in to out
_case2=(_b==_c);//true if veh fire from in to out

//['chat',ECM_SYNC_AREA_UNITS] remoteExecCall ["cti_CL_FNC_LocalizeMessage"];


//if ((_source in ECM_SYNC_AREA_UNITS)||(_source in ECM_SYNC_AREA_VEHICLES)||) then {
if ((_a)||(_b)||(_case1)||(_case2)||(_d)) then {//missle gets random walk +rangelimit


	if(_missile distance _unit < 15)then {deleteVehicle _missile;};	
	_destroyed=False;
	_pos = getPos _source;
	//['chat',"randomwalk"] remoteExecCall ["cti_CL_FNC_LocalizeMessage"];
waitUntil {
				if ((_destroyed)||( _missile distance _unit < 30)||(_missile distance _pos > 3000)) exitWith { true }; 
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


}else{//just 3k range if no ecm activ

//['chat',"3k way"] remoteExecCall ["cti_CL_FNC_LocalizeMessage"];

	_source = getPos _source;
	_distance = _unit distance _source;
	
	//_limit = missionNamespace getVariable "cti_C_GAMEPLAY_MISSILES_RANGE";
	
	_limit=3000;
	
	if (_distance > _limit) then {
		waitUntil {_missile distance _source > _limit};
		deleteVehicle _missile;
	};
};