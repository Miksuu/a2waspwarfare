Private ["_mhq"];

_mhq = _this select 1;

if (!(cti_Client_SideJoined Call cti_CO_FNC_GetSideHQDeployStatus)) then {
	_mhq addAction [localize "STR_WF_Unlock_MHQ","Client\Action\Action_ToggleLock.sqf", [], 95, false, true, '', 'alive _target && (locked _target == 2)'];
	_mhq addAction [localize "STR_WF_Lock_MHQ","Client\Action\Action_ToggleLock.sqf", [], 94, false, true, '', 'alive _target && (locked _target == 0)'];
};