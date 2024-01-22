scriptName "Client\GUI\GUI_UpgradeMenu.sqf";

//--- Register the UI.
uiNamespace setVariable ["cti_display_upgrades", _this select 0];
_upgrade_lastsel = uiNamespace getVariable "cti_display_upgrades_sel";
if (isNil '_upgrade_lastsel') then {_upgrade_lastsel = 0; uiNamespace setVariable ["cti_display_upgrades_sel", 0]};

_upgrade_enabled = missionNamespace getVariable Format["cti_C_UPGRADES_%1_ENABLED",cti_Client_SideJoinedText];
_upgrade_costs = missionNamespace getVariable Format["cti_C_UPGRADES_%1_COSTS",cti_Client_SideJoinedText];
_upgrade_descriptions = missionNamespace getVariable "cti_C_UPGRADES_DESCRIPTIONS";
_upgrade_labels = missionNamespace getVariable "cti_C_UPGRADES_LABELS";
_upgrade_levels = missionNamespace getVariable Format["cti_C_UPGRADES_%1_LEVELS",cti_Client_SideJoinedText];
_upgrade_links = missionNamespace getVariable Format["cti_C_UPGRADES_%1_LINKS",cti_Client_SideJoinedText];
_upgrade_sorted = missionNamespace getVariable "cti_C_UPGRADES_SORTED";
_upgrade_times = missionNamespace getVariable Format["cti_C_UPGRADES_%1_TIMES",cti_Client_SideJoinedText];
_upgrade_isupgrading = false;

_upgrades = (cti_Client_SideJoined) call cti_CO_FNC_GetSideUpgrades;

_i = 0;
{
	if (_upgrade_enabled select _x) then {
		lnbAddRow [504001, [Format ["%1/%2",_upgrades select _x,_upgrade_levels select _x],_upgrade_labels select _x]];
		lnbSetValue [504001, [_i, 0], _x];
		_i = _i + 1;
	};
} forEach _upgrade_sorted;
lnbSetCurSelRow[504001, _upgrade_lastsel];
_upgrades_old = _upgrades;

_purchase = false;
_update_upgrade = true;
_update_upgrade_details = true;
_update_list = false;
_update_upgrade_lastcheck = -1;

_player_commander = false; //added-MrNiceGuy
if (!isNull(commanderTeam)) then {if (commanderTeam == group player) then {_player_commander = true}};
if !(_player_commander) then {ctrlEnable [504007, false]};

cti_WF_MenuAction = -1;

