Private ["_availableSpawn","_base_respawn","_buildings","_checks","_deathLoc","_farps","_has_baserespawn","_hq","_mobileRespawns","_range","_side","_sideText","_upgrades"];

_side = _this select 0;
_deathLoc = _this select 1;
_sideText = str _side;

//--- Base.
_hq = (_side) Call cti_CO_FNC_GetSideHQ;
_availableSpawn = [_hq];
_buildings = (_side) Call cti_CO_FNC_GetSideStructures;
_checks = [_side,missionNamespace getVariable Format["cti_%1BARRACKSTYPE",_sideText],_buildings] Call cti_CO_FNC_GetFactories;
if (count _checks > 0) then {_availableSpawn = _availableSpawn + _checks};
_checks = [_side,missionNamespace getVariable Format["cti_%1LIGHTTYPE",_sideText],_buildings] Call cti_CO_FNC_GetFactories;
if (count _checks > 0) then {_availableSpawn = _availableSpawn + _checks};
_checks = [_side,missionNamespace getVariable Format["cti_%1HEAVYTYPE",_sideText],_buildings] Call cti_CO_FNC_GetFactories;
if (count _checks > 0) then {_availableSpawn = _availableSpawn + _checks};
_checks = [_side,missionNamespace getVariable Format["cti_%1AIRCRAFTTYPE",_sideText],_buildings] Call cti_CO_FNC_GetFactories;
if (count _checks > 0) then {_availableSpawn = _availableSpawn + _checks};

_base_respawn = _availableSpawn - [_hq];
_has_baserespawn = if (alive _hq || count _base_respawn > 0) then {true} else {false};

//--- HQ is dead, but we can spawn at other buildings.
if (!alive _hq && count _availableSpawn > 1) then {_availableSpawn = _availableSpawn - [_hq]};

//--- Mobile respawn.
if ((missionNamespace getVariable "cti_C_RESPAWN_MOBILE") > 0) then {
	_mobileRespawns = missionNamespace getVariable Format["cti_%1AMBULANCES",_sideText];
	_upgrades = (_side) Call cti_CO_FNC_GetSideUpgrades;
	_range = (missionNamespace getVariable "cti_C_RESPAWN_RANGES") select (_upgrades select cti_UP_RESPAWNRANGE);
	_checks = _deathLoc nearEntities[_mobileRespawns,_range];
	if (count _checks > 0) then {
		{
			if (_x emptyPositions "cargo" > 0) then {
				_availableSpawn pushBackUnique _x;
			};
		} forEach _checks;
	};
};

//--- Camps.
if ((missionNamespace getVariable "cti_C_RESPAWN_CAMPS_MODE") > 0) then {
	_availableSpawn = _availableSpawn + ([_deathLoc, _side] Call cti_CO_FNC_GetRespawnCamps);
};

_availableSpawn