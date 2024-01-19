WF_MenuAction = -1;

_vehi = [group player,false] Call cti_CO_FNC_GetTeamVehicles;

//if (typeOf _vehicle in cti_C_IS_UAV)then {
//_rangeGET=(missionNamespace getVariable "cti_C_UNITS_SUPPORT_RANGE");
//_vehi = ((getPos _sp) nearEntities[cti_C_IS_UAV,_rangeGET]) ;
	



_alives = (units group player) Call cti_CO_FNC_GetLiveUnits;


{if (vehicle _x == _x) then {_vehi = _vehi + [_x]}} forEach _alives;
_lastUse = 0;
_typeRepair = missionNamespace getVariable Format['cti_%1REPAIRTRUCKS',cti_Client_SideJoinedText];
_sheal = missionNamespace getVariable 'cti_C_UNITS_SUPPORT_HEAL_TIME';
_srearm = missionNamespace getVariable 'cti_C_UNITS_SUPPORT_REARM_TIME';
_srefuel = missionNamespace getVariable 'cti_C_UNITS_SUPPORT_REFUEL_TIME';
_srepair = missionNamespace getVariable 'cti_C_UNITS_SUPPORT_REPAIR_TIME';

_healPrice = 0;
_repairPrice = 0;
_refuelPrice = 0;
_rearmPrice = 0;
_lastVeh = objNull;
_lastDmg = 0;
_lastFue = 0;

_buildings = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideStructures;

//--- Service Point.
_csp = objNull;


_sp = [cti_Client_SideJoined, missionNamespace getVariable Format ["cti_%1SERVICEPOINTTYPE",cti_Client_SideJoinedText],_buildings] Call cti_CO_FNC_GetFactories;

if (count _sp > 0) then {
	//_csp = [vehicle player,_sp] Call cti_CO_FNC_GetClosestEntity;
//getConnectedUAVUnit player
		_csp = [vehicle player,_sp] Call cti_CO_FNC_GetClosestEntity;
		//_csp2 =[getConnectedUAVUnit player,_sp] Call cti_CO_FNC_GetClosestEntity;
		
//add UAV TO LIST
_rangeGET=(missionNamespace getVariable "cti_C_UNITS_SUPPORT_RANGE");
_vehi2 = ((getPos _csp) nearEntities[cti_C_IS_UAV,_rangeGET]) ;
_vehi =_vehi + _vehi2;



};

if ((missionNamespace getVariable "cti_C_MODULE_cti_EASA") > 0) then {
	_enable = false;
	_currentUpgrades = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideUpgrades;
	_easaLevel = _currentUpgrades select cti_UP_EASA;
	
	if (!(isNull _csp) && _easaLevel > 0) then {
		if (player distance _csp < (missionNamespace getVariable "cti_C_UNITS_SUPPORT_RANGE")) then {
				if ((vehicle player isKindOf 'Air') && driver (vehicle player) == player) then { _enable = true; };						
		};
	};
	
	
	
	
	
	
	/*
	if (!(isNull _csp2) && _easaLevel > 0) then {
		if (player distance _csp2 < (missionNamespace getVariable "cti_C_UNITS_SUPPORT_RANGE")) then {
				if (getConnectedUAVUnit player isKindOf 'Air')  then { _enable = true; };						
		};
	};
	*/
	ctrlEnable [20010,_enable];
} else {
	ctrlEnable [20010,false];
};

_effective = [];
_nearSupport = [];
_spType = missionNamespace getVariable Format ["%1SP",cti_Client_SideJoinedText];
_i = 0;
{
	_closestSP = objNull;
	_add = false;
	
	_nearSupport set [_i, []];
	
	//--- Service Point.
	if (count _sp > 0) then {
		_closestSP = [_x,_sp] Call cti_CO_FNC_GetClosestEntity;
		if !(isNull _closestSP) then {
			if (_x distance _closestSP < (missionNamespace getVariable "cti_C_UNITS_SUPPORT_RANGE")) then {
				_add = true;
				_nearSupport set [_i,(_nearSupport select _i) + [_closestSP]];
			};
		};
	};
	
	//--- Depots.
	_nObject = [_x, (missionNamespace getVariable "cti_C_UNITS_SUPPORT_RANGE")] Call cti_CL_FNC_GetClosestDepot;
	
	if !(isNull _nObject) then {
		_add = true;
		_nearSupport set [_i,(_nearSupport select _i) + [_nObject]];
	};
	
	//--- Repairs Trucks.
	_checks = (getPos _x) nearEntities[_typeRepair, missionNamespace getVariable "cti_C_UNITS_REPAIR_TRUCK_RANGE"];
	if (count _checks > 0) then {
		_add = true;
		_nearSupport set [_i,(_nearSupport select _i) + _checks];
	};
	
	//--- Add the vehicle ?
	if (_add) then {
		_effective = _effective + [_x];
		_desc = [typeOf _x, 'displayName'] Call cti_CO_FNC_GetConfigInfo;
		_finalNumber = (_x) Call cti_CO_FNC_GetAIDigit;
		_isInVehicle = "";
		if (_x != vehicle _x) then {
			_descVehi = [typeOf (vehicle _x), 'displayName'] Call cti_CO_FNC_GetConfigInfo;
			_isInVehicle = " [" + _descVehi + "] ";
		};
		_txt = "["+_finalNumber+"] "+ _desc + _isInVehicle;
		lbAdd[20002,_txt];
		
		_i = _i + 1;
	};
} forEach _vehi;

