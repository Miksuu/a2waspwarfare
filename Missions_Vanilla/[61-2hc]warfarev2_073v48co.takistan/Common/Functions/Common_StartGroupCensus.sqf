/*
	Author: Marty
	Description:
		Starts a local periodic group census on server or headless client machines.
*/

Private ["_event","_interval"];

_interval = if (count _this > 0) then {_this select 0} else {120};
_event = if (count _this > 1) then {_this select 1} else {"periodic"};

if (missionNamespace getVariable ["WFBE_GroupCensusStarted", false]) exitWith {};
missionNamespace setVariable ["WFBE_GroupCensusStarted", true];

[_interval, _event] Spawn {
	Private ["_event","_interval"];
	_interval = _this select 0;
	_event = _this select 1;

	sleep 30;
	while {!(missionNamespace getVariable ["WFBE_GameOver", false])} do {
		[_event, "timer"] Call WFBE_CO_FNC_LogGroupCensus;
		sleep _interval;
	};
};
