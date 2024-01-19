Private['_moveMode','_team'];

_team = _this select 0;
_moveMode = _this select 1;

if (isNull _team) exitWith {};

_team setVariable ["cti_teammode", _moveMode, true];