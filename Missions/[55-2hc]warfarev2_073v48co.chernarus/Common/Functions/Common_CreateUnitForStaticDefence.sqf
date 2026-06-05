/*
	Create units for static defence.
	 Parameters:
		- Side
		- Groups
		- Spawn positions
		- Teams
		- Defence
		- Move In Gunner immidietly or not
*/

Private ["_assignedUnit", "_built", "_builtveh", "_defence", "_groups", "_manningInProgress", "_moveInGunner", "_perfActive", "_perfItemStart", "_perfScope", "_perfStart", "_position", "_positions", "_side", "_sideID", "_team", "_teams", "_townDefenderAI", "_town_vehicles", "_unit"];

_side = _this select 0;
_groups = _this select 1;
_positions = _this select 2;
_team = _this select 3;
_defence = _this select 4;
_moveInGunner = _this select 5;
// Marty: Optional flag marks town static defender AI without affecting player/base defenses.
_townDefenderAI = if (count _this > 6) then {_this select 6} else {false};
_sideID = (_side) call WFBE_CO_FNC_GetSideID;

_built = 0;
_builtveh = 0;
_teams = [];
// Marty: Performance Audit measures delegated/static defense unit creation source.
_perfStart = diag_tickTime;
_perfActive = 0;

if !(isNull (gunner _defence)) exitWith {
	["INFORMATION", Format["Common_CreateUnitForstaticDefence.sqf: [%1] skipped duplicate request for [%2], gunner already alive.", _side, typeOf _defence]] Call WFBE_CO_FNC_LogContent;
	[_teams]
};

_assignedUnit = _defence getVariable "WFBE_StaticDefenseAssignedUnit";
if (isNil "_assignedUnit") then {_assignedUnit = objNull};
if (!(isNull _assignedUnit) && !(alive _assignedUnit)) then {
	_defence setVariable ["WFBE_StaticDefenseAssignedUnit", objNull, true];
};
if (!(isNull _assignedUnit) && (alive _assignedUnit)) exitWith {
	[_assignedUnit] allowGetIn true;
	_assignedUnit assignAsGunner _defence;
	[_assignedUnit] orderGetIn true;
	if (_moveInGunner) then {_assignedUnit moveInGunner _defence};
	["INFORMATION", Format["Common_CreateUnitForstaticDefence.sqf: [%1] skipped duplicate request for [%2], assigned unit still alive.", _side, typeOf _defence]] Call WFBE_CO_FNC_LogContent;
	[_teams]
};

_manningInProgress = _defence getVariable "WFBE_StaticDefenseManningInProgress";
if (isNil "_manningInProgress") then {_manningInProgress = false};
if (_manningInProgress) exitWith {
	["INFORMATION", Format["Common_CreateUnitForstaticDefence.sqf: [%1] skipped duplicate request for [%2], manning already in progress.", _side, typeOf _defence]] Call WFBE_CO_FNC_LogContent;
	[_teams]
};
_defence setVariable ["WFBE_StaticDefenseManningInProgress", true, true];

for '_i' from 0 to count(_groups)-1 do {
	_position = _positions select _i;
	//_team = _teams select _i;

	["INFORMATION", Format["Common_CreateUnitForstaticDefence.sqf: [%1] will create a team template %2 at %3", _side, _groups select _i,_position]] Call WFBE_CO_FNC_LogContent;

	_sideID = (_side) Call GetSideID;
	_perfItemStart = diag_tickTime;
	if (isNull _team) then {_team = createGroup _side};
	if (!local _team) then {_team = createGroup _side};
	_unit = [_groups select _i, _team, _position, _sideID] Call WFBE_CO_FNC_CreateUnit;
	if (isNull _unit) exitWith {
		["WARNING", Format["Common_CreateUnitForstaticDefence.sqf: [%1] failed to create static gunner template %2 at %3", _side, _groups select _i, _position]] Call WFBE_CO_FNC_LogContent;
	};
	_defence setVariable ["WFBE_StaticDefenseAssignedUnit", _unit, true];
	_perfActive = _perfActive + (diag_tickTime - _perfItemStart);
	_built  = _built + 1;

	// Marty: Mark delegated town static gunners for enemy-town activation filtering.
	if (_townDefenderAI) then {
		_unit setVariable ["WFBE_IsTownDefenderAI", true, true];
		(group _unit) setVariable ["WFBE_IsTownDefenderAI", true];
	};

	[_teams, _team] call WFBE_CO_FNC_ArrayPush;
	[_unit] allowGetIn true;
	_unit assignAsGunner _defence;
	[_unit] orderGetIn true;

	if(_moveInGunner)then{
		_unit moveInGunner _defence;
		[_unit,_defence] Spawn {
			Private ["_defence","_unit"];
			_unit = _this select 0;
			_defence = _this select 1;
			sleep 1;
			if (alive _unit && alive _defence && (gunner _defence != _unit)) then {
				_unit setPosATL (getPosATL _defence);
				[_unit] allowGetIn true;
				_unit assignAsGunner _defence;
				[_unit] orderGetIn true;
				_unit moveInGunner _defence;
				["WARNING", Format["Common_CreateUnitForstaticDefence.sqf: retried instant static manning for [%1].", typeOf _defence]] Call WFBE_CO_FNC_LogContent;
			};
			if (alive _unit && alive _defence && (gunner _defence == _unit)) then {
				_unit disableAI "MOVE";
				_unit setVariable ["WFBE_StaticDefenseSettled", true, true];
			};
		};
	}else{
		[_unit] allowGetIn true;
	};

	[group _unit, 175, getPos _defence] spawn WFBE_CO_FNC_RevealArea;



	_unit allowFleeing 0; //--- Make the units brave.
};

if (_built > 0) then {[str _side,'UnitsCreated',_built] call UpdateStatistics};

_defence setVariable ["WFBE_StaticDefenseManningInProgress", false, true];

["INFORMATION", Format["Common_CreateUnitForstaticDefence.sqf:  [%1] was activated with a total of [%2] units.", _side, _built]] Call WFBE_CO_FNC_LogContent;

if !(isNil "PerformanceAudit_Record") then {
	if (missionNamespace getVariable ["PerformanceAuditEnabled", true]) then {
		_perfScope = if (isServer && !hasInterface) then {"SERVER"} else {"CLIENT"};
		["create_static_defense_units", _perfActive, Format["side:%1;groups:%2;units:%3;moveIn:%4;cycleMs:%5", _sideID, count _groups, _built, _moveInGunner, round ((diag_tickTime - _perfStart) * 1000)], _perfScope] Call PerformanceAudit_Record;
	};
};

[_teams]
