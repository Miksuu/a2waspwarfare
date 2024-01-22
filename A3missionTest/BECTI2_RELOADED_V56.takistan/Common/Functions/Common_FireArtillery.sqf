

Private["_ammo","_angle","_artillery","_burst","_destination","_dispersion","_direction","_distance","_FEH","_gunner","_i","_index","_minRange","_maxRange","_position","_radius","_reloadTime","_side","_type","_velocity","_watchPosition","_weapon","_xcoord","_ycoord","_allNAMES","_countA"];

_artillery = _this select 0;
_destination = _this select 1;
_side = _this select 2;
_radius = _this select 3;
_index = _this select 4;
_gunner = gunner _artillery;

if (_index == -1) exitWith {["WARNING", Format ["Common_FireArtillery.sqf: No artillery types were found for [%1].", _artillery]] Call cti_CO_FNC_LogContent};
if (isNull _gunner) exitWith {["WARNING", Format ["Common_FireArtillery.sqf: Artillery [%1] gunner is null.", _artillery]] Call cti_CO_FNC_LogContent};
if (isPlayer _gunner) exitWith {["WARNING", Format ["Common_FireArtillery.sqf: Artillery [%1] gunner is a player", _artillery]] Call cti_CO_FNC_LogContent};
if (_index == 0) then {

_allNAMES= missionNamespace getVariable Format ["cti_%1_ARTILLERY_CLASSNAMES",_side];
_countA=(count _allNAMES) -1;
_indexnumber=((missionNamespace getVariable Format ["cti_%1_ARTILLERY_CLASSNAMES",_side])select [1,_countA]) find [(typeOf (vehicle _gunner) )];
_indexshift=_indexnumber +1;

_minRange = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_RANGES_MIN",_side]) select (_index + _indexshift) ;
_maxRange = round(((missionNamespace getVariable Format ["cti_%1_ARTILLERY_RANGES_MAX",_side]) select (_index + _indexshift)) / (missionNamespace getVariable "cti_C_ARTILLERY"));
_weapon = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_WEAPONS",_side]) select (_index + _indexshift);
_ammo = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_AMMOS",_side]) select (_index + _indexshift);
_velocity = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_VELOCITIES",_side]) select (_index + _indexshift);
_dispersion = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_DISPERSIONS",_side]) select (_index + _indexshift);
} else {

_minRange = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_RANGES_MIN",_side]) select _index ;
_maxRange = round(((missionNamespace getVariable Format ["cti_%1_ARTILLERY_RANGES_MAX",_side]) select _index) / (missionNamespace getVariable "cti_C_ARTILLERY"));
_weapon = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_WEAPONS",_side]) select _index;
_ammo = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_AMMOS",_side]) select _index;
_velocity = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_VELOCITIES",_side]) select _index;
_dispersion = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_DISPERSIONS",_side]) select _index;


};


//--- Move function to global later on.
if (local player) then {[_artillery] Call cti_CO_FNC_ARTY_Prep};

//--- Artillery Calculations.
_position = getPos _artillery;
_xcoord = (_destination select 0) - (_position select 0);
_ycoord = (_destination select 1) - (_position select 1);
_direction =  -(((_ycoord atan2 _xcoord) + 270) % 360);
if (_direction < 0) then {_direction = _direction + 360};
_distance = sqrt ((_xcoord ^ 2) + (_ycoord ^ 2)) - _minRange;
_angle = (90-((( _distance)/_maxRange)*45))-10  ;
if (_angle < 45) then {_angle = 45};
if (_angle > 80) then {_angle = 80};
if (_distance < 0 || _distance + _minRange > _maxRange) exitWith {};
_getmag=currentMagazine _artillery;

//SPLIT BETWEEN doartilleryfire and script

if (!(_getmag == "CUP_30Rnd_105mmLASER_M119_M" )&& !(_getmag == "CUP_30Rnd_122mmLASER_D30_M" )&& !(_getmag == "2Rnd_155mm_Mo_LG" )&& !(typeOf _artillery in CTI_ARTY_SCRIPTBLACKLIST)  ) then {

//____________________________________________________________

_FEH = Call Compile Format ["_artillery addEventHandler ['Fired',{[_this select 4,_this select 6,%1,%2,%3,%4,%5,%6,%7,%8,%9] Spawn cti_CO_FNC_HandleArtillery}];",_ammo,_destination,_velocity,_dispersion,getPos _artillery,_distance,_radius,_maxRange,cti_Client_sideJoinedText];
{_gunner disableAI _x} forEach ['ANIM','MOVE','TARGET','AUTOTARGET'];
_watchPosition = [_destination select 0, _destination select 1, (_artillery distance _destination)/(tan(90-_angle))];
(_gunner) doWatch _watchPosition;
sleep (10 + random 4);
if !(alive (_gunner)) exitWith {if !(isNull _artillery) then {_artillery removeEventHandler ['Fired',_FEH]}};
if !(alive _artillery) exitWith {
	if (alive (_gunner)) then {{_gunner enableAI _x} forEach ['MOVE','TARGET','AUTOTARGET']};
};

if (_index == 0) then {
_indexnumber=((missionNamespace getVariable Format ["cti_%1_ARTILLERY_CLASSNAMES",_side])select [1,_countA]) find [(typeOf (vehicle _gunner) )];
_indexshift=_indexnumber +1;
_reloadTime = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_TIME_RELOAD",_side]) select (_index + _indexshift);
_burst = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_BURST",_side]) select (_index + _indexshift);
} else {
_reloadTime = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_TIME_RELOAD",_side]) select _index;
_burst = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_BURST",_side]) select _index;
};
for [{_i = 0},{_i < _burst},{_i = _i + 1}] do {
	sleep (_reloadTime+random 3);
	if (!alive (_gunner) || !alive _artillery) exitWith {};	
	[vehicle _gunner, _weapon] call BIS_fnc_fire;
};
sleep 10;
if !(isNull _artillery) then {_artillery removeEventHandler ['Fired',_FEH]};
sleep _reloadTime;
if (alive (_gunner)) then {{_gunner enableAI _x} forEach ['MOVE','TARGET','AUTOTARGET']};
if (local player) then {[_artillery] Call cti_CO_FNC_ARTY_Finish};

} else{
sleep (10 + random 4);

if (_index == 0) then {
_indexnumber=((missionNamespace getVariable Format ["cti_%1_ARTILLERY_CLASSNAMES",_side])select [1,_countA]) find [(typeOf (vehicle _gunner) )];
_indexshift=_indexnumber +1;
_reloadTime = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_TIME_RELOAD",_side]) select (_index + _indexshift);
_burst = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_BURST",_side]) select (_index + _indexshift);
} else {
_reloadTime = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_TIME_RELOAD",_side]) select _index;
_burst = (missionNamespace getVariable Format ["cti_%1_ARTILLERY_BURST",_side]) select _index;
};

for [{_i = 0},{_i < _burst},{_i = _i + 1}] do {
	//sleep _reloadTime;
	sleep (_reloadTime+random 3);
	if (!alive (_gunner) || !alive _artillery) exitWith {};
	_magazineType = currentMagazine _artillery;
	//--- Randomize Land Area.
	_distance = random (_distance / _maxRange * 100) + random _radius;
	_direction = random 360;
	//--- Default Position.
	_landDestination = [((_destination # 0)+((sin _direction)*_distance))+(random _dispersion)-(random _dispersion),(_destination # 1)+((cos _direction)*_distance)+(random _dispersion)-(random _dispersion),0];	
    _artillery doArtilleryFire [_landDestination, _magazineType, 1];
   	
};
sleep 10;
sleep _reloadTime;
};	
