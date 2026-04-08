/*
	Order newly spawned AI units toward the team leader's active destination.
	Parameters:
		- Team.
		- Spawned units array.
*/

Private ["_currentWaypoint","_destinationData","_destinationMode","_destinationPosition","_destinationSource","_leader","_member","_orderedUnits","_orderedVehicles","_spawnedUnits","_storedMapOrderGroup","_storedMapOrderPosition","_team","_unit","_vehicle","_waypointCount"];

_team = _this select 0;
_spawnedUnits = _this select 1;

if (!(missionNamespace getVariable "AUTO_SEND_SPAWNED_UNITS_TO_WAYPOINT")) exitWith {
	if (WF_Debug) then {["DEBUG (Client_SendSpawnedUnitsToLeaderWaypoint.sqf)", "Client_SendSpawnedUnitsToLeaderWaypoint.sqf: Feature toggle is OFF, skipping order."] Call WFBE_CO_FNC_LogContent};
	false
};
if (isNull _team) exitWith {
	if (WF_Debug) then {["WARNING", "Client_SendSpawnedUnitsToLeaderWaypoint.sqf: Team is null, skipping order."] Call WFBE_CO_FNC_LogContent};
	false
};

_leader = leader _team;
_destinationPosition = [];
_destinationSource = "none";

_storedMapOrderGroup = missionNamespace getVariable ["WFBE_CLIENT_LAST_TEAMLEADER_MAP_ORDER_GROUP", grpNull];
_storedMapOrderPosition = missionNamespace getVariable ["WFBE_CLIENT_LAST_TEAMLEADER_MAP_ORDER_POSITION", []];

if (!isNull _storedMapOrderGroup && _storedMapOrderGroup == _team && count _storedMapOrderPosition > 1) then {
	if (_leader distance _storedMapOrderPosition > 25) then {
		_destinationPosition = _storedMapOrderPosition;
		_destinationSource = "stored shift-click map order";
	} else {
		missionNamespace setVariable ["WFBE_CLIENT_LAST_TEAMLEADER_MAP_ORDER_POSITION", []];
		missionNamespace setVariable ["WFBE_CLIENT_LAST_TEAMLEADER_MAP_ORDER_GROUP", grpNull];
		missionNamespace setVariable ["WFBE_CLIENT_LAST_TEAMLEADER_MAP_ORDER_TIME", -5000];
		if (WF_Debug) then {
			["DEBUG (Client_SendSpawnedUnitsToLeaderWaypoint.sqf)", Format ["Client_SendSpawnedUnitsToLeaderWaypoint.sqf: Cleared stored map order because leader [%1] is already near %2.", _leader, _storedMapOrderPosition]] Call WFBE_CO_FNC_LogContent;
		};
	};
};

_waypointCount = count (waypoints _team);
_currentWaypoint = currentWaypoint _team;
if (count _destinationPosition == 0 && _currentWaypoint < _waypointCount && _waypointCount > 0) then {
	_destinationPosition = waypointPosition [_team, _currentWaypoint];
	_destinationSource = Format ["group waypoint [%1/%2]", _currentWaypoint, _waypointCount];
};

if (count _destinationPosition == 0) then {
	{
		_member = _x;
		if (!isNull _member && alive _member && _member != _leader) then {
			_destinationData = expectedDestination _member;
			_destinationMode = _destinationData select 1;
			if (_destinationMode != "DoNotPlan") exitWith {
				_destinationPosition = _destinationData select 0;
				_destinationSource = Format ["member expectedDestination [%1] from %2", _destinationMode, _member];
			};
		};
	} forEach units _team;
};

_destinationData = expectedDestination _leader;
_destinationMode = _destinationData select 1;
if (count _destinationPosition == 0 && _destinationMode != "DoNotPlan") then {
	_destinationPosition = _destinationData select 0;
	_destinationSource = Format ["leader expectedDestination [%1]", _destinationMode];
};

if (count _destinationPosition == 0) exitWith {
	["WARNING", Format ["Client_SendSpawnedUnitsToLeaderWaypoint.sqf: No valid destination found for team [%1]. Spawned units will keep default behavior.", _team]] Call WFBE_CO_FNC_LogContent;
	if (WF_Debug) then {["DEBUG (Client_SendSpawnedUnitsToLeaderWaypoint.sqf)", Format ["Client_SendSpawnedUnitsToLeaderWaypoint.sqf: No valid destination. Leader [%1], waypoints [%2], currentWaypoint [%3], leader expectedDestination [%4], stored map order [%5], stored group [%6].", _leader, _waypointCount, _currentWaypoint, _destinationData, _storedMapOrderPosition, _storedMapOrderGroup]] Call WFBE_CO_FNC_LogContent};
	false
};

["INFORMATION", Format ["Client_SendSpawnedUnitsToLeaderWaypoint.sqf: Ordering [%1] spawned units using %2 at %3.", count _spawnedUnits, _destinationSource, _destinationPosition]] Call WFBE_CO_FNC_LogContent;
if (WF_Debug) then {["DEBUG (Client_SendSpawnedUnitsToLeaderWaypoint.sqf)", Format ["Client_SendSpawnedUnitsToLeaderWaypoint.sqf: Using %1 at %2 for [%3] spawned units.", _destinationSource, _destinationPosition, count _spawnedUnits]] Call WFBE_CO_FNC_LogContent};

_orderedUnits = [];
_orderedVehicles = [];

{
	_unit = _x;

	if (!isNull _unit && alive _unit) then {
		_vehicle = vehicle _unit;

		if (_vehicle == _unit) then {
			_unit commandMove _destinationPosition;
			_orderedUnits = _orderedUnits + [_unit];
		} else {
			if (_unit == driver _vehicle) then {
				if ((_orderedVehicles find _vehicle) == -1) then {
					_unit commandMove _destinationPosition;
					_orderedUnits = _orderedUnits + [_unit];
					_orderedVehicles = _orderedVehicles + [_vehicle];
				};
			};
		};
	};
} forEach _spawnedUnits;

["INFORMATION", Format ["Client_SendSpawnedUnitsToLeaderWaypoint.sqf: Issued commandMove to [%1] spawned unit leaders/drivers.", count _orderedUnits]] Call WFBE_CO_FNC_LogContent;
if (WF_Debug) then {["DEBUG (Client_SendSpawnedUnitsToLeaderWaypoint.sqf)", Format ["Client_SendSpawnedUnitsToLeaderWaypoint.sqf: Issued commandMove to [%1] spawned unit leaders/drivers.", count _orderedUnits]] Call WFBE_CO_FNC_LogContent};

true
