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
_groups = +(_this select 1);
_positions = +(_this select 2);
_team = _this select 3;
_defence = _this select 4;
_moveInGunner = _this select 5;

//--- Delegate The groups to the miscelleanous headless clients.
for '_i' from 0 to count(_groups) -1 do {
	if!(isNil "headlessClients") then {
		if(count headlessClients > 0)then{
			_hc = headlessClients select 0;
			['delegate-ai-static-defence', _side, [_groups select _i], [_positions select _i], _team, _defence, _moveInGunner] remoteExecCall ["cti_CL_FNC_HandleSpecial", _hc];
		};
	};
};