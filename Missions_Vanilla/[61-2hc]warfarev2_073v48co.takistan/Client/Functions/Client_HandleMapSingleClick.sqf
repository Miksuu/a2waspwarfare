/*
	Capture the team leader's shift-click map order so newly spawned units can inherit it.
	Parameters:
		0 - Clicked position.
		1 - Shift pressed.
		2 - Alt pressed.
		3 - Selected units array from onMapSingleClick (mostly unreliable in Arma 2/OA, logged for debug only).
*/

Private ["_alt","_group","_position","_selectedUnits","_shift","_storedPosition"];

_position = _this select 0;
_shift = _this select 1;
_alt = _this select 2;
_selectedUnits = _this select 3;

if (_shift && (leader (group player)) == player) then {
	_group = group player;
	_storedPosition = [_position select 0, _position select 1, 0];

	missionNamespace setVariable ["WFBE_CLIENT_LAST_TEAMLEADER_MAP_ORDER_POSITION", _storedPosition];
	missionNamespace setVariable ["WFBE_CLIENT_LAST_TEAMLEADER_MAP_ORDER_GROUP", _group];
	missionNamespace setVariable ["WFBE_CLIENT_LAST_TEAMLEADER_MAP_ORDER_TIME", time];

	if (missionNamespace getVariable "AUTO_SEND_SPAWNED_UNITS_TO_WAYPOINT") then {
		["INFORMATION", Format ["Client_HandleMapSingleClick.sqf: Stored team leader shift-click order for team [%1] at %2.", _group, _storedPosition]] Call WFBE_CO_FNC_LogContent;
	};

	if (WF_Debug) then {
		["DEBUG (Client_HandleMapSingleClick.sqf)", Format ["Client_HandleMapSingleClick.sqf: Shift-click detected for team [%1] at %2. Alt [%3], selected units [%4].", _group, _storedPosition, _alt, _selectedUnits]] Call WFBE_CO_FNC_LogContent;
	};
};

// Preserve the legacy debug teleport on plain map clicks without blocking shift-click move capture.
if (WF_Debug && !_shift) then {
	vehicle player setPos _position;
	(vehicle player) setVelocity [0,0,-0.1];
	diag_log getPos player;
};

false
