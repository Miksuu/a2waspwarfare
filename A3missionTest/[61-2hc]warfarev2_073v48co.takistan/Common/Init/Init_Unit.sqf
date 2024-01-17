/*
	Initialize a unit for clients (JIP Compatible).
*/

Private ["_get","_isMan","_logik","_side","_sideID","_unit","_unit_kind","_upgrades"];

_unit 	   = _this select 0;
_sideID    = _this select 1;
_unit_kind = typeOf _unit;

if !(alive _unit) exitWith {}; //--- Abort if the unit is null or dead.

if(isNil 'commonInitComplete')then{ commonInitComplete = false; };
waitUntil {commonInitComplete}; //--- Wait for the common part.
_side = (_sideID) Call cti_CO_FNC_GetSideFromID;
_logik = (_side) Call cti_CO_FNC_GetSideLogic;



waitUntil {!isNil {_logik getVariable "cti_upgrades"}};


_upgrades = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideUpgrades;


	






// --- [Generic Vehicle initialization] (Run on all clients AND server)

//if !(local player) exitWith {}; //--- We don't need the server to process it.
waitUntil {clientInitComplete}; //--- Wait for the client part.
sleep 2; //--- Wait a bit.


_unit 	addEventHandler ["HandleDamage", {  
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"]; 
	
	_damage =_damage * SCALE_DAMAGE_COEFF; 
	
	_damage 
	  }];


//_unit execVM "Client\Module\IgiLoad\IgiLoad.sqf";
//[_unit] call IL_Init_Veh;
_isMan = if (_unit isKindOf 'Man') then {true} else {false};
// --- 				[Generic Vehicle initialization] (Run on all clients)


//disable vanilla lift for helicopter, rest need ropes for towing
//if (_unit_kind isKindOf "Helikopter") then{_unit enableRopeAttach false;};
_unit enableRopeAttach false;

//zeta
if(!isNil 'Zeta_Lifter')then{
	if (_unit_kind in Zeta_Lifter) then { //--- Units that can lift vehicles.
	
if (_upgrades select CTI_UP_AIRLIFT > 0) then {
	_unit addAction [localize 'STR_WF_Lift','Client\Module\ZetaCargo\Zeta_Hook.sqf']
		};
	};
};


if (_unit_kind in (missionNamespace getVariable "cti_REPAIRTRUCKS")) then { //--- Repair Trucks.
	//--- Build action.
	
	
	_unit addAction [localize 'STR_WF_BuildMenu_Repair','Client\Action\Action_BuildRepair.sqf', [], 1000, false, true, '', Format['side player == side _target && alive _target && player distance _target <= %1', missionNamespace getVariable 'cti_C_UNITS_REPAIR_TRUCK_RANGE']];
	
	
	
	
	
	//_unit addAction ["<t color='#504315'>" + ('Bulldozer 1000$') + "</t>",'Client\Action\Action_Bulldozer_Repairtruck.sqf', [], 995, false,true, '', "((alive _target) && (player distance _target <= 5))"];
	
	_unit addAction [localize 'STR_WF_Repair_Camp','Client\Action\Action_RepairCamp.sqf', [], 97, false, true, '', '[_unit] call cti_CL_FNC_Client_GetNearestCamp'];

	if ((missionNamespace getVariable "cti_C_GAMEPLAY_VICTORY_CONDITION") != 1) then { //--- Repair HQ Ability.
		//--- Repair MHQ action.
		_unit addAction [localize 'STR_WF_Repair_MHQ','Client\Action\Action_RepairMHQ.sqf', [], 98, false, true, '', 'alive _target'];
	};
};


if (typeOf _unit in (missionNamespace getVariable Format["cti_%1REPAIRTRUCKS", _side])) then { 
	//--- Bulldozer
	_unit addAction ["<t color='#504315'>" + ('Bulldozer 1000$') + "</t>",'Client\Action\Action_Bulldozer_Repairtruck.sqf', [], 995, false,true, '', "((alive _target) && (player distance _target <= 5))"];
	

};

