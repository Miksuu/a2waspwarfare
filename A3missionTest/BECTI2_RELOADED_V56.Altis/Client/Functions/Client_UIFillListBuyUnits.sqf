//Private ['_addin','_c','_currentUpgrades','_filler','_filter','_i','_listBox','_listNames','_u','_value','_selectedRole'];

Private ['_addin','_c','_currentUpgrades','_filler','_filter','_i','_listBox','_listNames','_u','_value'];

_listNames = _this select 0;
_filler = _this select 1;
_listBox = _this select 2;
_value = _this select 3;
//_selectedRole = WSW_gbl_boughtRoles select 0;

_u = 0;
_i = 0;

_UpAirlift = ((CTI_Client_SideJoined) Call CTI_CO_FNC_GetSideUpgrades) select CTI_UP_AIRLIFT;

/*
_currentUpgrades = (CTI_Client_SideJoined) Call CTI_CO_FNC_GetSideUpgrades;
_filter = missionNamespace getVariable Format["CTI_%1%2CURRENTFACTIONSELECTED",CTI_Client_SideJoinedText,_filler];
if (isNil '_filter') then {_filter = "nil"} else {
	if (_filter == 0) then {
		_filter = 'nil';
	} else {
		_filter = ((missionNamespace getVariable Format["CTI_%1%2FACTIONS",CTI_Client_SideJoinedText,_filler]) select _filter);
	};
};

lnbClear _listBox;

{
	if(isNil "_x")then{
		_listNames deleteAt _forEachIndex;
	}else{
		_selUnit = missionNamespace getVariable _x;
		if(isNil "_selUnit")then{
			_listNames deleteAt _forEachIndex;
		};
	}
}foreach _listNames;

_UpBar = ((CTI_Client_SideJoined) Call CTI_CO_FNC_GetSideUpgrades) select CTI_UP_BARRACKS;
_UpLight = ((CTI_Client_SideJoined) Call CTI_CO_FNC_GetSideUpgrades) select CTI_UP_LIGHT;
_UpHeavy = ((CTI_Client_SideJoined) Call CTI_CO_FNC_GetSideUpgrades) select CTI_UP_HEAVY;
_UpAirlift = ((CTI_Client_SideJoined) Call CTI_CO_FNC_GetSideUpgrades) select CTI_UP_AIRLIFT;

{
	_addin = true;
	_isAdvVehicle = false;
	_c = missionNamespace getVariable _x;
	
	if!(isNil "_c")then{
		if (_filter != "nil") then {
			if ((_c select QUERYUNITFACTION) != _filter) then {_addin = false};
		};

		_addit = false;
		if(_filler == 'Depot') then
		{

			if ((_x in ['rhs_vdv_des_machinegunner', 'rhsusf_army_ucp_arb_machinegunner']) && _UpBar>=1)then{_addit  = true;};
			if ((_x in ['rhs_vdv_des_LAT', 'rhsusf_army_ucp_arb_riflemanat']) && _UpBar>=1)then{_addit = true;};
			if ((_x in ['rhs_vdv_des_engineer', 'rhsusf_army_ucp_arb_engineer']) && _UpBar>=1)then{_addit = true;};
			if ((_x in ['rhs_vdv_des_aa','rhsusf_army_ucp_aa']) && _UpBar>=3)then{_addit = true;};
		};

		if (_x in CTI_ADV_ARTILLERY)then{ _isAdvVehicle = true;};

        if!(isNil '_selectedRole')then{
            if(_selectedRole == WSW_ARTY_OPERATOR)then{
                if(_filler == 'Light')then{
                    if (_isAdvVehicle && _UpLight == _c select QUERYUNITUPGRADE)then{
                        _addit = true;
                    };
                };
                if(_filler == 'Heavy')then{
                    if (_isAdvVehicle && _UpHeavy == _c select QUERYUNITUPGRADE)then{
                        _addit = true;
                    };
                };
            };
        };

		if (((_c select QUERYUNITUPGRADE) <= (_currentUpgrades select _value) && _addin && !_isAdvVehicle) || (_addit&&_addin)) then {
		    _cost = _c select QUERYUNITPRICE;
		    if(_isAdvVehicle) then {

		        if!(isNil '_selectedRole')then{
		            if(_selectedRole == WSW_ARTY_OPERATOR)then{
                        _cost = ceil (_cost - (_cost * CTI_ADV_ARTY_DISCOUNT));
                        lnbAddRow [_listBox,['$'+str (_cost),(_c select QUERYUNITLABEL)]];
                    }else{
                        lnbAddRow [_listBox,['$'+str (_c select QUERYUNITPRICE),(_c select QUERYUNITLABEL)]];
                    };
		        }else{
		            lnbAddRow [_listBox,['$'+str (_c select QUERYUNITPRICE),(_c select QUERYUNITLABEL)]];
		        };
		        lnbSetData [_listBox,[_i,0],_filler];
                lnbSetValue [_listBox,[_i,0],_u];
                lnbSetValue [_listBox,[_i,1],_cost];
                lnbSetColor [_listBox,[_i,0],[0.6, 0.4, 0.6, 1.0]];
                lnbSetColor [_listBox,[_i,1],[0.6, 0.4, 0.6, 1.0]];
		    } else {
		        lnbAddRow [_listBox,['$'+str (_cost),(_c select QUERYUNITLABEL)]];
                lnbSetData [_listBox,[_i,0],_filler];
                lnbSetValue [_listBox,[_i,0],_u];
                lnbSetValue [_listBox,[_i,1],_cost];
		    };
			_i = _i + 1;
		};
		_u = _u + 1;
	};
	
} forEach _listNames;
*/
_currentUpgrades = (CTI_Client_SideJoined) Call CTI_CO_FNC_GetSideUpgrades;
_filter = missionNamespace getVariable Format["CTI_%1%2CURRENTFACTIONSELECTED",CTI_Client_SideJoinedText,_filler];
if (isNil '_filter') then {_filter = "nil"} else {
	if (_filter == 0) then {
		_filter = 'nil';
	} else {
		_filter = ((missionNamespace getVariable Format["CTI_%1%2FACTIONS",CTI_Client_SideJoinedText,_filler]) select _filter);
	};
};

