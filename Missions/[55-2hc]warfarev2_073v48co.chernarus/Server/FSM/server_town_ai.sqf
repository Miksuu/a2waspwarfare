// Marty: Optimized town AI monitor; activation is budgeted and air/ground detection is split.
Private["_town","_range","_range_detect","_range_detect_active","_position","_groups","_town_camps","_town_camps_count","_town_teams","_airHeight","_unitsInactiveMax","_patrol_delay","_patrol_enabled","_ai_delegation_enabled","_town_defender_enabled","_town_occupation_enabled","_activationBudget","_activationBudgetMax","_detected","_groundDetected","_enemies","_enemies_ground"];

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

for "_k" from 0 to ((count towns) - 1) step 1 do
{
	_town = towns select _k;
	_town setVariable ["wfbe_active", false];
	_town setVariable ["wfbe_active_air", false];
	_town setVariable ["wfbe_inactivity", 0];
	_town setVariable ["wfbe_active_override", false];
	_town setVariable ['wfbe_active_vehicles', []];
	_town setVariable ['wfbe_town_teams', []];
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
	_perfActive = 0;
	_activationBudget = _activationBudgetMax;

	for "_i" from 0 to ((count towns) - 1) step 1 do
	{
		// Marty: Performance Audit active time excludes the cooperative sleep below.
		_perfItemStart = diag_tickTime;
		_position = [];
		_groups = [];


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
				_dynRange = if (_town getVariable "wfbe_active" || _town getVariable "wfbe_active_air") then {_range_detect_active} else {_range_detect};
				// Marty: Scan once, then split low/ground threats from high air threats. The old code forced ground activation.
				_detected = _town nearEntities [["Man","Car","Motorcycle","Tank","Air","Ship"],_dynRange];
				_groundDetected = _detected unitsBelowHeight _airHeight;
				_perfNearEntities = _perfNearEntities + 1;
				_perfDetected = _perfDetected + count _detected;

				_enemies = [_detected, _side] Call WFBE_CO_FNC_GetAreaEnemiesCount;
				_enemies_ground = [_groundDetected, _side] Call WFBE_CO_FNC_GetAreaEnemiesCount;
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
								for '_i' from 0 to count(_groups)-1 do {
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

		_perfActive = _perfActive + (diag_tickTime - _perfItemStart);
		sleep 0.05;
	};

	// Marty: Performance Audit record for one town AI server cycle.
	if !(isNil "PerformanceAudit_Record") then {
		["server_town_ai", _perfActive, Format["towns:%1;nearEntities:%2;detected:%3;activations:%4;despawns:%5;spawnGroups:%6;cycleMs:%7", _perfTowns, _perfNearEntities, _perfDetected, _perfActivations, _perfDespawns, _perfSpawnGroups, round ((diag_tickTime - _perfStart) * 1000)], "SERVER"] Call PerformanceAudit_Record;
	};

	sleep 5;

};
