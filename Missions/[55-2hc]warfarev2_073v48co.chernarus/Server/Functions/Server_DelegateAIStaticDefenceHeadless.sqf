/*
	Delegate town AI creation to an headless client.
	 Parameters:
		- Side
		- Groups
		- Spawn positions
		- Teams
		- Defence
		- Move In Gunner immidietly or not
*/

Private ["_clients", "_groups", "_positions", "_side", "_teams"];

_side = _this select 0;
["DEBUG", Format ["Server_DelegateAIStaticDefenceHeadless.sqf: Debug info [_side] [%1]", _side]] Call WFBE_CO_FNC_LogContent;

_groups = +(_this select 1);
["DEBUG", Format ["Server_DelegateAIStaticDefenceHeadless.sqf: Debug info [_groups] [%1]", _groups]] Call WFBE_CO_FNC_LogContent;

_positions = +(_this select 2);
["DEBUG", Format ["Server_DelegateAIStaticDefenceHeadless.sqf: Debug info [_positions] [%1]", _positions]] Call WFBE_CO_FNC_LogContent;

_team = _this select 3;
["DEBUG", Format ["Server_DelegateAIStaticDefenceHeadless.sqf: Debug info [_team] [%1]", _team]] Call WFBE_CO_FNC_LogContent;

_defence = _this select 4;
["DEBUG", Format ["Server_DelegateAIStaticDefenceHeadless.sqf: Debug info [_defence] [%1]", _defence]] Call WFBE_CO_FNC_LogContent;

_moveInGunner = _this select 5;
["DEBUG", Format ["Server_DelegateAIStaticDefenceHeadless.sqf: Debug info [_moveInGunner] [%1]", _moveInGunner]] Call WFBE_CO_FNC_LogContent;


//--- Delegate The groups to the miscelleanous headless clients.
for '_i' from 0 to count(_groups) -1 do {
	_clients = missionNamespace getVariable "WFBE_HEADLESSCLIENTS_ID";
	["DEBUG", Format ["Server_DelegateAIStaticDefenceHeadless.sqf: Debug info [_clients] [%1]", _clients]] Call WFBE_CO_FNC_LogContent;

	if (count _clients > 0) then {
		[leader(_clients select floor(random count _clients)), "HandleSpecial", ['delegate-ai-static-defence', _side, [_groups select _i], [_positions select _i], _team, _defence, _moveInGunner]] Call WFBE_CO_FNC_SendToClient;
	};
};