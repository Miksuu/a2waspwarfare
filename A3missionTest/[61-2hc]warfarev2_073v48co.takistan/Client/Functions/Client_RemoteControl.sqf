/*
  # HEADER #
	Script: 		Client\Functions\Client_RemoteControl.sqf
	Alias:			CTI_CL_FNC_RemoteControl
	Description:	
	Author: 		JEDMario
	Creation Date:	07-01-2018
	Revision Date:	09-01-2018
	
  # PARAMETERS #
    0	[String]: The entity classname
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[OBJECT] call CTI_CL_FNC_CanRemoteUnit
	
  # DEPENDENCIES #
	None
	
  # EXAMPLE #
    _this call CTI_CL_FNC_CanRemoteUnit;
*/
	
params ["_unit"];
player connectTerminalToUAV (vehicle(_unit));
(_unit) spawn {
	private ["_actions"];
	CTI_P_Controlled = _this;
	_actions = (_this) call CTI_CL_FNC_AddRemoteActionsToUnit;
	while {alive _this && alive player && (vehicle _this isEqualTo cameraOn) && !(vehicle _this == vehicle player)} do {
	};
	CTI_P_Controlled = player;
	objNull remoteControl _this;
	
	sleep 1;

	player connectTerminalToUAV objNull;
	vehicle (player) switchCamera 'Internal';
};

player remoteControl (_unit);
(vehicle _unit) switchCamera 'Internal';