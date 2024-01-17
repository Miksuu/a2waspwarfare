Private ["_action","_actionID","_caller","_ehq","_whq","_index","_isAttached","_lifter","_position","_sorted","_type","_vehicle","_vehicles"];

_lifter = _this select 0;
_caller = _this select 1;
_actionID = _this select 2;
_ehq = ['CUP_O_BTR90_HQ_RU'];
_whq = ['CUP_B_LAV25_HQ_USMC'];

if (_caller != driver _lifter) exitWith {};

/*
if ((typeOf _lifter) in Zeta_Special) then {
	if (speed _lifter > 20) exitWith {};
} else {
	if ((speed _lifter > 20)||((getpos _lifter select 2)<2)) exitWith {};
};
*/
//--- nearEntities handle living units.
_vehicles1 = _lifter nearObjects ["LandVehicle", 15];

_vehicles2 = _lifter nearObjects ["Land_Pod_Heli_Transport_04_medevac_F", 25];

_vehicles3 = _lifter nearObjects ["Land_Device_slingloadable_F", 25];


//["Land_Device_assembled_F","Strategic","Building","Static","All"]
//["Land_Device_slingloadable_F","FloatingStructure_F","All"]
//["Land_Pod_Heli_Transport_04_medevac_F","Pod_Heli_Transport_04_crewed_base_F","StaticWeapon","LandVehicle","Land","AllVehicles","All"]
_vehicles=_vehicles1+_vehicles2+_vehicles3;



if (count _vehicles < 1) exitWith {};

_vehicle = [_lifter,_vehicles] Call CTI_CO_FNC_GetClosestEntity;

if ((typeOf _vehicle in _ehq) && (!(alive _vehicle)) && (side _caller == WEST)) exitWith {hint "You can't airlift ennemy HQ wreck because someone thought it was a bit too much"};
if ((typeOf _vehicle in _whq) && (!(alive _vehicle)) && (side _caller == EAST)) exitWith {hint "You can't airlift ennemy HQ wreck because someone thought it was a bit too much"};
_type = typeOf _lifter;
_position = Zeta_DefaultPos;

/*
_index = Zeta_Special find _type;
if (_index != -1) then {_position = Zeta_SpecialPosition select _index};
*/


//if (count crew(_vehicle) > 0) exitWith {hint (localize 'STR_WF_INFO_Hook_Manned')};

_Zeta_Special_special= ["cwr3_o_an12"];

if  (typeOf _lifter in Zeta_Special) then {
	if  (typeOf _lifter in _Zeta_Special_special) then {
_position= [0,0,-3.5];
}else{
_position= [0,0,-2];


}}else{
_position = Zeta_DefaultPos;};

_vehicle attachTo [_lifter,_position];



_lifter setVariable ["Attached",true,false];
_lifter removeAction _actionID;

_action = _lifter addAction [localize "STR_WF_Lift_Detach","Client\Module\ZetaCargo\Zeta_Unhook.sqf"];

while {!cti_GameOver||!(alive _lifter) } do {
	sleep 2;
	_isAttached = _lifter getVariable "Attached";
	if ((getDammage _lifter > 0.3)||!_isAttached||isNull (driver _lifter)) exitWith {
		detach _vehicle;
		
		if ((((getPosASL _vehicle)#2) - (getTerrainHeightASL (getPosASL _vehicle))<0.1)) then {//---vehicle is under terrainlevel
		
		
		//_height = getTerrainHeightASL (getPosASL player);
		//hint str [(getPosATL this)#2),"|",(getPos this)#2)];
		
		_p=getPos _lifter;
		_vehicle setPos [(_p#0)+7,(_p#1)+7,(_p#2)];
			};
		
		_lifter removeAction _action;
		if (alive _lifter) then {_lifter addAction [localize "STR_WF_Lift","Client\Module\ZetaCargo\Zeta_Hook.sqf"]};
	};
};