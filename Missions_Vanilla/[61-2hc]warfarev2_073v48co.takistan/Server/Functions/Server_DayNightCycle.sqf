/*
    Author : Marty 
	Contributors :
	Name: daynight_cycle.sqf
    Description:
        Server-side authoritative accelerated day/night cycle.
        Day and night real-life durations are configurable through mission parameters.

    Mission parameters:
        WFBE_DAY_DURATION   - Real-life duration of daytime in minutes.
        WFBE_NIGHT_DURATION - Real-life duration of nighttime in minutes.
*/

Private [
    "_day_duration_real",
    "_night_duration_real",
    "_day_duration_real_seconds",
    "_night_duration_real_seconds",
    "_day_hours_game",
    "_night_hours_game",
    "_day_hours_per_second",
    "_night_hours_per_second",
    "_tick",
    "_sync_interval",
    "_sync_elapsed",
    "_hour",
    "_hours_to_add"
];

if (!isServer) exitWith {};
// Marty: Defensive guard in case this script is executed while the mission parameter is disabled.
if ((missionNamespace getVariable "WFBE_DAYNIGHT_ENABLED") != 1) exitWith {};

_day_duration_real = missionNamespace getVariable "WFBE_DAY_DURATION";
_night_duration_real = missionNamespace getVariable "WFBE_NIGHT_DURATION";

_day_duration_real_seconds = _day_duration_real * 60;
_night_duration_real_seconds = _night_duration_real * 60;

// In-game daytime: 06:00 -> 18:00 = 12 hours.
// In-game nighttime: 18:00 -> 06:00 = 12 hours.
_day_hours_game = 12;
_night_hours_game = 12;

// Marty: Keep the server as the authoritative clock; clients use these same rates locally for smooth visuals.
_day_hours_per_second = _day_hours_game / _day_duration_real_seconds;
_night_hours_per_second = _night_hours_game / _night_duration_real_seconds;

// Marty: Small server-side skipTime steps avoid the previous large jumps while keeping the server date authoritative.
_tick = 1;
_sync_interval = missionNamespace getVariable "WFBE_DAYNIGHT_SERVER_SYNC_INTERVAL";
_sync_elapsed = _sync_interval;

while {(missionNamespace getVariable "WFBE_DAYNIGHT_ENABLED") == 1} do {

    _hour = daytime;

    if (_hour >= 6 && _hour < 18) then {
        _hours_to_add = _day_hours_per_second * _tick;
    } else {
        _hours_to_add = _night_hours_per_second * _tick;
    };

    // Marty: This skipTime runs only the server clock forward. Clients animate locally and only use server dates as drift references.
    skipTime _hours_to_add;

    _sync_elapsed = _sync_elapsed + _tick;
    if (_sync_elapsed >= _sync_interval) then {
        // Marty: Publish an absolute date for JIP and drift correction, without forcing clients to call setDate every tick.
        WFBE_DAYNIGHT_DATE = date;
        publicVariable "WFBE_DAYNIGHT_DATE";
        _sync_elapsed = 0;
    };

    sleep _tick;
};
