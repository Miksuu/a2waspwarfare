Private['_respawn','_team'];

_team = _this select 0;
_respawn = _this select 1;

if (isNull _team) exitWith {};

_team setVariable ["cti_respawn", _respawn, true];