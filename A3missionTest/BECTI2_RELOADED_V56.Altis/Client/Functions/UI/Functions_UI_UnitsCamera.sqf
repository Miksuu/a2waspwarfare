CTI_UI_UnitsCam_CalculatePodCost = {
	private _price = 0;
	{
		if (isPlayer _x) then {
			_price = _price + (CTI_HALO_COST / 2);
		} else {
			_price = _price + CTI_PARADROP_UNIT_FEE;
		};
	} forEach crew vehicle _this;
	_price
};

CTI_UI_UnitsCam_UpdateParaButton = {
	if (time - CTI_HALO_LASTTIME >= CTI_HALO_COOLDOWN) then {
		/*_upgrades = (CTI_P_SideJoined) call CTI_CO_FNC_GetSideUpgrades;
		_upgrade_halo = _upgrades select CTI_UPGRADE_HALO;
		_enable = if ((CTI_Base_AirInRange && _upgrade_halo > 0) || (CTI_Base_DepotInRange && _upgrade_halo > 1) || (CTI_Base_GearInRange_LARGE_FOB && _upgrade_halo > 1)) then {true} else {false};
		((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180025) ctrlEnable _enable;*/
		
		_flag = "";
		
		if !(typeOf vehicle _this in CTI_PARADROP_PODS) then {
			_flag = "Unit must be in a valid pod";
		};
		
		if !(alive _this) then {
			_flag = "This unit is dead.";
		};
		
		if (_flag isEqualTo "" && alive _this) then {
			_price = _this call CTI_UI_UnitsCam_CalculatePodCost;
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180025) ctrlSetTooltip format ["Paradrop Units ($%1)", _price];
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180025) ctrlEnable true;
		} else {
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180025) ctrlSetTooltip _flag;
			((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180025) ctrlEnable false;
		};
	}else{
		((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180025) ctrlEnable false;
		((uiNamespace getVariable "cti_dialog_ui_unitscam") displayCtrl 180025) ctrlSetTooltip format ["Paradrop Units (%1s)",floor((CTI_HALO_COOLDOWN-(time - CTI_HALO_LASTTIME)))];
	};
};