Private ["_building","_built","_config","_crew","_dir","_distance","_factoryPosition","_factoryType","_id","_index","_vehiSlots","_longest","_position","_queu","_queu2","_ret","_side","_sideID","_sideText","_soldier","_team","_turrets","_type","_unitType","_vehicle","_waitTime"];

_id = _this select 0;
_building = _this select 1;
_unitType = _this select 2;
_side = _this select 3;
_team = _this select 4;
_vehiSlots = _this select 5;
_additionalSlotsAmount = if (count _this > 6) then {_this select 6} else {-1};

_sideID = (_side) Call cti_CO_FNC_GetSideID;


_sideText = str _side;

if !(alive _building) exitWith {["INFORMATION", Format ["Server_ResBuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call cti_CO_FNC_LogContent};

["INFORMATION", Format ["Server_ResBuyUnit.sqf: [%1] Team has purchased a [%1] unit.",_team, _unitType]] Call cti_CO_FNC_LogContent;

_type = typeOf _building;

_index = (missionNamespace getVariable Format ["cti_%1STRUCTURENAMES",_sideText]) find _type;
_distance = (missionNamespace getVariable Format ["cti_%1STRUCTUREDISTANCES",_sideText]) select _index;
_factoryType = (missionNamespace getVariable Format ["cti_%1STRUCTURES",_sideText]) select _index;

_waitTime = (missionNamespace getVariable _unitType) select QUERYUNITTIME;
_direction = (missionNamespace getVariable Format["cti_%1STRUCTUREDIRECTIONS",str _side]) select _index;
_position = [getPos _building,_distance,getDir _building + _direction] Call cti_CO_FNC_GetPositionFrom;
_longest = missionNamespace getVariable Format ["cti_LONGEST%1BUILDTIME",_factoryType];

if !(alive _building) exitWith {["INFORMATION", Format ["Server_ResBuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call cti_CO_FNC_LogContent};

_HC = missionNamespace getVariable "cti_HEADLESSCLIENTS_ID";
_factoryPosition = getPosATL _building;
_dir = -((((_position select 1) - (_factoryPosition select 1)) atan2 ((_position select 0) - (_factoryPosition select 0))) - 90);
if (_unitType isKindOf "Man") then {
	if (count _HC > 0) then {
		_groups = [];
		_groups pushBack (missionNamespace getVariable Format ["cti_%1SOLDIER", _side]);
		_positions = [];
		_positions pushBack _position;

		[_side, _unitType, _position, _team, _dir] Call cti_SE_FNC_DelegateAIHeadless;
	}else{
	    _soldier = [_unitType,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
        //--- Infantry can use the team vehicles as cargo.
        _vehicle = [_team,true] Call cti_CO_FNC_GetTeamVehicles;
        {_team addVehicle _x} forEach _vehicle;
	};
}else{
    if (count _HC > 0) then {
        _groups = [];
        _groups pushBack (missionNamespace getVariable Format ["cti_%1SOLDIER", _side]);
        _special = if (_unitType isKindOf "Air") then {"FLY"} else {"NONE"};
        [_side, _unitType, _position, _team, _dir, _special] Call cti_SE_FNC_DelegateAIHeadless;
    }else{
        //_crew = missionNamespace getVariable Format["cti_%1RESSOLDIER",_sideText];
		
		
		
		_crew = selectRandom["CUP_I_TK_GUE_Soldier_HAT","CUP_I_PMC_Soldier_AA","cwr3_i_soldier_aa_strela"];

		

        //if (_unitType isKindOf "Tank") then {_crew = missionNamespace getVariable Format ["cti_%1RESCREW",_sideText]};
        
		
		
		if (_unitType isKindOf "Air") then {_crew = missionNamespace getVariable Format ["cti_%1RESPILOT",_sideText]};

        _special = if (_unitType isKindOf "Air") then {"FLY"} else {"NONE"};
        _vehicle = [_unitType, _position, _sideID, _dir, true, true, true, _special] Call cti_CO_FNC_CreateVehicle;

        /* Clear the vehicle */
        (_vehicle) call cti_CO_FNC_ClearVehicleCargo;

        emptyQueu pushBack _vehicle;
        [_vehicle] Spawn cti_SE_FNC_HandleEmptyVehicle;
        _soldier = [_crew,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
        _soldier  spawn {_this allowDamage false; sleep 10; _this allowDamage true};
        [_soldier] allowGetIn true;
        [_soldier] orderGetIn true;
        _soldier assignAsDriver _vehicle;
        _soldier moveInDriver _vehicle;

        _built = 1;
        if (_vehiSlots select 1) then {
            _soldier = [_crew,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
            _soldier  spawn {_this allowDamage false; sleep 10; _this allowDamage true};
            [_soldier] allowGetIn true;
            [_soldier] orderGetIn true;
            _soldier assignAsGunner _vehicle;
            _soldier moveInGunner _vehicle;
            _built = _built + 1;
        };
        if (_vehiSlots select 2) then {
            _soldier = [_crew,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
            _soldier  spawn {_this allowDamage false; sleep 10; _this allowDamage true};
            [_soldier] allowGetIn true;
            [_soldier] orderGetIn true;
            _soldier assignAsCommander _vehicle;
            _soldier moveInCommander _vehicle;
            _built = _built + 1;
        };
        if (_vehiSlots select 3) then {
            Private ["_get","_turrets"];
            _get = missionNamespace getVariable _unitType;
            _turrets = _get select QUERYUNITTURRETS;

            if(_additionalSlotsAmount > 0)then{
                for "_i" from 0 to _additionalSlotsAmount - 1 do {
                    if (isNull (_vehicle turretUnit (_turrets select _i))) then {
                        _soldier = [_crew,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
                        [_soldier] allowGetIn true;
                        _soldier moveInTurret [_vehicle, (_turrets select _i)];
                        _built = _built + 1;
                    };
                };
            } else {
                {
                    if (isNull (_vehicle turretUnit _x)) then {
                        _soldier = [_crew,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
                        [_soldier] allowGetIn true;
                        _soldier moveInTurret [_vehicle, _x];
                        _built = _built + 1;
                    };
                } forEach _turrets;
            };
        };
    };

};