//--- Display a vehicle's content in the Gear UI
CTI_UI_Gear_DisplayInventoryVehicle = {
	private ["_gear", "_list", "_u"];
	_gear = _this;
	

	lnbClear 70109;
	_list = [];
	_u = 0;
	
	{
		_item = _x;
		if !(_item in _list) then {
			_count = {_x == _item} count _gear;
			_config = (_item) call CTI_UI_Gear_GetItemBaseConfig;
			lnbAddRow [70109, [format ["x%1", _count], format ["%1", getText(configFile >> _config >> _item >> 'displayName')]]];
			lnbSetPicture [70109, [_u, 0], getText(configFile >> _config >> _item >> 'picture')];
			lnbSetData [70109, [_u, 0], _item];
			lnbSetValue [70109, [_u, 0], _count];
			_list pushBack _item;
			_u = _u + 1;
		};
	} forEach _gear;
};

CTI_UI_Gear_AddVehicleItem = {
	private ["_gear", "_item"];
	_gear = _this select 0;
	_item = _this select 1;
	
	_gear pushBack _item;
	
	//--- Update the vehicle's mass
	[_item, "add"] call CTI_UI_Gear_UpdateVehicleLoad;
	
	//--- Update the Vehicle container along with the mass
	call CTI_UI_Gear_UpdateVehicleContainerProgress;
	(_gear) call CTI_UI_Gear_DisplayInventoryVehicle;
	
	true
};

