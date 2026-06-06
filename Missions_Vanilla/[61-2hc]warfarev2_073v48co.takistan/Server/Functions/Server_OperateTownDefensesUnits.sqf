/*
	Oeprate the defenses in a town, spawn or despawn.
	 Parameters:
		- Town.
		- Side.
		- Action ("spawn"/"remove").
*/

Private ["_action","_ai_delegation_enabled","_defense","_diagEnabled","_groups","_gunner","_operator","_perfActive","_perfDelegated","_perfItemStart","_perfRemoved","_perfScope","_perfSpawned","_perfStart","_perfTotal","_positions","_side","_spawn","_team","_town","_unit","_units","_use_server","_sideID"];

_town = _this select 0;
_side = _this select 1;
_action = _this select 2;
_sideID = (_side) Call WFBE_CO_FNC_GetSideID;
// Marty: Performance Audit measures town defense unit spawn/remove bursts separately from server_town_ai.
_perfStart = diag_tickTime;
_perfActive = 0;
_perfSpawned = 0;
_perfRemoved = 0;
_perfDelegated = 0;
_perfTotal = 0;
// Marty: Dedicated town defense diagnostics, kept separate from broad WF_Debug logging.
_diagEnabled = missionNamespace getVariable ["TownDefenseDiagnosticsEnabled", false];


