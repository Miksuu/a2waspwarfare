/*
	Author: Marty
	Description:
		Aggregates current groups by side and trace source so RPT analysis can identify group leaks.
*/

Private ["_civ","_context","_east","_empty","_event","_group","_groups","_guer","_hasPlayer","_i","_index","_leader","_local","_logic","_machine","_record","_side","_sideText","_source","_total","_units","_unknown","_vehicle","_vehicles","_west"];

_event = if (count _this > 0) then {_this select 0} else {"periodic"};
_context = if (count _this > 1) then {_this select 1} else {""};
_machine = if (isServer) then {"SERVER"} else {if (hasInterface) then {"CLIENT"} else {"HC"}};

_west = 0;
_east = 0;
_guer = 0;
_civ = 0;
_logic = 0;
_unknown = 0;
_groups = [];

{
	_group = _x;
	_side = side _group;
	_sideText = str _side;
	switch (_side) do {
		case west: {_west = _west + 1};
		case east: {_east = _east + 1};
		case resistance: {_guer = _guer + 1};
		case civilian: {_civ = _civ + 1};
		case sideLogic: {_logic = _logic + 1};
		default {_unknown = _unknown + 1};
	};

	_source = _group getVariable ["WFBE_GroupTrace_Source", "unmarked"];
	_units = units _group;
	if (_source == "unmarked") then {
		_hasPlayer = false;
		{if (isPlayer _x) exitWith {_hasPlayer = true}} forEach _units;
		if ((count _units) == 0) then {_source = "unmarked_empty"};
		if ((count _units) > 0 && _hasPlayer) then {_source = "player_group"};
		if ((count _units) > 0 && !_hasPlayer) then {_source = "unmarked_ai"};
	};
	_vehicles = [];
	{
		_vehicle = vehicle _x;
		if (_vehicle != _x) then {
			if !(_vehicle in _vehicles) then {_vehicles set [count _vehicles, _vehicle]};
		};
	} forEach _units;

	_empty = if ((count _units) == 0) then {1} else {0};
	// Marty: Arma 2 OA local expects an object, so count a group as local only when its leader is local.
	_leader = leader _group;
	_local = if (isNull _leader) then {0} else {if (local _leader) then {1} else {0}};
	_index = -1;

	for "_i" from 0 to ((count _groups) - 1) do {
		_record = _groups select _i;
		if (((_record select 0) == _source) && ((_record select 1) == _sideText)) exitWith {_index = _i};
	};

	if (_index == -1) then {
		_groups set [count _groups, [_source, _sideText, 1, _empty, (count _units), (count _vehicles), _local]];
	} else {
		_record = _groups select _index;
		_record set [2, (_record select 2) + 1];
		_record set [3, (_record select 3) + _empty];
		_record set [4, (_record select 4) + count _units];
		_record set [5, (_record select 5) + count _vehicles];
		_record set [6, (_record select 6) + _local];
		_groups set [_index, _record];
	};
} forEach allGroups;

_total = count allGroups;

{
	["INFORMATION", Format ["GROUP_CENSUS event:%1 machine:%2 source:%3 side:%4 groups:%5 empty:%6 units:%7 vehicles:%8 localGroups:%9 total:%10 west:%11 east:%12 guer:%13 civ:%14 logic:%15 unknown:%16 context:%17", _event, _machine, (_x select 0), (_x select 1), (_x select 2), (_x select 3), (_x select 4), (_x select 5), (_x select 6), _total, _west, _east, _guer, _civ, _logic, _unknown, _context]] Call WFBE_CO_FNC_LogContent;
} forEach _groups;
