Private ["_ammo","_irLock","_missile","_source","_unit","_indirectHit","_towDamage","_cruiseMissileAoEDamage","_cruiseMissileAoERange"];
_unit = _this select 0;
_ammo = _this select 1;
_source = _this select 2;

_missile = nearestObject [_source,_ammo];
if (isNull _missile) exitWith {};

_irLock = getNumber(configFile >> "CfgAmmo" >> _ammo >> "irLock"); //--- Get the ammo type.
if (_irLock == 0) then {if (_ammo in ["Bo_FAB_250","Bo_Mk82"]) then {_irLock = 1}}; //--- Dumb bomb workaround (rocket simulation).

if (_irLock == 1) then { //--- IR Lock is affected
	_source = getPos _source;
	_distance = _unit distance _source;

	_limit = missionNamespace getVariable "WFBE_C_GAMEPLAY_MISSILES_RANGE";

	if (_distance > _limit) then {
		waitUntil {_missile distance _source > _limit};
		deleteVehicle _missile;
	};
};

//Maverick fix
_indirectHit = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHit");
    if (_ammo in ["M_Maverick_AT"])
        then {
            _indirectHit = 849
            };

//Tow Damage Buff
_towDamage = getNumber(configFile >> "CfgAmmo" >> _ammo >> "hit");
    if (_ammo in ["M_TOW_AT"])
        then {
            _towDamage = 5000;
            };

//Tow nuke test
_cruiseMissileAoEDamage = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHit");
    if (_ammo in ["M_TOW_AT"])
        then {
            _cruiseMissileAoEDamage = 5000;
            };
//range
_cruiseMissileAoERange = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
    if (_ammo in ["M_TOW_AT"])
        then {
            _cruiseMissileAoERange = 5000;
            };