if (_sideID != WFBE_C_GUER_ID) exitWith {};
switch (_action) do {
	case "spawn": {
		//_side_group = createGroup _side;
		//--- Man the defenses.
		{
			_perfItemStart = diag_tickTime;
			_perfTotal = _perfTotal + 1;
			_defense = _x getVariable "wfbe_defense";
			_use_server = true;
			if !(isNil '_defense') then {
				// Marty: Store town-defense ownership on the static weapon before any server or HC gunner creation path.
				[_town, _defense, _sideID, "static_weapon"] Call WFBE_CO_FNC_MarkTownDefenseAsset;
				_positions = [];
				_groups = [];
				// Marty: Trace static gunner state before any server or HC creation path.
				if (_diagEnabled) then {
					_gunner = gunner _defense;
					["TOWN_DEFENSE_DIAG", Format ["static_spawn_check town:%1;side:%2;defense:%3;defenseAlive:%4;gunnerNull:%5;gunnerAlive:%6;gunnerMarked:%7", _town getVariable "name", _side, typeOf _defense, alive _defense, isNull _gunner, alive _gunner, _gunner getVariable ["WFBE_IsTownDefenderAI", false]]] Call WFBE_CO_FNC_LogContent;
				};
				if !(alive gunner _defense) then { //--- Make sure that the defense gunner is null or dead.
					_ai_delegation_enabled = missionNamespace getVariable "WFBE_C_AI_DELEGATION";
					if(_ai_delegation_enabled > 0)then{
						switch (_ai_delegation_enabled) do {
							case 2: { //--- Headless Client delegation.
								[_positions, getPos _x] call WFBE_CO_FNC_ArrayPush;
								[_groups, missionNamespace getVariable Format ["WFBE_%1SOLDIER", _side]] call WFBE_CO_FNC_ArrayPush;


								_team = missionNamespace getVariable Format ["WFBE_%1_DefenseTeam", _side];

								if (isNull _team) then {
									_team = createGroup _side;
									missionNamespace setVariable [format["WFBE_%1_DefenseTeam", _side], _team];
								};

								if (count(missionNamespace getVariable "WFBE_HEADLESSCLIENTS_ID") > 0) then {
									// Marty: Delegated town static gunners carry the owning town for activation filtering and cleanup.
									[_side, _groups, _positions, _team, _defense, true, true, _town] Call WFBE_CO_FNC_DelegateAIStaticDefenceHeadless;
									// Marty: Confirm delegated static gunners so HC-side orphan cases can be correlated in RPT.
									if (_diagEnabled) then {
										["TOWN_DEFENSE_DIAG", Format ["static_spawn_delegated town:%1;side:%2;defense:%3;groups:%4;teamNull:%5;headless:%6", _town getVariable "name", _side, typeOf _defense, count _groups, isNull _team, count (missionNamespace getVariable ["WFBE_HEADLESSCLIENTS_ID", []])]] Call WFBE_CO_FNC_LogContent;
									};
									_use_server = false;
									_perfDelegated = _perfDelegated + 1;
								};
							};
						};
					};

					if (_use_server) then {
						_unit = [missionNamespace getVariable Format ["WFBE_%1SOLDIER", _side],missionNamespace getVariable Format ["WFBE_%1_DefenseTeam", _side], getPos _x, _side] Call WFBE_CO_FNC_CreateUnit;
						// Marty: If unit creation fails, leave the static empty instead of running commands on objNull.
						if (isNull _unit) then {
							["WARNING", Format ["Server_OperateTownDefensesUnits.sqf : Town [%1] failed to create static gunner for [%2].", _town getVariable "name", _side]] Call WFBE_CO_FNC_LogContent;
						} else {
							// Marty: Mark town static gunners so nearby enemy towns do not activate from them and cleanup stays town-scoped.
							[_town, _unit, _sideID, "static_gunner"] Call WFBE_CO_FNC_MarkTownDefenseAsset;
							[_town, group _unit, _sideID, "static_group"] Call WFBE_CO_FNC_MarkTownDefenseAsset;
							_unit assignAsGunner _defense;
							[_unit] orderGetIn true;
							_unit moveInGunner _defense;
							[group _unit, 175, getPos _defense] spawn WFBE_CO_FNC_RevealArea;
							_x setVariable ["wfbe_defense_operator", _unit]; //--- Track the original gunner.
							// Marty: Confirm server-created static gunners are seated and tracked.
							if (_diagEnabled) then {
								["TOWN_DEFENSE_DIAG", Format ["static_spawn_server town:%1;side:%2;unit:%3;defense:%4;inDefense:%5;operatorTracked:%6", _town getVariable "name", _side, typeOf _unit, typeOf _defense, vehicle _unit == _defense, !(isNil {_x getVariable "wfbe_defense_operator"})]] Call WFBE_CO_FNC_LogContent;
							};
							_perfSpawned = _perfSpawned + 1;
						};
					};
				};

			};
			_perfActive = _perfActive + (diag_tickTime - _perfItemStart);
			
			// Added small delay to avoid the lag spike when spawning all units at once
			sleep 0.5;
		} forEach (_town getVariable "wfbe_town_defenses");

		//--- Reveal the town area to the statics.
		if (count (_town getVariable "wfbe_town_defenses") > 0) then {
			[missionNamespace getVariable Format ["WFBE_%1_DefenseTeam", _side], _town getVariable "range", _town] Call RevealArea;
		};

		["INFORMATION", Format ["Server_OperateTownDefensesUnits.sqf : Town [%1] defenses were manned for [%2] defenses on [%3].", _town getVariable "name", count (_town getVariable "wfbe_town_defenses"),_side]] Call WFBE_CO_FNC_LogContent;
	};
	case "remove": {
		//--- De-man the defenses.
		{
			_perfItemStart = diag_tickTime;
			_perfTotal = _perfTotal + 1;
			_defense = _x getVariable "wfbe_defense";

			if !(isNil '_defense') then {
				_unit = gunner _defense;
				// Marty: Trace what the server can see before removing static gunners, especially HC-created or dismounted ones.
				if (_diagEnabled) then {
					_operator = _x getVariable ["wfbe_defense_operator", objNull];
					["TOWN_DEFENSE_DIAG", Format ["static_remove_check town:%1;side:%2;defense:%3;gunnerNull:%4;gunnerAlive:%5;gunnerMarked:%6;operatorNull:%7;operatorAlive:%8;operatorInDefense:%9", _town getVariable "name", _side, typeOf _defense, isNull _unit, alive _unit, _unit getVariable ["WFBE_IsTownDefenderAI", false], isNull _operator, alive _operator, vehicle _operator == _defense]] Call WFBE_CO_FNC_LogContent;
				};
				if !(isNull _unit) then { //--- Make sure that we do not remove a player's unit.
					if (alive _unit) then {
						if (isNil {(group _unit) getVariable "wfbe_funds"}) then {_unit setPos (getPos _x);	deleteVehicle _unit;_perfRemoved = _perfRemoved + 1};
					} else {
						_unit setPos (getPos _x); deleteVehicle _unit;_perfRemoved = _perfRemoved + 1;
					};
				};
			};
			if !(isNil {_x getVariable "wfbe_defense_operator"}) then { //--- Delete the original gunner if he's still around.
				if (alive(_x getVariable "wfbe_defense_operator")) then {deleteVehicle (_x getVariable "wfbe_defense_operator");_perfRemoved = _perfRemoved + 1};
				_x setVariable ["wfbe_defense_operator", nil];
			};
			// Marty: Summarize static removal result after gunner/operator cleanup.
			if (_diagEnabled && !(isNil "_defense")) then {
				["TOWN_DEFENSE_DIAG", Format ["static_remove_done town:%1;side:%2;defense:%3;gunnerNull:%4;operatorTracked:%5;removedTotal:%6", _town getVariable "name", _side, typeOf _defense, isNull (gunner _defense), !(isNil {_x getVariable "wfbe_defense_operator"}), _perfRemoved]] Call WFBE_CO_FNC_LogContent;
			};
			_perfActive = _perfActive + (diag_tickTime - _perfItemStart);
		} forEach (_town getVariable "wfbe_town_defenses");

		["INFORMATION", Format ["Server_OperateTownDefensesUnits.sqf : Town [%1] defenses units were removed for [%2] defenses.", _town getVariable "name", count (_town getVariable "wfbe_town_defenses")]] Call WFBE_CO_FNC_LogContent;
	};
};

if !(isNil "PerformanceAudit_Record") then {
	if (missionNamespace getVariable ["PerformanceAuditEnabled", true]) then {
		_perfScope = if (isServer && !hasInterface) then {"SERVER"} else {"CLIENT"};
		["town_defenses_units", _perfActive, Format["town:%1;side:%2;action:%3;defenses:%4;spawned:%5;delegated:%6;removed:%7;cycleMs:%8", _town getVariable "name", _side, _action, _perfTotal, _perfSpawned, _perfDelegated, _perfRemoved, round ((diag_tickTime - _perfStart) * 1000)], _perfScope] Call PerformanceAudit_Record;
	};
};
