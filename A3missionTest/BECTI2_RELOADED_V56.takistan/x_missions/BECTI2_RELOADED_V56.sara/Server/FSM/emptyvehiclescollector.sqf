private["_vehicles", "_vehicles2","_reloaded"];

while {!cti_GameOver} do {
	_vehicles = WF_Logic getVariable "emptyVehicles";

	{
		if !(_x in emptyQueu) then {
			_vehicles2 = WF_Logic getVariable "emptyVehicles";
			emptyQueu pushBack _x;
			[_x] Spawn cti_SE_FNC_HandleEmptyVehicle;
			_reloaded = _vehicles2 - [_x] - [objNull];
			WF_Logic setVariable ["emptyVehicles",_reloaded,true];
		};
	} forEach _vehicles;
	sleep 0.5
};