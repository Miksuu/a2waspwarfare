Private['_amount','_get','_isArtillery','_magazines','_side','_turrets','_type','_vehicle','_sam','_weapons'];

_vehicle = _this select 0;
_side = _this select 1;
_type = typeOf _vehicle;

if ((typeOf _vehicle) in cti_C_UNITS_TO_BALANCE) then {	
	_vehicle setVehicleAmmo 1;
} else {			
	_vehicle setVehicleAmmoDef 1;
};

{	
	if((_x select 0) == (typeOf _vehicle)) exitWith {		
		_vehicle setVehicleAmmoDef 1;
		[_vehicle, _x select 1] call cti_CO_FNC_Requip_AIR_VEH;
	};			
} forEach cti_C_AIR_VEHICLE_TO_REQUIP;

//--If vehicle have EASA then reload EASA magazines--
if(!(isNil { _vehicle getVariable "_pylons" } )) then {
	if(count (_vehicle getVariable "_pylons") > 0) then {			
		[_vehicle, _vehicle getVariable "_pylons"] call cti_CO_FNC_Requip_AIR_VEH;
	};
};

//--- Are we dealing with an artillery unit ?.
_isArtillery = [_type, _side] Call cti_CO_FNC_IsArtillery;
if (_isArtillery != -1) then {[_vehicle, _isArtillery, _side] Call cti_CO_FNC_EquipArtillery};