while {alive player && dialog} do {
	if (cti_WF_MenuAction == 1) then {cti_WF_MenuAction = -1; if (_player_commander) then {_purchase = true}};
	if (cti_WF_MenuAction == 2) then {cti_WF_MenuAction = -1;_update_upgrade = true};
	
	_upgrades = (cti_Client_SideJoined) call cti_CO_FNC_GetSideUpgrades;
	
	if (time - _update_upgrade_lastcheck > 0.5) then {
		_update_list = false;
		_update_upgrade_lastcheck = time;
		for '_i' from 0 to count(_upgrades_old)-1 do {if ((_upgrades_old select _i) != (_upgrades select _i)) exitWith {_update_list = true}};
		if (_update_list) then {
			_update_list = false;
			for '_i' from 0 to count(_upgrades_old)-1 do {lnbSetText[504001, [_i, 0], Format ["%1/%2",_upgrades select _i,_upgrade_levels select _i]]};
			
			_i = 0;
			{
				if (_upgrade_enabled select _x) then {
					lnbSetText[504001, [_i, 0], Format ["%1/%2",_upgrades select _x,_upgrade_levels select _x]];
					_i = _i + 1;
				};
			} forEach _upgrade_sorted;
			
			_ui_lnb_sel = lnbCurSelRow(504001);
			if (_ui_lnb_sel != -1) then {lnbSetCurSelRow[504001, _ui_lnb_sel]};
		};
		_upgrades_old = _upgrades;
	};
	
	if (_update_upgrade) then {
		_update_upgrade = false;
		_ui_lnb_sel = lnbCurSelRow(504001);
		if (_ui_lnb_sel != -1) then {
			_id = lnbValue[504001, [_ui_lnb_sel, 0]];
			uiNamespace setVariable ["cti_display_upgrades_sel", _ui_lnb_sel];
			/*ctrlSetText[504002, if ((_upgrade_images select _id) != "") then {_upgrade_images select _id} else {""}];*/
			((uiNamespace getVariable "cti_display_upgrades") displayCtrl 504005) ctrlSetStructuredText (parseText (_upgrade_descriptions select _id));
		};
		_update_upgrade_details = true;
	};

	if (_update_upgrade_details) then {
		_update_upgrade_details = false;
		_ui_lnb_sel = lnbCurSelRow(504001);
		if (_ui_lnb_sel != -1) then {
			_id = lnbValue[504001, [_ui_lnb_sel, 0]];
			_upgrade_current = _upgrades select _id;
			_funds = call cti_CL_FNC_GetPlayerFunds;
			_supply = (cti_Client_SideJoined) call cti_CO_FNC_GetSideSupply;
			_html = "";
			_html2 = "<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Dependencies:</t><br /><br />";
			if (_upgrade_current < (_upgrade_levels select _id)) then {
				_upgrade_supply = ((_upgrade_costs select _id) select _upgrade_current) select 0;
				_upgrade_price = ((_upgrade_costs select _id) select _upgrade_current) select 1;

				_html = Format["<t color='#42b6ff' size='1.2' underline='1' shadow='1'>%1:</t><br /><br /><t color='#42b6ff' shadow='1'>Upgrade Level :</t><t shadow='1' align='right'><t color='#F5D363'>%2</t>/<t color='#F5D363'>%3</t></t><br /><t color='#42b6ff' shadow='1'>Needed Funds :</t><t shadow='1' align='right'><t color='#F5D363'>%4</t>/<t color='%5'>%6</t> $</t><br /><t color='#42b6ff' shadow='1'>Needed Supply :</t><t shadow='1' align='right'><t color='#F5D363'>%7</t>/<t color='%8'>%9</t> S</t><br /><t color='#42b6ff' shadow='1'>Needed Time :</t><t shadow='1' align='right'><t color='#F5D363'>%10</t> Seconds</t><br />",_upgrade_labels select _id,_upgrade_current, _upgrade_levels select _id,_upgrade_price,if(_funds >= _upgrade_price) then {'#76F563'} else {'#F56363'},_funds,_upgrade_supply,if(_supply >= _upgrade_supply) then {'#76F563'} else {'#F56363'},_supply,(_upgrade_times select _id) select _upgrade_current];
				
				_links = (_upgrade_links select _id) select _upgrade_current;
				if (count _links > 0) then {
					if (typeName (_links select 0) == "ARRAY") then {
						_count = count(_links);
						for '_i' from 0 to _count-1 do {
							_coma = if (_i+1 < _count) then {", "} else {""};
							_clink = _links select _i;
							_linkto = _upgrades select (_clink select 0);
							_html2 = _html2 + Format ["<t shadow='1'><t color='%1'>%2 </t><t color='#F5D363'>%3</t>%4</t>",if (_linkto >= (_clink select 1)) then {'#76F563'} else {'#F56363'},_upgrade_labels select (_clink select 0), _clink select 1,_coma];
						};
					} else {
						_linkto = _upgrades select (_links select 0);
						if (_linkto >= (_links select 1)) then {_html2 = _html2 + "<t color='#76F563' shadow='1'>All dependencies are met</t>"} else {_html2 = _html2 + Format ["<t shadow='1'><t color='#F56363'>%1 </t><t color='#F5D363'>%2</t></t>",_upgrade_labels select (_links select 0), _links select 1]};
					};
				} else {
					_html2 = _html2 + "<t color='#76F563' shadow='1'>None</t>";
				};
			} else {
				_html = Format["<t color='#42b6ff' size='1.2' underline='1' shadow='1'>%1:</t><br /><br /><t color='#76F563' shadow='1'>The maximum upgrade level has been reached.</t>",_upgrade_labels select _id];
				_html2 = _html2 + "<t color='#76F563' shadow='1'>None</t>";
			};
			((uiNamespace getVariable "cti_display_upgrades") displayCtrl 504003) ctrlSetStructuredText (parseText _html);
			((uiNamespace getVariable "cti_display_upgrades") displayCtrl 504004) ctrlSetStructuredText (parseText _html2);
		};
	};
	
	if (_purchase) then {
		_purchase = false;
		_ui_lnb_sel = lnbCurSelRow(504001);
		if (_ui_lnb_sel != -1) then {
			_id = lnbValue[504001, [_ui_lnb_sel, 0]];
			_upgrade_current = _upgrades select _id;
			_funds = call cti_CL_FNC_GetPlayerFunds;
			_supply = (cti_Client_SideJoined) call cti_CO_FNC_GetSideSupply;
			if !(cti_Client_Logic getVariable "cti_upgrading") then {
				if (_upgrade_current < (_upgrade_levels select _id)) then {
					_upgrade_supply = ((_upgrade_costs select _id) select _upgrade_current) select 0;
					_upgrade_price = ((_upgrade_costs select _id) select _upgrade_current) select 1;
					if(_funds >= _upgrade_price && _supply >= _upgrade_supply) then {
						_links = (_upgrade_links select _id) select _upgrade_current;
						_link_needed = false;
						if (count _links > 0) then {
							if (typeName (_links select 0) == "ARRAY") then {
								_count = count(_links);
								for '_i' from 0 to _count-1 do {
									_clink = _links select _i;
									_linkto = _upgrades select (_clink select 0);
									if (_linkto < (_clink select 1)) exitWith {_link_needed = true};
								};
							} else {
								_linkto = _upgrades select (_links select 0);
								if (_linkto < (_links select 1)) exitWith {_link_needed = true};
							};
						};
						if !(_link_needed) then {
							-(_upgrade_price) Call cti_CL_FNC_ChangePlayerFunds;
							[cti_Client_SideJoined, -(_upgrade_supply)] Call cti_CO_FNC_ChangeSideSupply;
							//--- todo check conditions., deduce cash etc
							[cti_Client_SideJoined, _id, _upgrade_current, true] remoteExecCall ["cti_SE_PVF_RequestUpgrade",2];
							cti_Client_Logic setVariable ["cti_upgrading", true, true];
							//todo spawn local upgrade thread & timer & hint
							//--- Pure client, spawn an upgrade thread, which is local to the client in case the client tickrate is above the server tickrate.
							if !(isServer) then {
								_upgrade_time = (_upgrade_times select _id) select _upgrade_current;
								[_id, _upgrade_current, _upgrade_time] spawn {
									sleep (_this select 2);
									["upgrade-sync", cti_Client_SideJoined, _this select 0, _this select 1] remoteExecCall ["cti_SE_PVF_RequestSpecial",2];
								};
							};
							hint parseText(Format["<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Information:</t><br /><br /><t>Upgrading <t color='#B6F563'>%1</t> to level <t color='#F5D363'>%2</t></t>",_upgrade_labels select _id,_upgrade_current + 1]);
						} else {
							hint parseText("<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Information:</t><br /><br /><t>One or more <t color='#F56363'>dependencies</t> are needed in order to process this upgrade.");
						};
					} else {
						hint parseText(Format["<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Information:</t><br /><br /><t> There is not enough resources to process this upgrade (<t color='#F56363'>Funds</t> or <t color='#F56363'>Supply</t>)</t>",_upgrade_labels select _id,_upgrade_current]);
					};
				} else {
					hint parseText("<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Information:</t><br /><br /><t>The upgrade has reached it's <t color='#76F563'>maximum level</t></t>");
				};
			} else {
				hint parseText("<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Information:</t><br /><br /><t>An upgrade is <t color='#B6F563'>already running</t></t>");
			};
		};
	};
	
	if ((_upgrade_isupgrading && !(cti_Client_Logic getVariable "cti_upgrading")) || (!_upgrade_isupgrading && (cti_Client_Logic getVariable "cti_upgrading"))) then {
		_upgrade_isupgrading = (cti_Client_Logic getVariable "cti_upgrading");
		_html = if (_upgrade_isupgrading) then {"<t>An upgrade is <t color='#B6F563'>currently running</t></t>"} else {""};
		((uiNamespace getVariable "cti_display_upgrades") displayCtrl 504006) ctrlSetStructuredText (parseText _html);
	};
	
	//--- Go back to the main menu.
	if (cti_WF_MenuAction == 1000) exitWith {
		cti_WF_MenuAction = -1;
		closeDialog 0;
		createDialog "WF_Menu";
	};
	
	sleep .01;
};

uiNamespace setVariable ["cti_display_upgrades", nil];