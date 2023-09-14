Private ["_townName"];

_receivedTownName = _this select 0;
if(count(Headless_Client_Towns) > 0) then {
	
	for '_i' from 0 to count(Headless_Client_Towns)-1 do {
		
		_town = Headless_Client_Towns select _i;
		_townName = _town getVariable "name";
		
		
		if(_townName == _receivedTownName)exitWith{
		
			_town_teams = _town getVariable "cti_town_teams";
			_town_vehicles = _town getVariable "cti_town_active_vehicles";
		
			//--- Teams Units.
			{
				if !(isNil '_x') then {
					if !(isNull _x) then {
						{
							_vehicle = vehicle _x;
							deleteVehicle _x;
							if!(isNil "_vehicle") then {
								deleteVehicle _vehicle;
							}
						} forEach units _x;
						deleteGroup _x;
						
					};
				};
			} forEach _town_teams;
			
			{
				if (!(isPlayer leader group _x)) then {deleteVehicle _x};
			} forEach (_town_vehicles);
			
			_town setVariable ['cti_town_teams', []];
			_town setVariable ['cti_town_active_vehicles', []];
		
		};
	
	};

};




