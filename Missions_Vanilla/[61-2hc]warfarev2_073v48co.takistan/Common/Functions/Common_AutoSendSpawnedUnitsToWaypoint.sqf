/*
	This script handles the custom action key used to toggle the spawned-unit waypoint follow feature.
*/

Private ["_auto_send_spawned_units_to_waypoint","_key"];
_key = _this select 1;

_auto_send_spawned_units_to_waypoint = missionNamespace getVariable "AUTO_SEND_SPAWNED_UNITS_TO_WAYPOINT";

if (_key in (actionKeys "User13")) then {
	if (_auto_send_spawned_units_to_waypoint) then {
		missionNamespace setVariable ["AUTO_SEND_SPAWNED_UNITS_TO_WAYPOINT", false];
		"Auto send spawned units to current waypoint is now OFF" call GroupChatMessage;
		playSound ["autoViewDistanceToggledOff",true];
		["INFORMATION", "Common_AutoSendSpawnedUnitsToWaypoint.sqf: AUTO_SEND_SPAWNED_UNITS_TO_WAYPOINT toggled OFF."] Call WFBE_CO_FNC_LogContent;
		if (WF_Debug) then {["DEBUG (Common_AutoSendSpawnedUnitsToWaypoint.sqf)", "Common_AutoSendSpawnedUnitsToWaypoint.sqf: AUTO_SEND_SPAWNED_UNITS_TO_WAYPOINT toggled OFF."] Call WFBE_CO_FNC_LogContent};
	} else {
		missionNamespace setVariable ["AUTO_SEND_SPAWNED_UNITS_TO_WAYPOINT", true];
		"Auto send spawned units to current waypoint is now ON" call GroupChatMessage;
		playSound ["autoViewDistanceToggledOn",true];
		["INFORMATION", "Common_AutoSendSpawnedUnitsToWaypoint.sqf: AUTO_SEND_SPAWNED_UNITS_TO_WAYPOINT toggled ON."] Call WFBE_CO_FNC_LogContent;
		if (WF_Debug) then {["DEBUG (Common_AutoSendSpawnedUnitsToWaypoint.sqf)", "Common_AutoSendSpawnedUnitsToWaypoint.sqf: AUTO_SEND_SPAWNED_UNITS_TO_WAYPOINT toggled ON."] Call WFBE_CO_FNC_LogContent};
	};
};

false
