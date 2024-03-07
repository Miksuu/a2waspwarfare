private ["_unit","_weapon","_reduction","_projectile","_startPos","_checkDistance","_currentPos","_distance"];
_unit = _this select 0;
_ammo = _this select 1;
_weapon = currentweapon _unit;

// Check if the fired ammo is Mk82 or Fab250
if (_ammo in ["Bo_FAB_250","Bo_Mk82"]) then {
	_startPos = getPosASL _unit;
	
	_projectile spawn {
        while {!isNull _projectile && {alive _projectile}} do {
			if {(_startPos distance getPosASL _projectile) > 3000} then {
				deleteVehicle _projectile;
			};
            sleep 0.1;
        };

        deleteVehicle _projectile;
	};
};
