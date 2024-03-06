Private ["_nearby","_group"];

_nearby = _this select 0;

if!(_nearby)then{
	{
		_group = _x;
		{
			//deleteVehicle _x;2024_0227
			_x call CTI_CO_FNC_DELETE;
			
		} forEach (units _x);

		deleteGroup _group;
		
	} forEach cti_HC_BasePatrolTeams;
};
cti_HC_BasePatrolTeams = cti_HC_BasePatrolTeams - [objNull];