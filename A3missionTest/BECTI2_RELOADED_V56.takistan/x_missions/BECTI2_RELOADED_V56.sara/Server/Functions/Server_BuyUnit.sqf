Private ["_building","_built","_config","_crew","_direction","_dir","_distance","_factoryType","_factoryPosition","_gbq","_id","_index","_isVehicle","_longest","_position","_queu","_queu2","_ret","_side","_sideID","_sideText","_soldier","_team","_turrets","_type","_unitType","_vehicle","_waitTime"];
_id = _this select 0;
_building = _this select 1;
_unitType = _this select 2;
_side = _this select 3;
_sideID = (_side) Call cti_CO_FNC_GetSideID;
_team = _this select 4;
_isVehicle = _this select 5;

_sideText = str _side;

if (!(alive _building)||(isPlayer (leader _team))) exitWith {
	_gbq = (_team getVariable "cti_queue") - _id;
	_team setVariable ["cti_queue",_gbq];
	if !(alive _building) then {["INFORMATION", Format ["Server_BuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call cti_CO_FNC_LogContent};
	if (isPlayer (leader _team)) then {["INFORMATION", Format ["Server_BuyUnit.sqf: Unit [%1] has been canceled, player [%2] has replace the ai.", _unitType, name (leader _team)]] Call cti_CO_FNC_LogContent};
};

["INFORMATION", Format ["Server_BuyUnit.sqf: [%1] Team [%2] has purchased [%3].", _side,_team,_unitType]] Call cti_CO_FNC_LogContent;

_queu = _building getVariable "queu";
if (isNil "_queu") then {_queu = []};
_queu pushBack (_id select 0);
_building setVariable ["queu",_queu,true];

_type = typeOf _building;
_index = (missionNamespace getVariable Format ["cti_%1STRUCTURENAMES",_sideText]) find _type;
_distance = (missionNamespace getVariable Format ["cti_%1STRUCTUREDISTANCES",_sideText]) select _index;
_direction = (missionNamespace getVariable Format ["cti_%1STRUCTUREDIRECTIONS",_sideText]) select _index;
_factoryType = (missionNamespace getVariable Format ["cti_%1STRUCTURES",_sideText]) select _index;
_waitTime = (missionNamespace getVariable _unitType) select QUERYUNITTIME;
_position = [getPos _building,_distance,getDir _building + _direction] Call cti_CO_FNC_GetPositionFrom;
_longest = missionNamespace getVariable Format ["cti_LONGEST%1BUILDTIME",_factoryType];

_ret = 0;
_queu2 = [0];

if (count _queu > 0) then {
	_queu2 = _building getVariable "queu";
};

while {_id select 0 != _queu select 0} do {
	sleep 4;
	_ret = _ret + 4;
	_queu = _building getVariable "queu";
	
	if (!(alive _building)||(isNull _building)||(isPlayer (leader _team))) exitWith {
		_gbq = (_team getVariable "cti_queue") - _id;
		_team setVariable ["cti_queue",_gbq];
		_queu = _building getVariable "queu";
		_index = _queu find (_queu select 0);
		if(_index > -1)then{_queu deleteAt _index};
		_building setVariable ["queu",_queu,true];
		if !(alive _building) then {["INFORMATION", Format ["Server_BuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call cti_CO_FNC_LogContent};
		if (isPlayer (leader _team)) then {["INFORMATION", Format ["Server_BuyUnit.sqf: Unit [%1] has been canceled, player [%2] has replace the ai.", _unitType, name (leader _team)]] Call cti_CO_FNC_LogContent};
	};
	
	if (_queu select 0 == _queu2 select 0) then {
		if (_ret > _longest) then {
			if (count _queu > 0) then {
				_queu = _building getVariable "queu";
				_index = _queu find (_queu select 0);
				if(_index > -1)then{_queu deleteAt _index};
				_building setVariable ["queu",_queu,true];
			};	
		};
	};
	if (count _queu != count _queu2) then {
		_ret = 0;
		_queu2 = _building getVariable "queu";
	};
};

sleep _waitTime;

_queu = _building getVariable "queu";
_index = _queu find (_id select 0);
if(_index > -1)then{_queu deleteAt _index};
_building setVariable ["queu",_queu,true];

if (!(alive _building)||(isPlayer (leader _team))) exitWith {
	_gbq = (_team getVariable "cti_queue") - _id;
	_team setVariable ["cti_queue",_gbq];
	if !(alive _building) then {["INFORMATION", Format ["Server_BuyUnit.sqf: Unit [%1] construction has been stopped due to factory destruction.", _unitType]] Call cti_CO_FNC_LogContent};
	if (isPlayer (leader _team)) then {["INFORMATION", Format ["Server_BuyUnit.sqf: Unit [%1] has been canceled, player [%2] has replace the ai.", _unitType, name (leader _team)]] Call cti_CO_FNC_LogContent};
};

if (_unitType isKindOf "Man") then {
	_soldier = [_unitType,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
	[_sideText,'UnitsCreated',1] Call cti_CO_FNC_UpdateStatistics;
} else {
	_factoryPosition = getPos _building;
	_dir = -((((_position select 1) - (_factoryPosition select 1)) atan2 ((_position select 0) - (_factoryPosition select 0))) - 90);

	_crew = missionNamespace getVariable Format ["cti_%1SOLDIER",_sideText];
	if (_unitType isKindOf "Tank") then {_crew = missionNamespace getVariable Format ["cti_%1CREW",_sideText]};
	if (_unitType isKindOf "Air") then {_crew = missionNamespace getVariable Format ["cti_%1PILOT",_sideText]};
	
	_special = if (_unitType isKindOf "Plane") then {"FLY"} else {"NONE"};
	_vehicle = [_unitType, _position, _sideID, _dir, true, true, true, _special] Call cti_CO_FNC_CreateVehicle;

	emptyQueu pushBack (_vehicle);
	[_vehicle] Spawn cti_SE_FNC_HandleEmptyVehicle;
	if (_vehicle distance (leader _team) < 200) then {(units _team) allowGetIn true;_team addVehicle _vehicle};
	
	//--- Clear the vehicle.
	(_vehicle) call cti_CO_FNC_ClearVehicleCargo;
	
	_soldier = [_crew,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;


	[_soldier] allowGetIn true;
	[_soldier] orderGetIn true;
	//if ((missionNamespace getVariable "cti_C_UNITS_BALANCING") > 0) then {(_vehicle) Call cti_CO_FNC_BalanceInit};
	
	_soldier assignAsDriver _vehicle;
	_soldier moveInDriver _vehicle;
	[_sideText,'VehiclesCreated',1] Call cti_CO_FNC_UpdateStatistics;
	_built = 1;
	if (_isVehicle select 1) then {
		_soldier = [_crew,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
		[_soldier] allowGetIn true;
		[_soldier] orderGetIn true;
		_soldier assignAsGunner _vehicle;
		_soldier moveInGunner _vehicle;
		_built = _built + 1;
	};
	if (_isVehicle select 2) then {
		if (vehicle leader _team == leader _team && leader _team distance _vehicle < 200 && alive leader _team) then {
			[leader _team] allowGetIn true;
			[leader _team] orderGetIn true;
			(leader _team) assignAsCommander _vehicle;
			(leader _team) moveInCommander _vehicle;
		} else {
			_soldier = [_crew,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
			[_soldier] allowGetIn true;
			[_soldier] orderGetIn true;
			_soldier assignAsCommander _vehicle;
			_soldier moveInCommander _vehicle;
		};
		_built = _built + 1;
	};
	
	if (_isVehicle select 3) then {
		Private ["_get","_turrets"];
		_get = missionNamespace getVariable _unitType;
		_turrets = _get select QUERYUNITTURRETS;
		
		{
			if (isNull (_vehicle turretUnit _x)) then {
				_soldier = [_crew,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
				[_soldier] allowGetIn true;
				_soldier moveInTurret [_vehicle, _x];
				_built = _built + 1;			
			};
		} forEach _turrets;
	};

_vehicle allowCrewInImmobile true;
	[_sideText,'UnitsCreated',_built] Call cti_CO_FNC_UpdateStatistics;
};

_gbq = (_team getVariable "cti_queue") - _id;
_team setVariable ["cti_queue",_gbq];