_checks = (getPos player) nearEntities[_typeRepair, missionNamespace getVariable "cti_C_UNITS_REPAIR_TRUCK_RANGE"];
if (count _checks > 0) then {
	_repair = _checks select 0;
	_vehi = ((getPos _repair) nearEntities[["Car","Motorcycle","Tank","Air","Ship","StaticWeapon"],100]) - [_repair];
	{
		if !(_x in _effective) then {
			_effective = _effective + [_x];
			_nearSupport set [_i,[_repair]];
			_descVehi = [typeOf (vehicle _x), 'displayName'] Call cti_CO_FNC_GetConfigInfo;
			lbAdd[20002,_descVehi];
			
			_i = _i + 1;
		};
	} forEach _vehi;
};

if (count _effective > 0) then {lbSetCurSel[20002,0]};

_colorConfigs = [];
_colorNames = [];

ctrlSetText [20016, localize 'STR_WF_SKIN'];

while {true} do {
	sleep 0.1;
	
	if (Side player != cti_Client_SideJoined) exitWith {closeDialog 0};
	if (!dialog) exitWith {};
	_curSel = lbCurSel(20002);	

	if (_curSel != -1) then {
		_veh = (vehicle (_effective select _curSel));
		_funds = Call cti_CL_FNC_GetPlayerFunds;
		
		if (_veh isKindOf "Man") then {
			{ctrlEnable [_x,false]} forEach [20003,20004,20005];
			_enabled = if (_funds >= _healPrice) then {true} else {false};
			ctrlEnable [20008,_enabled];
			//--- Healing.
			_healPrice = round((getDammage _veh)*(missionNamespace getVariable "cti_C_UNITS_SUPPORT_HEAL_PRICE"));
			ctrlSetText [20011,"$0"];
			ctrlSetText [20012,"$0"];
			ctrlSetText [20013,"$0"];
			ctrlSetText [20014,"$"+str(_healPrice)];
		} else {
			//--Check current selection, is it available for EASA--
			if ((missionNamespace getVariable "cti_C_MODULE_cti_EASA") > 0) then {
				_enable = false;
				_currentUpgrades = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideUpgrades;
				_easaLevel = _currentUpgrades select cti_UP_EASA;
				if (!(isNull _csp) && _easaLevel > 0) then {		
					if (player distance _csp < (missionNamespace getVariable "cti_C_UNITS_SUPPORT_RANGE")) then {																	
							if ((_veh isKindOf 'Air') && driver _veh == player) then { _enable = true; } else { _enable = false; };						
					
					_sideID= str cti_Client_SideJoined;
					_pID=str player;
					_EASAvar="giveDATAtoEASA"+_sideID+_pID;
					missionNamespace setvariable [_EASAvar,_veh];
					
					
					};
				};
				
				if (typeOf _veh in cti_C_IS_UAV)  then { 
				_enable = true;
				
				_sideID= str cti_Client_SideJoined;
				_pID=str player;
				_EASAvar="giveDATAtoEASA"+_sideID+_pID;
				missionNamespace setvariable [_EASAvar,_veh];
				};	
				
				
				
				ctrlEnable [20010,_enable];
			} else {
				ctrlEnable [20010,false];
			};
		
			//--- Prevent on the air re-supply.
			_canBeUsed = if ((getPos _veh) select 2 <= 2 && speed _veh <= 20) then {true} else {false};
			_enabled = if (_canBeUsed && _funds >= _rearmPrice) then {true} else {false};
			ctrlEnable [20003,_enabled];
			_enabled = if (_canBeUsed && _funds >= _repairPrice) then {true} else {false};
			ctrlEnable [20004,_enabled];
			_enabled = if (_canBeUsed && _funds >= _refuelPrice) then {true} else {false};
			ctrlEnable [20005,_enabled];
			_enabled = if (_canBeUsed && _funds >= _healPrice) then {true} else {false};
			ctrlEnable [20008,_enabled];
			//--- Healing.
			_healPrice = 0;
			{
				if (alive _x) then {_healPrice = _healPrice + round((getDammage _x)*(missionNamespace getVariable "cti_C_UNITS_SUPPORT_HEAL_PRICE"))};
			} forEach (crew _veh);
			ctrlSetText [20014,"$"+str(_healPrice)];
			//--- Repair.
			if (_veh != _lastVeh || getDammage _veh != _lastDmg) then {
				_type = typeOf _veh;
				
				_vehicle_hit_point_damage_array = getAllHitPointsDamage _veh;
				if(count _vehicle_hit_point_damage_array > 1) then {
					_array = _vehicle_hit_point_damage_array select 2;
					{_lastDmg = _lastDmg + _x} forEach _array;
					_lastDmg = _lastDmg / count (_array);
				};
				
				_get = missionNamespace getVariable _type;
				if !(isNil '_get') then {
					_repairPrice = round(_lastDmg*((_get select QUERYUNITPRICE)/(missionNamespace getVariable "cti_C_UNITS_SUPPORT_REPAIR_PRICE")));
				} else {
					_repairPrice = 500;
				};
			};
			ctrlSetText [20012,"$"+str(_repairPrice)];
			//--- Rearm.
			if (_veh != _lastVeh) then {
				_type = typeOf _veh;
				_get = missionNamespace getVariable _type;
				if !(isNil '_get') then {
					_rearmPrice = round((_get select QUERYUNITPRICE)/(missionNamespace getVariable "cti_C_UNITS_SUPPORT_REARM_PRICE"));
					//--If vehicle have EASA reload EASA magazines--
					if(!(isNil { _veh getVariable "_pylons" } )) then {
						if(count (_veh getVariable "_pylons") > 0) then {			
							_rearmPrice = round(_rearmPrice + (_rearmPrice * (count (_veh getVariable "_pylons")) / 10));
						};
					};
				} else {
					_rearmPrice = 500;
				};
			};
			ctrlSetText [20011,"$"+str(_rearmPrice)];
			//--- Refuel.
			if (_veh != _lastVeh || fuel _veh != _lastFue) then {
				_type = typeOf _veh;
				_lastFue = fuel _veh;
				_get = missionNamespace getVariable _type;
				if !(isNil '_get') then {
					_fuel = ((fuel _veh) -1) * -1;
					_refuelPrice = round(_fuel*((_get select QUERYUNITPRICE)/(missionNamespace getVariable "cti_C_UNITS_SUPPORT_REFUEL_PRICE")));
				} else {
					_refuelPrice = 200;
				};
			};
			ctrlSetText [20013,"$"+str(_refuelPrice)];
		};
		
		_lastVeh = _veh;
		
		//--- Rearm.
		if (WF_MenuAction == 1) then {
			WF_MenuAction = -1;
			-_rearmPrice Call cti_CL_FNC_ChangePlayerFunds;
			
			//--- Spawn a Rearm thread.
			[_veh,_nearSupport select _curSel,_typeRepair,_spType] Spawn cti_CL_FNC_SupportRearm;
		};	
		
		//--- Repair.
		if (WF_MenuAction == 2) then {
			WF_MenuAction = -1;
			-_repairPrice Call cti_CL_FNC_ChangePlayerFunds;
			
			//--- Spawn a Repair thread.
			[_veh,_nearSupport select _curSel,_typeRepair,_spType] Spawn cti_CL_FNC_SupportRepair;
		};
		
		//--- Refuel.
		if (WF_MenuAction == 3) then {
			WF_MenuAction = -1;
			-_refuelPrice Call cti_CL_FNC_ChangePlayerFunds;
			
			//--- Spawn a Refuel thread.
			[_veh,_nearSupport select _curSel,_typeRepair,_spType] Spawn cti_CL_FNC_SupportRefuel;
		};
		
		//--- Heal.
		if (WF_MenuAction == 5) then {
			WF_MenuAction = -1;
			-_healPrice Call cti_CL_FNC_ChangePlayerFunds;
			
			//--- Spawn a Healing thread.
			[_veh,_nearSupport select _curSel,_typeRepair,_spType] Spawn cti_CL_FNC_SupportHeal;
		};
		
		//--- Texture.
		if (WF_MenuAction == 9) then {
			WF_MenuAction = -1;		
			
			_colorTextures = [];
			
			if(count _colorConfigs > 0) then {
				_colorTextures pushback (getArray (configfile >> "CfgVehicles" >> typeof _veh >> "textureSources" >> configName (_colorConfigs select (lbCurSel 20015)) >> "textures"));
				
				_txtIndex = 0;
				{					
					_veh setObjectTextureGlobal [_txtIndex, _x];
					_txtIndex = _txtIndex + 1;
				}	forEach (_colorTextures select 0);
			};
		};
		
		//--- Unit select.
		if (WF_MenuAction == 10) then {
			WF_MenuAction = -1;		
			
			//--Compute vehicle skins data--
			lbClear 20015;
			_colorConfigs = "true" configClasses (configfile >> "CfgVehicles" >> typeof _veh >> "textureSources");			
			_colorNames = [];
			
			if (count _colorConfigs > 0) then {				
				{
					_colorNames pushback (getText (configfile >> "CfgVehicles" >> typeof _veh >> "textureSources" >> configName _x >> "displayName"));					
					lbAdd [20015,(getText (configfile >> "CfgVehicles" >> typeof _veh >> "textureSources" >> configName _x >> "displayName"))];
				} foreach _colorConfigs;
			};
		};
	} else {
		{ctrlEnable[_x,false]} forEach [20003,20004,20005,20008];
	};
	
	//--- EASA. TBD: Add dialog;
	if (WF_MenuAction == 7) then {
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "RscMenu_EASA";
	};
	
	//--- Back Button.
	if (WF_MenuAction == 8) exitWith { //---added-MrNiceGuy
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "WF_Menu";
	};
};
