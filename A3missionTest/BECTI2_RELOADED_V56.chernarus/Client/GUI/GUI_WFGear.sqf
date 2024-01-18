_action = _this select 0;

switch (_action) do {
	case "onLoad": { //--- Triggered on the very first loading of the UI
		//-- Load the list.
		call CTI_UI_Gear_LoadAvailableUnits;




			//-- Start ofps Gear Cam
		CTI_Gear_cam_ppos = getPos player;
		CTI_Gear_cam_pdir = getCameraViewDirection player;
		// Move position to 1.5m above ground
		CTI_Gear_cam_cpos = CTI_Gear_cam_ppos vectorAdd (CTI_Gear_cam_pdir vectorMultiply 2);
		// Cam should be ~2.5 meters above ground, and should look at the player at 1.2m above ground
		//CTI_Gear_cam_cpos set [2, 1.8];
		//CTI_Gear_cam_ppos set [2, 1];
		
		CTI_Gear_cam_cpos set [2, 1.9];
		CTI_Gear_cam_ppos set [2, 1.1];
		


		CTI_Gear_cam = "camera" camCreate CTI_Gear_cam_cpos;
		CTI_Gear_cam cameraEffect ["INTERNAL", "BACK"];
		CTI_Gear_cam camSetTarget CTI_Gear_cam_ppos;
		CTI_Gear_cam camCommit 0;
		showCinemaBorder false;
		//End Gear Cam

		// HIDE TEMPLATE RENAME
		((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71120) ctrlShow false;
		((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71121) ctrlShow false;
	



		execVM "Client\GUI\GUI_GearMenu.sqf";

		//--- Handle drag stop //todo check the getVariable modification.
		_dragging = if (isNil{uiNamespace getVariable "CTI_dialog_ui_gear_dragging"}) then {false} else {uiNamespace getVariable "CTI_dialog_ui_gear_dragging"};
		
		if (_dragging) then {uiNamespace setVariable ["CTI_dialog_ui_gear_dragging", false]};
		(findDisplay 503000) displaySetEventHandler ["mouseButtonUp", "_dragging = if (isNil{uiNamespace getVariable 'CTI_dialog_ui_gear_dragging'}) then {false} else {uiNamespace getVariable 'CTI_dialog_ui_gear_dragging'}; if (_dragging) then {['onShoppingListMouseUp', _this select 1] call compile preprocessFileLineNumbers 'Client\GUI\GUI_WFGear.sqf'}"];
	};
	
	
	// Hide item info things
	ctrlShow [71112, false];
	((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71111) ctrlShow false;
	
	
	
	case "onUnload": {
		
		//clean info switch
		missionNamespace setVariable ["cti_dialog_ui_gear_linked_weapon_parent", ""];
		
		
		
		// Cleanup ofps Gear Cam
		
		CTI_Gear_cam cameraEffect["TERMINATE","BACK"];
		camDestroy CTI_Gear_cam;
		showCinemaBorder false;
	};
	
	
	
	
	
	case "onShoppingTabClicked": { //--- A shopping tab was clicked upon
		//--- New tab
		
		
		
		
		
		_changedto = _this select 1;
		
		
		
		(_changedto) call CTI_UI_Gear_DisplayShoppingItems;
		uiNamespace setVariable ["CTI_dialog_ui_gear_shop_tab", _changedto];
		//};
	
		// Hide Template renaming
		((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71120) ctrlShow false;
		((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71121) ctrlShow false;
	
	};
	case "onUnitLBSelChanged": { //--- The units combo was changed
		_changedto = _this select 1;

		_target = (uiNamespace getVariable "CTI_dialog_ui_gear_units") select _changedto;
		//--- The target
		uiNamespace setVariable ["CTI_dialog_ui_gear_target", _target];

		if (_target isKindOf "Man") then {
		//--- Get the target's equipment
		_gear = (_target) call CTI_CO_FNC_GetUnitLoadout;

		//--- Calculate the initial mass
		_mass = (_gear) call CTI_UI_Gear_GetTotalMass;

		//--- Default
		uiNamespace setVariable ["CTI_dialog_ui_gear_target_staticgear", +_gear];
		uiNamespace setVariable ["CTI_dialog_ui_gear_target_gear", _gear];
		uiNamespace setVariable ["CTI_dialog_ui_gear_target_gear_mass", _mass];

		//--- Progress UI Updates.
		{[_forEachIndex, _x] call CTI_UI_Gear_UpdateContainerProgress} forEach [70301,70302,70303];

		//--- Do we have a default gear tab? if not we give the template one to the player
			uiNamespace setVariable ["CTI_dialog_ui_gear_shop_tab", CTI_GEAR_TAB_PRIMARY];
			(uiNamespace getVariable "CTI_dialog_ui_gear_shop_tab") call CTI_UI_Gear_DisplayShoppingItems;
			
			call CTI_UI_Gear_UpdatePrice;
			(_gear) call CTI_UI_Gear_DisplayInventory;
		} else {
			_gear = (_target) call CTI_CO_FNC_GetVehicleCargo;

			//--- Calculate the initial mass
			_maxmass = getNumber(configFile >> "CfgVehicles" >> typeOf _target >> "maximumLoad");
			_mass = (_gear) call CTI_UI_Gear_GetVehicleLoad;
			
			//--- Update the overlay
			call CTI_UI_Gear_EnableVehicleOverlay;
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70001) ctrlSetText getText(configFile >> "CfgVehicles" >> typeOf _target >> 'picture');
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70001) ctrlSetTooltip getText(configFile >> "CfgVehicles" >> typeOf _target>> 'displayName');
			
			//--- Default
			uiNamespace setVariable ["CTI_dialog_ui_gear_target_staticgear", +_gear];
			uiNamespace setVariable ["CTI_dialog_ui_gear_target_gear", _gear];
			uiNamespace setVariable ["CTI_dialog_ui_gear_target_gear_mass", [_maxmass, _mass]];
			
			//--- Do we have a default gear tab? if not we give the template one to the player
			if (isNil {uiNamespace getVariable "CTI_dialog_ui_gear_shop_tab"}) then {uiNamespace setVariable ["CTI_dialog_ui_gear_shop_tab", CTI_GEAR_TAB_PRIMARY]};
			(uiNamespace getVariable "CTI_dialog_ui_gear_shop_tab") call CTI_UI_Gear_DisplayShoppingItems;
			
			//--- Progress UI Updates.
			call CTI_UI_Gear_UpdateVehicleContainerProgress;

			call CTI_UI_Gear_UpdatePrice;
			(_gear) call CTI_UI_Gear_DisplayInventoryVehicle;
		};
	};
	case "onShoppingListLBDblClick": {		
		//--- Item
		_selected = _this select 1;

		//--- Get the current tab
		if (uiNamespace getVariable "CTI_dialog_ui_gear_shop_tab" != 7) then {//--- Skip on template tab
			_updated = false;
			if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
				_updated = (lnbData [70108, [_selected,0]]) call CTI_UI_Gear_AddItem;
		} else {
				_updated = [uiNamespace getVariable "CTI_dialog_ui_gear_target_gear", lnbData [70108, [_selected,0]]] call CTI_UI_Gear_AddVehicleItem;
			};
			
			if (_updated) then { call CTI_UI_Gear_UpdatePrice };
		} else {
			if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
				(_selected) call CTI_UI_Gear_EquipTemplate;
			};
		};
		
	};
	case "onShoppingListLBDrag": {
		//--- Item (Data)
		_selected = ((_this select 1) select 0) select 2;

		if (uiNamespace getVariable "CTI_dialog_ui_gear_shop_tab" != 7) then { //--- Skip on template tab
			uiNamespace setVariable ["CTI_dialog_ui_gear_dragging", true];
			(_selected) call CTI_UI_Gear_OnShoppingItemDrag;
		};
	};
	case "onShoppingListLBDrop": {
		_kind = _this select 1;
		_idc = _this select 2;
		_dropped = _this select 3;
		_path = _this select 4;

		if (uiNamespace getVariable "CTI_dialog_ui_gear_shop_tab" != 7) then { //--- Skip on template tab
			_updated = [_idc, _dropped, _kind, _path] call CTI_UI_Gear_OnShoppingItemDrop;
			if (_updated) then { call CTI_UI_Gear_UpdatePrice };
		};
	};
	case "onShoppingListLBSelChanged": {
		//--- Item
		_selected = _this select 1;
		
		
		
		
		(lnbData [70108, [_selected,0]]) call CTI_UI_Gear_UpdateLinkedItems;
		
	//ofps info add
		(lnbData [70108, [_selected,0]]) call CTI_UI_Gear_UpdateDescription;
	
	/*no time to implement this atm,maybe i do later.its nice function
	//ofps rename template ui
		if (uiNamespace getVariable "cti_dialog_ui_gear_shop_tab" isEqualTo CTI_GEAR_TAB_TEMPLATES) then { // Show Template Renaming UI
			private _index = lnbCurSelRow 70108;
			if (_index > -1 && _index < ((lnbSize((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 70108)) select 0)) then {
				private _seed = lnbValue[70108, [_index,0]];
				private _currentName = _seed call CTI_UI_Gear_GetProfileTemplateName;
				((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71120) ctrlSetText _currentName;
				((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71120) ctrlShow true;
				((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71121) ctrlShow true;
			};
		} else {
			((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71120) ctrlShow false;
			((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71121) ctrlShow false;
		};
	*/
	
	
	};
	case "onShoppingListMouseUp": {
		{
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _x) ctrlSetBackgroundColor [1, 1, 1, 0.15];
		} forEach (uiNamespace getVariable ["CTI_dialog_ui_gear_drag_colored_idc", []]);
		
		{
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _x) ctrlSetBackgroundColor [1, 1, 1, 0.15];
		} forEach (uiNamespace getVariable ["CTI_dialog_ui_gear_drag_colored_idc_red", []]);

		//--- Todo: highlight current container.
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl (77001 + (uiNamespace getVariable "CTI_dialog_ui_gear_items_tab"))) ctrlSetBackgroundColor [1, 1, 1, 0.4];

		uiNamespace setVariable ["CTI_dialog_ui_gear_dragging", false];
	};
	case "onLinkedListLBDblClick": {
		//--- Item
		_selected = _this select 1;
		_updated = false;
		
		if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
		
			
			_updated = (lnbData [70601, [_selected,0]]) call CTI_UI_Gear_AddItem;

			
		} else {
			_updated = [uiNamespace getVariable "CTI_dialog_ui_gear_target_gear", lnbData [70601, [_selected,0]]] call CTI_UI_Gear_AddVehicleItem;
		};

		if (_updated) then { call CTI_UI_Gear_UpdatePrice };
	};

	
	//ofps info add
	case "onLinkedListLBSelChanged": {
		//--- Item
		_selected = _this select 1;
		
		
		
		
		//ofps info add
		(lnbData [70601, [_selected,0]]) call CTI_UI_Gear_UpdateDescription;
	
	};



	case "onItemContainerClicked": { //--- Uniform (0), vest (1) or backpack (2) container was clicked upon
		//--- The container
		_container = _this select 1;
		_background = _this select 2;

		//--- Get the target's gear
		_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";

		if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
		//--- Make sure that the container is present.
		if ((((_gear select 1) select _container) select 0) != "") then {
				(((_gear select 1) select _container) select 1) call CTI_UI_Gear_DisplayContainerItems;

			//--- Change the color
				((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _background) ctrlSetBackgroundColor [1, 1, 1, 0.4];
				{((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _x) ctrlSetBackgroundColor [1, 1, 1, 0.15]} forEach ([77001,77002,77003] - [_background]);

			//--- Set the current items tab
				uiNamespace setVariable ["CTI_dialog_ui_gear_items_tab", _container];
			};
		};
	};
	case "onItemContainerMouseClicked": { //--- Uniform (0), vest (1) or backpack (2) container was clicked upon
		//--- The container
		_container = _this select 1;
		_idc = _this select 2;
		_mouse = _this select 3;

		//--- Remove the container & its content if needed
		if (_mouse == 1 && uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then { //--- Right click
			_updated = ["", _container] call CTI_UI_Gear_ReplaceContainer;
			if (_updated) then { call CTI_UI_Gear_UpdatePrice };
		};
	};
	case "onAccessoryClicked": { //--- Helm or Goggles were clicked upon
		//--- The array slot, idc and default picture
		_slot = _this select 1;
		_idc = _this select 2;
		_default = _this select 3;

		_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";

		if ((_gear select 2) select _slot != "" && uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
			//--- Apply the default picture and release the tooltip
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetText _default;
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetTooltip "";

			(_gear select 2) set [_slot, ""];
			call CTI_UI_Gear_UpdatePrice;
		};
	};
	case "onItemClicked": { //--- NVG, Binocular or items were clicked upon
		//--- The array slot, idc and default picture
		_slot = _this select 1;
		_idc = _this select 2;
		_default = _this select 3;

		_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";

		if ((((_gear select 3) select (_slot select 0)) select (_slot select 1)) != "" && uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetText _default;
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetTooltip "";

			((_gear select 3) select (_slot select 0)) set [(_slot select 1), ""];
			call CTI_UI_Gear_UpdatePrice;
		};
	};
	case "onWeaponClicked": { //--- Primary, Secondary or Handgun was clicked upon
		//--- The array slot, idc and default picture
		_slot = _this select 1;
		_idc = _this select 2;

		if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
			["", _slot] call CTI_UI_Gear_ReplaceWeapon;
			call CTI_UI_Gear_UpdatePrice;
		};
		
		_weapon = (((uiNamespace getVariable "cti_dialog_ui_gear_target_gear") select 0) select _slot) select 0;
		
		/*
		_lastlinked = missionNamespace getVariable ["cti_dialog_ui_gear_linked_weapon_parent", ""];
		if !(_lastlinked isEqualTo _weapon) then {
			// Weapon was not empty, so we get that weapons details, and view its linked items.
			_weapon call CTI_UI_Gear_UpdateLinkedItems;
		};
		*/
		_weapon call CTI_UI_Gear_UpdateLinkedItems;
		_weapon call CTI_UI_Gear_UpdateDescription;
	};
	case "onUnitItemsLBDblClick": { //--- Item container
		_row = _this select 1;

		_item = lnbData[70109, [_row,0]];
		_count = lnbValue[70109, [_row,0]];

		_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";

		if (uiNamespace getVariable ["CTI_dialog_ui_gear_target", objNull] isKindOf "Man") then {
			_container = uiNamespace getVariable "CTI_dialog_ui_gear_items_tab";
		_items = ((_gear select 1) select _container) select 1;

			_items deleteAt (_items find _item);
			(_gear select 1) select (uiNamespace getVariable "CTI_dialog_ui_gear_items_tab") set [1, _items];
			
			//--- Update the mass.
			["ContainerItem", _item, "", [_container]] call CTI_UI_Gear_UpdateMass;
			
			//--- Update the Mass RscProgress
			[_container, 70301+_container] call CTI_UI_Gear_UpdateContainerProgress;
		} else {
			//--- Update the Mass RscProgress
			// [0, 70301] call CTI_UI_Gear_UpdateContainerProgress;
			
			_gear deleteAt (_gear find _item);

		//--- Update the mass.
			[_item, "delete"] call CTI_UI_Gear_UpdateVehicleLoad;

		//--- Update the Mass RscProgress
			call CTI_UI_Gear_UpdateVehicleContainerProgress;
		};

		if (_count > 1) then { //--- Decrement
			lnbSetText[70109, [_row,0], Format["x%1",_count - 1]];
			lnbSetValue[70109, [_row,0], _count - 1];
		} else { //--- Remove
			lnbDeleteRow[70109, _row];
		};

		call CTI_UI_Gear_UpdatePrice;
	};

	case 'onWeaponAccessoryClicked': { //--- Primary, Secondary or Handgun accessory was clicked upon
		//--- The array slot, idc and default picture
		_slot_type = _this select 1;
		_slot = _this select 2;
		_idc = _this select 3;
		_default = _this select 4;

		_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";
		if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
		if (count(((_gear select 0) select _slot_type) select 1) > 0) then {
			if (((((_gear select 0) select _slot_type) select 1) select _slot) != "") then {
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetText _default;
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetTooltip "";

				(((_gear select 0) select _slot_type) select 1) set [_slot, ""];
					call CTI_UI_Gear_UpdatePrice;
				};
			};
		};
	};

	case "onWeaponCurrentMagazineClicked": { //--- Primary, Secondary or Handgun current magazine was clicked upon
		private _slot_type = _this select 1;
		private _idc = _this select 2;

		if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
			private _updated = ["", _slot_type, _idc] call CTI_UI_Gear_ChangeCurrentMagazine;
			if (_updated) then {call CTI_UI_Gear_UpdatePrice};
		};
	};

	case "onPurchase": {
		_funds = Call CTI_CL_FNC_GetPlayerFunds;
		_cost = uiNamespace getVariable "CTI_dialog_ui_gear_tradein";
		if (_funds >= _cost) then {
			if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
				[uiNamespace getVariable "CTI_dialog_ui_gear_target", uiNamespace getVariable "CTI_dialog_ui_gear_target_gear"] call CTI_CO_FNC_EquipUnit; 
				
				missionNamespace setVariable ["CTI_gear_lastpurchased", uiNamespace getVariable "CTI_dialog_ui_gear_target_gear"];
				CTI_P_CurrentGear = (player) call CTI_CO_FNC_GetUnitLoadout;
			} else {
				[uiNamespace getVariable "CTI_dialog_ui_gear_target", uiNamespace getVariable "CTI_dialog_ui_gear_target_gear"] call CTI_CO_FNC_EquipVehicleCargo;
			};
			uiNamespace setVariable ["CTI_dialog_ui_gear_target_staticgear", +(uiNamespace getVariable "CTI_dialog_ui_gear_target_gear")];
			
			call CTI_UI_Gear_UpdatePrice;
			-(_cost) Call CTI_CL_FNC_ChangePlayerFunds
		} else {
			hint "not enough funds";
		};
	};

	case "onInventoryClear": {
		if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
		_gear = [
			[["", [], []], ["", [], []], ["", [], []]],
			[["", []], ["", []], ["", []]],
			["", ""],
			[["", ""], ["", "", "", "", ""]]
		];
			uiNamespace setVariable ["CTI_dialog_ui_gear_target_gear", _gear];

			_mass = (_gear) call CTI_UI_Gear_GetTotalMass;
			uiNamespace setVariable ["CTI_dialog_ui_gear_target_gear_mass", _mass];

			{[_forEachIndex, _x] call CTI_UI_Gear_UpdateContainerProgress} forEach [70301,70302,70303];
			
			call CTI_UI_Gear_UpdatePrice;
			(_gear) call CTI_UI_Gear_DisplayInventory;
		} else {
			_gear = [];
			uiNamespace setVariable ["CTI_dialog_ui_gear_target_gear", _gear];
			(uiNamespace getVariable ["CTI_dialog_ui_gear_target_gear_mass", [0, 0]]) set [1, 0];
			
			//--- Progress UI Updates.
			call CTI_UI_Gear_UpdateVehicleContainerProgress;

			call CTI_UI_Gear_UpdatePrice;
			(_gear) call CTI_UI_Gear_DisplayInventoryVehicle;
		};
	};

	case "onInventoryReload": {
		_gear = missionNamespace getVariable "CTI_gear_lastpurchased";
		if (!isNil '_gear' && uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
			uiNamespace setVariable ["CTI_dialog_ui_gear_target_gear", _gear];

			_mass = (_gear) call CTI_UI_Gear_GetTotalMass;
			uiNamespace setVariable ["CTI_dialog_ui_gear_target_gear_mass", _mass];

			{[_forEachIndex, _x] call CTI_UI_Gear_UpdateContainerProgress} forEach [70301,70302,70303];

			call CTI_UI_Gear_UpdatePrice;
			(_gear) call CTI_UI_Gear_DisplayInventory;
		};
		//todo reload from config if nil
	};

	case "onTemplateCreation": {
		if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
			_gear = +(uiNamespace getVariable "CTI_dialog_ui_gear_target_gear");

			_cost = 0;
			_picture = "";
			_label = "";
			_haspic = false;
			_upgrade = -1;
			_current_upgrade_level = 0;
			{
					_cost = _cost + (_x call CTI_CO_FNC_GetGearItemCost);
			} forEach (_gear call CTI_CO_FNC_ConvertGearToFlat);
			
			{
				if(_upgrade == -1)then{
					_upgrade = (_x call CTI_CO_FNC_GetGearItemUpgradeLevel);
				}else{
					_current_upgrade_level = (_x call CTI_CO_FNC_GetGearItemUpgradeLevel);
					if(_upgrade < _current_upgrade_level)then{
						_upgrade = _current_upgrade_level;
					};
				};
			} forEach (_gear call CTI_CO_FNC_ConvertGearToFlat);
			
			if (_cost != 0) then {
				{
					if (_x select 0 != "") then {
						if (_label != "") then { _label = _label + " | " };
						_label = _label + getText(configFile >> "CfgWeapons" >> (_x select 0) >> "displayName");
						if !(_haspic) then { _picture = getText(configFile >> "CfgWeapons" >> (_x select 0) >> "picture"); _haspic = true};
					};
				} forEach (_gear select 0);
			};

			_seed = round(time + random 10000 - random 500 + diag_frameno);

			//--- Persistent!.
			
			/*
			
			_selectedRole = WSW_gbl_boughtRoles select 0;
            if!(isnil '_selectedRole')then{
                _gearListTemapltes = (missionNamespace getVariable format["CTI_gear_list_templates_%1_%2", CTI_Client_SideJoined, _selectedRole]);
                _gearListTemapltes pushBack [_label, _picture, _cost, _gear, _upgrade, _seed];

                _templates = if !(isNil {profileNamespace getVariable format["CTI_PERSISTENT_GEAR_TEMPLATE_%1_%2", CTI_Client_SideJoined, _selectedRole]}) then {
                    profileNamespace getVariable format["CTI_PERSISTENT_GEAR_TEMPLATE_%1_%2", CTI_Client_SideJoined, _selectedRole]
                } else {
                    +(missionNamespace getVariable format["CTI_gear_list_templates_%1_%2", CTI_Client_SideJoined, _selectedRole])
                };
                _templates pushBack [_label, _picture, _cost, _gear, _upgrade, _seed];
                profileNamespace setVariable [format["CTI_PERSISTENT_GEAR_TEMPLATE_%1_%2", CTI_Client_SideJoined, _selectedRole], _templates];
            }else{
                (missionNamespace getVariable "CTI_gear_list_templates") pushBack [_label, _picture, _cost, _gear, _upgrade, _seed];
                _templates = if !(isNil {profileNamespace getVariable format["CTI_PERSISTENT_GEAR_TEMPLATE_%1", CTI_Client_SideJoined]}) then {
                    profileNamespace getVariable format["CTI_PERSISTENT_GEAR_TEMPLATE_%1", CTI_Client_SideJoined]
                } else {
                    +(missionNamespace getVariable "CTI_gear_list_templates")
                };
                _templates pushBack [_label, _picture, _cost, _gear, _upgrade, _seed];
                profileNamespace setVariable [format["CTI_PERSISTENT_GEAR_TEMPLATE_%1", CTI_Client_SideJoined], _templates];
            };
			*/

			 (missionNamespace getVariable "CTI_gear_list_templates") pushBack [_label, _picture, _cost, _gear, _upgrade, _seed];
                _templates = if !(isNil {profileNamespace getVariable format["CTI_PERSISTENT_GEAR_TEMPLATE_%1", CTI_Client_SideJoined]}) then {
                    profileNamespace getVariable format["CTI_PERSISTENT_GEAR_TEMPLATE_%1", CTI_Client_SideJoined]
                } else {
                    +(missionNamespace getVariable "CTI_gear_list_templates")
                };
                _templates pushBack [_label, _picture, _cost, _gear, _upgrade, _seed];
                profileNamespace setVariable [format["CTI_PERSISTENT_GEAR_TEMPLATE_%1", CTI_Client_SideJoined], _templates];

			saveProfileNamespace;
				
			if (uiNamespace getVariable "CTI_dialog_ui_gear_shop_tab" == CTI_GEAR_TAB_TEMPLATES) then { //--- Reload the template tab if needed
				(CTI_GEAR_TAB_TEMPLATES) call CTI_UI_Gear_DisplayShoppingItems;
			};

			hint parseText format ["<t size='1.3' color='#2394ef'>Information</t><br /><br /><t align='left'>A new template has been created with the name <t color='#bcff70'>%1</t>.<br /><br />You may find it in the <t color='#eaff96'>Template</t> tab</t><br /><br /><img image='Rsc\Pictures\icon_wf_building_barracks.paa' size='2.5'/>", _label];
		};
	};

	case "onTemplateDeletion": {
		_index = _this select 1;
		if (uiNamespace getVariable "CTI_dialog_ui_gear_shop_tab" == CTI_GEAR_TAB_TEMPLATES) then {
			_seed = lnbValue[70108, [_index,0]];
			if (_index > -1 && _index < ((lnbSize((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70108)) select 0)) then {
				
				/*
                _selectedRole = WSW_gbl_boughtRoles select 0;
				if!(isnil '_selectedRole')then{
				    _templates = missionNamespace getVariable format["CTI_gear_list_templates_%1_%2", CTI_Client_SideJoined, _selectedRole];
				     _templates deleteAt _index;
				    missionNamespace setVariable [format["CTI_gear_list_templates%1_%2", CTI_Client_SideJoined, _selectedRole], _templates];
				}else{
				    _templates = missionNamespace getVariable "CTI_gear_list_templates";
                    _templates deleteAt _index;
                    missionNamespace setVariable ["CTI_gear_list_templates", _templates];
				};
				*/
				_templates = missionNamespace getVariable "CTI_gear_list_templates";
                _templates deleteAt _index;
                missionNamespace setVariable ["CTI_gear_list_templates", _templates];

                //--- Persistent!
                (_index) call CTI_UI_Gear_RemoveProfileTemplate;

				if (uiNamespace getVariable "CTI_dialog_ui_gear_shop_tab" == CTI_GEAR_TAB_TEMPLATES) then { //--- Reload the template tab if needed
					(CTI_GEAR_TAB_TEMPLATES) call CTI_UI_Gear_DisplayShoppingItems;
				};
			};
		} else {
			hint parseText "<t size='1.3' color='#2394ef'>Information</t><br /><br /><t align='left'>Templates may only be removed from the <t color='#eaff96'>Template</t> tab</t><br /><br /><img image='Rsc\Pictures\icon_wf_building_barracks.paa' size='2.5'/>";
		};
	};

	case "onItemContainerMouseDblClicked": {
		_container = _this select 1;


		
		_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";
		_container_type = ((_gear select 1) select _container) select 0;
		
		if (_container_type != "") then {
			if (uiNamespace getVariable "CTI_dialog_ui_gear_items_tab" == _container) then {lnbClear 70109};
			
			["Container", "", _container_type, [_container, ((_gear select 1) select _container) select 1]] call CTI_UI_Gear_UpdateMass;
			((_gear select 1) select _container) set [1, []];
			[_container, 70301+_container] call CTI_UI_Gear_UpdateContainerProgress;
			
			call CTI_UI_Gear_UpdatePrice;
		};
	};


/*
		if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
			_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";
		_container_type = ((_gear select 1) select _container) select 0;

		if (_container_type != "") then {
				if (uiNamespace getVariable "CTI_dialog_ui_gear_items_tab" == _container) then {lnbClear 70109};

				["Container", "", _container_type, [_container, ((_gear select 1) select _container) select 1]] call CTI_UI_Gear_UpdateMass;
			((_gear select 1) select _container) set [1, []];
				[_container, 70301+_container] call CTI_UI_Gear_UpdateContainerProgress;

				call CTI_UI_Gear_UpdatePrice;
			};
		};
	};
*/
};
