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
							//deleteVehicle _x;2024_0227
							_x call CTI_CO_FNC_DELETE;
							if!(isNil "_vehicle") then {
							
								//deleteVehicle _vehicle;2024_0227
								_vehicle call CTI_CO_FNC_DELETE;
							}
						} forEach units _x;
						deleteGroup _x;
						
					};
				};
			} forEach _town_teams;
			
			{
				if (!(isPlayer leader group _x)) then {
				
				//deleteVehicle _x//2024_0227
				_x call CTI_CO_FNC_DELETE
				};
			} forEach (_town_vehicles);
			
			_town setVariable ['cti_town_teams', []];
			_town setVariable ['cti_town_active_vehicles', []];
		
		};
	
	};

};




