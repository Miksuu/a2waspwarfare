Private ["_actionID","_caller","_index","_lifter","_param","_sorted","_type","_vehicle","_vehicles"];

_lifter = _this select 0;
_caller = _this select 1;
_actionID = _this select 2;
_param = _this select 3;
_vehicle = _param select 0;

_lifter setVariable ["Attached",false];


_vehicles = _lifter nearObjects ["LandVehicle", 15];
if (count _vehicles < 1) exitWith {};
_vehicle = [_lifter,_vehicles] Call CTI_CO_FNC_GetClosestEntity;


_vehicle attachTo [_lifter,[0,0,-8.5]];

detach _vehicle;




_vehicle setVelocity (velocity _lifter);
//_lifter removeAction _actionID;




sleep 1;

if ((getPos _vehicle) select 2 < 0) then {_vehicle setPos [(getPos _vehicle) select 0,(getPos _vehicle) select 1,0];
_vehicle setVelocity [0,0,-0.1]};



//200m paradrop a bit buggy
/*
_para = "B_Parachute_02_F";
_DropPos1 = getpos _vehicle;
_Chute1 = createVehicle [_para, _DropPos1, [], 0, "NONE"];
_chute1 attachTo [_vehicle, [0, 0, 1]];
// Land safely
WaitUntil {((((position _vehicle) select 2) < 0.6) || (isNil "_chute1"))};
detach _vehicle;
_vehicle SetVelocity [0,0,-5];           
sleep 0.3;
_vehicle setPos [(position _vehicle) select 0, (position _vehicle) select 1, 1];
_vehicle SetVelocity [0,0,0];  
sleep 2;
deleteVehicle _Chute1;
*/



[_vehicle,_side] Spawn {
	Private ['_chute','_side','_vehicle'];
	_vehicleP = _this select 0;
	_side = _this select 1;
	sleep 2;
	if (!alive _vehicleP) exitWith {};
	//_chute = (missionNamespace getVariable Format['cti_%1PARACHUTE',str _side]) createVehicle [0,0,20];
	_chute = createVehicle ["NonSteerable_Parachute_F", position _vehicleP, [], 0, "CAN_COLLIDE"];
	
	
	//_chute = createVehicle ["B_Parachute_02_F", position _vehicle, [], 0, "CAN_COLLIDE"];

	_chute setPos [getPos _vehicleP select 0, getPos _vehicleP select 1, (getPos _vehicleP select 2) - 11];
	
	_chute setDir (getDir _vehicleP);
	
	_vehicleP attachTo [_chute,[0,0,0]];
	
	
	
	waitUntil {getPos _vehicleP select 2 < 10 || !alive _vehicleP};
	detach _vehicleP;
	
	
	
	sleep 10;
	deleteVehicle _chute;
	
};





_lifter removeAction _actionID;



/*
_damage = getDammage _vehicle;

_tmp = [_vehicle] spawn
{
	while {(getPosATL (_this select 0)) select 2 > 50} do
	{
		sleep 0.2;
	};
};
if (50 > 0) then
{
	while {(getPosATL _vehicle) select 2 > (50 + ((velocity _vehicle) select 2) * -0.5)} do
	{
		sleep 0.2;
	};
};
//	_chute = createVehicle ["NonSteerable_Parachute_F", position _vehicle, [], 0, "CAN_COLLIDE"];
_chute = createVehicle ["B_Parachute_02_F", position _vehicle, [], 0, "CAN_COLLIDE"];
_chute attachTo [_vehicle, _vehicle_pos];
_velocity = velocity _vehicle;
detach _chute;

_chute setVelocity _velocity;

_vehicle attachTo [_chute, _vehicle_pos];
------------------------------------------------

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



*/

