/*
	Author: Marty
	Description:
		Deletes stale empty side groups after a confirmation delay while preserving Warfare teams and persistent groups.
*/

Private ["_interval","_ttl"];

_interval = if (count _this > 0) then {_this select 0} else {60};
_ttl = if (count _this > 1) then {_this select 1} else {60};

if (missionNamespace getVariable ["WFBE_EmptyGroupWatchdogStarted", false]) exitWith {};
missionNamespace setVariable ["WFBE_EmptyGroupWatchdogStarted", true];

[_interval, _ttl] Spawn {
	Private ["_candidates","_deleted","_empty","_firstSeen","_group","_groupsNow","_i","_interval","_logic","_machine","_observed","_protected","_protectedByVariable","_protectedGroups","_side","_sideText","_source","_teams","_total","_ttl","_west","_east","_guer"];

	_interval = _this select 0;
	_ttl = _this select 1;
	_machine = if (isServer) then {"SERVER"} else {if (hasInterface) then {"CLIENT"} else {"HC"}};

	sleep _interval;
	while {!(missionNamespace getVariable ["WFBE_GameOver", false])} do {
		_protectedGroups = [];
		{
			_logic = _x Call WFBE_CO_FNC_GetSideLogic;
			if !(isNull _logic) then {
				_teams = _logic getVariable "wfbe_teams";
				if !(isNil "_teams") then {
					{
						if !(_x in _protectedGroups) then {_protectedGroups set [count _protectedGroups, _x]};
					} forEach _teams;
				};
			};
		} forEach WFBE_PRESENTSIDES;

		{
			_group = missionNamespace getVariable [Format ["WFBE_%1_DefenseTeam", _x], grpNull];
			if !(isNull _group) then {
				if !(_group in _protectedGroups) then {_protectedGroups set [count _protectedGroups, _group]};
			};
		} forEach [west, east, resistance];

		_west = 0;
		_east = 0;
		_guer = 0;
		_total = count allGroups;
		_candidates = 0;
		_observed = 0;
		_deleted = 0;
		_protected = 0;

		{
			_side = side _x;
			switch (_side) do {
				case west: {_west = _west + 1};
				case east: {_east = _east + 1};
				case resistance: {_guer = _guer + 1};
			};
		} forEach allGroups;

		_groupsNow = allGroups;
		{
			_group = _x;
			Call {
				_side = side _group;
				if !(_side in [west, east, resistance]) exitWith {
					_group setVariable ["WFBE_EmptyGroupWatchdog_FirstSeen", nil];
				};

				_empty = (count (units _group)) == 0;
				if !(_empty) exitWith {
					_group setVariable ["WFBE_EmptyGroupWatchdog_FirstSeen", nil];
				};

				_protectedByVariable = false;
				{
					if !(isNil {_group getVariable _x}) exitWith {_protectedByVariable = true};
				} forEach ["wfbe_persistent", "wfbe_side", "wfbe_uid", "wfbe_teamleader", "wfbe_funds", "wfbe_respawn", "WFBE_EmptyGroupWatchdog_Protected"];

				if (_group in _protectedGroups) then {_protectedByVariable = true};
				if (_protectedByVariable) exitWith {
					_protected = _protected + 1;
					_group setVariable ["WFBE_EmptyGroupWatchdog_FirstSeen", nil];
				};

				_candidates = _candidates + 1;
				_firstSeen = _group getVariable ["WFBE_EmptyGroupWatchdog_FirstSeen", -1];
				_source = _group getVariable ["WFBE_GroupTrace_Source", "unmarked"];
				_sideText = str _side;

				if (_firstSeen < 0) exitWith {
					_group setVariable ["WFBE_EmptyGroupWatchdog_FirstSeen", time];
					_observed = _observed + 1;
					["INFORMATION", Format ["EMPTY_GROUP_WATCHDOG observe machine:%1 side:%2 group:%3 source:%4 ttl:%5 total:%6 west:%7 east:%8 guer:%9", _machine, _sideText, _group, _source, _ttl, _total, _west, _east, _guer]] Call WFBE_CO_FNC_LogContent;
				};
				if ((time - _firstSeen) < _ttl) exitWith {};

				["WARNING", Format ["EMPTY_GROUP_WATCHDOG delete machine:%1 side:%2 group:%3 source:%4 age:%5 total:%6 west:%7 east:%8 guer:%9", _machine, _sideText, _group, _source, round (time - _firstSeen), _total, _west, _east, _guer]] Call WFBE_CO_FNC_LogContent;
				deleteGroup _group;
				_deleted = _deleted + 1;
			};
		} forEach _groupsNow;

		if (_candidates > 0 || _deleted > 0) then {
			["INFORMATION", Format ["EMPTY_GROUP_WATCHDOG cycle machine:%1 scanned:%2 candidates:%3 observed:%4 deleted:%5 protectedEmpty:%6 west:%7 east:%8 guer:%9", _machine, _total, _candidates, _observed, _deleted, _protected, _west, _east, _guer]] Call WFBE_CO_FNC_LogContent;
		};

		if (_deleted > 0) then {
			["empty_watchdog", Format ["deleted:%1", _deleted]] Call WFBE_CO_FNC_LogGroupCensus;
		};

		sleep _interval;
	};
};
