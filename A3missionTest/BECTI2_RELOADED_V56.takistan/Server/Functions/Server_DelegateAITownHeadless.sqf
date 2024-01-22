/*
	Delegate town AI creation to an headless client.
	 Parameters:
		- Town
		- Side
		- Groups
		- Spawn positions
*/

Private ["_groups", "_positions", "_side", "_teams", "_town"];

_town = _this select 0;
_side = _this select 1;
_groups = _this select 2;
_positions = _this select 3;

//--- Delegate The groups to the miscelleanous headless clients.
if!(isNil "headlessClients")then{
	if(count headlessClients > 0)then{
		_hc = headlessClients select 0;
		[_town, _side, _groups, _positions] remoteExecCall ["cti_CL_FNC_DelegateTownAI", _hc];
	};
};