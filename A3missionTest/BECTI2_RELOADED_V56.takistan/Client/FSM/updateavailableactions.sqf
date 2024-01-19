_lastUpdate = time;
_handle = nil;
_mhqbr = missionNamespace getVariable "cti_C_BASE_HQ_BUILD_RANGE";
_pur = missionNamespace getVariable "cti_C_UNITS_PURCHASE_RANGE";
_pura = missionNamespace getVariable "cti_C_UNITS_PURCHASE_HANGAR_RANGE";
_ccr = missionNamespace getVariable "cti_C_STRUCTURES_COMMANDCENTER_RANGE";
_pgr = missionNamespace getVariable "cti_C_UNITS_PURCHASE_GEAR_RANGE";
_rptr = missionNamespace getVariable "cti_C_UNITS_REPAIR_TRUCK_RANGE";
_spr = missionNamespace getVariable "cti_C_STRUCTURES_SERVICE_POINT_RANGE";
_tcr = missionNamespace getVariable "cti_C_TOWNS_CAPTURE_RANGE";
_buygearfrom = missionNamespace getVariable "cti_C_TOWNS_GEAR";
_gear_field_range = missionNamespace getVariable "cti_C_UNITS_PURCHASE_GEAR_MOBILE_RANGE";
_boundaries_enabled = if ((missionNamespace getVariable "cti_C_GAMEPLAY_BOUNDARIES_ENABLED") > 0) then {true} else {false};
_typeRepair = missionNamespace getVariable Format['cti_%1REPAIRTRUCKS',cti_Client_SideJoinedText];
_typeAmmo = missionNamespace getVariable Format['cti_%1AMMOTRUCKS',cti_Client_SideJoinedText];



//--- Keep actions updated (GUI). - changed-MrNiceGuy 
12450 cutRsc ["OptionsAvailable","PLAIN",0];
_icons = [
	"Client\Images\icon_wf_building_mhq.paa",       //mhq deployable
	"Client\Images\icon_wf_building_barracks.paa",  //barracks 
	"Client\Images\icon_wf_building_gear.paa",      //gear avail
	"Client\Images\icon_wf_building_lvs.paa",       //lvsp
	"Client\Images\icon_wf_building_hvs.paa",       //hvsp
	"Client\Images\icon_wf_building_air.paa",       //helipad
	"Client\Images\icon_wf_building_hangar.paa",    //hangar
	"Client\Images\icon_wf_building_repair.paa",    //rearm | repair | refuel
	"Client\Images\icon_wf_building_firstaid.paa",  //heal
	"Client\Images\icon_wf_building_cc.paa",        //command center
	"Client\Images\icon_wf_building_aa_radar.paa",  //AA radar
	"Client\Images\icon_wf_building_am_radar.paa",  //ARTY radar
	"Client\Images\icon_wf_support_transport.paa",  //transport
	"Client\Images\icon_wf_support_supplydrop.paa", //supply drop
	"Client\Images\icon_wf_support_artilery.paa",   //ARTY
	"Client\Images\icon_wf_support_mortar.paa",     //ARTY - mortar
	"Client\Images\icon_wf_support_cas.paa",        //CAS
	"Client\Images\icon_wf_support_uav.paa"         //UAV
];


