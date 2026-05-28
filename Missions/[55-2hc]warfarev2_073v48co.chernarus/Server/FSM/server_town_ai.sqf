// Marty: Town AI activation is driven by the capture scanner; inactive towns are not polled here.
Private["_activeSideIDs","_forceActivation","_town","_position","_groups","_town_teams","_unitsInactiveMax","_patrol_delay","_patrol_enabled","_ai_delegation_enabled","_town_defender_enabled","_town_occupation_enabled","_perfActivationRequests","_perfTowns","_perfActivations","_perfDespawns","_perfSpawnGroups","_perfActive","_perfItemStart","_perfStart","_skippedTowns","_townScanned","_sideID","_side","_side_enabled","_camps","_camp","_positions","_teams","_use_server","_retVal","_groupIndex"];

for "_j" from 0 to ((count towns) - 1) step 1 do
{
	_loc = towns select _j;
	["INITIALIZATION",Format ["server_town_ai.sqf : Initialized for [%1].", _loc getVariable "name"]] Call WFBE_CO_FNC_LogContent;
	sleep 0.01;
};

_unitsInactiveMax = missionNamespace getVariable "WFBE_C_TOWNS_UNITS_INACTIVE";
_patrol_delay = missionNamespace getVariable "WFBE_C_PATROLS_DELAY_SPAWN";
_ai_delegation_enabled = missionNamespace getVariable "WFBE_C_AI_DELEGATION";
_town_defender_enabled = if ((missionNamespace getVariable "WFBE_C_TOWNS_DEFENDER") > 0) then {true} else {false};
_town_occupation_enabled = if ((missionNamespace getVariable "WFBE_C_TOWNS_OCCUPATION") > 0) then {true} else {false};

for "_k" from 0 to ((count towns) - 1) step 1 do
{
	_town = towns select _k;
	_town setVariable ["wfbe_active", false, true];
	_town setVariable ["wfbe_active_air", false, true];
	// Marty: Clients use this side list to reveal active-town SV without leaking it to every team.
	_town setVariable ["wfbe_active_sideIDs", [], true];
	_town setVariable ["wfbe_inactivity", 0];
	_town setVariable ["wfbe_active_override", false];
	_town setVariable ['wfbe_active_vehicles', []];
	_town setVariable ['wfbe_town_teams', []];
	// Marty: server_town.sqf owns this wake signal from its capture scan.
	_town setVariable ["wfbe_ai_force_activation", false];
	_town setVariable ["wfbe_ai_attack_sideIDs", []];
	sleep 0.01;
};

while {!WFBE_GameOver} do {

	// Marty: Performance Audit timing for one town AI server cycle.
	_perfStart = diag_tickTime;
	_perfTowns = 0;
	_perfActivationRequests = 0;
	_perfActivations = 0;
	_perfDespawns = 0;
	_perfSpawnGroups = 0;
	_skippedTowns = 0;
	_perfActive = 0;

	for "_i" from 0 to ((count towns) - 1) step 1 do
	{
		// Marty: Performance Audit active time excludes the cooperative sleep below.
		_perfItemStart = diag_tickTime;
		_position = [];
		_groups = [];
		// Marty: Track per-town wake outcome so audit totals show which towns were attack-driven.
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
				// Marty: Do not scan inactive towns here; server_town.sqf raises this from the capture scan.
				_forceActivation = _town getVariable "wfbe_ai_force_activation";
				if (isNil "_forceActivation") then {_forceActivation = false};

				if (_forceActivation) then {
					_townScanned = true;
					_perfActivationRequests = _perfActivationRequests + 1;

					// Marty: Publish only the side IDs that the capture scanner reported as attackers.
					_activeSideIDs = _town getVariable "wfbe_ai_attack_sideIDs";
					if (isNil "_activeSideIDs") then {_activeSideIDs = []};
					_town setVariable ["wfbe_active_sideIDs", _activeSideIDs, true];
					_town setVariable ["wfbe_inactivity", time];

					if (_town getVariable "wfbe_active_override") then {
						_town setVariable ["wfbe_active_override", false];
						_town setVariable ["wfbe_active", false, true];
					};

					if(!(_town getVariable "wfbe_active")) then {
						// Marty: Capture-confirmed attacks bypass the old spawn budget so towns cannot be captured empty.
						_town setVariable ["wfbe_active", true, true];

						if (_side == WFBE_DEFENDER) then {
							_groups = [_town, _side] Call WFBE_SE_FNC_GetTownGroupsDefender
						} else {
							_groups = [_town, _side] Call WFBE_SE_FNC_GetTownGroups;
						};

						// Marty: Count the activation even if a bad config leaves only static defenses to man.
						_perfActivations = _perfActivations + 1;

						if (count _groups == 0) then {
							["WARNING", Format ["server_town_ai.sqf: Town [%1] activation for [%2] had no group templates; static defenses will still be manned.", _town getVariable "name", _side]] Call WFBE_CO_FNC_LogContent;
						} else {
							// Marty: Performance Audit counters for town AI activation.
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
						};

						//--- Man the defenses.
						[_town, _side, "spawn"] Call WFBE_SE_FNC_OperateTownDefensesUnits;
					};
				};

			};//// end of side_enabled

			if((_town getVariable "wfbe_active") || (_town getVariable "wfbe_active_air")) then {
				if(time - (_town getVariable "wfbe_inactivity") > _unitsInactiveMax) then {
					//// inner block
					// Marty: Performance Audit counter for town AI despawn.
					_perfDespawns = _perfDespawns + 1;
					_town setVariable ["wfbe_active", false, true];
					_town setVariable ["wfbe_active_air", false, true];
					// Marty: Clear side-scoped active visibility when the town deactivates.
					_town setVariable ["wfbe_active_sideIDs", [], true];

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

		// Marty: Count towns without a capture-confirmed AI wake signal this pass.
		if (!_townScanned) then {_skippedTowns = _skippedTowns + 1};

		_perfActive = _perfActive + (diag_tickTime - _perfItemStart);
		sleep 0.05;
	};

	// Marty: Performance Audit record for one town AI server cycle.
	if !(isNil "PerformanceAudit_Record") then {
		if (missionNamespace getVariable ["PerformanceAuditEnabled", true]) then {
			["server_town_ai", _perfActive, Format["towns:%1;activationRequests:%2;skippedTowns:%3;activations:%4;despawns:%5;spawnGroups:%6;cycleMs:%7", _perfTowns, _perfActivationRequests, _skippedTowns, _perfActivations, _perfDespawns, _perfSpawnGroups, round ((diag_tickTime - _perfStart) * 1000)], "SERVER"] Call PerformanceAudit_Record;
		};
	};

	// Marty: This loop no longer runs nearEntities, so poll capture wake signals quickly.
	sleep 1;

};
