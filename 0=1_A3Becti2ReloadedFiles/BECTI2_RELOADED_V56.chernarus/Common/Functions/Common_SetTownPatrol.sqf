Private["_location","_team","_sideID","_focus","_lastSV","_startSV","_mode","_lastMode","_patrol_range","_defense_range"];

_location = _this select 0;
_team = _this select 1;
_sideID = _this select 2;
_focus = if (count _this > 3) then {_this select 3} else {objNull};

_lastSV = _location getVariable 'supplyValue';
_startSV = _location getVariable 'startingSupplyValue';
_mode = "patrol";
_lastMode = "nil";

_patrol_range = missionNamespace getVariable 'cti_C_TOWNS_PATROL_RANGE';
_defense_range = missionNamespace getVariable 'cti_C_TOWNS_DEFENSE_RANGE';
_aliveTeam = if (count ((units _team) Call cti_CO_FNC_GetLiveUnits) == 0 || isNull _team) then {false} else {true};


//-------------------------added AI System---------------------------

_leader=leader _team;

if ((missionNamespace getVariable "cti_C_AI_SYSTEM") == 2) then {


if (vehicle _leader != _leader) then { //CAR OR TANK SPAWN STAYS ON ROAD

 
[_leader,getPosATL _leader, 600, 10] call cti_CO_FNC_Streetwaypoints;

}else{


[group _leader, getPosATL _leader] call cti_CO_FNC_taskDefend};

};

//-------------------------------------------------------------------------------------

if ((missionNamespace getVariable "cti_C_AI_SYSTEM") == 1) then {


if (vehicle _leader != _leader) then { //CAR OR TANK SPAWN STAYS ON ROAD

 
[_leader,getPosATL _leader, 600, 10] call cti_CO_FNC_Streetwaypoints;

}else{


[group _leader, getPosATL _leader] call cti_CO_FNC_taskDefend};

};

//---------------------------------------------------------------------------------------

if ((missionNamespace getVariable "cti_C_AI_SYSTEM") == 0) then {



while {!cti_GameOver || _aliveTeam} do {
	
	



	
	_aliveTeam = if (count ((units _team) Call cti_CO_FNC_GetLiveUnits) == 0 || isNull _team) then {false} else {true};

	_currentSV = _location getVariable 'supplyValue';
	if (_currentSV < _lastSV || _currentSV < _startSV || _sideID != (_location getVariable 'sideID')) then {
		_mode = "defense";
	} else {
		_mode = "patrol";
	};

	_lastSV = _currentSV;
	
	if(_aliveTeam && _mode != _lastMode && !cti_GameOver) then {
		_lastMode = _mode;

		if (_mode == "patrol") then {
			if (isNull _focus) then {
				
				//[group _team,[getPos nearestLocation [getPos _team, "CityCenter"]],200] call BIS_fnc_taskPatrol;

				 //[getPos nearestLocation [getPos _team, "CityCenter"]];
				//[_team, 300, _location, _location, 300, "AWARE", 100, "LIMITED", "FILE", 0, 0]  spawn cti_SE_ULTRASIMPELPATROLSCRIPT;
	

				[_team,_location,_patrol_range] Spawn cti_CO_FNC_WaypointPatrolTown;
			} else {
				
				
				//[group this,[position nearestLocation [getPos this, "CityCenter"]],50] call BIS_fnc_taskPatrol;

				//[group this,getpos this,50] call BIS_fnc_taskPatrol;
				//[_team, 300, _location, _location, 75, "AWARE", 100, "LIMITED", "FILE", 0, 0]  spawn cti_SE_ULTRASIMPELPATROLSCRIPT;
	
				[_team,_focus,_patrol_range/4] call cti_CO_FNC_WaypointPatrol;
			};
		} else {
			
			//[group _team,[getPos nearestLocation [getPos _team, "CityCenter"]],200] call BIS_fnc_taskPatrol;

			
			[_team,getPos _location,'SAD',_defense_range] Spawn cti_CO_FNC_WaypointSimple;
		
		
		};
	};
	sleep 30;
	
};

};
