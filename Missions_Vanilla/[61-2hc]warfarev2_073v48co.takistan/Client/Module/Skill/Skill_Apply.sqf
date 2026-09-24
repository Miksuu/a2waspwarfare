/*
	Script: Skill Application System by Benny.
	Description: Skill Application.
*/

Private ["_unit"];

_unit = _this;

switch (WFBE_SK_V_Type) do {
	
	case 'Engineer': {
		/* Repair Ability */
		_unit addAction [
			("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),
			(WFBE_SK_V_Root + 'Engineer' + '.sqf'), 
			[], 
			80, 
			false, 
			true, 
			"", 
			"time - WFBE_SK_V_LastUse_Repair > WFBE_SK_V_Reload_Repair"
		];

		/* Salvage Ability */
		_unit addAction [
			("<t color='#CC00CB'>" + localize 'STR_WF_ACTION_Salvage'+ "</t>"),
			(WFBE_SK_V_Root + 'Salvage' + '.sqf'), 
			[], 
			80, 
			false, 
			true, 
			"", 
			"time - WFBE_SK_V_LastUse_Salvage > WFBE_SK_V_Reload_Salvage"
		];
	
	// Marty: Only show Repair Camp when the player is near a destroyed camp.
	_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf', [], 97, false, true, '', 'alive _target && !isNil "WFBE_CL_FNC_CanRepairCampNearby" && (_target Call WFBE_CL_FNC_CanRepairCampNearby)'];
	
	};
	
	case 'Officer': {
		/* MASH Ability require that the MASH parameter is enabled */
		if ((missionNamespace getVariable "WFBE_C_RESPAWN_MASH") > 0) then {
			/* MASH Ability */
			_unit addAction [
				("<t color='#f8d664'>" + localize 'STR_WF_ACTION_DeployMASH'+ "</t>"),
				(WFBE_SK_V_Root + 'Officer' + '.sqf'), 
				[], 
				80, 
				false, 
				true, 
				"", 
				"time - WFBE_SK_V_LastUse_MASH > WFBE_SK_V_Reload_MASH"
			];
			// Marty: Only show Repair Camp when the player is near a destroyed camp.
			_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf', [], 97, false, true, '', 'alive _target && !isNil "WFBE_CL_FNC_CanRepairCampNearby" && (_target Call WFBE_CL_FNC_CanRepairCampNearby)'];
			//_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf', [], 97, false, true, '', 'alive _target'];	
		};
	};

	case 'SpecOps': {
		// Supply truck mission
		_unit addAction [
			"<t color='#00e83e'>" + 'LOAD SUPPLIES TO TRUCK' + "</t>",
			'Client\Module\supplyMission\supplyMissionStart.sqf',
			[], 
			80, 
			false, 
			true, 
			"", 
			"(player distance (call GetClosestFriendlyLocation) < 70) && (typeOf cursorTarget in ['WarfareSupplyTruck_RU', 'WarfareSupplyTruck_USMC', 'WarfareSupplyTruck_INS', 'WarfareSupplyTruck_Gue', 'WarfareSupplyTruck_CDF', 'UralSupply_TK_EP1', 'MtvrSupply_DES_EP1'])"
		];

		// Marty: FOB construction and supply unloading (both while aiming at a supply truck), dismantling and status.
		if ((missionNamespace getVariable "WFBE_C_FOB_ENABLED") > 0) then {
			_unit addAction [
				"<t color='#00e83e'>" + Format ["CONSTRUCT FOB ($%1)", WFBE_C_FOB_COST] + "</t>",
				'Client\Module\FOB\FOB_Construct.sqf',
				[],
				79,
				false,
				true,
				"",
				"alive _target && vehicle player == player && !WFBE_CL_VAR_FOB_BUSY && isNull WFBE_CL_VAR_FOB_NEAR && (typeOf cursorTarget in WFBE_C_FOB_SUPPLYTRUCK_TYPES) && (player distance cursorTarget < 15)"
			];

			_unit addAction [
				"<t color='#00e83e'>" + 'UNLOAD SUPPLIES TO FOB' + "</t>",
				'Client\Module\FOB\FOB_Unload.sqf',
				[],
				79,
				false,
				true,
				"",
				"alive _target && !WFBE_CL_VAR_FOB_BUSY && !isNull WFBE_CL_VAR_FOB_NEAR && (typeOf cursorTarget in WFBE_C_FOB_SUPPLYTRUCK_TYPES) && (player distance cursorTarget < 15) && ((cursorTarget Call WFBE_CL_FNC_FOB_GetTruckSupply) > 0)"
			];

			_unit addAction [
				"<t color='#f8d664'>" + 'DISMANTLE FOB' + "</t>",
				'Client\Module\FOB\FOB_Dismantle.sqf',
				[],
				3,
				false,
				true,
				"",
				"alive _target && vehicle player == player && !WFBE_CL_VAR_FOB_BUSY && !isNull WFBE_CL_VAR_FOB_NEAR && (player distance WFBE_CL_VAR_FOB_NEAR < WFBE_C_FOB_DISMANTLE_RANGE)"
			];

			_unit addAction [
				"<t color='#42b6ff'>" + 'FOB STATUS' + "</t>",
				'Client\Module\FOB\FOB_Status.sqf',
				[],
				2,
				false,
				true,
				"",
				"alive _target && !isNull WFBE_CL_VAR_FOB_NEAR"
			];
		};

		_unit addAction [
			(localize "STR_WASP_actions_fastrep"),
			(WFBE_SK_V_Root + 'LR' + '.sqf'), 
			[], 
			80, 
			false, 
			true, 
			"", 
			"(time - WFBE_SK_V_LastUse_LR > WFBE_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"
		];
		
	};
	case 'Spotter': {
		/* Spotting Ability */
		_unit addAction [
			("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),
			(WFBE_SK_V_Root + 'Sniper' + '.sqf'), 
			[], 
			80, 
			false, 
			true, 
			"", 
			"time - WFBE_SK_V_LastUse_Spot > WFBE_SK_V_Reload_Spot"
		];

		/* Lockpicking Ability */
		_unit addAction [
			("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),
			(WFBE_SK_V_Root + 'SpecOps' + '.sqf'), 
			[], 
			80, 
			false, 
			true, 
			"", 
			"time - WFBE_SK_V_LastUse_Lockpick > WFBE_SK_V_Reload_Lockpick"
		];
		
		_unit addAction [
				(localize "STR_WASP_actions_fastrep"),
				(WFBE_SK_V_Root + 'LR' + '.sqf'), 
				[], 
				80, 
				false, 
				true, 
				"", 
				"(time - WFBE_SK_V_LastUse_LR > WFBE_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"
			];
	
		// Marty: Only show Repair Camp when the player is near a destroyed camp.
		_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf', [], 97, false, true, '', 'alive _target && !isNil "WFBE_CL_FNC_CanRepairCampNearby" && (_target Call WFBE_CL_FNC_CanRepairCampNearby)'];
	
	};

	case 'Medic': {
			
		_unit addAction [
			(localize "STR_WASP_actions_fastrep"),
			(WFBE_SK_V_Root + 'LR' + '.sqf'), 
			[], 
			80, 
			false, 
			true, 
			"", 
			"(time - WFBE_SK_V_LastUse_LR > WFBE_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"
		];
		
		// Marty: Only show Repair Camp when the player is near a destroyed camp.
		_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf', [], 97, false, true, '', 'alive _target && !isNil "WFBE_CL_FNC_CanRepairCampNearby" && (_target Call WFBE_CL_FNC_CanRepairCampNearby)'];
	
	};

	case 'Soldier': {
			
		_unit addAction [
			(localize "STR_WASP_actions_fastrep"),
			(WFBE_SK_V_Root + 'LR' + '.sqf'), 
			[], 
			80, 
			false, 
			true, 
			"", 
			"(time - WFBE_SK_V_LastUse_LR > WFBE_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"
		];
		
		// Marty: Only show Repair Camp when the player is near a destroyed camp.
		_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf', [], 97, false, true, '', 'alive _target && !isNil "WFBE_CL_FNC_CanRepairCampNearby" && (_target Call WFBE_CL_FNC_CanRepairCampNearby)'];
	
	};

};
