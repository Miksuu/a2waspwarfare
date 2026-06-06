/*
	Clean town defense groups that can block new town spawns.
	Author: Marty
*/

Private ["_asset", "_assetType", "_createdAt", "_diagEnabled", "_forcePersistent", "_group", "_groupsDeleted", "_keptActive", "_keptPersistent", "_keptVehicles", "_objectsDeleted", "_owner", "_persistent", "_persistentBefore", "_pressure", "_reason", "_refsPruned", "_role", "_sideID", "_town", "_townGroups", "_unitsDeleted", "_vehicle", "_vehicles"];

_reason = if (count _this > 0) then {_this select 0} else {"scheduled"};
_pressure = if (count _this > 1) then {_this select 1} else {false};
_diagEnabled = missionNamespace getVariable ["TownDefenseDiagnosticsEnabled", false];

_groupsDeleted = 0;
_unitsDeleted = 0;
_objectsDeleted = 0;
_refsPruned = 0;

{
	_town = _x;

	// Marty: Expired captured defenders are always removed before checking group pressure.
	[_town] Call WFBE_SE_FNC_CleanupExpiredTownDefenseAssets;

	_townGroups = +(_town getVariable ["wfbe_town_teams", []]);
	_keptActive = [];
	{
		_group = _x;
		if (isNull _group) then {
			_refsPruned = _refsPruned + 1;
		} else {
			_role = _group getVariable ["WFBE_TownDefenseRole", ""];
			_createdAt = _group getVariable ["WFBE_TownDefenseCreatedAt", 0];
			if (count units _group == 0) then {
				if ((_role == "mobile_group_pending") && ((time - _createdAt) < 120)) then {
					[_keptActive, _group] Call WFBE_CO_FNC_ArrayPush;
				} else {
					deleteGroup _group;
					_groupsDeleted = _groupsDeleted + 1;
				};
			} else {
				[_keptActive, _group] Call WFBE_CO_FNC_ArrayPush;
			};
		};
	} forEach _townGroups;
	_town setVariable ["wfbe_town_teams", _keptActive];

	_vehicles = +(_town getVariable ["wfbe_active_vehicles", []]);
	_keptVehicles = [];
	{
		_vehicle = _x;
		if (isNull _vehicle) then {
			_refsPruned = _refsPruned + 1;
		} else {
			if (alive _vehicle) then {
				[_keptVehicles, _vehicle] Call WFBE_CO_FNC_ArrayPush;
			} else {
				_refsPruned = _refsPruned + 1;
			};
		};
	} forEach _vehicles;
	_town setVariable ["wfbe_active_vehicles", _keptVehicles];

	_persistent = +(_town getVariable ["wfbe_persistent_town_defense_assets", []]);
	_persistentBefore = count _persistent;
	_keptPersistent = [];
	{
		_asset = _x;
		_assetType = typeName _asset;
		_forcePersistent = false;
		_owner = objNull;
		_role = "";
		_sideID = -1;

		if (_assetType == "GROUP") then {
			if !(isNull _asset) then {
				_owner = _asset getVariable ["WFBE_TownDefenseOwner", objNull];
				_role = _asset getVariable ["WFBE_TownDefenseRole", ""];
				_sideID = _asset getVariable ["WFBE_TownDefenseSideID", -1];
			};
		};

		if (_assetType == "OBJECT") then {
			if !(isNull _asset) then {
				_owner = _asset getVariable ["WFBE_TownDefenseOwner", objNull];
				_role = _asset getVariable ["WFBE_TownDefenseRole", ""];
				_sideID = _asset getVariable ["WFBE_TownDefenseSideID", -1];
			};
		};

		if (_pressure && (_owner == _town) && ((_role find "captured") >= 0)) then {_forcePersistent = true};

		call {
			if ((_assetType != "GROUP") && (_assetType != "OBJECT")) exitWith {
				_refsPruned = _refsPruned + 1;
			};
			if (isNull _asset) exitWith {
				_refsPruned = _refsPruned + 1;
			};
			if (_owner != _town) exitWith {
				_refsPruned = _refsPruned + 1;
			};
			if (!_forcePersistent) exitWith {
				[_keptPersistent, _asset] Call WFBE_CO_FNC_ArrayPush;
			};

			if (_diagEnabled) then {
				["TOWN_DEFENSE_DIAG", Format ["group_pool_pressure_delete town:%1;reason:%2;assetType:%3;role:%4;sideID:%5;units:%6", _town getVariable "name", _reason, _assetType, _role, _sideID, if (_assetType == "GROUP") then {count units _asset} else {-1}]] Call WFBE_CO_FNC_LogContent;
			};

			if (_assetType == "GROUP") exitWith {
				if (({isPlayer _x} count units _asset) > 0) then {
					[_keptPersistent, _asset] Call WFBE_CO_FNC_ArrayPush;
					if (_diagEnabled) then {
						["TOWN_DEFENSE_DIAG", Format ["group_pool_pressure_keep_player_group town:%1;reason:%2;role:%3;sideID:%4;units:%5", _town getVariable "name", _reason, _role, _sideID, count units _asset]] Call WFBE_CO_FNC_LogContent;
					};
				} else {
					{
						if !(isPlayer _x) then {
							deleteVehicle _x;
							_unitsDeleted = _unitsDeleted + 1;
						};
					} forEach units _asset;
					deleteGroup _asset;
					_groupsDeleted = _groupsDeleted + 1;
				};
			};

			if !(isPlayer _asset) then {
				if !(isPlayer leader group _asset) then {
					deleteVehicle _asset;
					_objectsDeleted = _objectsDeleted + 1;
				};
			};
		};
	} forEach _persistent;
	_town setVariable ["wfbe_persistent_town_defense_assets", _keptPersistent];

	if (_diagEnabled && (_pressure || ((count _townGroups) != (count _keptActive)) || (_persistentBefore != (count _keptPersistent)) || ((count _vehicles) != (count _keptVehicles)))) then {
		["TOWN_DEFENSE_DIAG", Format ["group_pool_cleanup town:%1;reason:%2;pressure:%3;activeBefore:%4;activeKept:%5;vehiclesBefore:%6;vehiclesKept:%7;persistentBefore:%8;persistentKept:%9;groupsDeleted:%10;unitsDeleted:%11;objectsDeleted:%12;refsPruned:%13", _town getVariable "name", _reason, _pressure, count _townGroups, count _keptActive, count _vehicles, count _keptVehicles, _persistentBefore, count _keptPersistent, _groupsDeleted, _unitsDeleted, _objectsDeleted, _refsPruned]] Call WFBE_CO_FNC_LogContent;
	};
} forEach towns;

