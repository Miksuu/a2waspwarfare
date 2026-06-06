/*
	Delete town defense assets that were kept alive temporarily after capture.
	Author: Marty
*/

Private ["_asset", "_assetType", "_deleted", "_diagEnabled", "_expireAt", "_expiredDeleted", "_kept", "_owner", "_persistent", "_role", "_sideID", "_town"];

_town = _this select 0;
_persistent = +(_town getVariable ["wfbe_persistent_town_defense_assets", []]);
_kept = [];
_deleted = 0;
_expiredDeleted = 0;
_diagEnabled = missionNamespace getVariable ["TownDefenseDiagnosticsEnabled", false];

{
	_asset = _x;
	_assetType = typeName _asset;
	_expireAt = -1;
	_owner = objNull;
	_role = "";
	_sideID = -1;

	if (_assetType == "GROUP") then {
		if !(isNull _asset) then {
			_owner = _asset getVariable ["WFBE_TownDefenseOwner", objNull];
			_expireAt = _asset getVariable ["WFBE_TownDefenseExpireAt", -1];
			_role = _asset getVariable ["WFBE_TownDefenseRole", ""];
			_sideID = _asset getVariable ["WFBE_TownDefenseSideID", -1];
		};
	};

	if (_assetType == "OBJECT") then {
		if !(isNull _asset) then {
			_owner = _asset getVariable ["WFBE_TownDefenseOwner", objNull];
			_expireAt = _asset getVariable ["WFBE_TownDefenseExpireAt", -1];
			_role = _asset getVariable ["WFBE_TownDefenseRole", ""];
			_sideID = _asset getVariable ["WFBE_TownDefenseSideID", -1];
		};
	};

	if (_assetType != "GROUP" && _assetType != "OBJECT") then {
		_deleted = _deleted + 1;
	} else {
		if (isNull _asset) then {
			_deleted = _deleted + 1;
		} else {
			if (_owner != _town) then {
				_deleted = _deleted + 1;
			} else {
				if (_expireAt < 0 || time < _expireAt) then {
					[_kept, _asset] Call WFBE_CO_FNC_ArrayPush;
				} else {
					if (_diagEnabled) then {
						["TOWN_DEFENSE_DIAG", Format ["persistent_cleanup_delete town:%1;assetType:%2;role:%3;sideID:%4;expireAt:%5;time:%6", _town getVariable "name", _assetType, _role, _sideID, _expireAt, time]] Call WFBE_CO_FNC_LogContent;
					};

					if (_assetType == "GROUP") then {
						{deleteVehicle _x} forEach units _asset;
						deleteGroup _asset;
					};
					if (_assetType == "OBJECT") then {
						if !(isPlayer _asset) then {
							if !(isPlayer leader group _asset) then {deleteVehicle _asset};
						};
					};
					_deleted = _deleted + 1;
					_expiredDeleted = _expiredDeleted + 1;
				};
			};
		};
	};
} forEach _persistent;

_town setVariable ["wfbe_persistent_town_defense_assets", _kept];

if (_diagEnabled && (count _persistent > 0 || _deleted > 0)) then {
	["TOWN_DEFENSE_DIAG", Format ["persistent_cleanup_done town:%1;before:%2;kept:%3;deleted:%4", _town getVariable "name", count _persistent, count _kept, _deleted]] Call WFBE_CO_FNC_LogContent;
};

// Marty: In-game debug summary only when defenders were removed because their capture persistence expired.
if (_expiredDeleted > 0) then {
	[Format ["[Town Debug] %1 old defenders cleanup completed | Deleted: %2 | Still kept: %3", _town getVariable "name", _expiredDeleted, count _kept]] Call WFBE_SE_FNC_SendTownDebugChat;
};
