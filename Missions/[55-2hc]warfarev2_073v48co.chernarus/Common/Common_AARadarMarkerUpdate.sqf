Private ["_height","_object","_markerName","_side","_sideID","_speed","_altitude","_aircraftName","_aarUpgradeLevel","_oppositeSide","_perfStart","_perfTextUpdates","_perfVisible","_playerDirection","_typeOfObject","_updateFrequency","_upgrades"];

_object = _this select 0;
_side = _this select 1;
_sideID = _this select 2;

unitMarker = unitMarker + 1;
_markerName = Format ["unitMarker%1",unitMarker];

createMarkerLocal [_markerName,[0,0,0]];
//_markerName setMarkerTypeLocal "Vehicle";
_markerName setMarkerTypeLocal "mil_arrow2"; 	//Marty : draw marker as a filled arrow
_markerName setMarkerColorLocal "ColorRed";
_markerName setMarkerSizeLocal [0.5, 0.5]; // Made the marker a bit smaller still, might need adjustmenets
_markerName setMarkerAlphaLocal 0;
_height = missionNamespace getVariable "WFBE_C_STRUCTURES_ANTIAIRRADAR_DETECTION";

// Marty: Performance Audit active AAR marker script counter.
if !(isNil "PerformanceAuditAARMarkerScripts") then {
	missionNamespace setVariable ["PerformanceAuditAARMarkerScripts", (missionNamespace getVariable ["PerformanceAuditAARMarkerScripts", 0]) + 1];
};
if !(isNil "PerformanceAudit_Record") then {
	["aar_marker_start", 0, Format["type:%1;side:%2;activeAAR:%3", typeOf _object, _sideID, missionNamespace getVariable ["PerformanceAuditAARMarkerScripts", 0]], "CLIENT"] Call PerformanceAudit_Record;
};

// Need to flip the logic for getting the upgrade level
if (_sideID == 0) then {
    _oppositeSide = (1) Call GetSideFromID;
};
if (_sideID == 1) then {
    _oppositeSide = (0) Call GetSideFromID;
};

// Place any aircraft warning logic here before the loop (done once)?

// The main update loop
while {alive _object && !(isNull _object)} do {
	_perfStart = diag_tickTime;
	_perfVisible = 0;
	_perfTextUpdates = 0;
	_aarUpgradeLevel = -1;
    _updateFrequency = 5; // AAR0: 5, AAR1: 3, AAR2: 1

	if (antiAirRadarInRange) then {
		if (((getPos _object) select 2) > _height) then {

		    // Get the AAR upgrade level from the _oppositeSite variable
            _upgrades = (_oppositeSide) Call WFBE_CO_FNC_GetSideUpgrades;
            _aarUpgradeLevel = _upgrades select WFBE_UP_AAR;

            _speed = str(round(speed _object)) + "km/h"; // Get the speed (AAR0)
            _altitude = " "; // Defined empty (AAR1)
            _aircraftName = " "; // Defined empty (AAR2)

            // Get the aircraft altitude (AAR1)
            if (_aarUpgradeLevel > 0) then {
                _altitude = str(round(getPosATL _object select 2)) + "m";
                _updateFrequency = 3;
            };

            // Get the aircraft name (AAR2)
            if (_aarUpgradeLevel > 1) then {
                _typeOfObject = typeOf _object;
                //["DEBUG (AAR1)", Format ["%1", _typeOfObject]] Call WFBE_CO_FNC_LogContent;
                _aircraftName = [_typeOfObject] call WFBE_CL_FNC_ReturnAircraftNameFromItsType;
                //["DEBUG (AAR2)", Format ["%1", _aircraftName]] Call WFBE_CO_FNC_LogContent;

                _updateFrequency = 1;
            };

			_markerName setMarkerAlphaLocal 1;
			_markerName setMarkerPosLocal (getPos _object);
            _markerName setMarkerTextLocal (format ["%1 %2 %3", _speed, _altitude, _aircraftName]);
			_playerDirection = getDir _object; 				//Marty : get the player's angle direction (= azimut) in order to draw the arrow marker in the same direction.
			_markerName setMarkerDirLocal _playerDirection;	//Marty : set the player's angle direction to the marker.
			_perfVisible = 1;
			_perfTextUpdates = 1;

		} else {
			_markerName setMarkerAlphaLocal 0;
		};
	};

	if !(isNil "PerformanceAudit_Record") then {
		["aar_marker_update", diag_tickTime - _perfStart, Format["type:%1;visible:%2;textUpdates:%3;upgrade:%4;refresh:%5;activeAAR:%6;radarInRange:%7", typeOf _object, _perfVisible, _perfTextUpdates, _aarUpgradeLevel, _updateFrequency, missionNamespace getVariable ["PerformanceAuditAARMarkerScripts", 0], antiAirRadarInRange], "CLIENT"] Call PerformanceAudit_Record;
	};

	sleep _updateFrequency; //Marty : refresh frequency is same as the updateTeamMarker in order to refresh faster on map. (May be we should increase this value in case of performances issues !)
};

if !(isNil "PerformanceAuditAARMarkerScripts") then {
	missionNamespace setVariable ["PerformanceAuditAARMarkerScripts", ((missionNamespace getVariable ["PerformanceAuditAARMarkerScripts", 1]) - 1) max 0];
};
if !(isNil "PerformanceAudit_Record") then {
	["aar_marker_end", 0, Format["type:%1;side:%2;activeAAR:%3", typeOf _object, _sideID, missionNamespace getVariable ["PerformanceAuditAARMarkerScripts", 0]], "CLIENT"] Call PerformanceAudit_Record;
};

deleteMarkerLocal _markerName;