// Marty: Catch marked town-defense groups that lost their town array reference.
{
	_group = _x;
	if !(isNull _group) then {
		if (_group getVariable ["WFBE_IsTownDefenderAI", false]) then {
			_owner = _group getVariable ["WFBE_TownDefenseOwner", objNull];
			_role = _group getVariable ["WFBE_TownDefenseRole", ""];
			_sideID = _group getVariable ["WFBE_TownDefenseSideID", -1];
			_createdAt = _group getVariable ["WFBE_TownDefenseCreatedAt", 0];

			call {
				if (count units _group == 0) exitWith {
					if (!((_role == "mobile_group_pending") && ((time - _createdAt) < 120))) then {
						if (_diagEnabled) then {
							["TOWN_DEFENSE_DIAG", Format ["group_pool_orphan_empty_delete reason:%1;owner:%2;role:%3;sideID:%4", _reason, if (isNull _owner) then {"<null>"} else {_owner getVariable ["name", str _owner]}, _role, _sideID]] Call WFBE_CO_FNC_LogContent;
						};
						deleteGroup _group;
						_groupsDeleted = _groupsDeleted + 1;
					};
				};

				if (_pressure && ((_role find "captured") >= 0)) exitWith {
					if (({isPlayer _x} count units _group) > 0) then {
						if (_diagEnabled) then {
							["TOWN_DEFENSE_DIAG", Format ["group_pool_orphan_pressure_keep_player_group reason:%1;owner:%2;role:%3;sideID:%4;units:%5", _reason, if (isNull _owner) then {"<null>"} else {_owner getVariable ["name", str _owner]}, _role, _sideID, count units _group]] Call WFBE_CO_FNC_LogContent;
						};
					} else {
						if (_diagEnabled) then {
							["TOWN_DEFENSE_DIAG", Format ["group_pool_orphan_pressure_delete reason:%1;owner:%2;role:%3;sideID:%4;units:%5", _reason, if (isNull _owner) then {"<null>"} else {_owner getVariable ["name", str _owner]}, _role, _sideID, count units _group]] Call WFBE_CO_FNC_LogContent;
						};
						{
							if !(isPlayer _x) then {
								deleteVehicle _x;
								_unitsDeleted = _unitsDeleted + 1;
							};
						} forEach units _group;
						deleteGroup _group;
						_groupsDeleted = _groupsDeleted + 1;
					};
				};
			};
		};
	};
} forEach allGroups;

if (_diagEnabled) then {
	["TOWN_DEFENSE_DIAG", Format ["group_pool_cleanup_summary reason:%1;pressure:%2;groupsDeleted:%3;unitsDeleted:%4;objectsDeleted:%5;refsPruned:%6", _reason, _pressure, _groupsDeleted, _unitsDeleted, _objectsDeleted, _refsPruned]] Call WFBE_CO_FNC_LogContent;
};

[_groupsDeleted, _unitsDeleted, _objectsDeleted, _refsPruned]
