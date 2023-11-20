Private ["_currency","_currencySym","_currency_system","_hq","_repairPrice","_repairCount","_newRepairPrice","_vehicle"];

_vehicle = _this select 0;

_hq = (sideJoined) Call WFBE_CO_FNC_GetSideHQ;
if (alive _hq || (_hq distance _vehicle > 30)) exitWith {hint (localize "STR_WF_INFO_Repair_MHQ_None")};

//--- Is HQ already being fixed?
if (WFBE_Client_Logic getVariable "wfbe_hq_repairing") exitWith {hint (localize "STR_WF_INFO_Repair_MHQ_BeingRepaired")};

_currency_system = missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM";

_repairCount = missionNamespace getVariable Format ['WFBE_C_BASE_HQ_REPAIR_COUNT_%1', sideJoined];
if (_repairCount > 0 && _repairCount <= count WFBE_C_BASE_HQ_REPAIR_PRICES) then {
    _repairPrice = WFBE_C_BASE_HQ_REPAIR_PRICES select (_repairCount - 1);
    missionNamespace setVariable [Format ['WFBE_C_BASE_HQ_REPAIR_PRICE_%1', sideJoined], _repairPrice];
};

//if (missionNamespace getVariable Format ['WFBE_C_BASE_HQ_REPAIR_PRICE_%1', sideJoined] == (WFBE_C_BASE_HQ_REPAIR_PRICES select 2)) exitWith {hint Format [localize "STR_WF_INFO_MHQ_Repairs_Used"]};

_repairPrice = (missionNamespace getVariable Format ['WFBE_C_BASE_HQ_REPAIR_PRICE_%1', sideJoined]);
_currency = if (_currency_system == 0) then {(sideJoined) Call GetSideSupply} else {Call GetPlayerFunds};
_currencySym = if (_currency_system == 0) then {"S"} else {"$"};
if (_currency < _repairPrice) exitWith {hint Format [localize "STR_WF_INFO_Repair_MHQ_Funds",_currencySym,_repairPrice - _currency]};

if (_currency_system == 0) then {
	[sideJoined,-_repairPrice, "MHQ repaired."] Call ChangeSideSupply;
} else {
	-(_repairPrice) Call ChangePlayerFunds;
};

["RequestMHQRepair", sideJoined] Call WFBE_CO_FNC_SendToServer;

WF_Logic setVariable [Format ["%1MHQRepair",sideJoinedText],true,true];

_counter = missionNamespace getVariable Format ['WFBE_C_BASE_HQ_REPAIR_COUNT_%1', sideJoined];
missionNamespace setVariable [Format ['WFBE_C_BASE_HQ_REPAIR_COUNT_%1', sideJoined], _counter + 1];

_newRepairPrice = WFBE_C_BASE_HQ_REPAIR_PRICES select (_repairCount);

hint Format [localize "STR_WF_INFO_Repair_MHQ_Repair", " The HQ repair price is now: S", _newRepairPrice];
