/*
  # HEADER #
	Script: 		Client\Functions\Client_CanRemoteUnit.sqf
	Alias:			CTI_CL_FNC_CanRemoteUnit
	Description:	Function to be used to determine if a unit can be controlled by the Player
	Author: 		JEDMario
	Creation Date:	07-01-2018
	Revision Date:	07-01-2018
	
  # PARAMETERS #
    0	[String]: The entity classname
	
  # RETURNED VALUE #
	[BOOLEAN]: 
	
  # SYNTAX #
	[OBJECT] call CTI_CL_FNC_CanRemoteUnit
	
  # DEPENDENCIES #
	None
	
  # EXAMPLE #
    _unit call CTI_CL_FNC_CanRemoteUnit;
*/

params ["_unit"];
private ["_canRemote"];

_canRemote = false;
//if (alive _unit && alive player && local _unit && _unit in units group player && !(uavControl (vehicle(_unit)) select 0 == player) && !(vehicle _unit == vehicle player) && CTI_P_Controlled == player && _unit != player && (gunner (vehicle _unit) != _unit || (vehicle _unit) == _unit)) then {
//if (alive _unit && alive player && local _unit && _unit in units group player && !(uavControl (vehicle(_unit)) select 0 == player) && !(vehicle _unit == vehicle player) && CTI_P_Controlled == player && _unit != player) then {

if (alive _unit && alive player && local _unit && _unit in units group player && !(uavControl (vehicle(_unit)) select 0 == player) && !(vehicle _unit == vehicle player) && _unit != player) then {

	_canRemote = true;
};
_canRemote