if (typeOf _unit in (missionNamespace getVariable Format["cti_%1ECMVEHICLE", _side])) then { 

	if (typeOf _unit == "Land_Device_slingloadable_F") then {

		//DAMAGE HANDLER for ECM vehicle

		//create ID name
		_varname= str _unit;
		_OBJECTid=_varname+"id";


		_OBJECTid_damage=_OBJECTid+"damage";
		private _CHECKVALUE= missionNamespace getVariable _OBJECTid_damage;
		if (isNil "_CHECKVALUE") then {
		_unit addEventHandler ['HitPart', {_this Spawn cti_CO_FNC_HandleDamage_Object}];

		_CHECKVALUE=[0,_OBJECTid_damage];
		missionNamespace setVariable [_OBJECTid_damage, _CHECKVALUE];

	};
};

	_unit addAction ["ECM-SWITCH","Common\Module\ECM\Functions\Init_ECMobject.sqf","",95,true,true,"","(((_this distance _originalTarget)<5))",5,true,"",""];
};


if (_unit isKindOf "Tank" || _unit isKindOf "Wheeled_APC_F" || _unit isKindOf "Car" || typeOf _unit in (missionNamespace getVariable Format["cti_%1REPAIRTRUCKS", _side])) then { //--- Tanks.
	//--- Valhalla Low gear.
	
	//_unit addAction ['EARPLUGS','Client\Module\Jumper\Earplugtoogle.sqf'];
	_unit addAction ["<t color='#FFBD4C'>"+(localize "STR_ACT_LowGearOn")+"</t>","Client\Module\Valhalla\LowGear_Toggle.sqf", [], 91, false, true, "", "((player==driver _target)||(CTI_P_Controlled==driver _target)) && !Local_HighClimbingModeOn && canMove _target"];
	_unit addAction ["<t color='#FFBD4C'>"+(localize "STR_ACT_LowGearOff")+"</t>","Client\Module\Valhalla\LowGear_Toggle.sqf", [], 91, false, true, "", "((player==driver _target)||(CTI_P_Controlled==driver _target)) && Local_HighClimbingModeOn && canMove _target"];
};

if (_unit isKindOf "Ship") then { //--- Boats.(no ships for now)
	//--- Push action.
	_unit addAction [localize "STR_WF_Push","Client\Action\Action_Push.sqf", [], 93, false, true, "", 'driver _target == _this && alive _target && speed _target < 30'];
};




/*
if (_unit isKindOf "Air") then { //--- Air units.
	if ((getNumber (configFile >> 'CfgVehicles' >> _unit_kind >> 'transportSoldier')) > 0) then { //--- Transporters only.
		//--- HALO action.
		
		
		_unit addAction ['HALO','Client\Action\Action_HALO.sqf', [], 97, false, true, '', Format['getPos _target select 2 >= %1 && alive _target', missionNamespace getVariable 'cti_C_PLAYERS_HALO_HEIGHT']];
		
		
		//--- Cargo Eject action.
		_unit addAction [localize 'STR_WF_Cargo_Eject','Client\Action\Action_EjectCargo.sqf', [], 99, false, true, '', 'driver _target == _this && alive _target'];
	};
*/


