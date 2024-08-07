/*
	Initialize a unit for clients (JIP Compatible).
	Contributors : Marty.
*/

Private ["_get","_isMan","_logik","_side","_sideID","_unit","_unit_kind","_upgrades"];

_unit 				= _this select 0;
_sideID 	 		= _this select 1;
_unit_kind = typeOf _unit;

if !(alive _unit) exitWith {}; //--- Abort if the unit is null or dead.

if(isNil 'commonInitComplete')then{
	commonInitComplete = false;
};

waitUntil {commonInitComplete}; //--- Wait for the common part.


_side = (_sideID) Call GetSideFromID;
_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;

waitUntil {!isNil {_logik getVariable "wfbe_upgrades"}};
_upgrades = (_side) Call WFBE_CO_FNC_GetSideUpgrades;

// --- 				[Generic Vehicle initialization] (Run on all clients AND server)


if !(local player) exitWith {}; //--- We don't need the server to process it.

waitUntil {clientInitComplete}; //--- Wait for the client part.

sleep 2; //--- Wait a bit.

_isMan = if (_unit isKindOf 'Man') then {true} else {false};
// --- 				[Generic Vehicle initialization] (Run on all clients)

if(side _unit == east && !(_unit hasWeapon "NVGoggles")) then {
	_unit addWeapon "NVGoggles";
};

if(!isNil 'Zeta_Lifter')then{
	if (_unit_kind in Zeta_Lifter) then { //--- Units that can lift vehicles.
		if (_upgrades select WFBE_UP_AIRLIFT > 0) then {_unit addAction [localize "STR_WF_Lift", 'Client\Module\ZetaCargo\Zeta_Hook.sqf']};
	};
};
if (_unit_kind in (missionNamespace getVariable "WFBE_REPAIRTRUCKS")) then { //--- Repair Trucks.
	//--- Build action.
	_unit addAction [localize 'STR_WF_BuildMenu_Repair','Client\Action\Action_BuildRepair.sqf', [], 99, false, true, '', Format['side group player == side _target && alive _target && player distance _target <= %1', missionNamespace getVariable 'WFBE_C_UNITS_REPAIR_TRUCK_RANGE']];

	if ((missionNamespace getVariable "WFBE_C_CAMPS_CREATE") > 0) then { //--- Repair camps.
		_unit addAction [localize 'STR_WF_Repair_Camp','Client\Action\Action_RepairCamp.sqf', [], 97, false, true, '', 'alive _target'];
	};

	if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_VICTORY_CONDITION") != 1) then { //--- Repair HQ Ability.
		//--- Repair MHQ action.
		_unit addAction [localize 'STR_WF_Repair_MHQ','Client\Action\Action_RepairMHQ.sqf', [], 98, false, true, '', 'alive _target'];
	};
};

if (_unit isKindOf "Tank") then { //--- Tanks.
	//--- Valhalla Low gear.
	_unit addAction ["<t color='#FFBD4C'>"+(localize "STR_ACT_LowGearOn")+"</t>","Client\Module\Valhalla\LowGear_Toggle.sqf", [], 91, false, true, "", "(player==driver _target) && !Local_HighClimbingModeOn && canMove _target"];
	_unit addAction ["<t color='#FFBD4C'>"+(localize "STR_ACT_LowGearOff")+"</t>","Client\Module\Valhalla\LowGear_Toggle.sqf", [], 91, false, true, "", "(player==driver _target) && Local_HighClimbingModeOn && canMove _target"];
};

if (_unit isKindOf "Car") then { //--- Lights vehicles.
	//--- Valhalla Low gear.
	_unit addAction ["<t color='#FFBD4C'>"+(localize "STR_ACT_LowGearOn")+"</t>","Client\Module\Valhalla\LowGear_Toggle.sqf", [], 91, false, true, "", "(player==driver _target) && !Local_HighClimbingModeOn && canMove _target"];
	_unit addAction ["<t color='#FFBD4C'>"+(localize "STR_ACT_LowGearOff")+"</t>","Client\Module\Valhalla\LowGear_Toggle.sqf", [], 91, false, true, "", "(player==driver _target) && Local_HighClimbingModeOn && canMove _target"];
};

if (_unit isKindOf "Ship") then { //--- Boats.
	//--- Push action.
	_unit addAction [localize "STR_WF_Push","Client\Action\Action_Push.sqf", [], 93, false, true, "", 'driver _target == _this && alive _target && speed _target < 30'];
};

