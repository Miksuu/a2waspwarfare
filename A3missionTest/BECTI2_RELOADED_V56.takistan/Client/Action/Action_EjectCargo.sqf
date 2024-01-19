Private ["_cargo","_vehicle"];

_vehicle = _this select 0;

//--- Get the crew.
_cargo = (crew _vehicle) - [driver _vehicle, gunner _vehicle, commander _vehicle];

{
	if (alive _x && _vehicle == vehicle _x) then {
		if (local _x) then {
			//--- Dealing with a local unit, probably an AI.
			
			[_x,true,false] call cti_CL_FNC_HALO_JUMP;
					
			
		} else {
			//--- Dealing with a player or a non local unit.
			if (isPlayer(leader (group _x))) then {
				["action-perform", _x, "EJECT", _vehicle] remoteExecCall ["cti_CL_FNC_HandleSpecial", leader(group _x)];
			};
		};
	};
	sleep 0.3;
} forEach _cargo;