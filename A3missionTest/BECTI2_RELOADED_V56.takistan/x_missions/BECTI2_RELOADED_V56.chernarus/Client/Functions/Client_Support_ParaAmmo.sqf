

Private['_args','_bd','_cargo','_cargoVehicle','_grp','_pilot','_playerTeam','_positionCoord','_ran','_ranDir','_ranPos','_side','_sideID','_timeStart','_vehicle','_vehicleCoord'];

_args = _this;
_side = _args select 1;
_sideID = (_side) Call cti_CO_FNC_GetSideID;

_playerTeam = (_args select 3);
["INFORMATION", Format ["Server_HandleSpecial.sqf: [%1] Team [%2] [%3] called in an Ammo Paradrop.", str _side, _playerTeam, name (leader _playerTeam)]] Call cti_CO_FNC_LogContent;
_ranPos = [];
_ranDir = [];

_bd = missionNamespace getVariable 'cti_BOUNDARIESXY';
if !(isNil '_bd') then {
	_ranPos = [
		//[0+random(200),0+random(200),400+random(200)],
		//[0+random(200),_bd-random(200),400+random(200)],
		//[_bd-random(200),_bd-random(200),400+random(200)],
		//[_bd-random(200),0+random(200),400+random(200)]
	
	
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

_timeStart = time;
//_ran = round(random((count _ranPos)-1));
_ran = floor(random count _ranPos);
_grp = createGroup [_side, true];
//_vehicle = createVehicle [missionNamespace getVariable Format ["cti_%1PARAVEHI",str _side],(_ranPos select _ran), [], (_ranDir select _ran), "FLY"];

//creates Marker,seems only on localhost this works if runs on client#but ammobox visible
//[[[_vehicle,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;



private _spawnpos_plane=(_ranPos select _ran);
_spawnpos_plane=[_spawnpos_plane#0,_spawnpos_plane#1,_spawnpos_plane#2+1000];//spawnfix for ru plane

_vehicle = [missionNamespace getVariable Format ["cti_%1PARAVEHI", _side], _spawnpos_plane ,_sideID, (_ranDir select _ran), true,true,true,"FLY"] Call cti_CO_FNC_CreateVehicle;


_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, (getPos _vehicle select 2)+3000];


[str _side,'VehiclesCreated',1] Call cti_CO_FNC_UpdateStatistics;
[str _side,'UnitsCreated',1] Call cti_CO_FNC_UpdateStatistics;
_pilot = [missionNamespace getVariable Format ["cti_%1PILOT",str _side],_grp,[100,12000,0],_sideID] Call cti_CO_FNC_CreateUnit;
_pilot moveInDriver _vehicle;
_pilot doMove (_args select 2);
_grp setBehaviour 'CARELESS';
_grp setCombatMode 'STEALTH';
_pilot disableAI 'AUTOTARGET';
_pilot disableAI 'TARGET';
[_grp,(_args select 2),"MOVE",10] Call cti_SE_FNC_AIMoveTo;
Call Compile Format ["_vehicle addEventHandler ['Killed',{[_this select 0,_this select 1,%1] Spawn cti_CO_FNC_OnUnitKilled}]",_sideID];

//_vehicle flyInHeight (300 + random(75));
_vehicle flyInHeight 150;



_cargo = (crew _vehicle) - [driver _vehicle, gunner _vehicle, commander _vehicle];
_cargoVehicle = [missionNamespace getVariable Format ["cti_%1PARAAMMO", _side], [0,0,50] ,_sideID, 0, false] Call cti_CO_FNC_CreateVehicle;


_cargoVehicle attachTo [_vehicle,[0,0,-2]];


emptyQueu pushBack (_cargoVehicle);
[_cargoVehicle] Spawn cti_SE_FNC_HandleEmptyVehicle;

while {true} do {
	sleep 1;
	if (!alive _pilot || !alive _vehicle || isNull _vehicle || isNull _pilot || !alive _cargoVehicle) exitWith {};
	if (!(isPlayer (leader _playerTeam)) || time - _timeStart > 500) exitWith {{_x setDammage 1} forEach (_cargo+[_pilot,_vehicle,_cargoVehicle]);deleteGroup _grp};
	_vehicleCoord = [getPos _pilot select 0,getpos _pilot select 1];
	_positionCoord = [(_args select 2) select 0,(_args select 2) select 1];
	if (_vehicleCoord distance _positionCoord < 100) exitWith {};
};

_cargoVehicle attachTo [_vehicle,[0,0,-8.5]];

detach _cargoVehicle;

[_cargoVehicle,_side] Spawn {
	Private ['_chute','_side','_vehicle'];
	_vehicle = _this select 0;
	_side = _this select 1;
	sleep 2;
	if (!alive _vehicle) exitWith {};
	_chute = (missionNamespace getVariable Format['cti_%1PARACHUTE',str _side]) createVehicle [0,0,20];
	_chute setPos [getPos _vehicle select 0, getPos _vehicle select 1, (getPos _vehicle select 2) - 11];
	_chute setDir (getDir _vehicle);
	_vehicle attachTo [_chute,[0,0,0]];
	waitUntil {getPos _vehicle select 2 < 10 || !alive _vehicle};
	detach _vehicle;
	sleep 10;
	deleteVehicle _chute;
};

//[_grp,(_ranPos select _ran),"MOVE",10] Call cti_SE_FNC_AIMoveTo;
_pilot doMove (_ranPos select _ran);
while {true} do {
	sleep 1;
	if (!alive _pilot || !alive _vehicle || isNull _vehicle || isNull _pilot) exitWith {};
	_vehicleCoord = [getPos _pilot select 0,getpos _pilot select 1];
	_positionCoord = [(_ranPos select _ran) select 0,(_ranPos select _ran) select 1];
	if (_vehicleCoord distance _positionCoord < 500) exitWith {};
	if (time - _starttime > 900) exitWith {};//delete all after 15min
};

//deleteVehicle _pilot;
//all vehiclestuff need crew delete 2024_0227
_pilot call CTI_CO_FNC_DELETE;

//deleteVehicle _vehicle;
_vehicle call CTI_CO_FNC_DELETE;

deleteGroup _grp;