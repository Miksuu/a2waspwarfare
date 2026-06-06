/*
	Mark town defense assets with their owning town and role.
	Author: Marty
*/

Private ["_asset", "_assetType", "_createdAt", "_diagEnabled", "_expireAt", "_role", "_sideID", "_town"];

_town = _this select 0;
_asset = _this select 1;
_sideID = _this select 2;
_role = _this select 3;
_expireAt = if (count _this > 4) then {_this select 4} else {-1};
_createdAt = time;
_assetType = typeName _asset;
_diagEnabled = missionNamespace getVariable ["TownDefenseDiagnosticsEnabled", false];

if (_assetType == "GROUP") exitWith {
	if (isNull _asset) exitWith {};

	_asset setVariable ["WFBE_IsTownDefenderAI", true];
	_asset setVariable ["WFBE_TownDefenseOwner", _town];
	_asset setVariable ["WFBE_TownDefenseSideID", _sideID];
	_asset setVariable ["WFBE_TownDefenseRole", _role];
	_asset setVariable ["WFBE_TownDefenseCreatedAt", _createdAt];
	// Marty: Clear stale expiration when an asset is re-marked as active.
	_asset setVariable ["WFBE_TownDefenseExpireAt", _expireAt];

	if (_diagEnabled) then {
		["TOWN_DEFENSE_DIAG", Format ["mark_town_defense_asset town:%1;assetType:%2;role:%3;sideID:%4;units:%5;expireAt:%6;localServer:%7;hasInterface:%8", _town getVariable "name", _assetType, _role, _sideID, count units _asset, _expireAt, isServer, hasInterface]] Call WFBE_CO_FNC_LogContent;
	};
};

if (_assetType != "OBJECT") exitWith {};
if (isNull _asset) exitWith {};

_asset setVariable ["WFBE_IsTownDefenderAI", true, true];
_asset setVariable ["WFBE_TownDefenseOwner", _town, true];
_asset setVariable ["WFBE_TownDefenseSideID", _sideID, true];
_asset setVariable ["WFBE_TownDefenseRole", _role, true];
_asset setVariable ["WFBE_TownDefenseCreatedAt", _createdAt, true];
// Marty: Clear stale expiration when an asset is re-marked as active.
_asset setVariable ["WFBE_TownDefenseExpireAt", _expireAt, true];

if (_diagEnabled) then {
	["TOWN_DEFENSE_DIAG", Format ["mark_town_defense_asset town:%1;assetType:%2;role:%3;sideID:%4;class:%5;alive:%6;expireAt:%7;localServer:%8;hasInterface:%9", _town getVariable "name", _assetType, _role, _sideID, typeOf _asset, alive _asset, _expireAt, isServer, hasInterface]] Call WFBE_CO_FNC_LogContent;
};
