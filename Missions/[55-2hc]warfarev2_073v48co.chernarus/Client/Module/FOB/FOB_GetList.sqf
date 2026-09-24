/*
	Author: Marty
	Return the alive FOBs of the player's side.
*/

Private ["_alive","_fobs"];

_fobs = WFBE_Client_Logic getVariable "wfbe_fobs";
if (isNil '_fobs') then {_fobs = []};

_alive = [];
{if (alive _x) then {_alive set [count _alive, _x]}} forEach _fobs;

_alive
