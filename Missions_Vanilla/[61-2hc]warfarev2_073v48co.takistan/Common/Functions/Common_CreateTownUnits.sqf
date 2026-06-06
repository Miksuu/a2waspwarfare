/*
	Create units in towns.
	 Parameters:
		- Town
		- Side
		- Groups
		- Spawn positions
		- Teams
*/

// Marty: Optional global init flag lets town AI skip client marker/action setup.
Private ["_crews", "_global", "_groups", "_lock", "_perfActive", "_perfCreateTeams", "_perfItemStart", "_perfScope", "_perfStart", "_position", "_positions", "_retVal", "_side", "_sideID", "_team", "_teams", "_town", "_town_teams", "_town_vehicles", "_units", "_vehicles"];

_town = _this select 0;
_side = _this select 1;
_groups = _this select 2;
_positions = _this select 3;
_teams = _this select 4;
// Marty: Town AI can opt out of global Init_Unit marker/action setup to avoid client marker storms.
_global = if (count _this > 5) then {_this select 5} else {true};
_sideID = (_side) call WFBE_CO_FNC_GetSideID;

_built = 0;
_builtveh = 0;
_town_teams = [];
_town_vehicles = [];
// Marty: Performance Audit measures active town unit creation time, excluding the cooperative spawn sleeps.
_perfStart = diag_tickTime;
_perfActive = 0;
_perfCreateTeams = 0;

_lock = if ((missionNamespace getVariable "WFBE_C_TOWNS_VEHICLES_LOCK_DEFENDER") == 0 && _side == WFBE_DEFENDER) then {false} else {true};

for '_i' from 0 to count(_groups)-1 do {
	_position = _positions select _i;
	_team = _teams select _i;
	
	["INFORMATION", Format["Common_CreateTownUnits.sqf: Town [%1] [%2] will create a team template %3 at %4", _town, _side, _groups select _i,_position]] Call WFBE_CO_FNC_LogContent;
	
	// Marty: Pass the optional global init flag through to units and vehicles spawned for this town team.
	_perfItemStart = diag_tickTime;
	_retVal = [_groups select _i, _position, _side, _lock, _team, _global, 90] call WFBE_CO_FNC_CreateTeam;
	_perfActive = _perfActive + (diag_tickTime - _perfItemStart);
	_perfCreateTeams = _perfCreateTeams + 1;
	_units = _retVal select 0;
	_vehicles = _retVal select 1;
	_team = _retVal select 2;
	_crews = _retVal select 3;
	_built = _built + count(_units);
	_builtveh = _builtveh + (count _vehicles);

	// Marty: Event-only diagnostics for the actual unit/vehicle creation result on server, client, or HC locality.
	if (missionNamespace getVariable ["TownDefenseDiagnosticsEnabled", false]) then {
		["TOWN_DEFENSE_DIAG", Format ["create_town_units_result town:%1;side:%2;template:%3;groupNull:%4;units:%5;crews:%6;vehicles:%7;global:%8;localServer:%9;hasInterface:%10", _town getVariable "name", _side, _groups select _i, isNull _team, count _units, count _crews, count _vehicles, _global, isServer, hasInterface]] Call WFBE_CO_FNC_LogContent;
	};

	// Marty: If the group could not be created or no units survived creation, skip patrol/reveal setup cleanly.
	if (isNull _team) then {
		["WARNING", Format["Common_CreateTownUnits.sqf: Town [%1] [%2] skipped template %3 because the group is null.", _town, _side, _groups select _i]] Call WFBE_CO_FNC_LogContent;
	} else {
	// Marty: Mark every town-spawned defense or occupation asset with its owning town for filtering, persistence and cleanup.
	[_town, _team, _sideID, "mobile_group"] Call WFBE_CO_FNC_MarkTownDefenseAsset;
	{[_town, _x, _sideID, "mobile_unit"] Call WFBE_CO_FNC_MarkTownDefenseAsset} forEach _units;
	{[_town, _x, _sideID, "mobile_crew"] Call WFBE_CO_FNC_MarkTownDefenseAsset} forEach _crews;
	{[_town, _x, _sideID, "mobile_vehicle"] Call WFBE_CO_FNC_MarkTownDefenseAsset} forEach _vehicles;

	if ((count _units) + (count _crews) > 0) then {
		[_town, _team, _sideID] execVM "Server\FSM\server_town_patrol.sqf";
		[_team, 400, _position] spawn WFBE_CO_FNC_RevealArea;
		[_town_teams, _team] call WFBE_CO_FNC_ArrayPush;
		_team allowFleeing 0; //--- Make the units brave.
	} else {
		["WARNING", Format["Common_CreateTownUnits.sqf: Town [%1] [%2] template %3 created no units; patrol setup skipped.", _town, _side, _groups select _i]] Call WFBE_CO_FNC_LogContent;
		deleteGroup _team;
	};
	};
	{
		[_town_vehicles, _x] call WFBE_CO_FNC_ArrayPush;
		if (isServer) then {
			[_x] spawn WFBE_SE_FNC_HandleEmptyVehicle;
			_x setVariable ["WFBE_Taxi_Prohib", true];
		};
	} forEach _vehicles;

	// Marty: Spread town AI creation over scheduled frames instead of building every group in one burst.
	sleep 0.5;
};

if (_built > 0) then {[str _side,'UnitsCreated',_built] call UpdateStatistics};
if (_builtveh > 0) then {[str _side,'VehiclesCreated',_builtveh] call UpdateStatistics};

["INFORMATION", Format["Common_CreateTownUnits.sqf: Town [%1] held by [%2] was activated witha total of [%3] units.", _town, _side, _built + _builtveh]] Call WFBE_CO_FNC_LogContent;

// Marty: Audit town AI creation separately from the long-running town monitor.
if !(isNil "PerformanceAudit_Record") then {
	if (missionNamespace getVariable ["PerformanceAuditEnabled", true]) then {
		_perfScope = if (isServer && !hasInterface) then {"SERVER"} else {"CLIENT"};
		["createtownunits", _perfActive, Format["town:%1;side:%2;groups:%3;teams:%4;units:%5;vehicles:%6;global:%7;cycleMs:%8", _town getVariable "name", _side, count _groups, _perfCreateTeams, _built, _builtveh, _global, round ((diag_tickTime - _perfStart) * 1000)], _perfScope] Call PerformanceAudit_Record;
	};
};

[_town_teams, _town_vehicles]