while {!cti_GameOver} do {
	
	while {time - _lastUpdate > 5 || cti_ForceUpdate} do {
		
		_buildings = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideStructures;
		_base = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQ;
		_purchaseRange = if (commandInRange) then {_ccr} else {_pur};

		//--- Boundaries are limited ?
		if (_boundaries_enabled) then {
			_isOnMap = Call cti_CL_FNC_BoundariesIsOnMap;
			if (!_isOnMap && alive player && !cti_Client_IsRespawning) then {
				if !(paramBoundariesRunning) then {_handle = [] Spawn cti_CL_FNC_BoundariesHandleOnMap;};
			} else {
				if !(isNil '_handle') then {terminate _handle;_handle = nil;};
				paramBoundariesRunning = false;
			};
		};

		//--- HQ.
		if !(isNull _base) then {
			hqInRange = if ((player distance _base < _mhqbr) && alive _base  && (side _base in [cti_Client_SideJoined,civilian])) then {true} else {false};
		};

		barracksInRange = if (isNull (['BARRACKSTYPE',_buildings,_purchaseRange,cti_Client_SideJoined,player] Call cti_CO_FNC_BuildingInRange)) then {false} else {true};
		gearInRange = if (isNull (['BARRACKSTYPE',_buildings,_pgr,cti_Client_SideJoined,player] Call cti_CO_FNC_BuildingInRange)) then {false} else {true};
		if !(gearInRange) then {
		

								_nObject = objNull;
								_nObject = [vehicle player, _gear_field_range] Call cti_CL_FNC_GetClosestCamp;
								gearInRange = if !(isNull _nObject) then {true} else {false};
			};
			
	
		if !(gearInRange) then {
								
								_checks = (getPos player) nearEntities[_typeAmmo,_gear_field_range];
								if (count _checks > 0) then {gearInRange = true;};
			};
			
			
		

		lightInRange = if (isNull (['LIGHTTYPE',_buildings,_purchaseRange,cti_Client_SideJoined,player] Call cti_CO_FNC_BuildingInRange)) then {false} else {true};
		heavyInRange = if (isNull (['HEAVYTYPE',_buildings,_purchaseRange,cti_Client_SideJoined,player] Call cti_CO_FNC_BuildingInRange)) then {false} else {true};
		aircraftInRange = if (isNull (['AIRCRAFTTYPE',_buildings,_purchaseRange,cti_Client_SideJoined,player] Call cti_CO_FNC_BuildingInRange)) then {false} else {true};
		serviceInRange = if (isNull (['SERVICEPOINTTYPE',_buildings,_spr,cti_Client_SideJoined,player] Call cti_CO_FNC_BuildingInRange)) then {false} else {true};

		if !(serviceInRange) then {
			_checks = (getPos player) nearEntities[_typeRepair,_rptr];
			if (count _checks > 0) then {serviceInRange = true;};
		};

		_checks = [cti_Client_SideJoined, missionNamespace getVariable Format ["cti_%1AARADARTYPE",cti_Client_SideJoinedText],_buildings] Call cti_CO_FNC_GetFactories;
		if (count _checks > 0) then {antiAirRadarInRange = true;} else {antiAirRadarInRange = false;};
		
		_checks = [cti_Client_SideJoined, missionNamespace getVariable Format ["cti_%1ArtyRadarTYPE",cti_Client_SideJoinedText],_buildings] Call cti_CO_FNC_GetFactories;
		if (count _checks > 0) then {antiArtyRadarInRange = true;} else {antiArtyRadarInRange = false;};
		
		//--- Town Depot.
		depotInRange = if !(isNull ([vehicle player, _tcr] Call cti_CL_FNC_GetClosestDepot)) then {true} else {false};
		if (depotInRange) then {serviceInRange = true;};

		_checks = ['COMMANDCENTERTYPE',_buildings,_ccr,cti_Client_SideJoined,player] Call cti_CO_FNC_BuildingInRange;
		commandInRange = if (isNull _checks) then {false} else {true};

		//--- Airport.
		hangarInRange = if !(isNull ([vehicle player, _pura] Call cti_CL_FNC_GetClosestAirport)) then {true} else {false};

		_usable = [hqInRange,barracksInRange,gearInRange,lightInRange,heavyInRange,aircraftInRange,hangarInRange,serviceInRange,serviceInRange,commandInRange,antiAirRadarInRange];

		_c = 0;
		if (isNull (["currentCutDisplay"] call BIS_FNC_GUIget)) then {12450 cutRsc["OptionsAvailable","PLAIN",0]};
		{
			if (_x) then {
				((["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl (3500 + _c)) CtrlSetText (_icons select _c);
			} else {
				((["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl (3500 + _c)) CtrlSetText "";
			};
			_c = _c + 1;
		}forEach _usable;

		if (cti_ForceUpdate) then {cti_ForceUpdate  = false;};
		_lastUpdate = time;
		
	};


	sleep 0.5;
};