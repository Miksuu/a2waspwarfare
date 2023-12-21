/*
	Delegate town AI creation to an headless client.
	 Parameters:
		- Town
		- Side
		- Groups
		- Spawn positions
		- Teams
*/

Private ["_clients", "_groups", "_positions", "_side", "_teams", "_town"];

_town = _this select 0;
_side = _this select 1;
_groups = +(_this select 2);
_positions = +(_this select 3);
_teams = +(_this select 4);

//--- Delegate The groups to the miscelleanous headless clients.
for '_i' from 0 to count(_groups) -1 do {
	_clients = missionNamespace getVariable "WFBE_HEADLESSCLIENTS_ID";

	if (count _clients > 0) then {
		// Find the staticDefenceAIdelegation _hcType client
		_staticDefenceClient = _clients select {_x select 1 == "staticDefenceAIdelegation"} select 0;

		// If found, delegate the town AI creation to this client
		if (!isNil "_staticDefenceClient") then {
			[leader(_staticDefenceClient), "HandleSpecial", ['delegate-townai', _town, _side, [_groups select _i], [_positions select _i], [_teams select _i]]] Call WFBE_CO_FNC_SendToClient;
		};
	};
};