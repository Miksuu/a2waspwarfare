/*
	author: Net_2
	description: none
	returns: nothing
*/

private ["_key","_handled","_moveButtons"];

_key = _this select 1;
_handled = false;
// Marty: Opening or closing the map is not activity by itself; map clicks are recorded in Client_HandleMapSingleClick.sqf.
_moveButtons = actionKeys "MoveBack" + actionKeys "MoveDown" + actionKeys "MoveForward" + actionKeys "MoveFastForward" + actionKeys "MoveLeft" + actionKeys "MoveRight";

if (_key in _moveButtons) then {
    WFBE_CO_VAR_NotAFK_update = true;
    _handled = false;
};

_handled;
