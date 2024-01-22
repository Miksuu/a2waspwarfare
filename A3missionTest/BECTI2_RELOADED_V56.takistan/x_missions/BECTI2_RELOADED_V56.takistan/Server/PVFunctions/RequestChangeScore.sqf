Private["_oldScore","_newScore","_playerChanged"];

_playerChanged = _this select 0;
_newScore = _this select 1;

_oldScore = score _playerChanged;
_playerChanged addScore -_oldScore;
_playerChanged addScore _newScore;

[_playerChanged,_newScore] remoteExecCall ["cti_CL_FNC_ChangeScore"];