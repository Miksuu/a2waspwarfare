/*
	Start an upgrade.
	 Parameters:
		- Side
		- Upgrade ID
		- Upgrade Level
		- Player's call
*/

Private ["_logic","_side","_stime","_upgrades","_upgrade_id","_upgrade_isplayer","_upgrade_level","_upgrade_time"];

_side = _this select 0;
_upgrade_id = _this select 1;
_upgrade_level = _this select 2;
_upgrade_isplayer = _this select 3;

_upgrade_time = ((missionNamespace getVariable Format["cti_C_UPGRADES_%1_TIMES",str _side]) select _upgrade_id) select _upgrade_level;

if (_upgrade_isplayer) then {
	
	
	
	['upgrade-started', _upgrade_id, _upgrade_level + 1] remoteExecCall ["cti_CL_FNC_HandleSpecial", _side];
	
	//--- Store the sync.
	missionNamespace setVariable [Format["cti_upgrade_%1_%2_%3_sync", str _side, _upgrade_id, _upgrade_level], false];

	_stime = 0;
	while {!(missionNamespace getVariable Format["cti_upgrade_%1_%2_%3_sync", str _side, _upgrade_id, _upgrade_level]) && _stime < _upgrade_time} do {
		_stime = _stime + 1;
		sleep 1;
	};

	//--- Release the Sync
	missionNamespace setVariable [Format["cti_upgrade_%1_%2_%3_sync", str _side, _upgrade_id, _upgrade_level], nil];
} else {
	sleep _upgrade_time;
};

_upgrades = +(_side Call cti_CO_FNC_GetSideUpgrades);
_upgrades set [_upgrade_id, (_upgrades select _upgrade_id) + 1];

_logic = (_side) Call cti_CO_FNC_GetSideLogic;
_logic setVariable ["cti_upgrades", _upgrades, true];
_logic setVariable ["cti_upgrading", false, true];

[_side, "NewIntelAvailable"] Spawn cti_SE_FNC_SideMessage;

['upgrade-complete', _upgrade_id, _upgrade_level + 1] remoteExecCall ["cti_CL_FNC_HandleSpecial", _side];



//todo log.