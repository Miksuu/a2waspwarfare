// Marty: Optimized town AI monitor; activation is budgeted and air/ground detection is split.
Private["_town","_range","_range_detect","_range_detect_active","_position","_groups","_town_camps","_town_camps_count","_town_teams","_airHeight","_unitsInactiveMax","_patrol_delay","_patrol_enabled","_ai_delegation_enabled","_town_defender_enabled","_town_occupation_enabled","_activationBudget","_activationBudgetMax","_detected","_groundDetected","_enemies","_enemies_ground","_scanBudget","_scanBudgetMax","_scanRefs","_scanDelay","_scanActiveDelay","_scanNearDelay","_scanFarDelay","_scanCriticalRange","_scanNearRange","_scanDistance","_scanDistanceMin","_scanNext","_scanDue","_scanSkipped","_scannedTowns","_skippedTowns","_townScanned","_isActiveTown","_unit","_sideID","_side","_side_enabled","_dynRange","_camps","_camp","_positions","_teams","_use_server","_retVal","_groupIndex"];

for "_j" from 0 to ((count towns) - 1) step 1 do
{
	_loc = towns select _j;
	["INITIALIZATION",Format ["server_town_ai.sqf : Initialized for [%1].", _loc getVariable "name"]] Call WFBE_CO_FNC_LogContent;
	sleep 0.01;
};

_range = 600;
_range_detect = _range * (missionNamespace getVariable "WFBE_C_TOWNS_DETECTION_RANGE_COEF");
_range_detect_active = _range * (missionNamespace getVariable "WFBE_C_TOWNS_DETECTION_RANGE_ACTIVE_COEF");

_airHeight = missionNamespace getVariable "WFBE_C_TOWNS_DETECTION_RANGE_AIR";
_unitsInactiveMax = missionNamespace getVariable "WFBE_C_TOWNS_UNITS_INACTIVE";
_patrol_delay = missionNamespace getVariable "WFBE_C_PATROLS_DELAY_SPAWN";
_ai_delegation_enabled = missionNamespace getVariable "WFBE_C_AI_DELEGATION";
_town_defender_enabled = if ((missionNamespace getVariable "WFBE_C_TOWNS_DEFENDER") > 0) then {true} else {false};
_town_occupation_enabled = if ((missionNamespace getVariable "WFBE_C_TOWNS_OCCUPATION") > 0) then {true} else {false};
// Marty: Limit expensive town AI spawn bursts; further towns activate on later cycles.
_activationBudgetMax = 1;
// Marty: Limit expensive nearEntities scans; active and close towns stay responsive while remote towns are sampled over time.
_scanBudgetMax = 10;
_scanActiveDelay = 4;
_scanNearDelay = 10;
_scanFarDelay = 35;
_scanCriticalRange = _range_detect_active + 500;
_scanNearRange = _range_detect_active + 2500;

for "_k" from 0 to ((count towns) - 1) step 1 do
{
	_town = towns select _k;
	_town setVariable ["wfbe_active", false];
	_town setVariable ["wfbe_active_air", false];
	_town setVariable ["wfbe_inactivity", 0];
	_town setVariable ["wfbe_active_override", false];
	_town setVariable ['wfbe_active_vehicles', []];
	_town setVariable ['wfbe_town_teams', []];
	// Marty: Stagger remote town scans so the global loop does not hit every town with nearEntities in the same pass.
	_town setVariable ["wfbe_ai_next_scan", time + ((_k mod _scanBudgetMax) * 0.5)];
	sleep 0.01;
};

