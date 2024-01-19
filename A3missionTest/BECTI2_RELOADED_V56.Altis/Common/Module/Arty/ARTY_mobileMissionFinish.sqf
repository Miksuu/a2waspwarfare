Private ["_lookPos","_vehicle"];

_vehicle = _this select 0;

// Lower gun/missile racks.
//_lookPos = [(getPos _vehicle select 0) + sin(getDir _vehicle)*20, (getPos _vehicle select 1) + cos(getDir _vehicle)*20, (getPos _vehicle select 2) - 5];

sleep 10;

_lookPos = [(getPos _vehicle select 0) + sin(getDir _vehicle)*20, (getPos _vehicle select 1) + cos(getDir _vehicle)*20, (getPos _vehicle select 2)+1 ];


if (alive (driver _vehicle)) then {
	{(driver _vehicle) enableAI _x} forEach ["MOVE","TARGET","AUTOTARGET"];
};
sleep 3;
for "_i" from 0 to 2 do {(gunner _vehicle) lookAt _lookPos;};

{_gunner enableAI _x} forEach ['ANIM',"MOVE","TARGET","AUTOTARGET"];

