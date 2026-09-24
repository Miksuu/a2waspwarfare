/*
	Author: Marty
	Server side FOB construction request, validated here since the client checks can be outdated.
	 Parameters:
		- Player.
		- Position.
		- Direction.
		- Request ID.
*/

Private ["_dir","_enemyBuildings","_enemyHQ","_enemySide","_fob","_fobs","_id","_logic","_player","_pos","_reason","_side","_sideID","_type"];

_player = _this select 0;
_pos = _this select 1;
_dir = _this select 2;
_id = _this select 3;

if (isNull _player || !alive _player) exitWith {};

_side = side (group _player);
if !(_side in [west, east]) exitWith {};
_sideID = (_side) Call GetSideID;
_logic = (_side) Call WFBE_CO_FNC_GetSideLogic;
_enemySide = if (_side == west) then {east} else {west};

_fobs = _logic getVariable "wfbe_fobs";
if (isNil '_fobs') then {_fobs = []};
_fobs = _fobs - [objNull];
{if !(alive _x) then {_fobs = _fobs - [_x]}} forEach +_fobs;

_reason = "";

if ((missionNamespace getVariable "WFBE_C_FOB_ENABLED") == 0) then {_reason = "FOB construction is disabled."};
if (_reason == "" && count _fobs >= WFBE_C_FOB_MAX_PER_SIDE) then {_reason = Format ["Your side already has the maximum of %1 FOBs.", WFBE_C_FOB_MAX_PER_SIDE]};
if (_reason == "" && (_player distance _pos) > 40) then {_reason = "You are too far away from the construction position."};
if (_reason == "") then {
	{if (_x distance _pos < WFBE_C_FOB_MIN_DISTANCE) exitWith {_reason = Format ["Another friendly FOB is closer than %1m.", WFBE_C_FOB_MIN_DISTANCE]}} forEach _fobs;
};
if (_reason == "") then {
	{
		if ((_x getVariable "sideID") != _sideID && (_x distance _pos) < WFBE_C_FOB_HOSTILE_TOWN_RANGE) exitWith {_reason = Format ["Too close to %1, which is not held by your side (%2m minimum).", _x getVariable "name", WFBE_C_FOB_HOSTILE_TOWN_RANGE]};
	} forEach towns;
};
if (_reason == "") then {
	_enemyHQ = (_enemySide) Call WFBE_CO_FNC_GetSideHQ;
	_enemyBuildings = (_enemySide) Call WFBE_CO_FNC_GetSideStructures;
	if !(isNull _enemyHQ) then {_enemyBuildings = _enemyBuildings + [_enemyHQ]};
	{if (alive _x && (_x distance _pos) < WFBE_C_FOB_ENEMY_BASE_RANGE) exitWith {_reason = Format ["Can't build here!", WFBE_C_FOB_ENEMY_BASE_RANGE]}} forEach _enemyBuildings;
};

if (WF_Debug) then {["DEBUG", Format ["FOB_Construct.sqf: player:%1 side:%2 pos:%3 fobs:%4 reason:[%5]", name _player, _side, _pos, count _fobs, _reason]] Call WFBE_CO_FNC_LogContent};

if (_reason != "") exitWith {[_player, _id, false, _reason] Call WFBE_SE_FNC_FOB_Reply};

//--- The FOB is a regular service point object.
_type = missionNamespace getVariable Format ["%1SP", str _side];
_fob = createVehicle [_type, _pos, [], 0, "NONE"];
_fob setDir _dir;
_fob setPos _pos;
_fob setVariable ["wfbe_fob_sideid", _sideID, true];
_fob setVariable ["wfbe_fob_cash", 0, true];
_fob setVariable ["wfbe_fob_builder", name _player, true];
_fob addEventHandler ["killed", {[_this select 0, _this select 1] Spawn WFBE_SE_FNC_FOB_OnKilled}];

_fobs = _fobs + [_fob];
_logic setVariable ["wfbe_fobs", _fobs, true];

["INFORMATION", Format ["FOB_Construct.sqf: [%1] FOB constructed by %2 at %3 (%4/%5 FOBs).", str _side, name _player, _pos, count _fobs, WFBE_C_FOB_MAX_PER_SIDE]] Call WFBE_CO_FNC_LogContent;

[_player, _id, true, "FOB constructed."] Call WFBE_SE_FNC_FOB_Reply;
[_side, "HandleSpecial", ["fob-message", Format ["%1 has constructed a FOB near %2.", name _player, ([_fob, towns] Call WFBE_CO_FNC_GetClosestEntity) getVariable "name"]]] Call WFBE_CO_FNC_SendToClients;