while {!WFBE_GameOver} do {

	// Marty: Performance Audit timing for one town AI server cycle.
	_perfStart = diag_tickTime;
	_perfTowns = 0;
	_perfNearEntities = 0;
	_perfDetected = 0;
	_perfActivations = 0;
	_perfDespawns = 0;
	_perfSpawnGroups = 0;
	_scannedTowns = 0;
	_skippedTowns = 0;
	_perfActive = 0;
	_activationBudget = _activationBudgetMax;
	_scanBudget = _scanBudgetMax;
	_scanRefs = [];

	// Marty: Player proximity is a cheap pre-filter for town AI scans; AI-only activity is still covered by the slow far scan.
	{
		_unit = _x;
		if (isPlayer _unit) then {
			[_scanRefs, vehicle _unit] call WFBE_CO_FNC_ArrayPush;
		};
	} forEach (if (isMultiplayer) then {playableUnits} else {switchableUnits});

	for "_i" from 0 to ((count towns) - 1) step 1 do
	{
		// Marty: Performance Audit active time excludes the cooperative sleep below.
		_perfItemStart = diag_tickTime;
		_position = [];
		_groups = [];
		// Marty: Track per-town scan outcome so audit totals stay directly comparable.
		_townScanned = false;


		_town = towns select _i;
		_perfTowns = _perfTowns + 1;
		_town_teams = _town getVariable "wfbe_town_teams";
		_patrol_enabled = if (!isNil {_town getVariable "wfbe_patrol_enabled"}) then {true} else {false};

		//--- Towns patrol, if enabled.
		if (_patrol_enabled) then {
			_town setVariable ["wfbe_patrol_active", false];
			_town setVariable ["wfbe_patrol_active_last", time];
		};

		_sideID = _town getVariable "sideID";
		_side = (_sideID) Call WFBE_CO_FNC_GetSideFromID;


		if(_sideID != WFBE_C_UNKNOWN_ID ) then {
			_side_enabled = false;

			if (_side == WFBE_DEFENDER) then {
				if (_town_defender_enabled) then {_side_enabled = true};
			} else {
				if (_town_occupation_enabled) then {_side_enabled = true};
			};

			if(_side_enabled) then
			{
				// Marty: Gate the expensive scan by town state, player distance and per-cycle scan budget.
				_isActiveTown = (_town getVariable "wfbe_active") || (_town getVariable "wfbe_active_air");
				_scanDistanceMin = 999999;
				{
					if !(isNull _x) then {
						_scanDistance = _town distance _x;
						if (_scanDistance < _scanDistanceMin) then {_scanDistanceMin = _scanDistance};
					};
				} forEach _scanRefs;

				_scanDelay = _scanFarDelay;
				if (_scanDistanceMin <= _scanNearRange) then {_scanDelay = _scanNearDelay};
				if (_scanDistanceMin <= _scanCriticalRange) then {_scanDelay = _scanActiveDelay};
				if (_isActiveTown) then {_scanDelay = _scanActiveDelay};

				_scanNext = _town getVariable "wfbe_ai_next_scan";
				if (isNil "_scanNext") then {_scanNext = 0};
				_scanDue = time >= _scanNext;
				_scanSkipped = false;

				// Marty: Keep the scan gate linear so budget skips are easy to reason about from the audit counters.
				_scanSkipped = call {
					if (!_scanDue) exitWith {true};
					if (_scanBudget > 0) exitWith {false};
					if (_isActiveTown) exitWith {false};
					if (_scanDistanceMin <= _scanCriticalRange) exitWith {false};
					true
				};

				if !(_scanSkipped) then {
					_scanBudget = _scanBudget - 1;
					_scannedTowns = _scannedTowns + 1;
					_townScanned = true;

					_dynRange = if (_isActiveTown) then {_range_detect_active} else {_range_detect};
					// Marty: Scan once, then split low/ground threats from high air threats. The old code forced ground activation.
					_detected = _town nearEntities [["Man","Car","Motorcycle","Tank","Air","Ship"],_dynRange];
					_groundDetected = _detected unitsBelowHeight _airHeight;
					_perfNearEntities = _perfNearEntities + 1;
					_perfDetected = _perfDetected + count _detected;

					_enemies = [_detected, _side] Call WFBE_CO_FNC_GetAreaEnemiesCount;
					_enemies_ground = [_groundDetected, _side] Call WFBE_CO_FNC_GetAreaEnemiesCount;
					if (_enemies > 0) then {_scanDelay = _scanActiveDelay};
					_town setVariable ["wfbe_ai_next_scan", time + _scanDelay];

					if(_enemies > 0)then{
					///
					if (_enemies > 0) then {_town setVariable ["wfbe_inactivity", time]};

					if (_town getVariable "wfbe_active_override") then {
						_town setVariable ["wfbe_active_override", false];
						_town setVariable ["wfbe_active", false];
					};

					if(!(_town getVariable "wfbe_active")) then {
						// Marty: Do not spend the per-cycle spawn budget on an already active air-only town.
						if (_activationBudget > 0 && (!(_town getVariable "wfbe_active_air") || _enemies_ground > 0)) then {
							_activationBudget = _activationBudget - 1;

							if(_enemies_ground > 0) then {
								_town setVariable ["wfbe_active", true];

								if (_side == WFBE_DEFENDER) then {
									_groups = [_town, _side] Call WFBE_SE_FNC_GetTownGroupsDefender
								} else {
									_groups = [_town, _side] Call WFBE_SE_FNC_GetTownGroups;
								};
							};

							if(_enemies_ground == 0 && _enemies > 0) then {
								if(!(_town getVariable "wfbe_active_air")) then {
									_town setVariable ["wfbe_active_air", true];

									if (_side == WFBE_DEFENDER) then {
										_groups = [_town, _side, true] Call WFBE_SE_FNC_GetTownGroupsDefender
									} else {
										_groups = [_town, _side, true] Call WFBE_SE_FNC_GetTownGroups;
									};
								};
							};

							if (count _groups > 0) then {
								// Marty: Performance Audit counters for town AI activation.
								_perfActivations = _perfActivations + 1;
								_perfSpawnGroups = _perfSpawnGroups + count _groups;
								["INFORMATION", Format ["server_town_ai.fsm: Town [%1] has been activated, creating defensive units for [%2].", _town, _side]] Call WFBE_CO_FNC_LogContent;

								if (missionNamespace getVariable Format ["WFBE_%1_PRESENT",_side]) then {[_side,"HostilesDetectedNear",_town] Spawn SideMessage};

								//--- Get the positions and create the groups
								_camps = +(_town getVariable "camps");
								_positions = [];
								_teams = [];
								// Marty: Use a separate group index so town iteration is never affected by activation work.
								for '_groupIndex' from 0 to count(_groups)-1 do {
									_position = [];
									if (count _camps > 0 && random 100 > 50) then {
										_camp = _camps select floor (random count _camps);
										_camps = _camps - [_camp];
										_position = ([getPos _camp, 10, 50] call WFBE_CO_FNC_GetRandomPosition);
									} else {
										_position = ([getPos _town, 50, 300] call WFBE_CO_FNC_GetRandomPosition);
									};
									_position = [_position, 50] call WFBE_CO_FNC_GetEmptyPosition;
									[_positions, _position] call WFBE_CO_FNC_ArrayPush;
									[_teams, createGroup _side] call WFBE_CO_FNC_ArrayPush;
								};

								_use_server = true;

								switch (_ai_delegation_enabled) do {
									case 1: { //--- Client side delegation.
										_retVal = [_town, _side, _groups, _positions, _teams] Call WFBE_SE_FNC_DelegateAITown;
										_town_teams = _town_teams + _teams;
										_town setVariable ['wfbe_active_vehicles', (_town getVariable 'wfbe_active_vehicles') + (_retVal select 1)];
										_use_server = false;
									};
									case 2: { //--- Headless Client delegation.
										if (count(missionNamespace getVariable "WFBE_HEADLESSCLIENTS_ID") > 0) then {
											[_town, _side, _groups, _positions, _teams] Call WFBE_CO_FNC_DelegateAITownHeadless;
											_town_teams = _town_teams + _teams;
											_town setVariable ['wfbe_town_teams', _town_teams];
											_use_server = false;
										};
									};
								};

								//--- Use Server AI.
								if (_use_server) then {
									// Marty: Town AI does not need client-side unit marker/action initialization.
									_retVal = [_town, _side, _groups, _positions, _teams, false] Call WFBE_CO_FNC_CreateTownUnits;
									_town_teams = _town_teams + _teams;
									_town setVariable ['wfbe_active_vehicles', (_town getVariable 'wfbe_active_vehicles') + (_retVal select 1)];
									_town setVariable ['wfbe_town_teams', _town_teams];
								};

								//--- Man the defenses.
								[_town, _side, "spawn"] Call WFBE_SE_FNC_OperateTownDefensesUnits;
							};
						};
					};
					///
					};
				};

			};//// end of side_enabled

			if((_town getVariable "wfbe_active") || (_town getVariable "wfbe_active_air")) then {
				if(time - (_town getVariable "wfbe_inactivity") > _unitsInactiveMax) then {
					//// inner block
					// Marty: Performance Audit counter for town AI despawn.
					_perfDespawns = _perfDespawns + 1;
					_town setVariable ["wfbe_active", false];
					_town setVariable ["wfbe_active_air", false];

					//--- Teams Units.
					{
						if !(isNil '_x') then {
							if !(isNull _x) then {
								{deleteVehicle _x} forEach units _x;
								deleteGroup _x;
							};
						};
					} forEach _town_teams;

					//--- Teams vehicles.
					{
						if (alive _x) then {
							if (!(isPlayer leader group _x)) then {deleteVehicle _x};
						};
					} forEach (_town getVariable 'wfbe_active_vehicles');

					_town_teams = [];
					_town setVariable ['wfbe_active_vehicles', []];

					//--- Despawn the town defenses unit.
					[_town, _side, "remove"] Call WFBE_SE_FNC_OperateTownDefensesUnits;
					//// end of inner block
				};
			};
			if(_patrol_enabled)then {
				if !(_town getVariable "wfbe_patrol_active") then {
					if (time - (_town getVariable "wfbe_patrol_active_last") > _patrol_delay && !(_town getVariable "wfbe_active")) then {
						_town setVariable ["wfbe_patrol_active", true];
						[_town, _sideID] execVM "Server\FSM\server_patrols.sqf";
					};
				};
			};

		};

		// Marty: Count every town that avoided nearEntities this pass, including ineligible or cadence-delayed towns.
		if (!_townScanned) then {_skippedTowns = _skippedTowns + 1};

		_perfActive = _perfActive + (diag_tickTime - _perfItemStart);
		sleep 0.05;
	};

	// Marty: Performance Audit record for one town AI server cycle.
	if !(isNil "PerformanceAudit_Record") then {
		["server_town_ai", _perfActive, Format["towns:%1;scannedTowns:%2;skippedTowns:%3;nearEntities:%4;detected:%5;activations:%6;despawns:%7;spawnGroups:%8;cycleMs:%9", _perfTowns, _scannedTowns, _skippedTowns, _perfNearEntities, _perfDetected, _perfActivations, _perfDespawns, _perfSpawnGroups, round ((diag_tickTime - _perfStart) * 1000)], "SERVER"] Call PerformanceAudit_Record;
	};

	sleep 5;

};
