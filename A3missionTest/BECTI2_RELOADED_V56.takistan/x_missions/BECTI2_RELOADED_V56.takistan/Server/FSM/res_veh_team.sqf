private["_side", "_template", "_buildings", "_status", "_building", "_light", "_heavy", "_air",
"_destination", "_orderComplete", "_end", "_inf_group"];

_side = _this select 0;
_template = _this select 1;
_building = _this select 2;
_status = _this select 3;
_createAdditionalCrew = _this select 4;
_additionalSlotsAmount = if (count _this > 5) then {_this select 5} else {-1};

_destination = objNull;
_end = false;
_alives = [];
_inf_group = nil;
if(count _alives == 0) then{
	{
	    _inf_group = createGroup [_side, true];		
		_kindDetail = missionNamespace getVariable _x;
		_crews = _kindDetail select QUERYUNITCREW;
		if !(isNull _building) then {
			_vehiSlots = [true,false,false,_createAdditionalCrew];
            _IDS = [];
            if (typeName _crews == "ARRAY") then {
                if (_crews select 0) then {_vehiSlots set [2, true]};
                if (_crews select 1) then {_vehiSlots set [1, true]};
                /*if ((_crews select 3) > 0) then {_vehiSlots set [3, true]};*/

                {
                    _ran = 2000 + random(10) + random (100) + random(1000);
                    _IDS set [count _IDS, _ran];
                } forEach _vehiSlots;
            } else {
                if (_crews < 3 && _crews != 1) then {
                    _ran2 = 2000 + random(10) + random (100) + random(1000);
                    _vehiSlots = [true,true,false];
                    _IDS pushBack _ran2;
                };
                if (_crews > 2) then {
                    _ran2 = 2000 + random(10) + random (100) + random(1000);
                    _ran3 = 2000 + random(10) + random (100) + random(1000);
                    _vehiSlots = [true,true,true];
                    _IDS pushBack _ran2;
                    _IDS pushBack _ran3;
                };
            };
			[_IDS,_building,_x,_side,_inf_group,_vehiSlots,_additionalSlotsAmount] call cti_SE_FNC_Server_ResBuyUnit;
		};
	} forEach _template;
};


/*
while{!_end}do{

	_alives = (units _inf_group) Call cti_CO_FNC_GetLiveUnits;
	if(count _alives > 0)then{
	    WF_Logic setVariable [_status,true];
		_end = false;
	} else {
	    WF_Logic setVariable [_status,false];
		_end = true;
	};

    _nearTowns = [];
    _near = [];
    _allSortedTownsByDistance = [getPosATL (leader _inf_group),towns] Call cti_CO_FNC_SortByDistance;
    for [{_i = 0},{_i < 4},{_i = _i + 1}] do { _near pushBack (_allSortedTownsByDistance select _i) };

    if (count _near > 0) then {
        for [{_z = 0},{_z < 4},{_z = _z + 1}] do {
            _isInserted = false;
            while{!_isInserted}do{
                _selectedRandomTown = selectRandom _near;
                if!(_selectedRandomTown in _nearTowns)then{
                    _nearTowns pushBack (_selectedRandomTown);
                    _isInserted = true;
                };
            };
        };
    };

    [_inf_group,_nearTowns,400,'LINE'] Call cti_SE_FNC_AITownPatrol;

	sleep 60;
};
*/

_leader=leader _inf_group;

[_leader,getPosATL _leader, 5000, 10] call cti_CO_FNC_Streetwaypoints;