if (_unit isKindOf "Air") then { //--- Air units.
	//if ((getNumber (configFile >> 'CfgVehicles' >> _unit_kind >> 'transportSoldier')) > 0) then { //--- ALL AIR NOW,LIFE HAS MORE VALUE THAN $
		//--- HALO action.
		
		//_unit addAction ['EARPLUGS','Client\Module\Jumper\Earplugtoogle.sqf'];
		
		
		_unit addAction ['HALO','Client\Action\Action_HALO.sqf', [], 97, false, true, '', Format['getPos _target select 2 >= %1 && alive _target', missionNamespace getVariable 'cti_C_PLAYERS_HALO_HEIGHT']];
		
		//debugstate
		_unit addAction [localize 'STR_WF_Eject','Client\Action\Action_WAIO.sqf', [], 97, false, true, '', Format['getPos _target select 2 >= %1 && alive _target', missionNamespace getVariable 'cti_C_PLAYERS_WAIO_HEIGHT']];
		//_unit addAction ['EjectDEBUG','Client\Action\Action_WAIO.sqf', [], 97, false, true, '', Format['getPos _target select 2 >= %1 && alive _target', missionNamespace getVariable 'cti_C_PLAYERS_WAIO_HEIGHT']];
		
		
		//--- Cargo Eject action.(maybe useless noe. ZETA reimplementet as easy liftoption,but this stays for now)
		_unit addAction [localize 'STR_WF_Cargo_Eject','Client\Action\Action_EjectCargo.sqf', [], 99, false, true, '', 'driver _target == _this && alive _target'];
	//};





	//--- AAR Tracking.
	if (cti_Client_SideJoined != _side) then { //--- Track the unit via AAR System, skip if the unit side is the same as the player one.
		[_unit, _side] call cti_CO_FNC_TRACK_AIR_TARGETS;
	};

	if (_unit isKindOf "Plane") then { //--- Planes.
		_unit addAction [localize "STR_WF_TaxiReverse","Client\Action\Action_TaxiReverse.sqf", [], 92, false, true, "", 'driver _target == _this && alive _target && speed _target < 4 && speed _target > -4 && getPos _target select 2 < 4'];
	};
};

// --- 				[Side specific initialization] (Run on the desired client team).
waitUntil {!isNil 'sideID'};
if (sideID != _sideID) exitWith {};

Private ["_color","_markerName","_params","_size","_txt","_type"];

/* common now used for Minefields,rest is patched so thats the easyest way
//--- Map Marker tracking.
_type = "mil_dot";
_color = missionNamespace getVariable (Format ["cti_C_%1_COLOR", _side]);
_size = [1,1];
_txt = "";
_params = [];
*/

_type = "KIA";
//_color = missionNamespace getVariable (Format ["cti_C_%1_COLOR", _side]);

_color = "ColorRed";
_size = [0.5,0.5];
_txt = "";
_params = [];

unitMarker = unitMarker + 1;
_markerName = Format ["unitMarker%1", unitMarker];