lnbClear _listBox;
{
	_addin = true;
	_c = missionNamespace getVariable _x;
	if (_filter != "nil") then {
		if ((_c select QUERYUNITFACTION) != _filter) then {_addin = false};
	};
	
	_addit = false;
		if(_filler == 'Depot') then
		{
		      _UpBar = ((CTI_Client_SideJoined) Call CTI_CO_FNC_GetSideUpgrades) select CTI_UP_BARRACKS;

			if ((_x in ['CUP_O_sla_Soldier_LAT', 'CUP_O_TK_Soldier_LAT', 'CUP_O_INS_Soldier_LAT', 'CUP_B_CDF_Soldier_RPG18_DST', 'CUP_B_CDF_Soldier_RPG18_SNW', 'CUP_B_HIL_Soldier_LAT_Res']) && _UpBar>=1)then{_addit  = true;};
			if ((_x in ['CUP_B_HIL_MMG_Recon', 'CUP_B_CDF_Soldier_MG_SNW', 'CUP_B_HIL_MMG', 'CUP_O_INS_Soldier_MG', 'CUP_O_TK_Soldier_MG', 'CUP_O_TK_INS_Soldier_MG']) && _UpBar>=1)then{_addit = true;};
			if ((_x in ['CUP_O_sla_Soldier_AR', 'CUP_O_INS_Soldier_AR', 'CUP_O_TK_INS_Soldier_AR', 'CUP_B_CDF_Soldier_AR_DST', 'CUP_B_CDF_Soldier_AR_SNW', 'CUP_B_CDF_Soldier_AR_MNT']) && _UpBar>=1)then{_addit = true;};
			if ((_x in ['CUP_B_CDF_Soldier_LAT_DST','CUP_B_CDF_Soldier_LAT_SNW','CUP_B_HIL_Soldier_HAT_Res','CUP_O_TK_Soldier_AT','CUP_O_INS_Soldier_AT','CUP_O_TK_INS_Soldier_AT']) && _UpBar>=2)then{_addit = true;};
			if ((_x in ['CUP_O_TK_Soldier_AA','CUP_O_INS_Soldier_AA','CUP_O_TK_INS_Soldier_AA','CUP_B_CDF_Soldier_AA_DST','CUP_B_CDF_Soldier_AA_SNW','CUP_B_HIL_Soldier_AA']) && _UpBar>=3)then{_addit = true;};
		};

/*standard
	if (((_c select QUERYUNITUPGRADE) <= (_currentUpgrades select _value) && _addin) || (_addit&&_addin)) then {
		lnbAddRow [_listBox,['$'+str (_c select QUERYUNITPRICE),(_c select QUERYUNITLABEL)]];
		lnbSetData [_listBox,[_i,0],_filler];
		lnbSetValue [_listBox,[_i,0],_u];
		_i = _i + 1;
	};
	_u = _u + 1;
	
*/
	
	if (((_c select QUERYUNITUPGRADE) <= (_currentUpgrades select _value) && _addin) || (_addit&&_addin)) then {
		
		
		
		
		
		lnbAddRow [_listBox,['$'+str (_c select QUERYUNITPRICE),(_c select QUERYUNITLABEL)]];
		lnbSetData [_listBox,[_i,0],_filler];
		lnbSetValue [_listBox,[_i,0],_u];
		
	if(_x in (missionNamespace getVariable [format["cti_%1REPAIRTRUCKS", CTI_Client_SideJoined], []])) then {
		lnbSetColor [_listBox,[_i,1],[0.33, 0.33, 0.10, 1.0]]
	};			
	
	if(_x in (missionNamespace getVariable [format["cti_%1AMMOTRUCKS", CTI_Client_SideJoined], []])) then {
		lnbSetColor [_listBox,[_i,1],[1.0, 0.0, 0.0, 0.6]]
	};			
	

if (_UpAirlift > 0) then {
	
	if(_x in (missionNamespace getVariable [format["cti_%1LIFTVEHICLE", CTI_Client_SideJoined], []])) then {
		lnbSetColor [_listBox,[_i,1],[0.0, 0.70, 1.0, 1.0]]
	};
};
	if(_x in (missionNamespace getVariable [format["cti_%1CARGOVEHICLE", CTI_Client_SideJoined], []])) then {
		lnbSetColor [_listBox,[_i,1],[0.0, 0.70, 1.0, 1.0]]
	};

	if(_x in (missionNamespace getVariable [format["cti_%1AMBULANCES", CTI_Client_SideJoined], []])) then {
		lnbSetColor [_listBox,[_i,1],[1.0, 1.0, 0.0, 0.6]]
		
	};
	
	if(_x in (missionNamespace getVariable [format["cti_%1SALVAGETRUCK", CTI_Client_SideJoined], []])) then {
		lnbSetColor [_listBox,[_i,1],[0.0, 1.0, 0.0, 0.6]]
	
	};
	
	if(_x in (missionNamespace getVariable [format["cti_%1ARTYVEHICLE", CTI_Client_SideJoined], []])) then {
		//lnbSetColor [_listBox,[_i,1],[0.0, 0.70, 1.0, 1.0]]lightblue
		lnbSetColor [_listBox,[_i,1],[1.0, 0.3, 1.0, 0.4]]
			
	
	
			//[1.0, 0.0, 0.0, 0.6]sehr gutes rot
				//[0.33, 0.33, 0.10, 1.0]sollte gelb werden ist aber auch gold
				//[0.27, 0.2287, 0.0235, 1.0]gold,sieht man kaum
				//[1.0, 0.5, 0.25, 1.0]rosa
				};
	_i = _i + 1;
	
};
_u = _u + 1;
	
	
	
	
	
} forEach _listNames;


if (_i > 0) then {lnbSetCurSelRow [_listBox,0]} else {lnbSetCurSelRow [_listBox,-1]};