_location = _this select 0;
_sideID = _this select 1;
_side = (_sideID) Call cti_CO_FNC_GetSideFromID;

_team_job = "patrol";
_team_target = objNull;
_team_alive = false;
_town_reuse = floor(totalTowns * 0.25);
_town_vehicle_lock_defender = if ((missionNamespace getVariable "cti_C_TOWNS_VEHICLES_LOCK_DEFENDER") > 0) then {true} else {false};
_towns_visited = [_location];

_group = [_location, _side] Call cti_SE_FNC_GetTownPatrol;

_team = objNull;
if (count _group > 0) then {
	_team_alive = true;
	_team = createGroup [_side, true];
	_position = ([getPos _location, 50, 500] Call cti_CO_FNC_GetRandomPosition);
	_position = [_position, 50] Call cti_CO_FNC_GetEmptyPosition;
	_lock = if (_side == cti_DEFENDER) then {_town_vehicle_lock_defender} else {true};
	_retVal = [_group, _position, _side, _lock, _team] Call cti_CO_FNC_CreateTeam;
};

while {!cti_GameOver || _team_alive} do {

	_team_alive = if (count ((units _team) Call cti_CO_FNC_GetLiveUnits) == 0 || isNull _team) then {false} else {true};
	
	if(_team_job == "capture" && !cti_GameOver && _team_alive) then {
		if ((_team_target getVariable "sideID") == _sideID) then {
		//--- Captured, the team can move on.
		_towns_visited pushBack _team_target;
		_team_target = objNull;
		_team_job = "patrol";

		//todo, rearm, repair, refuel.
		};
	};
	
	if(_team_job == "patrol" && !cti_GameOver && _team_alive)then{
		if(isNull _team_target) then{
			//--- Refresh the town list which can be visited.
			if (count _towns_visited > _town_reuse ) then {
				_towns_visited deleteAt 0;
			};

			//--- Get the closest location which is available to the patrol while excluding previously visited towns.
			_team_target = [_location, towns - _towns_visited] Call cti_CO_FNC_GetClosestEntity;

			//--- Tell our patrol to move to the depot.
			[_team, getPos _team_target, 'MOVE', 25] Spawn cti_CO_FNC_WaypointSimple;
		};
		if(!isNull _team_target) then {
			if ((leader _team) distance _team_target < 200) then {
				_town_capturable = true;
				if ((_team_target getVariable "sideID") == _sideID && _town_capturable) then {
				//--- Town is friendly, don't bother.
				_towns_visited pushBack _team_target;
				_team_target = objNull;
				} else {
					//--- Attempt to capture the town.
					_team_job = "capture";
				};
			};
		};
	};
	sleep 30;
};

_location setVariable ["cti_patrol_active", false];
_location setVariable ["cti_patrol_active_last", time];