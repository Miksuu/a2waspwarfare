Private ["_destination","_maxWaypoints","_pos","_radius","_rand1","_rand2","_team","_type","_update","_wps","_z"];
_team = _this select 0;
_destinations = _this select 1;
_radius = if (count _this > 2) then {_this select 2} else {30};
_formation = if (count _this > 3) then {_this select 3} else {"DIAMOND"};

_team setCombatMode "RED";
_team setBehaviour "COMBAT";
_team setFormation _formation;
_team setSpeedMode "FULL";

_wps = [];
for [{_z=0},{_z<=(count _destinations)-1},{_z=_z+1}] do {
	_rand1 = random _radius - random _radius;
	_rand2 = random _radius - random _radius;
	_destination = getPosATL (_destinations select _z);
	_pos = [(_destination select 0)+_rand1,(_destination select 1)+_rand2,0];
	while {surfaceIsWater _pos} do {
		_rand1 = random _radius - random _radius;
		_rand2 = random _radius - random _radius;
		_pos = [(_destination select 0)+_rand1,(_destination select 1)+_rand2,0];
	};
	_type = if (_z != (count _destinations)-1) then {'MOVE'} else {'CYCLE'};
	_wps pushBack ([_pos,_type,35,40,"",[]]);
};

["INFORMATION", Format ["AI_Patrol.sqf: [%1] Team [%2] is patrolling at [%3].", side _team,_team,_destination]] Call cti_CO_FNC_LogContent;

[_team, true, _wps] Call cti_SE_FNC_AIWPAdd;