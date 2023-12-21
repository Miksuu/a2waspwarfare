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
	["DEBUG", Format ["Server_DelegateAITownHeadless.sqf: Debug info [_clients] [%1]", _clients]] Call WFBE_CO_FNC_LogContent;

	if (count _clients > 0) then {
		// Find the AI TownDefence Client from _hcType client
		_aiTownDefenceClient = objNull;
		{
			if ((_x select 1) == "delegateTownAI") then {
				_aiTownDefenceClient = (_x select 0);
				exitWith {};
			};
		} forEach _clients;

		["DEBUG", Format ["Server_DelegateAITownHeadless.sqf: Debug info [_aiTownDefenceClient] [%1]", _aiTownDefenceClient]] Call WFBE_CO_FNC_LogContent;

		// If found, delegate the town AI creation to this client
		if (!isNil "_aiTownDefenceClient") then {
			[leader(_aiTownDefenceClient), "HandleSpecial", ['delegate-townai', _town, _side, [_groups select _i], [_positions select _i], [_teams select _i]]] Call WFBE_CO_FNC_SendToClient;
			["DEBUG", Format ["Server_DelegateAITownHeadless.sqf: Debug info [delegate-townai] [%1, %2, %3, %4, %5]", _town, _side, [_groups select _i], [_positions select _i], [_teams select _i]]] Call WFBE_CO_FNC_LogContent;
		};
	};
};