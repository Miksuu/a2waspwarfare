Private ["_currency","_currencySym","_hq","_repairPrice","_vehicle"];

_vehicle = _this select 0;

_hq = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQ;
if (alive _hq || (_hq distance _vehicle > 30)) exitWith {hint (localize "STR_WF_INFO_Repair_MHQ_None")};

//--- Is HQ already being fixed?
if (cti_Client_Logic getVariable "cti_hq_repairing") exitWith {hint (localize "STR_WF_INFO_Repair_MHQ_BeingRepaired")};

_repairPrice = (missionNamespace getVariable 'cti_C_BASE_HQ_REPAIR_PRICE') * (1+0.05*((cti_Client_Logic getVariable "cti_hq_repair_count")-1));
_currency = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideSupply;
_currencySym = "S";
if (_currency < _repairPrice) exitWith {hint Format [localize "STR_WF_INFO_Repair_MHQ_Funds",_currencySym,_repairPrice - _currency]};

[cti_Client_SideJoined,-_repairPrice] Call cti_CO_FNC_ChangeSideSupply;


[cti_Client_SideJoined] remoteExecCall ["cti_SE_PVF_RequestMHQRepair",2];

WF_Logic setVariable [Format ["%1MHQRepair",cti_Client_SideJoinedText],true,true];

hint (localize "STR_WF_INFO_Repair_MHQ_Repair");