/* 
	Author: Marty
	Name: OnEventHandler_player_radiated.sqf
	Parameters:
	0 - the name of the publicvalue montitored by the EH : PLAYER_RADIATED
	1 - the value of the publicvalue montitored by the EH set in the namespace. Here the player object who is radiated.
	
	Description: This function responds to the "PLAYER_RADIATED" variable, in order to play the script on the player's side.
	When a player is in the radiated area (see radzone.sqf), this broadcast a public variable PLAYER_RADIATED and trigger the eventHandler, playing this script here.
		    
*/
private["_PLAYER_radiated"];

_PLAYER_radiated = _this select 1;
diag_log format[ "1. DEBUG _PLAYER_radiated = %1 | type = %2", _PLAYER_radiated, typeName _PLAYER_radiated ];
diag_log format[ "2. DEBUG player = %1 | type = %2", player, typeName player ];


if (player == _PLAYER_radiated) then 
{
	playSound ["radiationSound",true];
};
