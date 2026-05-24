// Marty: Performance Audit locals.
Private ["_deathMarkerColor","_deathMarkerSize","_deathMarkerType","_delete","_deletePrevious","_markerColor","_markerName","_markerSize","_markerType","_markerText","_refreshRate","_trackDeath","_tracked","_trackedKind","_trackedType","_side","_perfStart"];

waitUntil {commonInitComplete};

_markerType = _this select 0;
_markerColor = _this select 1;
_markerSize = _this select 2;
_markerText = _this select 3;
_markerName = _this select 4;
_tracked = _this select 5;
_refreshRate = _this select 6;
_trackDeath = _this select 7;
_deathMarkerType = _this select 8;
_deathMarkerColor = _this select 9;
_deletePrevious = _this select 10;
_side = _this select 11;
_deathMarkerSize = [1,1];
if (count _this > 12) then {_deathMarkerSize = _this select 12};

if (_side != side group player || isNull _tracked || !(alive _tracked)) exitWith {};
if (_deletePrevious) then {deleteMarkerLocal _markerName};

// Marty: Performance Audit metadata lets us separate infantry, vehicles, HQ, and paratrooper marker loops.
_trackedType = typeOf _tracked;
_trackedKind = "object";
if (_tracked isKindOf "Man") then {_trackedKind = "man"};
if (_tracked isKindOf "Car") then {_trackedKind = "car"};
if (_tracked isKindOf "Tank") then {_trackedKind = "tank"};
if (_tracked isKindOf "Air") then {_trackedKind = "air"};
if (_tracked isKindOf "Ship") then {_trackedKind = "ship"};

createMarkerLocal [_markerName, getPos _tracked];
if (_markerText != "") then {_markerName setMarkerTextLocal _markerText};
_markerName setMarkerTypeLocal _markerType;
_markerName setMarkerColorLocal _markerColor;
_markerName setMarkerSizeLocal _markerSize;

_tracked setVariable ["unitMarkerBlink", _markerName, false];
_tracked setVariable ["OriginalMarkerColor", _markerColor, false];

// Marty: Performance Audit active marker script counter.
if !(isNil "PerformanceAuditMarkerScripts") then {
	missionNamespace setVariable ["PerformanceAuditMarkerScripts", (missionNamespace getVariable ["PerformanceAuditMarkerScripts", 0]) + 1];
};

if !(isNil "PerformanceAudit_Record") then {
	["markerupdate_start", 0, Format["markerType:%1;trackedKind:%2;trackedType:%3;refresh:%4;trackDeath:%5;activeMarkers:%6;side:%7", _markerType, _trackedKind, _trackedType, _refreshRate, _trackDeath, missionNamespace getVariable ["PerformanceAuditMarkerScripts", 0], _side], "CLIENT"] Call PerformanceAudit_Record;
};

if (getMarkerType _markerName == "Headquarters") then {
	
	while {alive _tracked && !(isNull _tracked)} do {

		sleep _refreshRate;

		// Marty: Performance Audit timing for one HQ marker update.
		_perfStart = diag_tickTime;

		_markerName setMarkerPosLocal (getPos _tracked);

		// Marty: Performance Audit record for one HQ marker update.
		if !(isNil "PerformanceAudit_Record") then {
			["markerupdate_hq", diag_tickTime - _perfStart, Format["refresh:%1;activeMarkers:%2;trackedKind:%3;trackedType:%4", _refreshRate, missionNamespace getVariable ["PerformanceAuditMarkerScripts", 0], _trackedKind, _trackedType], "CLIENT"] Call PerformanceAudit_Record;
		};
	};

} else {

	while {alive _tracked && !(isNull _tracked)} do {

			sleep _refreshRate;

			// Marty: Performance Audit timing for one unit/vehicle marker update.
			_perfStart = diag_tickTime;

			if (!(canMove _tracked)) then {
				_markerName setMarkerTypeLocal "mil_objective";
				_markerName setMarkerSizeLocal [0.5,0.5];
			} else {
				_markerName setMarkerTypeLocal _markerType;
				_markerName setMarkerSizeLocal _markerSize;
			};

			_markerName setMarkerPosLocal (getPos _tracked);

			// Marty: Performance Audit record for one unit/vehicle marker update.
			if !(isNil "PerformanceAudit_Record") then {
				["markerupdate_unit", diag_tickTime - _perfStart, Format["refresh:%1;activeMarkers:%2;trackedKind:%3;trackedType:%4", _refreshRate, missionNamespace getVariable ["PerformanceAuditMarkerScripts", 0], _trackedKind, _trackedType], "CLIENT"] Call PerformanceAudit_Record;
			};
	};
};

if (_trackDeath && !isNull _tracked) then {
	_markerName setMarkerTypeLocal _deathMarkerType;
	_markerName setMarkerColorLocal _deathMarkerColor;
	_markerName setMarkerSizeLocal _deathMarkerSize;
	sleep (missionNamespace getVariable "WFBE_C_PLAYERS_MARKER_DEAD_DELAY");
};

// Marty: Performance Audit active marker script counter.
if !(isNil "PerformanceAuditMarkerScripts") then {
	missionNamespace setVariable ["PerformanceAuditMarkerScripts", ((missionNamespace getVariable ["PerformanceAuditMarkerScripts", 1]) - 1) max 0];
};

if !(isNil "PerformanceAudit_Record") then {
	["markerupdate_end", 0, Format["markerType:%1;trackedKind:%2;trackedType:%3;activeMarkers:%4;side:%5", _markerType, _trackedKind, _trackedType, missionNamespace getVariable ["PerformanceAuditMarkerScripts", 0], _side], "CLIENT"] Call PerformanceAudit_Record;
};

deleteMarkerLocal _markerName;
