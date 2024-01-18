private["_brr","_mbr","_onAreaRemoved","_side","_logik","_buildings","_command","_service","_aar","_areas","_grp","_areas_old"];

_brr = missionNamespace getVariable "cti_C_BASE_AREA_RANGE";
_mbr = missionNamespace getVariable "cti_C_BASE_HQ_BUILD_RANGE";
_baseareaRange = (missionNamespace getVariable "cti_C_BASE_AREA_RANGE") + (missionNamespace getVariable "cti_C_BASE_HQ_BUILD_RANGE");

_onAreaRemoved = {
	Private ["_areas", "_center", "_delete", "_objects", "_side"];
	_center = _this select 0;
	_side = _this select 1;
	_areas = _this select 2;
	
	_objectsToFind = (missionNamespace getVariable Format["cti_%1DEFENSENAMES", _side]);
	_objectsToFind pushBack "Land_HBarrier_large";
	_objects = nearestObjects [_center, _objectsToFind, (missionNamespace getVariable "cti_C_BASE_AREA_RANGE") + (missionNamespace getVariable "cti_C_BASE_HQ_BUILD_RANGE")];

	{
	    _objects = _objects - (nearestObjects [getPosATL _x, missionNamespace getVariable Format["cti_%1DEFENSENAMES", _side], _baseareaRange])
	} forEach _areas;
	
	{
		if !(isNil {_x getVariable "cti_defense"}) then {
			_delete = true;
			if (_x isKindOf "StaticWeapon") then {
				_unit = gunner _x;
				if (alive _unit) then {
					if (isNil {(group _unit) getVariable "cti_funds"}) then {
						_unit setPos (getPosATL _x);
						deleteVehicle _unit;
					} else {
						_delete = false;
					};
				};
			};
			if (_delete) then {deleteVehicle _x};
		};
	} forEach _objects;
};

while {!cti_GameOver} do {
	{
		_side = _x;
		_logik = (_side) Call cti_CO_FNC_GetSideLogic;
		_buildings = (_side Call cti_CO_FNC_GetSideStructures) + [_side Call cti_CO_FNC_GetSideHQ];
		_command=[_side,missionNamespace getVariable Format["cti_%1COMMANDCENTERTYPE",str _side],_buildings] Call cti_CO_FNC_GetFactories;
		_service=[_side,missionNamespace getVariable Format["cti_%1SERVICEPOINTTYPE",str _side],_buildings] Call cti_CO_FNC_GetFactories;
		_aar = [_side,missionNamespace getVariable Format["cti_%1AARADARTYPE",str _side],_buildings] Call cti_CO_FNC_GetFactories;
		_arr = [_side,missionNamespace getVariable Format["cti_%1ArtyRadarTYPE",str _side],_buildings] Call cti_CO_FNC_GetFactories;
		_buildings = _buildings - _command - _service - _aar - _arr;
		_areas = _logik getVariable "cti_basearea";

		{
			_structure = [_x, _buildings] Call cti_CO_FNC_GetClosestEntity;
			if (!isNull _structure) then {
				if (_structure distance _x > (_brr + _mbr)) then {
					//--- On deletion, remove the statics/defenses later.
					[getPosATL _x, _side, _areas] Spawn _onAreaRemoved;
					_areas deleteAt (_forEachIndex);
					_areas = _areas - [objNull];
					_grp = group _x;
					deleteVehicle _x;
					deleteGroup _grp;
					_logik setVariable ["cti_basearea", _areas, true];
				};
			};
		} forEach _areas;
	} forEach cti_PRESENTSIDES;
	sleep 60;
};