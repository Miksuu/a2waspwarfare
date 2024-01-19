/*
	Stealthstick's "Explosive-To-Vehicle" Script
	-Allows players to attach their explosive charges to any vehicle.
	https://github.com/DarthRogue/EtV/blob/master/addons/EtV/EtV.sqf
	
	
*/
EtV_ChargeableVehicles = ["Air","Ship","LandVehicle","Car","Motorcycle","Tank","Truck","Wheeled_APC","Tracked_APC","StaticWeapon","Autonomous","Support","Armored"];



EtV_InteractRange = 5;

CTI_ATTACH_BLACKLIST=[_unit];

EtV_ChargeCheck =
{
	params ["_charge","_unit"];
	private _hasIt = _charge in (magazines _unit);	
	private _return = (_hasIt && alive _unit);
	_return
};

EtV_TouchOff =
{
	private _array = _this select 3;
	private _unit = _array select 0;
	private _explosives = _unit getVariable ["charges",[]];
	{
		if(alive _x) then
		{
			detach _x;
			_x setDamage 1;
		};
	} forEach _explosives;
	_unit setVariable ["charges",[]];
};

EtV_UnitCheck =
{
	private ["_return"];
	private _unit = _this select 0;
	private _explosives = _unit getVariable ["charges",[]];

	//--- If vehicle dies the charge becomes ObjNull, we clear the array up.
	if (ObjNull in _explosives) then {
	    {_unit setVariable ["charges",_explosives - [ObjNull]];} forEach _explosives;
	};


	if(count _explosives > 0) then
	{
		_return = true;
	}
	else
	{
		_return = false;
	};
	
	_return
};

EtV_TimedCharge =
{
	params ["_explosive","_unit"];

	private _grp = createGroup sidelogic;
	private _illogic = _grp createUnit ["logic", Position _explosive, [], 0, "NONE"];
	[_illogic] join _grp;
	_illogic attachTo [_explosive];


	while {alive _explosive} do
	{
		waitUntil {sleep 1;!isNil {_illogic getVariable "timer"};};
		if(_illogic getVariable "timer" isEqualTo 0) exitWith 
		{
			private _charges = _unit getVariable ["charges",[]];
			_unit setVariable ["charges",_charges - [_explosive]];
			detach _explosive;
			_explosive setDamage 1;
		};
		sleep 1;
		private _oldTime = _illogic getVariable "timer";
		_illogic setVariable ["timer",_oldTime - 1];
	};
	// Radioman - Clean-up the logic
	deleteVehicle _illogic;
	
};

EtV_AttachCharge =
{
	private _array = _this select 3;
	private _charge = _array select 0;
	private _unit = _array select 1;
	private "_class";	
	private _nearVehicle = cursorObject;
	
	//get attach position
	
	private _pos = lineIntersectsSurfaces [
		AGLToASL positionCameraToWorld [0,0,0],
		AGLToASL positionCameraToWorld [0,0,1000],
		_unit,
		objNull,
		true,
		1,
		"GEOM",
		"NONE"
	];
	private _vector=_pos#0#1;
	_pos=_pos#0#0;
	
	
	
	if (getposASL _unit distance _pos > 4) then {
	
	hint (parseText(localize "STR_WF_TACTICAL_ArtilleryOutOfRange"));
	
	}else{	
	
	_unit removeMagazine _charge;
	
	switch _charge do
	{	
		case "APERSMine_Range_Mag":
		{
			_class = "APERSMine_Range_Ammo";
		};
			
		case "ClaymoreDirectionalMine_Remote_Mag":
		{
			_class = "ClaymoreDirectionalMine_Remote_Ammo";
		};

		case "SLAMDirectionalMine_Wire_Mag":
		{
			_class = "SLAMDirectionalMine_Wire_Ammo";
		};
		
		case "DemoCharge_Remote_Mag":
		{
			_class = "DemoCharge_Remote_Ammo";
		};
		
		case "SatchelCharge_Remote_Mag":
		{
			_class = "SatchelCharge_Remote_Ammo";
		};
		
		case "CUP_PipeBomb_M":
		{
			_class = "CUP_PipeBomb_Ammo";
		};		
	
	};
	
	private _explosive = _class createVehicle [0,0,0];

	[_explosive,_nearVehicle,_unit,_pos,_vector,_class] spawn	
	{
		params ["_explosive","_nearVehicle","_unit","_pos","_vector","_class"];
		sleep 1;
		_explosive setPosASL _pos;
		sleep 0.1;
		_explosive attachTo [_nearVehicle];
		sleep 0.1;
		
		if ((_class == "ClaymoreDirectionalMine_Remote_Ammo")||(_class == "SLAMDirectionalMine_Wire_Ammo"))then{
		//best solution i found, for xy it works mostly. 
		sleep 0.1;
			
		_dir=vectorDir _unit;
		_up=vectorUp _unit;
		
		_explosive setVectorDirAndUp  [_dir,_up];
		sleep 0.2;		
		_explosive setDir ((getDir _explosive) + 180);
			
		}else{
		
		sleep 0.1;
		_explosive setVectorUp _vector;
		
		};
		
		_unit addOwnedMine _explosive;
		side _unit revealMine _explosive;
		
		//_myMine setPosWorld getPosWorld _myMine; // synchronises the mine's direction over the network (special case)
		_explosive setPosWorld getPosWorld _explosive;
		
		
		_unit setVariable ["charges",(_unit getVariable ["charges",[]]) + [_explosive]];
		[_explosive,_unit] spawn EtV_TimedCharge;
	};
	};
};

EtV_ClosestExplosive =
{
	private _unit = _this select 0;
	private _charges = _unit getVariable ["charges",[]];
	private _newArray = [];
	{_newArray = _newArray + [player distance _x];} forEach _charges;
	private _closest = _newArray call BIS_fnc_lowestNum;
	private _selection = _newArray find _closest;
	private _charge = _charges select _selection;
	_charge
};

EtV_Timer =
{
	private _array = _this select 3;
	private _unit = _array select 0;
	private _explosive = [_unit] call EtV_ClosestExplosive;
	private _illogic = (nearestObjects [_explosive,["Logic"],50]) select 0;
	if(!isNil "_illogic") then
	{
		private _oldTime = _illogic getVariable ["timer",0];
		_illogic setVariable ["timer",_oldTime + 30];
		private _newTime = _illogic getVariable "timer";
		hint format ["Explosive timer set to %1 seconds.",_newTime];
	};
};

EtV_UnitCheckTimer =
{
	private _unit = _this select 0;
	private _explosives = _unit getVariable ["charges",[]];
	private _return = false;
	{if(_unit distance _x <= 5) exitWith {_return = true;};} forEach _explosives;
	_return
};