if (_isMan) then { //--- Man.
	_type = "mil_dot";
	_size = [0.5,0.5];
	if (group _unit == group player) then {
		_color = "ColorOrange";
		_txt = (_unit) Call cti_CO_FNC_GetAIDigit;
	};
	_params = [_type,_color,_size,_txt,_markerName,_unit,1,true,"waypoint",_color,false,_side,[1,1]];
} else { //--- Vehicle.

//_tankicon=["loc_radio","loc_LetterI"] ;

// if (local _unit && isMultiplayer) then {_color = "ColorOrange";};
	
 if (local _unit && isMultiplayer) then {
	if (_unit isKindOf "Tank") then {_type = "loc_radio";_color = "ColorOrange";_size = [1,1];};//--- Tanks
}else{	
	if (_unit isKindOf "Tank") then {_type = "loc_radio";_color =missionNamespace getVariable (Format ["cti_C_%1_COLOR", _side]);_size = [1,1];};//--- Tankstest
};	


 if (local _unit && isMultiplayer) then {	
	if (_unit isKindOf "Car"||_unit isKindOf "APC"||_unit isKindOf "Wheeled_APC") then {_type = "loc_car";_color = "ColorOrange";_size = [1,1];};//--- Wheeled
}else{
	if (_unit isKindOf "Car"||_unit isKindOf "APC"||_unit isKindOf "Wheeled_APC") then {_type = "loc_car";_color = missionNamespace getVariable (Format ["cti_C_%1_COLOR", _side]);_size = [1,1];};//--- Wheeled
};	


 if (local _unit && isMultiplayer) then {	
	if (_unit isKindOf "Motorcycle") then {_type = "mil_dot";_color = "ColorOrange";_size = [1,1];};//--- Bike
}else{	
	if (_unit isKindOf "Motorcycle") then {_type = "mil_dot";_color = missionNamespace getVariable (Format ["cti_C_%1_COLOR", _side]);_size = [1,1];};//--- Bike
};		
	
	
 if (local _unit && isMultiplayer) then {	
	if (_unit isKindOf "Air") then {_type = "loc_heli";_color = "ColorOrange";_size = [1,1];};//--- Helikopter
}else{	
	if (_unit isKindOf "Air") then {_type = "loc_heli";_color = missionNamespace getVariable (Format ["cti_C_%1_COLOR", _side]);_size = [1,1];};//--- Helikopter
};		
	
 if (local _unit && isMultiplayer) then {		
	if (_unit isKindOf "Plane") then {_type = "loc_plane";_color = "ColorOrange";_size = [1,1];};//--- Plane
}else{	
	if (_unit isKindOf "Plane") then {_type = "loc_plane";_color = missionNamespace getVariable (Format ["cti_C_%1_COLOR", _side]);_size = [1,1];};//--- Plane
};		
	
	
	//Mapmarker for static arty called by server/construction/construction_stationarydefense.sqf
	if (_unit isKindOf "StaticWeapon") then {_type = "loc_ViewTower";_color = "ColorPink";_size = [1,1];};//--- Arty
	
	
	if (typeOf _unit =="Land_Pod_Heli_Transport_04_medevac_F") then {_type = "loc_heal";_size = [1,1];};//--- Pod

	if (typeOf _unit =="Land_Device_slingloadable_F") then {_type = "loc_Transmitter";_size = [0.75,0.75];};//--- ECM


							
	

	if (_unit_kind in (missionNamespace getVariable Format['cti_%1REPAIRTRUCKS',str _side])) then {_type = "loc_repair";_color = "ColorUNKNOWN";_size = [1,1];};//--- Repair.
	if (_unit_kind in (missionNamespace getVariable Format['cti_%1AMBULANCES',str _side])) then {/*_type = "loc_heal";*/_color = "ColorYellow";_size = [1,1];};//--- Medical.
	if (_unit_kind in (missionNamespace getVariable Format['cti_%1SALVAGETRUCK',str _side])) then {_type = "loc_Truck";_color = "ColorGreen";_size = [1,1];};//--- Salvage.
	if (_unit_kind in (missionNamespace getVariable Format['cti_%1AMMOTRUCKS',str _side])) then {_type = "loc_Rifle";_color = "ColorRed";_size = [1,1];};//--- Ammo.
	if (_unit_kind in (missionNamespace getVariable Format['cti_%1ARTYVEHICLE',str _side])) then {/*_type = "mil_dot";*/_color = "ColorPink";_size = [1,1];};//--- Arty.
	
	
	
	_params = [_type,_color,_size,_txt,_markerName,_unit,1,true,"waypoint",_color,false,_side,[2,2]];
        if (_unit == ((_side) Call cti_CO_FNC_GetSideHQ)) then {_color = "ColorOrange";_params = ['b_hq',_color,[1,1],'HQ','HQUndeployed',_unit,0.2,false,'','',false,_side];};//--- HQ.


};

if !(_isMan) then { //--- Vehicle Specific.
	if ((missionNamespace getVariable "cti_C_GAMEPLAY_MISSILES_RANGE") != 0) then { //--- Max missile range.
		_unit addEventHandler ['incomingMissile', {_this Spawn cti_CO_FNC_HandleIncomingMissile}]; //--- Handle incoming missiles.
	};
};

_params Spawn cti_CO_FNC_MarkerUpdate;
