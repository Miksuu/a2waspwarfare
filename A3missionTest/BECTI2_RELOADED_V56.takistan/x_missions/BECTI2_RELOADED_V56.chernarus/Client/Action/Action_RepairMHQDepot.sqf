Private ["_currency","_currencySym","_hq","_repairPrice","_commander","_towns","_logik","_get"];

_commander = (cti_Client_SideJoined) call cti_CO_FNC_GetCommanderTeam;
_logik = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideLogic;
_get = _logik getVariable "cashrepaired";
_hq = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQ;

if (alive _hq ) exitWith {hint (localize "STR_WF_INFO_Repair_MHQ_None")};


if (_get) exitWith {hint "HQ cannot be repaired using cash twice!"};

/*
if!(isNil '_get')then {
    if (_get) exitWith {hint "HQ cannot be repaired using cash twice!"};
    if (!_get) then {_logik setVariable ['cashrepaired',"true",true];};
};

*/

//--- Is HQ already being fixed?
if (cti_Client_Logic getVariable "cti_hq_repairing") exitWith {hint (localize "STR_WF_INFO_Repair_MHQ_BeingRepaired")};

_repairPrice = (missionNameSpace getVariable "cti_C_BASE_HQ_REPAIR_PRICE_CASH") * (1+0.05*((cti_Client_Logic getVariable "cti_hq_repair_count")-1));
_currency = Call cti_CL_FNC_GetPlayerFunds;
_currencySym = "$";

if (_currency < _repairPrice) exitWith {hint Format [localize "STR_WF_INFO_Repair_MHQ_Funds",_currencySym,_repairPrice - _currency]};

-(_repairPrice) Call cti_CL_FNC_ChangePlayerFunds;

[cti_Client_SideJoined] remoteExecCall ["cti_SE_PVF_RequestMHQRepair",2];

WF_Logic setVariable [Format ["%1MHQRepair",cti_Client_SideJoinedText],true,true];
_logik setVariable ['cashrepaired',true,true];

hint (localize "STR_WF_INFO_Repair_MHQ_Repair");
/*
_hq setPos [0,0,500];
_hq spawn {_this allowDamage true;};
_position = ([getPosATL player, 20] call cti_CO_FNC_GetSafePlace);
_hq setPos _position;

*/


_hq setPos [((getPos player) select 0) + 5, (getPos player) select 1,((getPos player) select 2)+300];





_towns =(cti_Client_SideJoined) call cti_CO_FNC_GetSideTowns;

{_x setVariable ["supplyvalue", 10, true]} forEach _towns;

hint "ALL TOWNS' SV ARE SET TO MINIMUM ...";

sleep 5;

hint "New HQ has been parachuted over your location !";
