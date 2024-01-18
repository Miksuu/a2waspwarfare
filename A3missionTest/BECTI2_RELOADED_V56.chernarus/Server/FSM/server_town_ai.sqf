Private["_town","_range_detect_active","_position","_groups","_town_camps","_town_camps_count","_airHeight","_unitsInactiveMax","_patrol_delay","_patrol_enabled","_town_defender_enabled","_town_occupation_enabled"];

for "_j" from 0 to ((count towns) - 1) step 1 do
{
	_loc = towns select _j;
	["INITIALIZATION",Format ["server_town_ai.sqf : Initialized for [%1].", _loc getVariable "name"]] Call cti_CO_FNC_LogContent;
	sleep 0.01;
};

_range_detect_active = missionNamespace getVariable "cti_C_TOWNS_AI_SPAWN_RANGE";
//_range_detect_active_occupation = _range_detect_active / 3;

_range_detect_active_occupation = _range_detect_active;



_airHeight = missionNamespace getVariable "cti_C_TOWNS_DETECTION_RANGE_AIR";
_unitsInactiveMax = missionNamespace getVariable "cti_C_TOWNS_UNITS_INACTIVE";
_town_defender_enabled = if ((missionNamespace getVariable "cti_C_TOWNS_DEFENDER") > 0) then {true} else {false};
_town_occupation_enabled = if ((missionNamespace getVariable "cti_C_TOWNS_OCCUPATION") > 0) then {true} else {false};

for "_k" from 0 to ((count towns) - 1) step 1 do
{
	_town = towns select _k;
	_town setVariable ["cti_active", false];
	_town setVariable ["cti_active_air", false];
	_town setVariable ["cti_inactivity", 0];
	_town setVariable ['cti_town_teams',[]];
	_town setVariable ['cti_town_active_vehicles',[]];
	_town setVariable ['cti_active_vehicles', []];
	_town setVariable ['cti_town_teams', []];
	sleep 0.01;
};

while {!cti_GameOver} do {

	for "_i" from 0 to ((count towns) - 1) step 1 do
	{
		_position = [];
		_groups = [];

		_town = towns select _i;
		_sideID = _town getVariable "sideID";
		_side = (_sideID) Call cti_CO_FNC_GetSideFromID;

		if(_sideID != cti_C_UNKNOWN_ID) then {

            _detected = 0;
            if(_side != resistance && _side != civilian)then{
                _detected = (_town nearEntities ["AllVehicles",_range_detect_active_occupation]) unitsBelowHeight 20;
            }else{
                _detected = (_town nearEntities ["AllVehicles",_range_detect_active]) unitsBelowHeight 20;
            };

            _enemies = [_detected, _side] Call cti_CO_FNC_GetAreaEnemiesCount;

            if(_enemies > 0)then{

				_town setVariable ["cti_inactivity", time];

                if(!(_town getVariable "cti_active")) then {
                    _below = 1;
                    _enemies_ground = 1;

                    if(_enemies_ground > 0) then {
                        _town setVariable ["cti_active", true];

                        if (_side == cti_DEFENDER) then {
                            _groups = [_town, _side] Call cti_SE_FNC_GetTownGroupsDefender;
                        } else {
                            _groups = [_town, _side] Call cti_SE_FNC_GetTownGroups;
                        };
                    };

                    if(_enemies_ground == 0 && _enemies > 0) then {
                        if(!(_town getVariable "cti_active_air")) then {
                            _town setVariable ["cti_active_air", true];

                            if (_side == cti_DEFENDER) then {
                                _groups = [_town, _side, true] Call cti_SE_FNC_GetTownGroupsDefender;
                            } else {
                                _groups = [_town, _side, true] Call cti_SE_FNC_GetTownGroups;
                            };
                        };
                    };
                    //// start of creation
                    ["INFORMATION", Format ["server_town_ai.fsm: Town [%1] has been activated, creating defensive units for [%2].", _town, _side]] Call cti_CO_FNC_LogContent;

                    if (missionNamespace getVariable Format ["cti_%1_PRESENT",_side]) then {[_side,"HostilesDetectedNear",_town] Spawn cti_SE_FNC_SideMessage};

                    //--- Get the positions and create the groups
                    _camps = +(_town getVariable "camps");
                    _positions = [];
                    _spawn_radius = 10;
                    for '_i' from 0 to count(_groups)-1 do {
                        _position = [];
                        if (count _camps > 0 && random 100 > 25) then {
                            _camp = _camps select floor (random count _camps);
                            _index = _camps find _camp;
                            if(_index > -1)then{_camps deleteAt _index};

                            _position = ([getPosATL _camp, _spawn_radius] call cti_CO_FNC_GetSafePlace);
                        } else {
                            _position = ([getPosATL _town, _spawn_radius] call cti_CO_FNC_GetSafePlace);
                        };
                        _positions pushBack _position;
                        _spawn_radius = _spawn_radius + 15;
                    };

                    [_town, _side, "spawn"] spawn cti_SE_FNC_OperateTownDefensesUnits;

                    if (count(missionNamespace getVariable "cti_HEADLESSCLIENTS_ID") > 0) then {
                        [_town, _side, _groups, _positions] spawn cti_SE_FNC_DelegateAITownHeadless
                    }else {
                        [_town, _side, _groups, _positions] spawn cti_CO_FNC_CreateTownUnits;
                    };
                    //// end of creating
                };
            };

			if((_town getVariable "cti_active") || (_town getVariable "cti_active_air")) then {
				    if(time - (_town getVariable "cti_inactivity") > _unitsInactiveMax) then {
                        _town setVariable ["cti_active", false];
                        _town setVariable ["cti_active_air", false];

                        if!(isNil "headlessClients") then {
                            if(count headlessClients > 0)then{
                                _hc = headlessClients select 0;
                                [_town getVariable "name"] remoteExecCall ["cti_CL_FNC_RemoveTownAI", _hc];
                            };
                        } else {
                            //--- Teams Units.
                            {
                                if !(isNil '_x') then {
                                    if !(isNull _x) then {
                                        {deleteVehicle _x} forEach units _x;
                                        deleteGroup _x;
                                    };
                                };
                            } forEach (_town getVariable 'cti_town_teams');

                            //--- Teams vehicles.
                            {
                                if (alive _x) then {
                                    if (!(isPlayer leader group _x)) then {deleteVehicle _x};
                                };
                            } forEach (_town getVariable 'cti_active_vehicles');
                            _town setVariable ['cti_active_vehicles', []];
                        };
                        //--- Despawn the town defenses unit.
                        [_town, _side, "remove"] Call cti_SE_FNC_OperateTownDefensesUnits;
                        //// end of inner block
                    };
			};
		};
		sleep 0.05;
	};

	sleep 5;

};