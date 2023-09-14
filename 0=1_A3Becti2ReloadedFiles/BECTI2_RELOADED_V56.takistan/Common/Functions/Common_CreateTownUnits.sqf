/*
	Create units in towns.
	 Parameters:
		- Town
		- Side
		- Groups
		- Spawn positions
		- Teams
*/

Private ["_groups", "_lock", "_position", "_positions", "_side", "_sideID", "_team", "_teams", "_town", "_town_teams", "_town_vehicles", "_retVal"];

_town = _this select 0;
_side = _this select 1;
_groups = _this select 2;
_positions = _this select 3;
_town_teams = [];
_sideID = (_side) call cti_CO_FNC_GetSideID;
_built = 0;
_builtveh = 0;

if!(isNil "Headless_Client_Towns")then{
	if(_town in Headless_Client_Towns)then{
		for '_a' from 0 to count(Headless_Client_Towns)-1 do { 
			_kept_town = Headless_Client_Towns select _a;
			if(_town getVariable "name" == _kept_town getVariable "name")then{_town = _kept_town};
		};
	}else{
		Headless_Client_Towns pushBackUnique _town
	};
};

_lock = if ((missionNamespace getVariable "cti_C_TOWNS_VEHICLES_LOCK_DEFENDER") == 0 && _side == cti_DEFENDER) then {false} else {true};

_town_teams = [];
_town_vehicles = [];



_camps = _town getVariable "camps";
_c = 0;
for '_i' from 0 to count(_groups)-1 do {
	_position = _positions select _i;

	_team = createGroup [_side, true];
	
	["INFORMATION", Format["Common_CreateTownUnits.sqf: Town [%1] [%2] will create a team template %3 at %4", _town, _team, _groups select _i,_position]] Call cti_CO_FNC_LogContent;

	_retVal = [_groups select _i, _position, _side, _lock, _team, true, 90, _town] call cti_CO_FNC_CreateTeam;
	_units = _retVal select 0;
	_vehicles = _retVal select 1;
	_built = _built + count _units;
	_builtveh = _builtveh + (count _vehicles);

    if(count _vehicles > 0) then {
       

	   [_town, _team, _sideID] spawn cti_CO_FNC_SetPatrol;
       [_team, 300, _position] spawn cti_CO_FNC_RevealArea;

   }else{

 



        [_town, _team, _sideID] spawn cti_CO_FNC_SetPatrol;
		[_team, 300, _position] spawn cti_CO_FNC_RevealArea;

			

	  
    };
	//[_town, _team, _sideID] spawn cti_CO_FNC_SetPatrol;
	//[_team, 175, _position] spawn cti_CO_FNC_RevealArea;

	{ _town_vehicles pushBack _x; } forEach _vehicles;
	_town_teams pushBack _team;
	
	if (isServer) then {
		{
			_town_vehicles pushBack _x;
			[_x] spawn cti_SE_FNC_HandleEmptyVehicle;
			_x setVariable ["cti_Taxi_Prohib", true];
		} forEach _vehicles;
	};

	_team allowFleeing 0; //--- Make the units brave.
	sleep 0.005;
};


if (_built > 0) then {[str _side,'UnitsCreated',_built] call cti_CO_FNC_UpdateStatistics};
if (_builtveh > 0) then {[str _side,'VehiclesCreated',_builtveh] call cti_CO_FNC_UpdateStatistics};

["INFORMATION", Format["Common_CreateTownUnits.sqf: Town [%1] held by [%2] was activated witha total of [%3] units.", _town, _side, _built + _builtveh]] Call cti_CO_FNC_LogContent;

_town setVariable ['cti_active_vehicles', (_town getVariable 'cti_active_vehicles') + _town_vehicles];
_town setVariable ['cti_town_teams', (_town getVariable 'cti_town_teams') + _town_teams];