/*
	Delegate town AI creation to an headless client.
	 Parameters:
		- Side
		- Groups
		- Spawn positions
		- Teams
*/

Private ["_groups", "_positions", "_side", "_teams"];

_side = _this select 0;
_unitType = _this select 1;
_position = _this select 2;
_team = _this select 3;
_dir = _this select 4;
_special = if(count _this > 5) then{_this select 5};

//--- Delegate The groups to the miscelleanous headless clients.
if!(isNil "headlessClients") then {
	if(count headlessClients > 0)then{
		_hc = headlessClients select 0;
		if(isNil '_special')then{
		    ['delegate-ai', _side, _unitType, _position, _team, _dir] remoteExecCall ["cti_CL_FNC_HandleSpecial", _hc];
		} else {
		    ['delegate-ai', _side, _unitType, _position, _team, _dir, _special] remoteExecCall ["cti_CL_FNC_HandleSpecial", _hc];
		};
	};
};