CTI_UI_Gear_EnableVehicleOverlay = {
	private ["_startidc"];

	//--- Weapons
	_startidc = 70013;
	
	_default_weapons = ["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_secondary_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_hgun_gs.paa"];
	_default_accs = ["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa", "\A3\ui_f\data\gui\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa"];
	_default_clothes = ["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa"];
	_default_bin = ["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_glasses_gs.paa"];
	_default_items = [["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_nvg_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa"], ["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_map_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_gps_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_radio_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_compass_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_watch_gs.paa"]];
	
	for '_i' from 0 to 2 do {
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetText (_default_weapons select _i);
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetTooltip "";
		_startidc = _startidc + 1;
		
		for '_j' from 0 to 3 do {
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetText (_default_accs select _j);
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetTooltip "";
			_startidc = _startidc + 1;
		};
	};
	
	//--- Uniform, Vest and backpack
	for '_i' from 0 to 2 do {
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70001+_i) ctrlSetText (_default_clothes select _i);
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70001+_i) ctrlSetTooltip "";
	};
	
	//--- Accessories
	for '_i' from 0 to 1 do {
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70004+_i) ctrlSetText (_default_bin select _i);
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70004+_i) ctrlSetTooltip "";
	};
	
	//--- Accessories - specials and items
	_startidc = 70006;
	{
		_index = _forEachIndex;
		{
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetText ((_default_items select _index) select _forEachIndex);
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetTooltip "";
			_startidc = _startidc + 1;
		} forEach _x;
	} forEach _default_items;
	
	//--- Load the vest/vehicle container
	uiNamespace setVariable ["CTI_dialog_ui_gear_items_tab", 0];
	(uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 77001 ctrlSetBackgroundColor [1, 1, 1, 0.4];
	
	{((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _x) ctrlSetBackgroundColor [1, 1, 1, 0.15]} forEach [77002, 77003];
	
	//--- Mask the extra containers
	{((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _x) progressSetPosition 0} forEach [70302, 70303];
};

//--- Update the corresponding RscProgress bar
CTI_UI_Gear_UpdateVehicleContainerProgress = {
	private ["_idc"];
	
	_idc = 70301;
	
	_mass = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear_mass";
	_container_capacity = _mass select 0;
	_container_items_mass = _mass select 1;
	
	_progress = if (_container_capacity != 0) then {_container_items_mass / _container_capacity} else {0};
	((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) progressSetPosition _progress;
	((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetTooltip (if (_container_capacity != 0) then {Format ["Mass: %1 / %2", _container_items_mass, _container_capacity]} else {""});
};

CTI_UI_Gear_UpdateVehicleLoad = {
	private ["_item"];
	_item = _this select 0;
	_operation = _this select 1;
	
	_mass_item = _item call CTI_UI_Gear_GetGenericItemMass;
	_mass = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear_mass";
	_mass set [1, if (_operation == "delete") then {(_mass select 1) - _mass_item} else {(_mass select 1) + _mass_item}];
};

CTI_UI_Gear_GetVehicleLoad = {
	private ["_gear"];
	_gear = _this;
	
	_mass = 0;
	
	{_mass = _mass + (_x call CTI_UI_Gear_GetGenericItemMass)} forEach _gear;
	
	_mass
};

//--- Display the gear on the Gear UI
CTI_UI_Gear_DisplayInventory = {
	private ["_config_base", "_gear", "_load", "_startidc", "_startidc_current_mag", "_use", "_use_id"];

	_gear = _this;

	//--- Weapons
	_startidc = 70013;
	_startidc_current_mag = 70901;

	_default_weapons = ["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_secondary_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_hgun_gs.paa"];
	_default_accs = ["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa", "\A3\ui_f\data\gui\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa"];
	_default_clothes = ["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa"];
	_default_bin = ["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_helmet_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_glasses_gs.paa"];
	_default_items = [["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_nvg_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_binocular_gs.paa"], ["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_map_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_gps_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_radio_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_compass_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_watch_gs.paa"]];

	{
		if (_x select 0 != "") then {
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetText getText(configFile >> 'CfgWeapons' >> _x select 0 >> 'picture');
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetTooltip getText(configFile >> 'CfgWeapons' >> _x select 0 >> 'displayName');
		} else {
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetText (_default_weapons select _forEachIndex);
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetTooltip "";
		};
		_startidc = _startidc + 1;

		if (count (_x select 1) > 0) then {
			for '_i' from 0 to 3 do {
				if ((_x select 1) select _i != "") then {
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetText getText(configFile >> 'CfgWeapons' >> (_x select 1) select _i >> 'picture');
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetTooltip getText(configFile >> 'CfgWeapons' >> (_x select 1) select _i >> 'displayName');
				} else {
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetText (_default_accs select _i);
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetTooltip "";
				};
				_startidc = _startidc + 1;
			};
		} else {
			for '_i' from 0 to 3 do {
				((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetText (_default_accs select _i);
				((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetTooltip "";
				_startidc = _startidc + 1;
			};
		};

		if (count(_x select 2) > 0) then {
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc_current_mag+_forEachindex) ctrlSetText getText(configFile >> 'CfgMagazines' >> ((_x select 2) select 0) >> 'picture');
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc_current_mag+_forEachindex) ctrlSetTooltip getText(configFile >> 'CfgMagazines' >> ((_x select 2) select 0) >> 'displayName');
		} else {
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc_current_mag+_forEachindex) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc_current_mag+_forEachindex) ctrlSetTooltip "";
		};
	} forEach (_gear select 0);

	//--- Uniform, Vest and backpack
	{
		if (_x select 0 != "") then {
			_config_base = (_x select 0) call CTI_UI_Gear_GetItemBaseConfig;
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70001+_forEachIndex) ctrlSetText getText(configFile >> _config_base >> _x select 0 >> 'picture');
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70001+_forEachIndex) ctrlSetTooltip getText(configFile >> _config_base >> _x select 0 >> 'displayName');
		} else {
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70001+_forEachIndex) ctrlSetText (_default_clothes select _forEachIndex);
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70001+_forEachIndex) ctrlSetTooltip "";
		};
	} forEach (_gear select 1);

	//--- Accessories
	{
		if (_x != "") then {
			_config = if (isClass(configFile >> 'CfgWeapons' >> _x)) then {"CfgWeapons"} else {"CfgGlasses"};
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70004+_forEachIndex) ctrlSetText getText(configFile >> _config >> _x >> 'picture');
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70004+_forEachIndex) ctrlSetTooltip getText(configFile >> _config >> _x >> 'displayName');
		} else {
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70004+_forEachIndex) ctrlSetText (_default_bin select _forEachIndex);
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70004+_forEachIndex) ctrlSetTooltip "";
		};
	} forEach (_gear select 2);

	//--- Accessories - specials and items
	_startidc = 70006;
	{
		_def_root = _forEachIndex;
		{
			if (_x != "") then {
				((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetText getText(configFile >> 'CfgWeapons' >> _x >> 'picture');
				((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetTooltip getText(configFile >> 'CfgWeapons' >> _x >> 'displayName');
			} else {
				((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetText ((_default_items select _def_root) select _forEachIndex);
				((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _startidc) ctrlSetTooltip "";
			};
			_startidc = _startidc + 1;
		} forEach _x;
	} forEach (_gear select 3);

	//--- Unless told otherwise, load the vest content.
	//todo tweak that
	_idcs = [77001,77002,77003];
	_load = [1,0,2];
	_use = [];
	_use_id = 0;
	{
		if (((_gear select 1) select _x) select 0 != "") exitWith {_use = ((_gear select 1) select _x) select 1; _use_id = _x};
	} forEach _load;

	uiNamespace setVariable ["CTI_dialog_ui_gear_items_tab", _use_id];
	((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl (_idcs select _use_id)) ctrlSetBackgroundColor [1, 1, 1, 0.4];

	{
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _x) ctrlSetBackgroundColor [1, 1, 1, 0.15];
	} forEach (_idcs - [_idcs select _use_id]);

	(_use) call CTI_UI_Gear_DisplayContainerItems;
};

//--- Display the items from a container
CTI_UI_Gear_DisplayContainerItems = {
	private ["_config", "_find", "_list", "_item", "_items"];
	_list = _this;

	lnbClear 70109;

	_items = [[], []];
	if (count _list > 0) then {
		{
			_find = (_items select 0) find _x;
			if (_find == -1) then {
				(_items select 0) pushBack _x;
				(_items select 1) pushBack 1;
			} else {
				(_items select 1) set [_find, ((_items select 1) select _find) + 1];
			};
		} forEach _list;
	};

	for '_i' from 0 to count(_items select 0)-1 do {
		_item = (_items select 0) select _i;
		_config = (_item) call CTI_UI_Gear_GetItemBaseConfig;

		lnbAddRow [70109, [format ["x%1", (_items select 1) select _i], format ["%1", getText(configFile >> _config >> _item >> 'displayName')]]];
		lnbSetPicture [70109, [_i, 0], getText(configFile >> _config >> _item >> 'picture')]; // listbox of magazines
		lnbSetData [70109, [_i, 0], _item];
		lnbSetValue [70109, [_i, 0], (_items select 1) select _i];
	};
};

//--- Display the shoping tab items
CTI_UI_Gear_DisplayShoppingItems = {
	private ["_get", "_list", "_tab", "_upgrade_gear", "_upgrades"];

	_tab = _this;

	(_tab) call CTI_UI_Gear_HighlightTab;

	lnbClear 70108;

	_selectedRole = WSW_gbl_boughtRoles select 0;
    if!(isnil '_selectedRole')then{
        _list = switch (_tab) do {
            case CTI_GEAR_TAB_PRIMARY: {
                _gearListPrimary = missionNamespace getVariable format["CTI_gear_list_primary_%1",_selectedRole];
                if!(isNil '_gearListPrimary')then{
                    (missionNamespace getVariable "CTI_gear_list_primary") + _gearListPrimary
                } else {
                    missionNamespace getVariable "CTI_gear_list_primary"
                };
             };
            case CTI_GEAR_TAB_SECONDARY: {
                _gear_list_secondary = missionNamespace getVariable format["CTI_gear_list_secondary_%1",_selectedRole];
                if!(isNil '_gear_list_secondary')then{
                    (missionNamespace getVariable "CTI_gear_list_secondary") + _gear_list_secondary
                } else {
                    missionNamespace getVariable "CTI_gear_list_secondary"
                };
            };
            case CTI_GEAR_TAB_HANDGUN: {
                _gear_list_pistol = missionNamespace getVariable format["CTI_gear_list_pistol_%1",_selectedRole];
                if!(isNil '_gear_list_pistol')then{
                    (missionNamespace getVariable "CTI_gear_list_pistol") + _gear_list_pistol
                } else {
                    missionNamespace getVariable "CTI_gear_list_pistol"
                };
            };
            case CTI_GEAR_TAB_ACCESSORIES: {
                _gear_list_accessories = missionNamespace getVariable format["CTI_gear_list_accessories_%1",_selectedRole];
                if!(isNil '_gear_list_pistol')then{
                    (missionNamespace getVariable "CTI_gear_list_accessories") + _gear_list_accessories
                } else {
                    missionNamespace getVariable "CTI_gear_list_accessories"
                };
            };
            case CTI_GEAR_TAB_AMMO: {
                _gear_list_magazines = missionNamespace getVariable format["CTI_gear_list_magazines_%1",_selectedRole];
                if!(isNil '_gear_list_pistol')then{
                    (missionNamespace getVariable "CTI_gear_list_magazines") + _gear_list_magazines
                } else {
                    missionNamespace getVariable "CTI_gear_list_magazines"
                };
            };
            case CTI_GEAR_TAB_MISC: {
                _gear_list_special = missionNamespace getVariable format["CTI_gear_list_special_%1",_selectedRole];
                _gear_list_misc = missionNamespace getVariable format["CTI_gear_list_misc_%1",_selectedRole];
                _gear_list_explosives = missionNamespace getVariable format["CTI_gear_list_explosives_%1",_selectedRole];

                if(!(isNil '_gear_list_special') && !(isNil '_gear_list_misc') && !(isNil '_gear_list_explosives'))then{
                    (missionNamespace getVariable "CTI_gear_list_special") + _gear_list_special +
                    (missionNamespace getVariable "CTI_gear_list_misc") + _gear_list_misc +
                    (missionNamespace getVariable "CTI_gear_list_explosives") + _gear_list_explosives
                } else {
                    (missionNamespace getVariable "CTI_gear_list_special") +
                    (missionNamespace getVariable "CTI_gear_list_misc") +
                    (missionNamespace getVariable "CTI_gear_list_explosives")
                };
            };
            case CTI_GEAR_TAB_EQUIPMENT: {
                _gear_list_uniforms = missionNamespace getVariable format["CTI_gear_list_uniforms_%1",_selectedRole];
                _gear_list_vests = missionNamespace getVariable format["CTI_gear_list_vests_%1",_selectedRole];
                _gear_list_backpacks = missionNamespace getVariable format["CTI_gear_list_backpacks_%1",_selectedRole];
                _gear_list_headgear = missionNamespace getVariable format["CTI_gear_list_headgear_%1",_selectedRole];
                _gear_list_glasses = missionNamespace getVariable format["CTI_gear_list_glasses_%1",_selectedRole];

                if(!(isNil '_gear_list_uniforms') && !(isNil '_gear_list_vests') && !(isNil '_gear_list_backpacks') &&
                    !(isNil '_gear_list_headgear') && !(isNil '_gear_list_glasses'))then{
                    (missionNamespace getVariable "CTI_gear_list_uniforms") + _gear_list_uniforms +
                    (missionNamespace getVariable "CTI_gear_list_vests") + _gear_list_vests +
                    (missionNamespace getVariable "CTI_gear_list_backpacks") + _gear_list_backpacks +
                    (missionNamespace getVariable "CTI_gear_list_headgear") + _gear_list_headgear +
                    (missionNamespace getVariable "CTI_gear_list_glasses") + _gear_list_glasses
                }else{
                    (missionNamespace getVariable "CTI_gear_list_uniforms") +
                    (missionNamespace getVariable "CTI_gear_list_vests") +
                    (missionNamespace getVariable "CTI_gear_list_backpacks") +
                    (missionNamespace getVariable "CTI_gear_list_headgear") +
                    (missionNamespace getVariable "CTI_gear_list_glasses")
                };
            };
            default {
                profileNamespace getVariable format["CTI_PERSISTENT_GEAR_TEMPLATE_%1_%2", CTI_Client_SideJoined, _selectedRole]
            };
        };
    } else {
        _list = switch (_tab) do {
            case CTI_GEAR_TAB_PRIMARY: {missionNamespace getVariable "CTI_gear_list_primary"};
            case CTI_GEAR_TAB_SECONDARY: {missionNamespace getVariable "CTI_gear_list_secondary"};
            case CTI_GEAR_TAB_HANDGUN: {missionNamespace getVariable "CTI_gear_list_pistol"};
            case CTI_GEAR_TAB_ACCESSORIES: {missionNamespace getVariable "CTI_gear_list_accessories"};
            case CTI_GEAR_TAB_AMMO: {missionNamespace getVariable "CTI_gear_list_magazines"};
            case CTI_GEAR_TAB_MISC: {(missionNamespace getVariable "CTI_gear_list_special") + (missionNamespace getVariable "CTI_gear_list_misc") + (missionNamespace getVariable "CTI_gear_list_explosives")};
            case CTI_GEAR_TAB_EQUIPMENT: {
                (missionNamespace getVariable "CTI_gear_list_uniforms") + (missionNamespace getVariable "CTI_gear_list_vests") + (missionNamespace getVariable "CTI_gear_list_backpacks") +
                (missionNamespace getVariable "CTI_gear_list_headgear") + (missionNamespace getVariable "CTI_gear_list_glasses")
            };
            default {missionNamespace getVariable "CTI_gear_list_templates"};
        };
    };

	_upgrades = (CTI_Client_SideJoined) Call CTI_CO_FNC_GetSideUpgrades;
	_upgrade_gear = _upgrades select CTI_UP_GEAR;
	
	if (_tab != CTI_GEAR_TAB_TEMPLATES) then { //--- Generic items
		{
		    _isRoleItem = false;
			_get = missionNamespace getVariable format["CTI_%1", _x];

            if!(isnil '_selectedRole')then{
                _gearDetails = _get select 0;
                if(_gearDetails select 2 == _selectedRole)then{
                    _isRoleItem = true;
                };
            };

			if !(isNil "_get") then {
				if (((_get select 0) select 0) <= _upgrade_gear) then { //--- Add the item if it's equal or below the upgrade level
					
					//need add scopename to keep the names different(CUP displays same name for all)
					//_row = lnbAddRow [70108, [getText(configFile >> _get select 2 >> _x >> 'displayName'), format ["$%1", (_get select 0) select 1]]];
					
					_Cname_weapon=_x;
					
					_componentlist= _Cname_weapon call BIS_fnc_weaponComponents;
					
					
					
					_Dname_weapon=getText(configFile >> _get select 2 >> _x >> 'displayName');
					
					_finalString=_Dname_weapon;
					
					if ((count _componentlist)>1) then {
					
					_first_from_list= _componentlist #1;//#0 ==  baseclass of weapon
					
					_name_diffcomponent=getText(configFile >> _get select 2 >> _first_from_list >> 'displayName');
					
					
					
					_finalString=_Dname_weapon+" ("+_name_diffcomponent+")";
					
					
					
					};
					
					
					//_row = lnbAddRow [70108, [getText(configFile >> _get select 2 >> _x >> 'displayName'),_name_diffcomponent, format ["$%1", (_get select 0) select 1]]];
					
					_row = lnbAddRow [70108, [_finalString, format ["$%1", (_get select 0) select 1]]];
					
					
					
					lnbSetPicture [70108, [_row, 1], getText(configFile >> _get select 2 >> _x >> 'picture')]; // shoplist pictures of guns
					lnbSetData [70108, [_row, 0], toLower(_x)];
					if(_isRoleItem)then{
                        lnbSetColor [70108,[_row,0],[0.6, 0.4, 0.6, 1.0]];
                        lnbSetColor [70108,[_row,1],[0.6, 0.4, 0.6, 1.0]];
					};
				};
			};
		} forEach _list;
	} else { //--- Templates
	    if!(isnil '_selectedRole')then{
	        _templates = missionNamespace getVariable format["CTI_gear_list_templates_%1_%2", CTI_Client_SideJoined, _selectedRole];
	    }else{
	        _templates = missionNamespace getVariable "CTI_gear_list_templates";
	    };

        if!(isnil '_templates')then{
            {
                _template = _x;
                _gear = _template select 3;
                _upgrade = -1;
                _current_upgrade_level = 0;
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

                if(_upgrade > _upgrade_gear) then{
                    _template set [4, _upgrade];
                    missionNamespace setVariable ["CTI_gear_list_templates", _templates];
                    _list set [_forEachIndex, _template]
                }

            }foreach _templates;
        };

		{		
			if ((_x select 4) <= _upgrade_gear) then { //--- Add the template if it's equal or below the upgrade level
				_row = lnbAddRow [70108, [_x select 0, format ["$%1", _x select 2]]];
				if (_x select 1 != "") then {lnbSetPicture [70108, [_row, 1], _x select 1]};
				lnbSetValue [70108, [_row, 0], _x select 4];
			};
		} forEach _list;
	};

	if (lnbCurSelRow 70108 != -1 && lnbCurSelRow 70108 < (lnbSize 70108) select 0) then {
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70108) lnbSetCurSelRow lnbCurSelRow 70108;
	} else {
		lnbClear ((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70601);
	};
};

CTI_UI_Gear_HighlightTab = {
	private ["_IDCs", "_index", "_selected"];
	_index = _this;

	_IDCs = [70501, 70502, 70503, 70504, 70505, 70506, 70507, 70508];
	_selected = _IDCs select _index;
	_IDCS = _IDCS - [_selected];

	{
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _x) ctrlSetTextColor [0.4, 0.4, 0.4, 1];
	} forEach _IDCs;
	// ((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _selected) ctrlSetTextColor [1, 1, 1, 1];
	((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _selected) ctrlSetTextColor [0.258823529, 0.713725490, 1, 1];
};



CTI_UI_Gear_ReplaceWeapon = {
	private ["_accessories", "_changed", "_defaults", "_gear", "_idc", "_index", "_item", "_item_old"];

	_item = _this select 0;
	_index = _this select 1;
	_removeMagazines = if (count _this > 2) then {_this select 2} else {false};

	_idc = [70013,70018,70023] select _index;
	_gear = uiNamespace getVariable "cti_dialog_ui_gear_target_gear";

	_accessories = ((_gear select 0) select _index) select 1;
	_item_old = ((_gear select 0) select _index) select 0;

	_changed = true;

	if !(_item isEqualTo "") then { //--- Replace
		
		
		
		switch (_index) do {
			case 0: { //--- Adding a primary weapon
				if ((_item call CTI_UI_Gear_GetItemConfigType) isEqualTo 5) then { ["", 1] call CTI_UI_Gear_ReplaceWeapon }; //--- The launcher is gone if the weapon is considered heavy
			};
			case 1: { //--- Adding a secondary weapon
				_primary = ((_gear select 0) select 0) select 0;
				if !(_primary isEqualTo "") then {
					if ((_primary call CTI_UI_Gear_GetItemConfigType) isEqualTo 5) then { _changed = false }; //--- Heavy primary prevent the launcher from being picked
				};
			};
		};
		
		
		
		if (_changed) then {
			((_gear select 0) select _index) set [0, _item];
			((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl _idc) ctrlSetText getText(configFile >> 'CfgWeapons' >> _item >> 'picture');
			((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl _idc) ctrlSetTooltip getText(configFile >> 'CfgWeapons' >> _item >> 'displayName');

			//--- Do we keep the ammunitions? fuck this bugshit,we get new everytime
			//if !(_item_old isEqualTo "") then {[_item_old, _item, _removeMagazines] call CTI_UI_Gear_CheckMagazines};
			
			
			//get weapon mag
			_magazines = [];
			_bthis= _item call BIS_fnc_baseWeapon;		
			//launcher get normal magazine load
			if (getNumber(configFile >> "CfgWeapons" >> _item >> "type") == 4 ) then {
			_magazines = _magazines + getArray(configFile >> 'CfgWeapons' >> _item >> 'magazines');
			} else {
			//_magazines = _magazines + getArray(configFile >> 'CfgWeapons' >> _bthis >> 'magazines');
			
			_magazines =[_item] call BIS_fnc_compatibleMagazines;
			
			
			};
			//get first mag
			_mag= _magazines # 0;
			
			
			//load fkn mag
			[_mag, _index, 70901+_index] call CTI_UI_Gear_ChangeCurrentMagazine;
			
			
			//little update price bug now if mag is similar to loaded and paid ones,but better than drag mag everytime
			//for launcherammo this bug not exist(idk why) and rifleammo cheap,so i dont fix this little problem
			//-------------------------------------------------------------
			
			//add items to weapontypes like ak_pso(pretty sure there is a better way to do this,but this works too)
			
			
			_itemlist= _item call BIS_fnc_weaponComponents;
			
			
			
			if ((count _itemlist)==2) then {
			(_itemlist # 1) call CTI_UI_Gear_AddItem;};
			
			
			if ((count _itemlist)==3) then {
			(_itemlist # 1) call CTI_UI_Gear_AddItem;
			(_itemlist # 2) call CTI_UI_Gear_AddItem;
			};
			
			if ((count _itemlist)==4) then {
			(_itemlist # 1) call CTI_UI_Gear_AddItem;
			(_itemlist # 2) call CTI_UI_Gear_AddItem;
			(_itemlist # 3) call CTI_UI_Gear_AddItem;
			};
			
			if ((count _itemlist)==5) then {
			(_itemlist # 1) call CTI_UI_Gear_AddItem;
			(_itemlist # 2) call CTI_UI_Gear_AddItem;
			(_itemlist # 3) call CTI_UI_Gear_AddItem;
			(_itemlist # 4) call CTI_UI_Gear_AddItem;
			};
			
			if !(_item_old isEqualTo "") then {[_item_old, _item, _removeMagazines] call CTI_UI_Gear_CheckMagazines};
			
			
			
			
		};
	} else { //--- Remove
		_defaults = ["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_primary_gs.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_secondary_gs.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_hgun_gs.paa"];
		(_gear select 0) set [_index, ["", [], [""]]];

		((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl _idc) ctrlSetText (_defaults select _index);
		((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl _idc) ctrlSetTooltip "";

		["", _index, 70901+_index] call CTI_UI_Gear_ChangeCurrentMagazine;
		
		
		/*
		//primary
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70901) ctrlGetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
		//secondary
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70902) ctrlGetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
		//pistol
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70903) ctrlGetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
		
		//get weapon mag
			_magazines = [];
			_bthis= _item call BIS_fnc_baseWeapon;		
			//launcher get normal magazine load
			if (getNumber(configFile >> "CfgWeapons" >> _item >> "type") == 4 ) then {
			_magazines = _magazines + getArray(configFile >> 'CfgWeapons' >> _item >> 'magazines');
			} else {
			_magazines = _magazines + getArray(configFile >> 'CfgWeapons' >> _bthis >> 'magazines');
			};
			//get first mag
			_mag= _magazines # 0;
			
			
			//load fkn mag
			[_mag, _index, 70901+_index] call CTI_UI_Gear_ChangeCurrentMagazine;
		
		
		
		
		*/
		
		
		
	};

  
	if (_changed) then { [_item, _index, [_idc+1, _idc+2, _idc+3, _idc+4]] call CTI_UI_Gear_CheckAccessories }; //--- Do we keep the accessories?
};




//--- Replace a container (Uniform, Vest or Backpack)

CTI_UI_Gear_ReplaceContainer = {
	private ["_config_base", "_container", "_current", "_defaults", "_gear", "_item", "_updated"];

	_item = _this select 0;
	_container = _this select 1;
	_updated = false;

	_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";

	if (_item != "") then {
		_current = ((_gear select 1) select _container) select 0;
		_config_base = (_item) call CTI_UI_Gear_GetItemBaseConfig;

		if (_current != _item) then {
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70001+_container) ctrlSetText getText(configFile >> _config_base >> _item >> 'picture');
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70001+_container) ctrlSetTooltip getText(configFile >> _config_base >> _item >> 'displayName');

			["Container", "", _item, [_container, ((_gear select 1) select _container) select 1]] call CTI_UI_Gear_UpdateMass;
			[_container, 70301+_container] call CTI_UI_Gear_UpdateContainerProgress; //--- Update the Mass RscProgress

			
			
	
			
			//create muligroup and muli to get prefilled backpackstuff (found no other solution)
			_grp_get_fkn_PREFILLED = createGroup [civilian, true];

				_muli = _grp_get_fkn_PREFILLED createUnit [ "C_man_p_beggar_F", [position player#0,position player#1,position player#2 +10000], [], 0, "FORM"];

				if (_container == 2) then {
				_muli addBackpack _item;
				_list = backpackItems _muli;
				{ [_x,2] call CTI_UI_Gear_TryContainerAddItem } forEach _list;
				(_gear select 1) set [_container, [_item,_list]];
				};

				if (_container == 1) then {
				_muli addVest  _item;
				_list = vestItems _muli;
				{ [_x,1] call CTI_UI_Gear_TryContainerAddItem } forEach _list;
				(_gear select 1) set [_container, [_item,_list]];
				};

				if (_container == 0) then {
				removeUniform _muli;
				_muli addUniform _item;
				_list = uniformItems _muli;
				{ [_x,0] call CTI_UI_Gear_TryContainerAddItem } forEach _list;
				(_gear select 1) set [_container, [_item,_list]];
				};

				deleteVehicle _muli;
	
			
			
			//(_gear select 1) set [_container, [_item,[]]];
			
			
			
			
			
			
			
			_updated = true;
		};
	} else {
		if ((((_gear select 1) select _container) select 0) != "") then {
			_defaults = ["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_uniform_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_vest_gs.paa", "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_backpack_gs.paa"];

			["Container", "", _item, [_container, ((_gear select 1) select _container) select 1]] call CTI_UI_Gear_UpdateMass;

			(_gear select 1) set [_container, [_item,[]]];

			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70001+_container) ctrlSetText (_defaults select _container);
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70001+_container) ctrlSetTooltip "";

			[_container, 70301+_container] call CTI_UI_Gear_UpdateContainerProgress;
			_updated = true;
		};
	};

	if ((uiNamespace getVariable "CTI_dialog_ui_gear_items_tab") == _container) then {(((_gear select 1) select _container) select 1) call CTI_UI_Gear_DisplayContainerItems};

	_updated
};



CTI_UI_Gear_TryContainerAddItem = {
	private ["_container", "_item", "_updated"];
	
	
	
	_item = _this select 0;
	_container = if (count _this > 1) then {_this select 1} else {uiNamespace getVariable "cti_dialog_ui_gear_items_tab"};
	_tryAll = if (count _this > 2) then {_this select 2} else {true};
	_updated = false;

	


	if ([_item, _container] call CTI_UI_Gear_CanAddItemWithMass) then {
		[_item, _container] call CTI_UI_Gear_AddContainerItem;
		["ContainerItem", "", _item, [_container]] call CTI_UI_Gear_UpdateMass; //--- Update the mass.
		[_container, 70301+_container] call CTI_UI_Gear_UpdateContainerProgress; //--- Update the Mass RscProgress
		_updated = true;
	};
	if (!_updated && _tryAll) then {
		{
			_updated = [_item, _x, false] call CTI_UI_Gear_TryContainerAddItem;
			if (_updated) exitWith {};
		} forEach [0,1,2];
	};
	_updated
};



//--- Item add attempt
CTI_UI_Gear_AddItem = {
	private ["_current", "_get", "_gear", "_index", "_item", "_slot", "_sub_type", "_type", "_updated"];

	_item = toLower(_this);

	_get = missionNamespace getVariable format["CTI_%1", _item];
	_updated = false;

	if !(isNil '_get') then {
		//--- Depending on the item, we do different checks.
		_type = if (typeName (_get select 1) == "STRING") then {_get select 1} else {(_get select 1) select 0};
		_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";

		switch (_type) do {
			case "Rifle": { //--- Primary
				[_item, 0] call CTI_UI_Gear_ReplaceWeapon;
				_updated = true;
			};
			case "Launcher": { //--- Secondary
				[_item, 1] call CTI_UI_Gear_ReplaceWeapon;
				_updated = true;
			};
			case "Pistol": { //--- Handgun
				[_item, 2] call CTI_UI_Gear_ReplaceWeapon;
				_updated = true;
			};
			case "Rifle 2H": { //--- Two handed rifle, no launchers
				[_item, 0] call CTI_UI_Gear_ReplaceWeapon;
				["", 1] call CTI_UI_Gear_ReplaceWeapon;
				_updated = true;
			};
			case "Equipment": { //--- Binoc... NVG...
				//--- Simulation?
				_index = if (getText(configFile >> 'CfgWeapons' >> _item >> 'simulation') == "NVGoggles") then {0} else {1};
				_current = ((_gear select 3) select 0) select _index;

				if (_current != _item) then { //--- Replace
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl (70006+_index)) ctrlSetText getText(configFile >> 'CfgWeapons' >> _item >> 'picture');
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl (70006+_index)) ctrlSetTooltip getText(configFile >> 'CfgWeapons' >> _item >> 'displayName');

					((_gear select 3) select 0) set [_index, _item];
					_updated = true;
				};
			};
			case "Item": { //--- Uniform, vest, helm, gps, compass, toolkit...
				_sub_type = if (typeName (_get select 1) == "STRING") then {_get select 1} else {(_get select 1) select 1};

				switch (true) do {
					case (_sub_type in ["","BaseItem"]): {
						_slot = switch (getText(configFile >> 'CfgWeapons' >> _item >> 'simulation')) do {
							case "ItemMap": {0};
							case "ItemGPS": {1};
							case "ItemRadio": {2};
							case "ItemCompass": {3};
							case "ItemWatch": {4};
							default {-1};
						};

						//OFPS FIX
						if (_slot isEqualTo -1) then { //--- Check if the item is an UAV Terminal, in that case, it goes straight in the GPS slot
							if (getNumber(configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "type") isEqualTo CTI_SUBTYPE_UAVTERMINAL) then {_slot = 1};
						};


						if (_slot != -1) then { //--- Special item
							_current = ((_gear select 3) select 1) select _slot;

							if (_current != _item) then {
								((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl (70008+_slot)) ctrlSetText getText(configFile >> 'CfgWeapons' >> _item >> 'picture');
								((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl (70008+_slot)) ctrlSetTooltip getText(configFile >> 'CfgWeapons' >> _item >> 'displayName');

								((_gear select 3) select 1) set [_slot, _item];
								_updated = true;
							};
						} else { //--- Stock item
							_updated = [_item] call CTI_UI_Gear_TryContainerAddItem;
						};
					};
					case (_sub_type in ["Acc-Muzzle","Acc-Optics","Acc-Side","Acc-Bipod"]): {
						// _updated = [_item] call CTI_UI_Gear_TryContainerAddItem;
						
						//--- Try to equip it.
						_updated = [_item, _sub_type] call CTI_UI_Gear_TryEquipAccessory;
						
					};
					case (_sub_type == "Item"): {
						_updated = [_item] call CTI_UI_Gear_TryContainerAddItem;
					};
					case (_sub_type == "Headgear"): {
						_current = (_gear select 2) select 0;

						if (_current != _item) then {
							((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70004) ctrlSetText getText(configFile >> 'CfgWeapons' >> _item >> 'picture');
							((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70004) ctrlSetTooltip getText(configFile >> 'CfgWeapons' >> _item >> 'displayName');

							(_gear select 2) set [0, _item];
							_updated = true;
						};
					};
					/*
					case (_sub_type in ["Uniform","Vest"]): {
						_updated = [_item, if (_sub_type == "Uniform") then {0} else {1}] call CTI_UI_Gear_ReplaceContainer;
					};
					*/
					
					case (_sub_type == "Uniform"): {
					
					_updated = [_item, 0] call CTI_UI_Gear_ReplaceContainer;
					
					
					};
					
					case (_sub_type == "Vest"): {
					
					_updated = [_item, 1] call CTI_UI_Gear_ReplaceContainer;
					
					
					};
					
					
					
					
					
				};
			};
			case "Magazines": {
				_updated = [_item] call CTI_UI_Gear_TryContainerAddItem;
			};
			case "Backpack": {
				_updated = [_item, 2] call CTI_UI_Gear_ReplaceContainer;
				
				
		
			};
			case "Goggles": {
				_current = (_gear select 2) select 1;

				if (_current != _item) then {
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70005) ctrlSetText getText(configFile >> 'CfgGlasses' >> _item >> 'picture');
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70005) ctrlSetTooltip getText(configFile >> 'CfgGlasses' >> _item >> 'displayName');

					(_gear select 2) set [1, _item];
					_updated = true;
				};
			};
		};
	};

	_updated
};

CTI_UI_Gear_TryEquipAccessory = {
	private["_accessory", "_gear"];
	
	_accessory = _this select 0;
	_sub_type = _this select 1;
	
	_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";
	
	//--- Retrieve the matching config element
	_config_properties_acc = ["MuzzleSlot","PointerSlot","CowsSlot","UnderBarrelSlot"];
	_config_properties = ["Acc-Muzzle","Acc-Side","Acc-Optics","Acc-Bipod"];
	
	_index_acc = _config_properties find _sub_type;
	_config = _config_properties_acc select _index_acc;
	_idcs_acc_start = [70014, 70019, 70024]; //--- Muzzle IDCs
	
	//--- Check each weapons
	_match = false;
	{
		if (_x select 0 != "") then {
			//--- Check if the accessory is already equiped or not
			_do_check = true;
			if (count(_x select 1) > 0) then {
				if ((_x select 1) select _index_acc == _accessory) then {_do_check = false};
			};
			
			//--- Check if the accessory is compatible with this weapon
			if (_do_check) then {
				
				/*old waspcode
				_compatibleItems = (getArray(configFile >> 'CfgWeapons' >> (_x select 0) >> 'WeaponSlotsInfo' >> _config >> 'compatibleItems') call CTI_CO_FNC_ArrayToLower);
				{_compatibleItems pushBack toLower(configName _x)} forEach (configProperties[configfile >> "CfgWeapons" >> (_x select 0) >> "WeaponSlotsInfo" >> _config >> "compatibleItems", "true", true]);
				*/
				
				_compatibleItems = (_x select 0) call BIS_fnc_compatibleItems;
				_compatibleItems = (_compatibleItems) call CTI_CO_FNC_ArrayToLower;
					
					
				
				
				
				if (_accessory in _compatibleItems) then { //--- On match, equip the accessory
					_match = true;
					(((_gear select 0) select _forEachIndex) select 1) set [_index_acc, _accessory];
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl ((_idcs_acc_start select _forEachIndex)+_index_acc)) ctrlSetText getText(configFile >> 'CfgWeapons' >> _accessory >> 'picture');
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl ((_idcs_acc_start select _forEachIndex)+_index_acc)) ctrlSetTooltip getText(configFile >> 'CfgWeapons' >> _accessory >> 'displayName');
				};
			};
		};
		
		if (_match) exitWith {};
	} forEach (_gear select 0);
	
	_match
};

//--- Add an item within a container.
CTI_UI_Gear_AddContainerItem = {
	private["_config", "_exists", "_gear", "_index", "_item", "_items", "_row"];

	_item = _this select 0;
	_index = _this select 1;

	_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";

	_items = ((_gear select 1) select _index) select 1;
	_items = _items + [_item];
	((_gear select 1) select _index) set [1, _items];

	if (_index == uiNamespace getVariable "CTI_dialog_ui_gear_items_tab") then {
		_exists = -1;
		for '_i' from 0 to ((lnbSize 70109) select 0)-1 do {
			if (lnbData[70109, [_i, 0]] == _item) exitWith {_exists = _i};
		};

		if (_exists != -1) then {
			lnbSetValue [70109, [_exists,0], lnbValue[70109,[_exists,0]] + 1];
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70109) lnbSetText [[_exists, 0], format["x%1", lnbValue[70109,[_exists,0]]]];
		} else {
			_config = (_item) call CTI_UI_Gear_GetItemBaseConfig;
			_row = lnbAddRow [70109, ["x1", format ["%1", getText(configFile >> _config >> _item >> 'displayName')]]];
			lnbSetPicture [70109, [_row, 0], getText(configFile >> _config >> _item >> 'picture')];
			lnbSetData [70109, [_row, 0], _item];
			lnbSetValue [70109, [_row, 0], 1];
		};
	};
};

//--- Determine if an item can be added to a container based on it's mass and the one of the container.
CTI_UI_Gear_CanAddItemWithMass = {
	private["_index", "_item", "_mass", "_mass_capacity_container", "_mass_item", "_mass_items_container"];
	_item = _this select 0;
	_index = _this select 1;

	_mass = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear_mass";
	
	_mass_item = (_item) call CTI_UI_Gear_GetGenericItemMass;
	_mass_items_container = ((_mass select 1) select _index) select 0;
	_mass_capacity_container = ((_mass select 1) select _index) select 1;

	if (_mass_item + _mass_items_container <= _mass_capacity_container) then {true} else {false}
};

//--- Check whether accessories shall be kept after changing a weapon or not
CTI_UI_Gear_CheckAccessories = {
	private ["_defaults", "_defaults_process", "_gear", "_index", "_idcs", "_item"];

	_item = _this select 0;
	_index = _this select 1;
	_idcs = _this select 2;

	_defaults = ["\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_muzzle_gs.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_side_gs.paa","\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_top_gs.paa", "\A3\ui_f\data\gui\Rsc\RscDisplayGear\ui_gear_bipod_gs.paa"];
	_defaults_process = [];

	_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";
	if (_item == "" || count(((_gear select 0) select _index) select 1) == 0) then {
		((_gear select 0) select _index) set [1, []];
		_defaults_process = [0,1,2];
	} else {
		_config_properties = ["MuzzleSlot","PointerSlot","CowsSlot","UnderBarrelSlot"];

		for '_i' from 0 to 3 do {
			
			_compatibleItems = ([_item, ([101, 301, 201, 302] select _i)] call BIS_fnc_compatibleItems) call CTI_CO_FNC_ArrayToLower;

			
			if !(toLower((((_gear select 0) select _index) select 1) select _i) in _compatibleItems) then {
				(((_gear select 0) select _index) select 1) set [_i, ""];
				_defaults_process = _defaults_process + [_i];
			};
		};
	};

	{
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl (_idcs select _x)) ctrlSetText (_defaults select _x);
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl (_idcs select _x)) ctrlSetTooltip "";
	} forEach _defaults_process;
};



//--- Check whether magazines shall be kept after changing a weapon or not
CTI_UI_Gear_CheckMagazines = {
	private ["_gear", "_magazines", "_magazines_old", "_replace", "_weapon", "_weapon_old"];

	_weapon_old = _this select 0;
	_weapon = _this select 1;
	_removeMagazines = if (count _this > 2) then {_this select 2} else {false};

	_gear = uiNamespace getVariable "cti_dialog_ui_gear_target_gear";

	/*
	_magazines_old = (getArray(configFile >> 'CfgWeapons' >> _weapon_old >> 'magazines')) call CTI_CO_FNC_ArrayToLower;
	_magazines = (getArray(configFile >> 'CfgWeapons' >> _weapon >> 'magazines')) call CTI_CO_FNC_ArrayToLower;
	*/
	
	
	_bweapon_old= _weapon_old call BIS_fnc_baseWeapon;	
	_bweapon= _weapon call BIS_fnc_baseWeapon;	

	
	_magazines_old = (getArray(configFile >> 'CfgWeapons' >> _weapon_old >> 'magazines')) call CTI_CO_FNC_ArrayToLower;
	_magazines = (getArray(configFile >> 'CfgWeapons' >> _bweapon >> 'magazines')) call CTI_CO_FNC_ArrayToLower;
	

	_replace = [];
	{
		if !(_removeMagazines) then {	
			if (_x in _magazines_old && !(_x in _magazines) && !(_x in _replace)) then {
				_replace pushBack _x;
			};
		} else {
			if (_x in _magazines_old && !(_x in _replace)) then {
				_replace pushBack _x;
			};
		};
	} forEach ((((_gear select 1) select 0) select 1) + (((_gear select 1) select 1) select 1) + (((_gear select 1) select 2) select 1));

	if (count _replace > 0) then {
		private ["_container_capacity", "_container_items_mass", "_count", "_current_magazine", "_expected_mass", "_freespace", "_items", "_magazine_new", "_magazine_new_mass", "_return"];
		_magazine_new = _magazines select 0;
		_magazine_new_mass = (_magazine_new) call CTI_UI_Gear_GetGenericItemMass;

		for '_i' from 2 to 0 step -1 do {
			_items = ((_gear select 1) select _i) select 1;
			for '_j' from 0 to count(_items)-1 do {
				if ((_items select _j) in _replace) then {
					["ContainerItem", _items select _j, "", [_i]] call CTI_UI_Gear_UpdateMass;
					[_i, 70301+_i] call CTI_UI_Gear_UpdateContainerProgress;
					_items set [_j, "!nil!"];
				};
			};
			_count = {_x isEqualTo "!nil!"} count _items;
			if (_count > 0) then {
				_items = _items - ["!nil!"];
				((_gear select 1) select _i) set [1, _items];
				_return = [((_gear select 1) select _i) select 0, _items] call CTI_UI_Gear_GetContainerMass;
				_container_items_mass = _return select 1;
				_container_capacity = _return select 2;

				//--- Determine how much new magazines we can fill.
				_freespace = _container_capacity - _container_items_mass;
				_expected_mass = _count * _magazine_new_mass;

				while { _expected_mass > _freespace && _expected_mass > 0 } do { _expected_mass = _expected_mass - _magazine_new_mass };
				if !(_removeMagazines) then {	
					if (_expected_mass > 0) then {
						for '_k' from 1 to (_expected_mass/_magazine_new_mass) do {
							[_magazine_new, _i] call CTI_UI_Gear_AddContainerItem;
							["ContainerItem", "", _magazine_new, [_i]] call CTI_UI_Gear_UpdateMass;
						};
						[_i, 70301+_i] call CTI_UI_Gear_UpdateContainerProgress;
					};
				};
			};
		
		
			/* script used for update container only now
			_current_magazine = ((_gear select 0) select _i) select 2;
			if (count _current_magazine > 0) then {
				if ((_current_magazine select 0) in _replace) then {
					[_magazine_new, _i, 70901+_i] call CTI_UI_Gear_ChangeCurrentMagazine;
				};
			};
			*/
		};

		(((_gear select 1) select (uiNamespace getVariable "cti_dialog_ui_gear_items_tab")) select 1) call CTI_UI_Gear_DisplayContainerItems;
	};
};



//--- Get the mass of/from/in a container
CTI_UI_Gear_GetContainerMass = {
	private["_container", "_container_capacity", "_container_items_mass", "_container_mass", "_items"];

	_container = _this select 0;
	_items = _this select 1;

	_container_mass = (_container) call CTI_UI_Gear_GetGenericItemMass;
	_container_capacity = (_container) call CTI_UI_Gear_GetContainerMassCapacity;
	_container_items_mass = (_items) call CTI_UI_Gear_GetItemsMass;

	[_container_mass, _container_items_mass, _container_capacity]
};

//--- Return the initial mass of a unit from it's stored gear along with the separate containers mass
CTI_UI_Gear_GetTotalMass = {
	private["_backpack_items_capacity", "_backpack_items_mass", "_gear", "_generic_mass", "_item", "_mass", "_uniform_items_capacity", "_uniform_items_mass", "_vest_items_capacity", "_vest_items_mass"];

	_gear = _this;
	_generic_mass = 0;

	//--- Equipment
	_mass = [((_gear select 1) select 0) select 0, ((_gear select 1) select 0) select 1] call CTI_UI_Gear_GetContainerMass;
	_uniform_items_mass = _mass select 1;
	_uniform_items_capacity = _mass select 2;
	_generic_mass = _generic_mass + (_mass select 0) + _uniform_items_mass;

	_mass = [((_gear select 1) select 1) select 0, ((_gear select 1) select 1) select 1] call CTI_UI_Gear_GetContainerMass;
	_vest_items_mass = _mass select 1;
	_vest_items_capacity = _mass select 2;
	_generic_mass = _generic_mass + (_mass select 0) + _vest_items_mass;

	_mass = [((_gear select 1) select 2) select 0, ((_gear select 1) select 2) select 1] call CTI_UI_Gear_GetContainerMass;
	_backpack_items_mass = _mass select 1;
	_backpack_items_capacity = _mass select 2;
	_generic_mass = _generic_mass + (_mass select 0) + _backpack_items_mass;

	//--- Headgear
	_item = (_gear select 2) select 0;
	_generic_mass = _generic_mass + (if (_item != "") then {getNumber(configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "mass")} else {0});

	//--- Glasses
	_item = (_gear select 2) select 1;
	_generic_mass = _generic_mass + (if (_item != "") then {getNumber(configFile >> "CfgGlasses" >> _item >> "mass")} else {0});

	//--- Special and items
	_generic_mass = _generic_mass + (((_gear select 3) select 0) call CTI_UI_Gear_GetItemsMass) + (((_gear select 3) select 1) call CTI_UI_Gear_GetItemsMass);

	//--- Weapons
	for '_i' from 0 to 2 do {
		_item = ((_gear select 0) select _i) select 0;
		if (_item != "") then {
			_generic_mass = _generic_mass + getNumber(configFile >> "CfgWeapons" >> _item >> "WeaponSlotsInfo" >> "mass");

			{
				if (_x != "") then {_generic_mass = _generic_mass + getNumber(configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "mass")};
			} forEach (((_gear select 0) select _i) select 1);
		};
	};

	[_generic_mass, [[_uniform_items_mass, _uniform_items_capacity], [_vest_items_mass, _vest_items_capacity], [_backpack_items_mass, _backpack_items_capacity]]]
};

//--- Update the corresponding RscProgress bar
CTI_UI_Gear_UpdateContainerProgress = {
	private["_container_capacity", "_container_items_mass", "_idc", "_index", "_mass", "_progress"];

	_index = _this select 0;
	_idc = _this select 1;

	_mass = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear_mass";
	_container_items_mass = ((_mass select 1) select _index) select 0;
	_container_capacity = ((_mass select 1) select _index) select 1;

	_progress = if (_container_capacity != 0) then {_container_items_mass / _container_capacity} else {0};
	((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) progressSetPosition _progress;
	((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetTooltip (if (_container_capacity != 0) then {Format ["Mass: %1 / %2", ((_mass select 1) select _index) select 0, ((_mass select 1) select _index) select 1]} else {""});
};

CTI_UI_Gear_GetItemsMass = {
	private["_items", "_mass"];

	_items = _this;

	_mass = 0;
	{if (_x != "") then {_mass = _mass + (_x call CTI_UI_Gear_GetGenericItemMass)}} forEach _items;

	_mass
};

//--- Return the mass carrying capacity of a cargo item (uniform, vest or backpack)
CTI_UI_Gear_GetContainerMassCapacity = {
	private["_base", "_container", "_item"];

	_item = _this;

	if (_item == "") exitWith {0};

	_base = (_item) call CTI_UI_Gear_GetItemBaseConfig;

	if (_base == "CfgVehicles") then {
		getNumber(configFile >> "CfgVehicles" >> _item >> "maximumLoad");
	} else {
		_container = getText(configFile >> "CfgWeapons" >> _item >> "ItemInfo" >> "containerClass");
		getNumber(configFile >> "CfgVehicles" >> _container >> "maximumLoad");
	};
};

//--- Get the config of an item
CTI_UI_Gear_GetItemBaseConfig = {
	switch (true) do { //--- Determine the kind of item that we're dealing with
		case (isClass (configFile >> 'CfgWeapons' >> _this)): {"CfgWeapons"};
		case (isClass (configFile >> 'CfgMagazines' >> _this)): {"CfgMagazines"};
		case (isClass (configFile >> 'CfgVehicles' >> _this)): {"CfgVehicles"};
		case (isClass (configFile >> 'CfgGlasses' >> _this)): {"CfgGlasses"};
		default {"nil"};
	}
};

//--- Return the mass of an generic item
CTI_UI_Gear_GetGenericItemMass = {
	private["_config_type","_item","_mass"];

	_item = _this;

	_config_type = (_item) call CTI_UI_Gear_GetItemBaseConfig;
	_mass = 0;
	_type = getNumber(configFile >> _config_type >> _item >> "type");

	switch (_config_type) do {
		case "CfgWeapons": {
			if (_type != CTI_TYPE_ITEM) then {
				_mass = getNumber(configFile >> _config_type >> _item >> "WeaponSlotsInfo" >> "mass");
			} else {
				_mass = getNumber(configFile >> _config_type >> _item >> "ItemInfo" >> "mass");
			};
		};
		case "CfgMagazines": {_mass = getNumber(configFile >> _config_type >> _item >> "mass")};
		case "CfgVehicles": {_mass = getNumber(configFile >> _config_type >> _item >> "mass")};
		case "CfgGlasses": {_mass = getNumber(configFile >> _config_type >> _item >> "mass")};
	};

	_mass
};

//--- Update the mass of an inventory's part (+/-). TODO: Find the thin-air value that's used to define infantry maximum load
CTI_UI_Gear_UpdateMass = {
	private["_extra","_item_new","_item_old","_mass","_mass_new","_mass_old","_part"];

	_part = _this select 0;
	_item_old = _this select 1;
	_item_new = _this select 2;
	_extra = if (count _this > 3) then {_this select 3} else {[]};

	_mass = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear_mass";
	_mass_old = if (_item_old != "") then {(_item_old) call CTI_UI_Gear_GetGenericItemMass} else {0};
	_mass_new = if (_item_new != "") then {(_item_new) call CTI_UI_Gear_GetGenericItemMass} else {0};

	switch (_part) do {
		case "Container": { //--- Update either, the uniform, vest or backpack
			_extra_index = _extra select 0;
			_extra_items = _extra select 1;

			_mass_recal = [_item_new, _extra_items] call CTI_UI_Gear_GetContainerMass;
			_extra_items_mass = _mass_recal select 1;
			_extra_items_capacity = _mass_recal select 2;

			_mass_delta = _extra_items_mass - (((_mass select 1) select _extra_index) select 0);

			_mass set [0, (_mass select 0) + _mass_delta];
			((_mass select 1) select _extra_index) set [0, _mass_delta];
			((_mass select 1) select _extra_index) set [1, _extra_items_capacity];
		};
		case "ContainerItem": {
			_extra_index = _extra select 0;

			((_mass select 1) select _extra_index) set [0, (((_mass select 1) select _extra_index) select 0) - _mass_old + _mass_new];
		};
	};
};

CTI_UI_Gear_GetItemAllowedSlots = {
	_item = _this;

	_config_type = (_item) call CTI_UI_Gear_GetItemBaseConfig;
	_allowedInto = [];
	_type = getNumber(configFile >> _config_type >> _item >> "type");

	switch (_config_type) do {
		case "CfgWeapons": {
			if (_type != CTI_TYPE_ITEM) then {
				_allowedInto = getArray(configFile >> _config_type >> _item >> 'WeaponSlotsInfo' >> 'allowedSlots');
			} else {
				_sub_type = getNumber(configFile >> _config_type >> _item >> 'ItemInfo' >> 'type');
				_allowedInto = switch (true) do {
					case (_sub_type in [CTI_SUBTYPE_VEST, CTI_SUBTYPE_UNIFORM]): {getArray(configFile >> _config_type >> _item >> 'allowedSlots')};
					default {getArray(configFile >> _config_type >> _item >> 'ItemInfo' >> 'allowedSlots')};
				};
			};
		};
		case "CfgMagazines": {_allowedInto = [CTI_SUBTYPE_VEST, CTI_SUBTYPE_UNIFORM, CTI_SUBTYPE_BACKPACK]};
		case "CfgVehicles": {_allowedInto = getArray(configFile >> _config_type >> _item >> 'allowedSlots')};
		case "CfgGlasses": {_allowedInto = [CTI_SUBTYPE_VEST, CTI_SUBTYPE_UNIFORM, CTI_SUBTYPE_BACKPACK]};
	};

	if (count _allowedInto == 0) then {_allowedInto = [CTI_SUBTYPE_VEST, CTI_SUBTYPE_UNIFORM, CTI_SUBTYPE_BACKPACK]}; //--- Default

	[_allowedInto, _config_type]
};

//--- An item from the purchase list is being dragged around
CTI_UI_Gear_OnShoppingItemDrag = {
	_item = _this;

	_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";
	_idcs = [];
	_idcs_red = [];
	
	if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
		_tab = uiNamespace getVariable "CTI_dialog_ui_gear_items_tab";
		
		_get = (_item) call CTI_UI_Gear_GetItemAllowedSlots;
	_slots = _get select 0;
	_config_type = _get select 1;

	_translated = [[CTI_SUBTYPE_UNIFORM, 77001, ((_gear select 1) select 0) select 0],[CTI_SUBTYPE_VEST, 77002, ((_gear select 1) select 1) select 0],[CTI_SUBTYPE_BACKPACK, 77003, ((_gear select 1) select 2) select 0]];

	//--- Determine where the item may be parked.
	switch (_config_type) do {
		case "CfgMagazines": { //todo, current mag!
			_gear_sub = _gear select 1;

			for '_i' from 0 to 2 do {if ((_gear_sub select _i) select 0 != "") then { _idcs = _idcs + [77001+_i]; if (_tab == _i) then {_idcs = _idcs + [77109]}} };

			// current magazine
			//--- Is there a primary weapon?
			for '_i' from 0 to 2 do {
				_gear_sub = (_gear select 0) select _i;

				if (_gear_sub select 0 != "") then { //--- There is a weapon
					
						
					
					
					//_magazines = (getArray(configFile >> 'CfgWeapons' >> (_gear_sub select 0) >> 'magazines')) call CTI_CO_FNC_ArrayToLower;
					
					
					_magazines = [];
					//getting baseclass for weaponmagazines in weapons like ak_pso and such stuff
					_bthis= (_gear_sub select 0) call BIS_fnc_baseWeapon;	
					
					//launcher get normal magazine load
			
					if (getNumber(configFile >> "CfgWeapons" >> (_gear_sub select 0) >> "type") == 4 ) then {
			
					_lmag= (getArray(configFile >> 'CfgWeapons' >> (_gear_sub select 0) >> 'magazines')) call CTI_CO_FNC_ArrayToLower;
				
					_magazines = _magazines + _lmag;
					

					if (_item in _magazines) then {	_idcs pushBack (77901+_i) };
					} else {
			
					//_wmag= (getArray(configFile >> 'CfgWeapons' >> _bthis >> 'magazines')) call CTI_CO_FNC_ArrayToLower;
					//_magazines = _magazines + _wmag;
					
					
					_magazines =[_gear_sub#0] call BIS_fnc_compatibleMagazines;
					
					
					if (_item in _magazines) then {	_idcs pushBack (77901+_i) };
					};
			
					
				
					//if (getNumber(configFile >> "CfgWeapons" >> (_gear_sub select 0) >> "type") == 1 ) then {			
						//if (_item in _magazines) then {	_idcs = _idcs + [77901+0] };};
						
						
				};
			};
		};
		case "CfgGlasses": {
			_idcs = [77005];

			_gear = _gear select 1;

			for '_i' from 0 to 2 do {if ((_gear select _i) select 0 != "") then { _idcs = _idcs + [77001+_i]; if (_tab == _i) then {_idcs = _idcs + [77109]}} };
		};
		case "CfgVehicles": {
			{
				for '_i' from 0 to count(_translated)-1 do {
					if (_x == ((_translated select _i) select 0) && ((_translated select _i) select 2) != "") then {_idcs = _idcs + [(_translated select _i) select 1]; if (_tab == _i) then {_idcs = _idcs + [77109]}};
				};
			} forEach _slots;
			_idcs = _idcs + [77003];
		};
		case "CfgWeapons": {
			_type = getNumber(configFile >> _config_type >> _item >> "type");
			{
				for '_i' from 0 to count(_translated)-1 do {
					if (_x == ((_translated select _i) select 0) && ((_translated select _i) select 2) != "") then {_idcs = _idcs + [(_translated select _i) select 1]; if (_tab == _i) then {_idcs = _idcs + [77109]}};
				};
			} forEach _slots;

			//--- Specific to item
			switch (true) do {
				//todo, rifle & rifle2h separation > secondary unavailable
				case (_type in [CTI_TYPE_RIFLE, CTI_TYPE_RIFLE2H]): {_idcs = _idcs + [77013]};
				case (_type == CTI_TYPE_LAUNCHER): {_idcs = _idcs + [77018]};
				case (_type == CTI_TYPE_PISTOL): {_idcs = _idcs + [77023]};
				case (_type == CTI_TYPE_EQUIPMENT): {
					_idcs = _idcs + [if (getText(configFile >> 'CfgWeapons' >> _item >> 'simulation') == "NVGoggles") then {77006} else {77007}]
				};
				case (_type == CTI_TYPE_ITEM): {
					switch (getNumber(configFile >> _config_type >> _item >> 'ItemInfo' >> 'type')) do {
							case CTI_SUBTYPE_ACC_MUZZLE: {
								_acc_idcs = [77014, 77019, 77024];
								//--- Where does it fit?
								{
									if ((_x select 0) != "") then { //--- Muzzle is an array
																				
										_compatibleItems = ([_x select 0, 101] call BIS_fnc_compatibleItems) call CTI_CO_FNC_ArrayToLower;
	
										if (_item in _compatibleItems) then {_idcs = _idcs + [_acc_idcs select _forEachIndex]};
										};
								} forEach (_gear select 0);
							};
							case CTI_SUBTYPE_ACC_SIDE: {
								_acc_idcs = [77015, 77020, 77025];
								
							//--- Where does it fit?
							{
									if ((_x select 0) != "") then { //--- Side is a subclass

										
										_compatibleItems = ([_x select 0, 301] call BIS_fnc_compatibleItems) call CTI_CO_FNC_ArrayToLower; 
										
										
										if (_item in _compatibleItems) then {_idcs = _idcs + [_acc_idcs select _forEachIndex]};
								};
							} forEach (_gear select 0);
						};
						case CTI_SUBTYPE_ACC_OPTIC: {
							_acc_idcs = [77016, 77021, 77026];
							//--- Where does it fit?
							{
									if ((_x select 0) != "") then { //--- Optics is a subclass
										
										_compatibleItems = ([_x select 0, 201] call BIS_fnc_compatibleItems) call CTI_CO_FNC_ArrayToLower; // Might as well check it the same way it was put into the menu.
										
										
										if (_item in _compatibleItems) then {_idcs = _idcs + [_acc_idcs select _forEachIndex]};
								};
							} forEach (_gear select 0);
						};
						case CTI_SUBTYPE_ACC_BIPOD: {
							_acc_idcs = [77017, 77022, 77027];
							//--- Where does it fit?
							{
									if ((_x select 0) != "") then { //--- Optics is a subclass

										//_compatibleItems = (getArray(configFile >> _config_type >> (_x select 0) >> 'WeaponSlotsInfo' >> 'UnderBarrelSlot' >> 'compatibleItems') call CTI_CO_FNC_ArrayToLower);
										//{_compatibleItems pushBack toLower(configName _x)} forEach (configProperties[configfile >> _config_type >> (_x select 0) >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems", "true", true]);
										
										
										_compatibleItems = ([_x select 0, 302] call BIS_fnc_compatibleItems) call CTI_CO_FNC_ArrayToLower; 
										
										
										if (_item in _compatibleItems) then {_idcs = _idcs + [_acc_idcs select _forEachIndex]};
								};
							} forEach (_gear select 0);
						};
						case CTI_SUBTYPE_HEADGEAR: {_idcs = _idcs + [77004]};
						case CTI_SUBTYPE_VEST: {_idcs = _idcs + [77002]};
						case CTI_SUBTYPE_UNIFORM: {_idcs = _idcs + [77001]};
						case CTI_SUBTYPE_UAVTERMINAL: {_idcs = _idcs + [77009]};
						default {
							switch (getText(configFile >> _config_type >> _item >> 'simulation')) do {
								case "ItemMap": {_idcs = _idcs + [77008]};
								case "ItemGPS": {_idcs = _idcs + [77009]};
								case "ItemRadio": {_idcs = _idcs + [77010]};
								case "ItemCompass": {_idcs = _idcs + [77011]};
								case "ItemWatch": {_idcs = _idcs + [77012]};
							};
						};
					};
				};
			};
		};
	};
	} else {
		_mass = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear_mass";
		_mass_item = _item call CTI_UI_Gear_GetGenericItemMass;
		
		if (_mass_item + (_mass select 1) <= (_mass select 0)) then {
			_idcs = [77109];
		} else {
			_idcs_red = [77109];
		};
	};

	{
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _x) ctrlSetBackgroundColor [0.258823529, 0.713725490, 1, 0.7];
	} forEach _idcs;

	{
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _x) ctrlSetBackgroundColor [1, 0.258823529, 0.258823529, 0.7];
	} forEach _idcs_red;
	
	uiNamespace setVariable ["CTI_dialog_ui_gear_drag_colored_idc", _idcs];
	uiNamespace setVariable ["CTI_dialog_ui_gear_drag_colored_idc_red", _idcs_red];
};

//--- An item from the purchase list is being dropped.
CTI_UI_Gear_OnShoppingItemDrop = {
	private ["_config_type", "_current", "_gear", "_gear_index", "_gear_set", "_idc", "_item", "_kind", "_path", "_updated"];

	_idc = _this select 0;
	_item = _this select 1;
	_kind = _this select 2;
	_path = _this select 3;

	_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";

	_updated = false;

	if (_idc in (uiNamespace getVariable "CTI_dialog_ui_gear_drag_colored_idc")) then { //--- Allowed action
		if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
		_current = "!nil!";
		_gear_index = -1;
		_gear_set = [];

		switch (_kind) do {
			case "HeadAsset": {
				_current = (_gear select (_path select 0)) select (_path select 1);
				_gear_set = _gear select (_path select 0);
				_gear_index = _path select 1;
			};
			case "Item": {
				_current = ((_gear select (_path select 0)) select (_path select 1)) select (_path select 2);
				_gear_set = (_gear select (_path select 0)) select (_path select 1);
				_gear_index = _path select 2;
			};
			case "Accessory": {
				_current = ((_gear select (_path select 0)) select (_path select 1)) select (_path select 2);
					if (count _current == 0) then {_current = ["","","",""];((_gear select (_path select 0)) select (_path select 1)) set [_path select 2, ["","","",""]]};
				_current = _current select (_path select 3);
				_gear_set = ((_gear select (_path select 0)) select (_path select 1)) select (_path select 2);
				_gear_index = _path select 3;
			};
			case "Weapon": {
				[_item, _path] call CTI_UI_Gear_ReplaceWeapon;
				_updated = true;
			};
			case "Container": { //todo: if container load the config items!
				if (([CTI_SUBTYPE_UNIFORM, CTI_SUBTYPE_VEST, CTI_SUBTYPE_BACKPACK] select _path) == (_item call CTI_UI_Gear_GetItemConfigType)) then { //--- Same type, replace
					_updated = [_item, _path] call CTI_UI_Gear_ReplaceContainer;
				} else { //--- Type differ, try to add
					_updated = [_item, _path] call CTI_UI_Gear_TryContainerAddItem;
				};
			};
			case "ListItems": { _updated = [_item] call CTI_UI_Gear_TryContainerAddItem };
			case "CurrentMagazine": { _updated = [_item, _path, _idc-7000] call CTI_UI_Gear_ChangeCurrentMagazine };
		};

		if (_current != _item && _gear_index != -1) then {
			_config_type = (_item) call CTI_UI_Gear_GetItemBaseConfig;
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc-7000) ctrlSetText getText(configFile >> _config_type >> _item >> 'picture');
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc-7000) ctrlSetTooltip getText(configFile >> _config_type >> _item >> 'displayName');

			_gear_set set [_gear_index, _item];
			_updated = true;
		};
		} else {
			_updated = [_gear, _item] call CTI_UI_Gear_AddVehicleItem;
		};
	};

	_updated
};

//--- Get the config type of an item.
CTI_UI_Gear_GetItemConfigType = {
	private ["_config_type", "_item", "_type", "_type_returned"];

	_item = _this;

	_config_type = (_item) call CTI_UI_Gear_GetItemBaseConfig;
	_type_returned = -1;

	switch (_config_type) do {
		case "CfgMagazines": {_type_returned = 60000}; //--- Extended, no value in the config
		case "CfgGlasses": {_type_returned = 60001}; //--- Extended, no value in the config
		case "CfgVehicles": {
			if (getNumber(configFile >> _config_type >> _item >> 'isbackpack') == 1) then {_type_returned = CTI_SUBTYPE_BACKPACK};
		};
		case "CfgWeapons": {
			_type_returned = getNumber(configFile >> _config_type >> _item >> "type");
			if (_type_returned == CTI_TYPE_ITEM) then {
				_type_returned = getNumber(configFile >> _config_type >> _item >> 'ItemInfo' >> 'type');
				if (_type_returned == 0) then {_type_returned = CTI_TYPE_ITEM};
			};
		};
	};

	_type_returned
};

CTI_UI_Gear_ChangeCurrentMagazine = {
	private ["_gear", "_idc", "_item", "_slot_type", "_updated"];

	_item = _this select 0;
	_slot_type = _this select 1;
	_idc = _this select 2;

	_gear = uiNamespace getVariable "CTI_dialog_ui_gear_target_gear";
	_updated = false;
	
	/*originalcode
	if (_item == "") then { //--- Remove
		if (count(((_gear select 0) select _slot_type) select 2) > 0) then {
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetTooltip "";

			((_gear select 0) select _slot_type) set [2, []];
			_updated = true;
		};
	} else { //--- Add
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetText getText(configFile >> 'CfgMagazines' >> _item >> 'picture');
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetTooltip getText(configFile >> 'CfgMagazines' >> _item >> 'displayName');

		((_gear select 0) select _slot_type) set [2, [_item]];
		_updated = true;
	};
	
	
	
	*/


	if (_item == "") then { //--- Remove
		if (count(((_gear select 0) select _slot_type) select 2) > 0) then {
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayGear\ui_gear_magazine_gs.paa";
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetTooltip "";

			((_gear select 0) select _slot_type) set [2, []];
			_updated = true;
		};
	} else { //--- Add
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetText getText(configFile >> 'CfgMagazines' >> _item >> 'picture');
		((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl _idc) ctrlSetTooltip getText(configFile >> 'CfgMagazines' >> _item >> 'displayName');

		((_gear select 0) select _slot_type) set [2, [_item]];
		_updated = true;
	};


	_updated
};

CTI_UI_Gear_UpdateLinkedItems = {
	private ["_config_type", "_get", "_item", "_magazines","_upgrade_gear", "_upgrades"];
	_item = _this;
   _upgrades = (CTI_Client_SideJoined) Call CTI_CO_FNC_GetSideUpgrades;
   _upgrade_gear = _upgrades select CTI_UP_GEAR;

	_config_type = (_item) call CTI_UI_Gear_GetItemBaseConfig;

	if ((lnbSize 70601) select 0 > 0) then {lnbClear 70601};

	if (_config_type == "CfgWeapons") then {
		
		//ofps info switch
		missionNamespace setVariable ["cti_dialog_ui_gear_linked_weapon_parent", _item];
		
		
		//--- Add the linked magazines

		/*originalcode
		_magazines = [];
		{
			if (_x == "this") then {
				_magazines = _magazines + getArray(configFile >> 'CfgWeapons' >> _item >> 'magazines');
			} else {
				_magazines = _magazines + getArray(configfile >> 'CfgWeapons' >> _item >> _x >> 'magazines')
			};
		} forEach (getArray(configFile >> 'CfgWeapons' >> _item >> 'muzzles'));
		*/


		/*dont worked
		_magazines = [];
		_magazines =_magazines + ((getArray(configFile >> 'CfgWeapons' >> _item >> 'WeaponSlotsInfo' >> 'MuzzleSlot' >> 'compatibleMagazines')) call CTI_CO_FNC_ArrayToLower);
		
		{_magazines pushBack toLower(configName _x)} forEach (configProperties[configfile >> 'CfgWeapons' >> _item >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleMagazines", "true", true]);
		---------------------------------------
		
		{
			if (_x == "this") then {
				_magazines = _magazines + getArray(configFile >> 'CfgWeapons' >> _item >> 'compatibleMagazines');
			} else {
				_magazines = _magazines + getArray(configfile >> 'CfgWeapons' >> _item >> _x >> 'compatibleMagazines')
			};
		} forEach (getArray(configFile >> 'CfgWeapons' >> _item >> 'muzzles'));
		*/
		
		
		
		_magazines = [];
		{
			if (_x == "this") then {
				//_magazines = _magazines + getArray(configFile >> 'CfgWeapons' >> _item >> 'magazines');
			
			
			
			//get weapon mag
			_magazines = [];
			_bthis= _item call BIS_fnc_baseWeapon;	

			_bbthis= _bthis call BIS_fnc_baseWeapon;	
			
			
			
			//launcher get normal magazine load
			if (getNumber(configFile >> "CfgWeapons" >> _item >> "type") == 4 ) then {
			_magazines = _magazines + getArray(configFile >> 'CfgWeapons' >> _item >> 'magazines');
			//hint str _magazines;
			} else {
			
			_magazines =[_item] call BIS_fnc_compatibleMagazines;
			
			/*
			_amag=_magazines + getArray(configFile >> 'CfgWeapons' >> _item >> 'magazines');
			
			_bmag=_magazines + getArray(configFile >> 'CfgWeapons' >> _bthis >> 'magazines');
			
			_cmag=_magazines + getArray(configFile >> 'CfgWeapons' >> _bbthis >> 'magazines');
			*/
			
			/*
			_magazines = _magazines + getArray(configFile >> 'CfgWeapons' >> _bthis >> 'magazines');
			
			//hint str _magazines;
			
			if ((count _magazines)==0) then {
			
			_magazines =[_item] call BIS_fnc_compatibleMagazines;
			
			if ((count _magazines)==0) then {_magazines =compatibleMagazines _item;};
			
			
			};
			*/
			
			
			};
			
			
			
			
			
			} else {//maybe not used,was a forgotten ; in
				//_magazines = _magazines + getArray(configfile >> 'CfgWeapons' >> _item >> _x >> 'magazines');


			//get weapon mag
			_magazines = [];
			_bthis= _item call BIS_fnc_baseWeapon;		
			//launcher get normal magazine load
			if (getNumber(configFile >> "CfgWeapons" >> _item >> "type") == 4 ) then {
			_magazines = _magazines + getArray(configFile >> 'CfgWeapons' >> _item >> 'magazines');
			} else {
			_magazines = _magazines + getArray(configFile >> 'CfgWeapons' >> _bthis >> 'magazines');
			
				};	
			};
		} forEach (getArray(configFile >> 'CfgWeapons' >> _item >> 'muzzles'));
		
		

		/*old waspcode
		
		//--- Add the compatible accessories (bistery over here, one time the config 'compatibleItems' is property, one time it's an array, so fuck it, we add both).
		_compatible_acc = [];
		_compatible_acc = _compatible_acc + ((getArray(configFile >> 'CfgWeapons' >> _item >> 'WeaponSlotsInfo' >> 'MuzzleSlot' >> 'compatibleItems')) call CTI_CO_FNC_ArrayToLower);
		_compatible_acc = _compatible_acc + ((getArray(configFile >> 'CfgWeapons' >> _item >> 'WeaponSlotsInfo' >> 'PointerSlot' >> 'compatibleItems')) call CTI_CO_FNC_ArrayToLower);
		_compatible_acc = _compatible_acc + ((getArray(configFile >> 'CfgWeapons' >> _item >> 'WeaponSlotsInfo' >> 'CowsSlot' >> 'compatibleItems')) call CTI_CO_FNC_ArrayToLower);
		_compatible_acc = _compatible_acc + ((getArray(configFile >> 'CfgWeapons' >> _item >> 'WeaponSlotsInfo' >> 'UnderBarrelSlot' >> 'compatibleItems')) call CTI_CO_FNC_ArrayToLower);
		
		{_compatible_acc pushBack toLower(configName _x)} forEach (configProperties[configfile >> 'CfgWeapons' >> _item >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems", "true", true]);
		{_compatible_acc pushBack toLower(configName _x)} forEach (configProperties[configfile >> 'CfgWeapons' >> _item >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems", "true", true]);
		{_compatible_acc pushBack toLower(configName _x)} forEach (configProperties[configfile >> 'CfgWeapons' >> _item >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems", "true", true]);
		{_compatible_acc pushBack toLower(configName _x)} forEach (configProperties[configfile >> 'CfgWeapons' >> _item >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems", "true", true]);
		*/
		
		//--- Add the compatible accessories (bistery over here, one time the config 'compatibleItems' is property, one time it's an array, so fuck it, we add both).
		_muzzleAccessories = ([_item, 101] call BIS_fnc_compatibleItems);
		_opticAccessories = ([_item, 201] call BIS_fnc_compatibleItems);
		_pointerAccessories = ([_item, 301] call BIS_fnc_compatibleItems);
		_bipodAccessories = ([_item, 302] call BIS_fnc_compatibleItems);

		_compatible_acc = _muzzleAccessories + _opticAccessories + _pointerAccessories +  _bipodAccessories;

		
		
		
		
		
		
		
		
		{
			_get = missionNamespace getVariable format["CTI_%1", _x];

			if (!(isNil "_get") &&((_get select 0) select 0) <= _upgrade_gear) then {
	
				_row = lnbAddRow [70601, [getText(configFile >> _get select 2 >> _x >> 'displayName'), format ["$%1", (_get select 0) select 1]]];
				lnbSetPicture [70601, [_row, 1], getText(configFile >> _get select 2 >> _x >> 'picture')];
				lnbSetData [70601, [_row, 0], toLower(_x)];
				
				
			};
	
		} forEach (_magazines call CTI_CO_FNC_ArrayToLower) + _compatible_acc;
	

		} else {missionNamespace setVariable ["cti_dialog_ui_gear_linked_weapon_parent", ""];
	
	};
};

CTI_UI_Gear_GetGearCostDelta = {
	private ["_cost", "_find", "_gear_new", "_gear_old", "_item_cost"];
	
	_gear_old = +(_this select 0);
	_gear_new = +(_this select 1);

	_cost = 0;


        if (uiNamespace getVariable "CTI_dialog_ui_gear_target" isKindOf "Man") then {
		_gear_old = (_gear_old) call CTI_CO_FNC_ConvertGearToFlat;
		_gear_new = (_gear_new) call CTI_CO_FNC_ConvertGearToFlat;
	};

	{
		_find = _gear_new find _x;
		_item_cost = (_x) call CTI_CO_FNC_GetGearItemCost;
		if (_find != -1) then {
			_gear_new deleteAt _find;
		} else {
			_cost = _cost - (_item_cost * 0.5);
		};
	} forEach _gear_old;

	{
		_item_cost = (_x) call CTI_CO_FNC_GetGearItemCost;
		_cost = _cost + _item_cost;
	} forEach _gear_new;

	round _cost
};


//ofps description(great work thx)

CTI_UI_Gear_UpdateDescription = {
	_classname = _this;
	
	
	
	_description = "";
	_type = [_classname] call BIS_fnc_itemType;
  // See https://community.bistudio.com/wiki/BIS_fnc_itemType for list of types and subtypes

	
	
	//hide Template RENAME
	((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71120) ctrlShow false;
	((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71121) ctrlShow false;
	
	
	
	if (_classname != "") then {
		_var = missionNamespace getVariable _classname;
		_cost = _var select 2;
		((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71111) ctrlShow true;
		ctrlShow [71112, true];
		lnbClear 71112;
	} else {
		ctrlShow [71112, false];
		((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71111) ctrlShow false;
	};

	//Update large Image - idc - 71111
	_pic = "";
	switch (_type select 0) do {
		case "Magazine": {
			_pic = getText(configFile >> "CfgMagazines" >> _classname >> "picture");
		};
		case "Equipment": {
			switch (_type select 1) do {
				case "Backpack": {
					_pic = getText(configFile >> "CfgVehicles" >> _classname >> "picture");
				};
				default {
					_pic = getText(configFile >> "CfgWeapons" >> _classname >> "picture");
				};
			};
		};
		case "Mine": {
			_pic = getText(configFile >> "CfgMagazines" >> _classname >> "picture");
		};
		default {
			_pic = getText(configFile >> "CfgWeapons" >> _classname >> "picture");
		};
	};

	//_pic = getText(configFile >> "CfgWeapons" >> _classname >> "overviewPicture");
	//_pic = getText(configFile >> "CfgWeapons" >> _classname >> "UiPicture");
	((uiNamespace getVariable "cti_dialog_ui_gear") displayCtrl 71111) ctrlSetStructuredText (parseText format["<img image='%1' size='5'/>", _pic]);
	//Update Stat rows
	// Tell me what I have selected diag_log [format ["%1 %2 %3", _type select 0, _type select 1, _classname]];
	switch (_type select 0) do {
		case "Weapon": {
			switch (_type select 1) do {
				// Special cases for rocket launchers
				case "MissileLauncher";
				case "RocketLauncher";
				case "Launcher" : {
					private _mags = getArray(configFile >> "CfgWeapons" >> _classname >> "magazines");
					private _reloadable = true;
					private _reloadTime = getNumber(configFile >> "CfgWeapons" >> _classname >> "reloadTime");
					private _magScope = getNumber(configFile >> "CfgMagazines" >> _mags select 0 >> "scope");
					
					//Classnames are typically in camelcase, ie, "CUP_launch_M72A6", but for some reason script wants them in all lowercase
					//This is actually prettu inefficent because its getting reinitalized every time a launcher is clicked on, but il fix it later
					
					
					
					_nonreloadableLaunchers = createHashMapFromArray [
						["cup_launch_m72a6","CUP_M72A6_M"],
						["cup_launch_m72a6_special","CUP_M72A6_M"],
						["cup_launch_m136","CUP_M136_M"],
						["cup_launch_apilas", "CUP_APILAS_M"],
						["cup_launch_pzf3", "CUP_PTF3IT_M"],	//Dm22
						["cup_launch_hcpf3", "CUP_PTFHC_M"],	//Dm12A
						["cup_launch_bf3", "CUP_PTFHE_M"], 		//Dm32
						["cup_launch_rpg18", "CUP_RPG18_M"],
						["cup_launch_rpg26", "CUP_RPG26_M"],
						["cup_launch_rshg2", "CUP_RSHG2_M"],
						["cup_launch_fim92stinger", "CUP_Stinger_M"],
						
						//["cup_launch_igla","CUP_M_9K38_Igla_AA"],
						
						["CUP_launch_Igla","CUP_Igla_M"],
						
						
						

						
						
						["cwr3_launch_rpg75","cwr3_rpg75_heat_m"],
						["cup_launch_9k32strela","CUP_Strela_2_M"],
						
						["cwr3_launch_m72a3","cwr3_m72a3_m"],
						
						
						["cup_launch_nlaw","CUP_NLAW_M"]];
					
					if (_magScope != 2) then {
						_reloadable = false;
						
					};

					private _lockModes = [];
					private _canLock = getNumber(configFile >> "CfgWeapons" >> _classname >> "canLock");
					
					//disposable launchers are weird and have the ammo "CBA_FakeLauncherMagazine", getting magazine data is wrong, I use map to map weapon to ammo for disposables
					if(_canLock > 0) then {
						{
							_ammo = getText(configFile >> "CfgMagazines" >> _x >> "ammo");
							
							//Getting actual magazine from map, without this it gets data from "CBA_FakeLauncherMagazine"
							if(!_reloadable) then {
								_mag = _nonreloadableLaunchers get _classname;
								_ammo = getText(configFile >> "CfgMagazines" >> _mag >> "ammo");
								
							};
							
							
							_irLock = getNumber(configFile >> "CfgAmmo" >> _ammo >> "irLock"); // Ground
							_laserLock = getNumber(configFile >> "CfgAmmo" >> _ammo >> "laserLock"); // Laser Designation
							_airLock = getNumber(configFile >> "CfgAmmo" >> _ammo >> "airlock"); // Air
							_manualControl = getNumber(configFile >> "CfgAmmo" >> _ammo >> "manualControl"); // Wire Guided
							if(_irLock >= 1 && _airLock != 2) then {
								_lockModes pushback "(IR) Ground";
							};
							if(_laserLock isEqualTo 1) then {
								_lockModes pushback "Laser";
							};
							if(_airLock isEqualTo 2) then {
								_lockModes pushback "(IR) Anti-air";
							};
							if(_manualControl isEqualTo 1) then {
								_lockModes pushback "Wire";
							};
						} forEach _mags;
						_lockModes = _lockModes arrayIntersect _lockModes;
					} else {
						_lockModes pushback "Dumb-fire";
					};
					_lockModes sort true;
					lnbAddRow [71112, [format ["%1", getText(configFile >> "CfgWeapons" >> _classname >> "displayName")], "Name: " ]];
					lnbAddRow [71112, [_lockModes joinString " | ","Guidance: "]];
					
					
					if(!_reloadable) then {
						
						
						_magazineclass = _nonreloadableLaunchers get _classname;	//Get magazine from map
						_ammoclass = getText(configFile >> "CfgMagazines" >> _magazineclass >> "ammo");
						_penatrator = getText(configFile >> "CfgAmmo" >> _ammoclass >> "submunitionAmmo");
						_velocity = round getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "maxSpeed");
						_vstr = "Max Velocity: ";
						_warHeadName = "HE";
						_caliber = getNumber(configFile >> "CfgAmmo" >> _penatrator >> "caliber") * 15;
						if(_caliber > 150) then {_warHeadName = "Anti-Tank"};
						lnbAddRow [71112, [format ["%1", _warHeadName], "Warhead Type: " ]];
						
						if(_velocity isEqualTo 0) then {
							_velocity = round getNumber(configFile >> "CfgMagazines" >> _classname >> "initSpeed");
							_vstr = "Velocity: ";
						};
	




						
						//_hit = getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "hit");
						_ihit = getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "indirectHit");
						_hit = getNumber(configFile >> "CfgAmmo" >> _ammoclass>> "hit");
						
						
						//Basically all HEAT weapons use penatrators, when the projectile impacts a target it creates a penatrator that actually kills tanks
						// Hit and caliber come from penatrator, rest of stats can stay in root ammo
						

						if(getNumber(configFile >> "CfgAmmo" >> _penatrator >> "hit") > 1) then {
							_hit = getNumber(configFile >> "CfgAmmo" >> _penatrator >> "hit");
							
							//Caliber is armas penatration metric, multiplying it by 15 gives RHA-E
							_caliber = getNumber(configFile >> "CfgAmmo" >> _penatrator >> "caliber") * 15;
							lnbAddRow [71112, [format ["%1", _caliber], "RHA-E Penatration: " ]];
						
							
						};

						if(_hit > 0) then {lnbAddRow [71112, [format ["%1", _hit], "Direct Damage: " ]];};
						if(_ihit > 1) then {
							lnbAddRow [71112, [format ["%1", _ihit], "Splash Damage: " ]];
							lnbAddRow [71112, [format ["%1", getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "indirectHitRange")], "Splash Radius: " ]];
						};
						_mass = getNumber(configFile >> "CfgMagazines" >> _classname >> "mass");
						if (_mass > 0) then {
							lnbAddRow [71112, [format ["%1", _mass], "Mass: " ]];
						};
						lnbAddRow [71112, ["Single-use", "Note: " ]];
					};

				};

				default {
					private _fireModes = getArray(configFile >> "CfgWeapons" >> _classname >> "modes");
					// Minumum rate of fire
					private _mrof = -1;

					// Max mil is a full circle
					private _mmil = 2 * 1018.5916357881;
					private _modes = [];
					{
						// Only gather data from firemodes available to the player
						private _mode = configFile >> "CfgWeapons" >> _classname >> _x;
						if(getNumber(_mode >> "showToPlayer") isEqualTo 1) then {

							// Gather information from the firemode
							private _fmstr = "";

							// Accuracy is determined by firing mode, we will display the accuracy from the most accurate firemode
							private _rad = getNumber(configFile >> "CfgWeapons" >> _classname >> _x >> "dispersion");
							private _mil = _rad * 1018.5916357881;
							_mil = [_mil,3] call BIS_fnc_cutDecimals;
							_mmil = _mmil min _mil;

							// Get the rate of fire, keep the maximum
							private _tbs = getNumber(_mode >> "reloadTime");
							private _rof = 60 / _tbs;
							_mrof = _mrof max _rof;
							_mrof = _mrof - (_mrof % 5);

							// Determine if the firemode is fully automatic, burstfire or semi automatic
							// Will assume single shot bolt rifles are semi auto
							if (getNumber(_mode >> "autoFire") isEqualTo 1) then {
								if (getNumber(_mode >> "burst") > 1) then {
									_fmstr = format["%1rnd",getNumber(_mode >> "burst")];
								} else {
									_fmstr = "Full";
								};
							} else {
								if (getNumber(_mode >> "autoFire") isEqualTo 0) then {
									if(getNumber(_mode >> "burst") > 1) then {
										_fmstr = format["%1rnd",getNumber(_mode >> "burst")];
									} else {
										if (getText(configFile >> "CfgWeapons" >> _classname >> "Eventhandlers" >> "RHS_Boltaction" >> "fired") != "") then {
											_fmstr = "Bolt";
										} else {
											_fmstr = "Semi";
										};
									};
								};
							};
							if(_fmstr != "") then {
								_modes pushBack _fmstr;
							};
						};
					} forEach _fireModes;

					lnbAddRow [71112, [format ["%1", getText(configFile >> "CfgWeapons" >> _classname >> "displayName")], "Name: " ]];
					lnbAddRow [71112, [_modes joinString " | ","Fire modes: "]];
					lnbAddRow [71112, [format ["%1 rpm",  _mrof], "Max ROF: " ]];
  				lnbAddRow [71112, [format ["%1 mil",  _mmil], "Accuracy: " ]];
				_xCoef = getNumber(configFile >> "CfgWeapons" >> _classname >> "aiDispersionCoefX");
				_yCoef = getNumber(configFile >> "CfgWeapons" >> _classname >> "aiDispersionCoefY");
				_xyCoef = str(_xCoef) + "x" + str(_yCoef);
				lnbAddRow [71112, [format ["%1",  _xyCoef], "AI Aiming Coef: " ]];
				
				
  				};
  			};
		};
		case "Item": {
			switch (_type select 1) do {
				case "AccessorySights": {
					lnbAddRow [71112, [format ["%1", getText(configFile >> "CfgWeapons" >> _classname >> "displayName")], "Name: " ]];
					//lnbAddRow [71112, [format ["%1", getText(configFile >> "CfgWeapons" >> _classname >> "descriptionShort")], ""]];
					private _maxRange = 0;
					private _maxZoom = 10;
					private _viewModes = [];
					// 0.25 is the optical zoom at 1x magnification;
					private _opticalZoomBase = 0.25;
					{
						_maxRange = _maxRange max getNumber(_x >> "distanceZoomMax");
						_maxZoom = _maxZoom min getNumber(_x >> "opticsZoomMin");
						_viewModes = _viewModes + getArray(_x >> "visionMode");
					} forEach ("true" configClasses (configFile >> "CfgWeapons" >> _classname >> "ItemInfo" >> "OpticsModes"));
					_maxZoom = _opticalZoomBase / _maxZoom;
					_maxZoom = round _maxZoom;
					lnbAddRow [71112, [format ["%1m", _maxRange], "Optic Range: "]];
					lnbAddRow [71112, [format ["%1x", _maxZoom], "Optic Zoom: "]];
					_viewModes = _viewModes arrayIntersect _viewModes;

					if(count _viewModes > 0 && !(_viewModes isEqualTo ["Normal"])) then {
						_viewModes sort true;
						lnbAddRow [71112, [_viewModes joinString " | ","View modes: "]];
					};
				};
				case "AccessoryMuzzle": {
					private _noiseReduction = 0;
					private _visualReduction = 0;
					private _muzzleVelocity = 0;
					_noiseReduction = 10 * log (getNumber(configFile >> "CfgWeapons" >> _classname >> "ItemInfo" >> "AmmoCoef" >> "audibleFire"));
					_visualReduction = 1 - getNumber(configFile >> "CfgWeapons" >> _classname >> "ItemInfo" >> "AmmoCoef" >> "visibleFire");
					_muzzleVelocity = getNumber(configFile >> "CfgWeapons" >> _classname >> "ItemInfo" >> "MagazineCoef" >> "initSpeed");
					lnbAddRow [71112, [format ["%1db", _noiseReduction], "Noise Delta: " ]];
					lnbAddRow [71112, [format ["%1%2", _visualReduction * 100, "%"], "Flash Reduction: " ]];
					lnbAddRow [71112, [format ["%1x", _muzzleVelocity], "Velocity Mult:" ]];
				};
				default {};
			};
		};
		case "Equipment": {
		  private _stats = [];
			private _statBallisticArmor = 0;
			private _statExplosiveArmor = 0;
			if(_type select 1 in ["Headgear", "Vest", "Uniform"]) then {
				_stats = [[configfile >> "CfgWeapons" >> _classname],["passthrough","armor"],[false,false],[0,0]] call bis_fnc_configExtremes;
				_statBallisticArmor = ([_stats select 1 select 0, 2] call bis_fnc_cutDecimals) * 100;
				_statExplosiveArmor = ([_stats select 1 select 1, 2] call bis_fnc_cutDecimals) * 100;
			};
			switch (_type select 1) do {
				case "Headgear": {
					lnbAddRow [71112, [format ["%1", getText(configFile >> "CfgWeapons" >> _classname >> "displayName")], "Helmet: " ]];
					lnbAddRow [71112, [format ["%1", _statBallisticArmor], "Ballistic Armor: " ]];
					lnbAddRow [71112, [format ["%1", _statExplosiveArmor], "Explosive Armor: " ]];
				};
				case "Vest": {
					lnbAddRow [71112, [format ["%1", getText(configFile >> "CfgWeapons" >> _classname >> "displayName")], "Vest: " ]];
					lnbAddRow [71112, [format ["%1", _statBallisticArmor], "Ballistic Armor: " ]];
					lnbAddRow [71112, [format ["%1", _statExplosiveArmor], "Explosive Armor: " ]];
					_contclassname = getText(configFile >> "CfgWeapons" >> _classname >> "ItemInfo" >> "containerClass");
					lnbAddRow [71112, [format ["%1", getNumber(configFile >> "CfgVehicles" >> _contclassname >> "maximumLoad")], "Capacity:" ]];
				};
				case "Uniform": {
					lnbAddRow [71112, [format ["%1", getText(configFile >> "CfgWeapons" >> _classname >> "displayName")], "Uniform: " ]];
					/*lnbAddRow [71112, [format ["%1", _statBallisticArmor], "Ballistic Armor: " ]];
					lnbAddRow [71112, [format ["%1", _statExplosiveArmor], "Explosive Armor: " ]];*/
					_contclassname = getText(configFile >> "CfgWeapons" >> _classname >> "ItemInfo" >> "containerClass");
					lnbAddRow [71112, [format ["%1", getNumber(configFile >> "CfgVehicles" >> _contclassname >> "maximumLoad")], "Capacity:" ]];
				};
				case "Backpack": {
					lnbAddRow [71112, [format ["%1", getText(configFile >> "CfgVehicles" >> _classname >> "displayName")], "Backpack: " ]];
					lnbAddRow [71112, [format ["%1", str (getNumber (configFile >> 'CfgVehicles' >> _classname >> 'maximumLoad'))], "Capacity: " ]];
				};
				default {
					lnbAddRow [71112, [format ["%1", getText(configFile >> "CfgWeapons" >> _classname >> "displayName")], "" ]];
				};
			};
		};
		case "Magazine": {
			switch (_type select 1) do {
				case "ShotgunShell";
				case "Bullet": {
					_ammoclass = getText(configFile >> "CfgMagazines" >> _classname >> "ammo");
					lnbAddRow [71112, [format ["%1", round getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "hit")], "Damage: " ]];
					lnbAddRow [71112, [format ["%1", round getNumber(configFile >> "CfgMagazines" >> _classname >> "initSpeed")], "Velocity: " ]];
					lnbAddRow [71112, [format ["%1", getNumber(configFile >> "CfgMagazines" >> _classname >> "count")], "Capacity: " ]];
					_mass = getNumber(configFile >> "CfgMagazines" >> _classname >> "mass");
					if (_mass > 0) then {
						lnbAddRow [71112, [format ["%1", _mass], "Mass: " ]];
					};
				};
				case "Shell";
				case "Rocket";
				case "Missile": {
					_ammoclass = getText(configFile >> "CfgMagazines" >> _classname >> "ammo");
					_irLock = getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "irLock"); // Ground
					_laserLock = getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "laserLock"); // Laser Designation
					_airLock = getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "airlock"); // Air
					_manualControl = getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "manualControl"); // Wire Guided
					_lockModes = [];
					if(_irLock >= 1 && _airLock != 2) then {
						_lockModes pushback "(IR) Ground";
					};
					if(_laserLock isEqualTo 1) then {
						_lockModes pushback "Laser";
					};
					if(_airLock isEqualTo 2) then {
						_lockModes pushback "(IR) Anti-air";
					};
					if(_manualControl isEqualTo 1) then {
						_lockModes pushback "Wire";
					};
					if(count _lockModes isEqualTo 0) then {
						_lockModes pushback "Dumb-fire";
					};
					_velocity = round getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "maxSpeed");
					_vstr = "Max Velocity: ";
					if(_velocity isEqualTo 0) then {
						_velocity = round getNumber(configFile >> "CfgMagazines" >> _classname >> "initSpeed");
						_vstr = "Velocity: ";

					};

					lnbAddRow [71112, [format ["%1", _velocity], _vstr]];
					if(_type select 1 != "Shell") then {
						lnbAddRow [71112, [_lockModes joinString " | ","Control: "]];
					};

					//Default warheads to HE, reset to AT later if they have the pen to kill vehicles.
					_warHeadName = "HE";

					
					
					// Only display damage if it does damage
					_hit = getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "hit");
					
					
					//If its has a submunition, its probably an AT rocket and we want to know how much damage the submunition does
					_penatrator = getText(configFile >> "CfgAmmo" >> _ammoclass >> "submunitionAmmo");
					
					
					
					
					if(getNumber(configFile >> "CfgAmmo" >> _penatrator >> "hit") > 1) then {
						_hit = getNumber(configFile >> "CfgAmmo" >> _penatrator >> "hit");
						//Caliber is armas penatration metric, multiplying it by 15 gives RHA-E
						_caliber = getNumber(configFile >> "CfgAmmo" >> _penatrator >> "caliber") * 15;
						
						//configs sometimes have a warheadName field but its not consistent enough to use
						if(_caliber > 15) then {_warHeadName = "Anti-Tank"};
						lnbAddRow [71112, [format ["%1", _warHeadName], "Warhead Type: " ]];
						lnbAddRow [71112, [format ["%1", _caliber], "RHA-E Penatration: " ]];
						
					}else{
						lnbAddRow [71112, [format ["%1", _warHeadName], "Warhead Type: " ]];
					};
					

					
					
					if (_hit < 3) then {
						_ihit =  [_hit, 1] call BIS_fnc_cutDecimals;
					} else {
						_hit = round _hit;
					};
					if(_hit > 0) then {lnbAddRow [71112, [format ["%1", _hit], "Direct Damage: " ]];};

					// Only display Splash damage, and range if there is splash damage
					_ihit = getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "indirectHit");
					if (_ihit < 3) then {
						_ihit =  [_ihit, 1] call BIS_fnc_cutDecimals;
					} else {
						_ihit = round _ihit;
					};
					if(_ihit > 1) then {
						lnbAddRow [71112, [format ["%1", _ihit], "Splash Damage: " ]];
						lnbAddRow [71112, [format ["%1", getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "indirectHitRange")], "Splash Radius: " ]];
					};

					_mass = getNumber(configFile >> "CfgMagazines" >> _classname >> "mass");
					if (_mass > 0) then {
						lnbAddRow [71112, [format ["%1", _mass], "Mass: " ]];
					};
				};
				case "Grenade": {
					_ammoclass = getText(configFile >> "CfgMagazines" >> _classname >> "ammo");

					// Only display damage if it does damage
					_hit = getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "hit");
					if (_hit < 3) then {
						_ihit =  [_hit, 1] call BIS_fnc_cutDecimals;
					} else {
						_hit = round _hit;
					};
					if(_hit > 0) then {lnbAddRow [71112, [format ["%1", _hit], "Direct Damage: " ]];};

					// Only display Splash damage, and range if there is splash damage
					_ihit = getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "indirectHit");
					if (_ihit < 3) then {
						_ihit =  [_ihit, 1] call BIS_fnc_cutDecimals;
					} else {
						_ihit = round _ihit;
					};
					if(_ihit > 1) then {
						lnbAddRow [71112, [format ["%1", _hit], "Splash Damage: " ]];
						lnbAddRow [71112, [format ["%1", getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "indirectHitRange")], "Splash Radius: " ]];
					};

					_mass = getNumber(configFile >> "CfgMagazines" >> _classname >> "mass");
					if (_mass > 0) then {
						lnbAddRow [71112, [format ["%1", _mass], "Mass: " ]];
					};
				};
				
				
				
				
			if (_mass > 0) then {
				lnbAddRow [71112, [format ["%1", _mass], "Mass: " ]];
				
				};
				
				
				
				default {
					if (_classname == "CUP_PipeBomb_M")then{
					_ammoclass = getText(configFile >> "CfgMagazines" >> _classname >> "ammo");
					lnbAddRow [71112, [format ["%1", round getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "hit")], "Direct Damage: " ]];
					lnbAddRow [71112, [format ["%1", round getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "indirectHit")], "Splash Damage: " ]];
					lnbAddRow [71112, [format ["%1", getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "indirectHitRange")], "Splash Radius: " ]];
					lnbAddRow [71112, [format ["%1", getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "mineBoundingDist")], "Trigger Radius: " ]];
					_mass = getNumber(configFile >> "CfgMagazines" >> _classname >> "mass");
					
					}else{
					
					
					lnbAddRow [71112, [format ["%1", round getNumber(configFile >> "CfgMagazines" >> _classname >> "initSpeed")], "Velocity: " ]];
					lnbAddRow [71112, [format ["%1", getNumber(configFile >> "CfgMagazines" >> _classname >> "count")], "Capacity: " ]];
					_mass = getNumber(configFile >> "CfgMagazines" >> _classname >> "mass");
					if (_mass > 0) then {
						lnbAddRow [71112, [format ["%1", _mass], "Mass: " ]];
						};
					};
				};
			};
		};
		case "Mine": {
			_ammoclass = getText(configFile >> "CfgMagazines" >> _classname >> "ammo");
			lnbAddRow [71112, [format ["%1", round getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "hit")], "Direct Damage: " ]];
			lnbAddRow [71112, [format ["%1", round getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "indirectHit")], "Splash Damage: " ]];
			lnbAddRow [71112, [format ["%1", getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "indirectHitRange")], "Splash Radius: " ]];
			lnbAddRow [71112, [format ["%1", getNumber(configFile >> "CfgAmmo" >> _ammoclass >> "mineBoundingDist")], "Trigger Radius: " ]];
			_mass = getNumber(configFile >> "CfgMagazines" >> _classname >> "mass");
			if (_mass > 0) then {
				lnbAddRow [71112, [format ["%1", _mass], "Mass: " ]];
			};
		};
		default {
			lnbAddRow [71112, [format ["%1", getText(configFile >> "CfgWeapons" >> _classname >> "displayName")], "" ]];
			_mass = getNumber(configFile >> "CfgMagazines" >> _classname >> "mass");
			if (_mass > 0) then {
				lnbAddRow [71112, [format ["%1", _mass], "Mass: " ]];
			};
		};
	};
};







