/*
    Author : Marty 
	Contributors :
	Name: daynight_cycle.sqf
    Description:
        Server-side accelerated day/night cycle.
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
    "_day_skip_per_second",
    "_night_skip_per_second",
    "_tick",
    "_hour",
    "_skip"
];

if (!isServer) exitWith {};

_day_duration_real = missionNamespace getVariable "WFBE_DAY_DURATION";
_night_duration_real = missionNamespace getVariable "WFBE_NIGHT_DURATION";

_day_duration_real_seconds = _day_duration_real * 60;
_night_duration_real_seconds = _night_duration_real * 60;

// In-game daytime: 06:00 -> 18:00 = 12 hours.
// In-game nighttime: 18:00 -> 06:00 = 12 hours.
_day_hours_game = 12;
_night_hours_game = 12;

// skipTime expects hours.
_day_skip_per_second = _day_hours_game / _day_duration_real_seconds;
_night_skip_per_second = _night_hours_game / _night_duration_real_seconds;

// Update interval in real seconds.
_tick = 10;

while {true} do {

    _hour = daytime;

    if (_hour >= 6 && _hour < 18) then {
        _skip = _day_skip_per_second * _tick;
    } else {
        _skip = _night_skip_per_second * _tick;
    };

    skipTime _skip;

    sleep _tick;
};