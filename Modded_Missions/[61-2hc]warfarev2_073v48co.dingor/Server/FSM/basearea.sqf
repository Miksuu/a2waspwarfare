private["_brr","_mbr","_onAreaRemoved","_side","_logik","_buildings","_command","_service","_aar","_areas","_grp","_areas_old"];

_brr = missionNamespace getVariable "WFBE_C_BASE_AREA_RANGE";
_mbr = missionNamespace getVariable "WFBE_C_BASE_HQ_BUILD_RANGE";

_onAreaRemoved = {
    Private ["_areas", "_center", "_delete", "_objects", "_side"];
    _center = _this select 0;
    _side = _this select 1;
    _areas = _this select 2;

    _objects = nearestObjects [_center, missionNamespace getVariable Format["WFBE_%1DEFENSENAMES", _side], (missionNamespace getVariable "WFBE_C_BASE_AREA_RANGE") + (missionNamespace getVariable "WFBE_C_BASE_HQ_BUILD_RANGE")];
    {_objects = _objects - (nearestObjects [getPos _x, missionNamespace getVariable Format["WFBE_%1DEFENSENAMES", _side], (missionNamespace getVariable "WFBE_C_BASE_AREA_RANGE") + (missionNamespace getVariable "WFBE_C_BASE_HQ_BUILD_RANGE")])} forEach _areas;

    sleep 60;

    {
        if !(isNil {_x getVariable "wfbe_defense"}) then {
            _delete = true;
            if (_x isKindOf "StaticWeapon") then {
                _unit = gunner _x;
                if (alive _unit) then {
                    if (isNil {(group _unit) getVariable "wfbe_funds"}) then {
                        _unit setPos (getPos _x);
                        deleteVehicle _unit;
                    } else {
                        _delete = false;
                    };
                };
            };
            if (_x isKindOf "CDF_WarfareBVehicleServicePoint" || // Cherno BLU
                _x isKindOf "INS_WarfareBVehicleServicePoint" || // Cherno OPFOR
                _x isKindOf "US_WarfareBVehicleServicePoint_Base_EP1" || // Taki BLU
                _x isKindOf "TK_WarfareBVehicleServicePoint_Base_EP1") // Taki OPFOR
                 then {
                deleteVehicle _x;
            } else {
                if (_delete) then {
                    deleteVehicle _x;
                };
            };
        };
    } forEach _objects;
};

while {!gameOver} do {
	{
		_side = _x;
		["DEBUG", Format ["basearea.sqf: Debug info [_side] [%1]", _side]] Call WFBE_CO_FNC_LogContent;
		_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;
		["DEBUG", Format ["basearea.sqf: Debug info [_logik] [%1]", _logik]] Call WFBE_CO_FNC_LogContent;
		_buildings = (_side Call WFBE_CO_FNC_GetSideStructures) + [_side Call WFBE_CO_FNC_GetSideHQ];
		["DEBUG", Format ["basearea.sqf: Debug info [_buildings] [%1]", _buildings]] Call WFBE_CO_FNC_LogContent;
		_command=[_side,missionNamespace getVariable Format["WFBE_%1COMMANDCENTERTYPE",str _side],_buildings] Call GetFactories;
		["DEBUG", Format ["basearea.sqf: Debug info [_command] [%1]", _command]] Call WFBE_CO_FNC_LogContent;
		_service=[_side,missionNamespace getVariable Format["WFBE_%1SERVICEPOINTTYPE",str _side],_buildings] Call GetFactories;
		["DEBUG", Format ["basearea.sqf: Debug info [_service] [%1]", _service]] Call WFBE_CO_FNC_LogContent;
		_aar = [_side,missionNamespace getVariable Format["WFBE_%1AARADARTYPE",str _side],_buildings] Call GetFactories;
		["DEBUG", Format ["basearea.sqf: Debug info [_aar] [%1]", _aar]] Call WFBE_CO_FNC_LogContent;
		_buildings = _buildings - _command - _service - _aar;
		["DEBUG", Format ["basearea.sqf: Debug info [_buildings after subtraction] [%1]", _buildings]] Call WFBE_CO_FNC_LogContent;
		_areas_old = _logik getVariable "wfbe_basearea";
		["DEBUG", Format ["basearea.sqf: Debug info [_areas_old] [%1]", _areas_old]] Call WFBE_CO_FNC_LogContent;

		// Remove the null objects from the array, test to fix the base area bug possibly.
		_areas_old = _areas_old - [objNull];
		["DEBUG", Format ["basearea.sqf: Debug info [_areas_old after removing null] [%1]", _areas_old]] Call WFBE_CO_FNC_LogContent;

		_areas = _areas_old;
	
		{
			_structure = [_x, _buildings] Call WFBE_CO_FNC_GetClosestEntity;
			["DEBUG", Format ["basearea.sqf: Debug info [_structure] [%1]", _structure]] Call WFBE_CO_FNC_LogContent;
			if (!isNull _structure) then {
				if (_structure distance _x > (_brr + _mbr)) then {
					//--- On deletion, remove the statics/defenses later.
					[getPos _x, _side, _areas_old] Spawn _onAreaRemoved;
					_areas = _areas - [_x] - [objNull];
					["DEBUG", Format ["basearea.sqf: Debug info [_areas after removal] [%1]", _areas]] Call WFBE_CO_FNC_LogContent;
					_grp = group _x;
					deleteVehicle _x;
					deleteGroup _grp;
				};
			};
		} forEach _areas_old;
	
		if (count _areas_old != count _areas) then {
			_logik setVariable ["wfbe_basearea", _areas, true];
			["DEBUG", Format ["basearea.sqf: Debug info [wfbe_basearea setVariable] [%1]", _areas]] Call WFBE_CO_FNC_LogContent;
		};
	} forEach WFBE_PRESENTSIDES;
	sleep 20;
};