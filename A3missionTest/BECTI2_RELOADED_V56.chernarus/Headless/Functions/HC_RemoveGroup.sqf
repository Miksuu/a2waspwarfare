Private ["_nearby","_group"];

_nearby = _this select 0;

if!(_nearby)then{
	{
		_group = _x;
		{
			deleteVehicle _x;
		} forEach (units _x);

		deleteGroup _group;
		
	} forEach cti_HC_BasePatrolTeams;
};
cti_HC_BasePatrolTeams = cti_HC_BasePatrolTeams - [objNull];