if (_unit isKindOf "Air") then { //--- Air units.
	if ((getNumber (configFile >> 'CfgVehicles' >> _unit_kind >> 'transportSoldier')) > 0) then { //--- Transporters only.
		//--- HALO action.
		_unit addAction ['HALO','Client\Action\Action_HALO.sqf', [], 97, false, true, '', Format['getPos _target select 2 >= %1 && alive _target', missionNamespace getVariable 'WFBE_C_PLAYERS_HALO_HEIGHT']];
		//--- Cargo Eject action.
		_unit addAction [localize 'STR_WF_Cargo_Eject','Client\Action\Action_EjectCargo.sqf', [], 99, false, true, '', 'driver _target == _this && alive _target'];
	};

	if ((missionNamespace getVariable "WFBE_C_MODULE_WFBE_FLARES") > 0 && WF_A2_Vanilla) then { //--- Use of a custom CM parameter (Vanilla Only).
		switch (missionNamespace getVariable "WFBE_C_MODULE_WFBE_FLARES") do {
			case 1: { //--- Enabled with upgrades.
				if ((_upgrades select WFBE_UP_FLARESCM) > 0) then {
					(_unit) ExecVM 'Client\Module\CM\CM_Set.sqf';
					_unit addEventHandler ['incomingMissile',{_this Spawn CM_Countermeasures}];
				};
			};
			case 2: { //--- Enabled.
				(_unit) ExecVM 'Client\Module\CM\CM_Set.sqf';
				_unit addEventHandler ['incomingMissile',{_this Spawn CM_Countermeasures}];
			};
		};
	};

	if ((missionNamespace getVariable "WFBE_C_STRUCTURES_ANTIAIRRADAR") > 0) then { //--- AAR Tracking.
		if (sideJoined != _side) then { //--- Track the unit via AAR System, skip if the unit side is the same as the player one.
			[_unit, _side, _sideID] ExecVM 'Common\Common_AARadarMarkerUpdate.sqf';
		};
	};

	if (_unit isKindOf "Plane") then { //--- Planes.
		_unit addAction [localize "STR_WF_TaxiReverse","Client\Action\Action_TaxiReverse.sqf", [], 92, false, true, "", 'driver _target == _this && alive _target && speed _target < 4 && speed _target > -4 && getPos _target select 2 < 4'];
		_unit addEventHandler ['Fired', {_this Spawn HandleShootBombs}]; //--- Marty : Handle missiles and bombs.
	};
	
};

if !(_isMan) then { //--- Vehicle Specific.
	if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_MISSILES_RANGE") != 0) then { //--- Max missile range.
		_unit addEventHandler ['incomingMissile', {_this Spawn HandleIncomingMissile}]; //--- Handle incoming missiles.
	};

	if !(WF_A2_Vanilla) then { //--- Only run on non-vanilla versions.
		if ((missionNamespace getVariable "WFBE_C_GAMEPLAY_THERMAL_IMAGING") < 2) then {Call Compile '_unit disableTIEquipment true;'}; //--- Call Compile the variable to prevent errors on Vanilla.
	};
};

// --- 				[Side specific initialization] (Run on the desired client team).
if (sideID != _sideID) exitWith {};

Private ["_color","_markerName","_params","_size","_txt","_type"];

//--- Map Marker tracking.
_type = "Vehicle";
_color = missionNamespace getVariable (Format ["WFBE_C_%1_COLOR", _side]);
_size = [5,5];
_txt = "";
_params = [];

unitMarker = unitMarker + 1;
_markerName = Format ["unitMarker%1", unitMarker];

if (_isMan) then { //--- Man.
	_type = "mil_dot";
	_size = [0.5,0.5];
	if (group _unit == group player) then {
		_color = "ColorOrange";
		_txt = (_unit) Call GetAIDigit;
	};
	_params = [_type,_color,_size,_txt,_markerName,_unit,1,true,"DestroyedVehicle",_color,false,_side,[1,1]];
} else { //--- Vehicle.
        if (local _unit && isMultiplayer) then {_color = "ColorOrange"};
	if (_unit_kind in (missionNamespace getVariable Format['WFBE_%1SUPPLYTRUCKS',str _side])) then {_type = "SupplyVehicle";_size = [1,1]};//--- Supply.
	if (_unit_kind in (missionNamespace getVariable Format['WFBE_%1REPAIRTRUCKS',str _side])) then {_color = "ColorBrown";_type = "RepairVehicle";};//--- Repair.
	
	if (_unit_kind in (missionNamespace getVariable Format['WFBE_%1ARTYVEHICLE',str _side])) then {_color = "ColorPink";};//--- Arty.
	
	
	if (_unit_kind in (missionNamespace getVariable Format['WFBE_%1AMMOTRUCKS',str _side])) then {_size=[0.4,0.4];_type = "Attack";_color = "ColorRed";};//--- Ammotruck.
	
	if (_unit_kind in (missionNamespace getVariable Format['WFBE_%1LIFTVEHICLE',str _side])) then {_color = "ColorWhite";};//---Lifter
	if (_unit_kind in (missionNamespace getVariable Format['WFBE_%1AMBULANCES',str _side])) then {_color = "ColorYellow";};//--- Medical.
	
	
	
	//
	if (_unit_kind in (missionNamespace getVariable Format['WFBE_%1SALVAGETRUCK',str _side])) then {_color = "ColorKhaki";_type = "SalvageVehicle";};//--- Salvage.
        _params = [_type,_color,_size,_txt,_markerName,_unit,1,true,"DestroyedVehicle",_color,false,_side,[2,2]];	
        if (_unit == ((_side) Call WFBE_CO_FNC_GetSideHQ)) then {_color = "ColorPink";_params = ['Headquarters',_color,[1,1],'','HQUndeployed',_unit,0.2,false,'','',false,_side]};//--- HQ.	
};

_params Spawn MarkerUpdate;
