/*
	Author: Marty
	Creates or removes artificial empty groups locally on the HC/client for town defense saturation tests.
*/

Private ["_count","_created","_deleted","_event","_group","_i","_logGroupCount","_mode","_registry","_registryNew","_side","_sideName"];

_mode = _this select 0;
_sideName = _this select 1;
_count = _this select 2;

if !(WF_Debug) exitWith {};

_side = switch (_sideName) do {
	case "WEST": {west};
	case "EAST": {east};
	case "GUER": {resistance};
	case "ALL": {civilian};
	default {civilian};
};

if !(_sideName in ["WEST", "EAST", "GUER", "ALL"]) exitWith {
	["WARNING", Format ["TD_GROUP_LOAD_TEST invalid_side side:%1", _sideName]] Call WFBE_CO_FNC_LogContent;
};

// Marty: Log local group counts on the machine being saturated, normally the HC.
_logGroupCount = {
	Private ["_eventName","_groupCountCiv","_groupCountEast","_groupCountGuer","_groupCountLogic","_groupCountSide","_groupCountWest","_groupCountUnknown","_groupMachine","_groupSide","_players"];

	_eventName = _this select 0;
	_groupCountWest = 0;
	_groupCountEast = 0;
	_groupCountGuer = 0;
	_groupCountCiv = 0;
	_groupCountLogic = 0;
	_groupCountUnknown = 0;

	{
		_groupSide = side _x;
		switch (_groupSide) do {
			case west: {_groupCountWest = _groupCountWest + 1};
			case east: {_groupCountEast = _groupCountEast + 1};
			case resistance: {_groupCountGuer = _groupCountGuer + 1};
			case civilian: {_groupCountCiv = _groupCountCiv + 1};
			case sideLogic: {_groupCountLogic = _groupCountLogic + 1};
			default {_groupCountUnknown = _groupCountUnknown + 1};
		};
	} forEach allGroups;

	_groupCountSide = switch (_sideName) do {
		case "WEST": {_groupCountWest};
		case "EAST": {_groupCountEast};
		case "GUER": {_groupCountGuer};
		case "ALL": {count allGroups};
		default {_groupCountUnknown};
	};
	_groupMachine = if (isServer) then {"SERVER"} else {if (hasInterface) then {"CLIENT"} else {"HC"}};
	_players = Call WFBE_CO_FNC_GetHumanPlayerCount;
	// Marty: Include players in artificial load-test group counts so test sessions resemble production reports.
	["INFORMATION", Format ["TOWN_GROUP_COUNT %1 machine:%2 town:ARTIFICIAL side:%3 sideGroups:%4 total:%5 players:%6 west:%7 east:%8 guer:%9 civ:%10 logic:%11 unknown:%12", _eventName, _groupMachine, _sideName, _groupCountSide, count allGroups, _players, _groupCountWest, _groupCountEast, _groupCountGuer, _groupCountCiv, _groupCountLogic, _groupCountUnknown]] Call WFBE_CO_FNC_LogContent;
};

if (_mode == "count") exitWith {
	["artificial_count"] call _logGroupCount;
};

_registry = missionNamespace getVariable ["WFBE_TD_DebugArtificialGroups", []];
_registry = _registry - [grpNull];

if (_mode == "create") exitWith {
	if (_sideName == "ALL") exitWith {};

	_created = 0;
	for "_i" from 1 to _count do {
		_group = createGroup _side;
		if (isNull _group) exitWith {};

		// Marty: Mark artificial test groups so production leaks are not mixed with load-test pressure.
		[_group, "artificial_load_test", Format ["side:%1", _sideName]] Call WFBE_CO_FNC_TraceGroup;
		_group setVariable ["WFBE_TD_DebugArtificial", true, false];
		_group setVariable ["WFBE_TD_DebugArtificialSide", _sideName, false];
		_registry set [count _registry, _group];
		_created = _created + 1;
	};
	missionNamespace setVariable ["WFBE_TD_DebugArtificialGroups", _registry];

	["INFORMATION", Format ["TD_GROUP_LOAD_TEST create side:%1 requested:%2 created:%3 registry:%4", _sideName, _count, _created, count _registry]] Call WFBE_CO_FNC_LogContent;
	_event = if (_created < _count) then {"artificial_create_failed"} else {"artificial_create"};
	[_event] call _logGroupCount;
};

if (_mode == "delete") exitWith {
	_deleted = 0;
	_registryNew = [];

	{
		_group = _x;
		call {
			if (isNull _group) exitWith {};
			if !(_group getVariable ["WFBE_TD_DebugArtificial", false]) exitWith {
				_registryNew set [count _registryNew, _group];
			};
			if (_sideName != "ALL") then {
				if ((_group getVariable ["WFBE_TD_DebugArtificialSide", ""]) != _sideName) exitWith {
					_registryNew set [count _registryNew, _group];
				};
			};

			deleteGroup _group;
			_deleted = _deleted + 1;
		};
	} forEach _registry;

	missionNamespace setVariable ["WFBE_TD_DebugArtificialGroups", _registryNew];

	["INFORMATION", Format ["TD_GROUP_LOAD_TEST delete side:%1 deleted:%2 registryBefore:%3 registryAfter:%4", _sideName, _deleted, count _registry, count _registryNew]] Call WFBE_CO_FNC_LogContent;
	["artificial_delete"] call _logGroupCount;
};

["WARNING", Format ["TD_GROUP_LOAD_TEST invalid_mode mode:%1 side:%2 count:%3", _mode, _sideName, _count]] Call WFBE_CO_FNC_LogContent;
