/*
	Client OnFired events.
	 Scope: Client.
*/

/*
	Triggered whenever the player place a satchel.
	 Parameters:
		- unit: Object - Object the event handler is assigned to
		- projectile: object - Object of the projectile that was shot
*/
cti_CL_FNC_OnFiredSatchel = {
	Private ["_closest", "_projectile", "_side_structures", "_unit"];

	_unit = _this select 0;
	_projectile = _this select 1;

	//--- Retrieve the side structures.
	_side_structures = (cti_Client_SideJoined Call cti_CO_FNC_GetSideStructures) + [cti_Client_SideJoined Call cti_CO_FNC_GetSideHQ];

	//--- Get the closest structure.
	_closest = [_unit, _side_structures] Call cti_CO_FNC_GetClosestEntity;

	//--- Check the distance between the _unit and the closest friendly building.
	if (_closest distance _unit < 30) then {
		deleteVehicle _projectile;

		//--- Show ID
		_uid = getPlayerUID _unit;

		//--- Notify about the TK attempt.
		['StructureTK', name _unit, _uid, _closest, cti_Client_SideJoinedText] remoteExecCall ["cti_CL_FNC_LocalizeMessage"];
	};
};

//--- Handle the client Firing.
cti_CL_FNC_OnFired = {
	if ((_this select 4) == "PipeBomb") then {[_this select 0, _this select 6] Spawn cti_CL_FNC_OnFiredSatchel}; //--- Satchel Handler.
};