CTI_UI_Gear_UpdatePrice = {
	private ["_coloration", "_trade_in"];
	_trade_in = [uiNamespace getVariable "CTI_dialog_ui_gear_target_staticgear", uiNamespace getVariable "CTI_dialog_ui_gear_target_gear"] call CTI_UI_Gear_GetGearCostDelta;
	uiNamespace setVariable ["CTI_dialog_ui_gear_tradein", _trade_in];

	_coloration = if (_trade_in > 0) then {"#F56363"} else {"#76F563"};

	((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70028) ctrlSetStructuredText parseText format ["<t align='left'>Trade-in: <t color='%3'>$%1</t><t><t align='right'>Resources: <t color='%4'>$%2</t><t>", _trade_in, call CTI_CL_FNC_GetPlayerFunds, _coloration, "#BAFF81"];
};



CTI_UI_Gear_EquipTemplate = {
	_index = _this;

	_gear = +(((missionNamespace getVariable "CTI_gear_list_templates") select _index) select 3);
	uiNamespace setVariable ["CTI_dialog_ui_gear_target_gear", _gear];

	_mass = (_gear) call CTI_UI_Gear_GetTotalMass;
	uiNamespace setVariable ["CTI_dialog_ui_gear_target_gear_mass", _mass];

	{[_forEachIndex, _x] call CTI_UI_Gear_UpdateContainerProgress} forEach [70301,70302,70303];

	call CTI_UI_Gear_UpdatePrice;
	(_gear) call CTI_UI_Gear_DisplayInventory;
};





CTI_UI_Gear_LoadAvailableUnits = {
	_structures = (CTI_Client_SideJoined) call CTI_CO_FNC_GetSideStructures;
	_list = [];
	
	_vehicles = [];
	_base_gear_fob_range = 4; ////--- Determine how far a player has to be from a FOB to access the Gear Menu
	
	
	{
		_manRange = missionNamespace getVariable "CTI_C_BASE_DEFENSE_MANNING_RANGE";
		_nearest = ['BARRACKSTYPE', _x, _structures, _manRange] call CTI_CO_FNC_GetClosestStructure;
		
		_fob_in_range = gearInRange;
		
		if (!isNull _nearest || _x == player || _fob_in_range) then {//todo add fob
			_list pushBack _x;
			((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70201) lbAdd Format["[%1] %2", _x Call CTI_CO_FNC_GetAIDigit, getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName")];
		};
		if (vehicle _x != _x && !(vehicle _x in _vehicles)) then { //--- Vehicle check
			if (getNumber(configFile >> "CfgVehicles" >> typeOf vehicle _x >> "maximumLoad") > 0) then {
				if (!isNull _nearest || _fob_in_range) then {
					_list pushBack vehicle _x;
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70201) lbAdd Format["[%1] %2", _x Call CTI_CO_FNC_GetAIDigit, getText(configFile >> "CfgVehicles" >> typeOf vehicle _x >> "displayName")];
					_vehicles pushBack vehicle _x;
				};
			};
		};
	} forEach ((units player) call CTI_CO_FNC_GetLiveUnits);
	
	{
		_manRange = missionNamespace getVariable "CTI_C_BASE_DEFENSE_MANNING_RANGE";
		_nearest = ['BARRACKSTYPE', _x, _structures, _manRange] call CTI_CO_FNC_GetClosestStructure;
		
		_fob_in_range = gearInRange;
		
		if !(_x in _vehicles) then { //--- Vehicle check
			if (getNumber(configFile >> "CfgVehicles" >> typeOf _x >> "maximumLoad") > 0 && local _x) then {
				if (!isNull _nearest || _fob_in_range) then {
					_list pushBack _x;
					((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70201) lbAdd Format["%1", getText(configFile >> "CfgVehicles" >> typeOf _x >> "displayName")];
					_vehicles pushBack _x;
				};
			};
		};
	} forEach (vehicle player nearEntities [["Car", "Ship", "Motorcycle", "Tank", "Air", "StaticWeapon"], CTI_C_BASE_AREA_RANGE]);
	
	uiNamespace setVariable ["CTI_dialog_ui_gear_units", _list];
	
	((uiNamespace getVariable "CTI_dialog_ui_gear") displayCtrl 70201) lbSetCurSel 0;
};

CTI_UI_Gear_InitializeProfileTemplates = {

    _roles = [WSW_SNIPER, WSW_SOLDIER, WSW_ENGINEER, WSW_SPECOPS, WSW_ARTY_OPERATOR, WSW_UAV_OPERATOR];
    {
        _templates = +(missionNamespace getVariable format["CTI_gear_list_templates_%1_%2", CTI_Client_SideJoined, _x]);
        if(!isNil "_templates")then{
            {
                _x set [5, round(time + random 10000 - random 5000 + diag_frameno)];
            } forEach _templates;

            profileNamespace setVariable [format["CTI_PERSISTENT_GEAR_TEMPLATE_%1_%2", CTI_Client_SideJoined, _x], _templates];
            saveProfileNamespace;
        };
    } foreach _roles;

	_templates = +(missionNamespace getVariable "CTI_gear_list_templates");
	if(!isNil "_templates")then{
		{
			_x set [5, round(time + random 10000 - random 5000 + diag_frameno)];
		} forEach _templates;

		profileNamespace setVariable [format["CTI_PERSISTENT_GEAR_TEMPLATE_%1", CTI_Client_SideJoined], _templates];
		saveProfileNamespace;
	};
};

CTI_UI_Gear_RemoveProfileTemplate = {
	_index = _this;
	_selectedRole = WSW_gbl_boughtRoles select 0;
	if!(isnil '_selectedRole')then{
        _templates = profileNamespace getVariable format["CTI_PERSISTENT_GEAR_TEMPLATE_%1_%2", CTI_Client_SideJoined, _selectedRole];
        if (_index > -1) then {
            _templates deleteAt _index;
            profileNamespace setVariable [format["CTI_PERSISTENT_GEAR_TEMPLATE_%1_%2", CTI_Client_SideJoined, _selectedRole], _templates];
            saveProfileNamespace;
        };
	}else{
	    _templates = profileNamespace getVariable format["CTI_PERSISTENT_GEAR_TEMPLATE_%1", CTI_Client_SideJoined];
	    if (_index > -1) then {
            _templates deleteAt _index;
            profileNamespace setVariable [format["CTI_PERSISTENT_GEAR_TEMPLATE_%1", CTI_Client_SideJoined], _templates];
            saveProfileNamespace;
        };
	};
};


CTI_UI_Gear_GetProfileTemplateName = {
	_seed = _this;
	_name = "";

	_templates = profileNamespace getVariable format["CTI_PERSISTENT_GEAR_TEMPLATE_%1", CTI_Client_SideJoined];
	
	//hint str _templates;
	_n=_templates # _seed;
	//hint str _n;
	
	_index = -1;
	{if ((_x select 5) isEqualTo _seed) exitWith {_index = _forEachIndex}} forEach _templates;

	if (_index > -1) then {
		_name = (_templates select _index) select 0;
	};
	_name
};

