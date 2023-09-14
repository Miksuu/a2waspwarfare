private ["_posX", "_posY", "_multiplyMatrixFunc"];

_azi 	= _this select 0;
_pos 	= _this select 1;
_campObject = _this select 2;
_town = _this select 3;
_objs   = missionNamespace getVariable "";
_posX = _pos select 0;
_posY = _pos select 1;
_defences = [];
_fortifications = [];
_static_kind = ['MG'];
_multiplyMatrixFunc = {
	private ["_array1", "_array2", "_result"];
	_array1 = _this select 0;
	_array2 = _this select 1;
	_result =
	[
		(((_array1 select 0) select 0) * (_array2 select 0)) + (((_array1 select 0) select 1) * (_array2 select 1)),
		(((_array1 select 1) select 0) * (_array2 select 0)) + (((_array1 select 1) select 1) * (_array2 select 1))
	];
	_result
};

for "_i" from 0 to ((count _objs) - 1) do {
	private ["_obj", "_type", "_relPos", "_azimuth", "_newObj"];
	_obj = _objs select _i;
	_type = _obj select 0;
	_relPos = _obj select 1;
	_azimuth = _obj select 2;

	private ["_rotMatrix", "_newRelPos", "_newPos", "_z"];
	_rotMatrix =[[cos _azi, sin _azi],[-(sin _azi), cos _azi]];
	_newRelPos = [_rotMatrix, _relPos] call _multiplyMatrixFunc;

	if ((count _relPos) > 2) then {_z = _relPos select 2;} else {_z = 0;};
	_newPos = [_posX + (_newRelPos select 0), _posY + (_newRelPos select 1), _z];

	if(_type == (missionNamespace getVariable "cti_C_CAMP"))then{
		_newObj = _campObject;
	} else {
	    if!(_type in cti_C_STATIC_DEFENCE_FOR_COMPOSITIONS)then{
	        _newObj = createSimpleObject [_type, [0,0,0]];
            _newObj setPosATL _newPos;
            _newObj setVectorUp surfaceNormal position _newObj;
	    }else{
	        _newObj = _type createVehicle [0,0,500];
            _newObj enableSimulation false;
            _newObj setPosATL _newPos;
	        [_newObj] spawn {sleep 3; (_this select 0) enableSimulation true};
	        _newObj enableDynamicSimulation true;
	    }
	};

    if(_type != (missionNamespace getVariable "cti_C_CAMP"))then{
        if(_type in cti_C_STATIC_DEFENCE_FOR_COMPOSITIONS)then{
            _newObj setVariable ['cti_defense_kind', _static_kind];
            _newObj setVariable ["cti_defense", _newObj];
            _defences pushBack _newObj;
        }else{
            _fortifications pushBack _newObj;
        }
    };

	_newObj setDir (_azi + _azimuth);
	_newObj setPosATL _newPos;
	_newObj setVectorUp surfaceNormal position _newObj;
};

_town_defences_composition = _town getvariable "cti_town_defenses_composition";
if(isNil "_town_defences_composition")then{
    _town setVariable ["cti_town_defenses_composition", _defences];
}else{
    for "_i" from 0 to ((count _defences) - 1) do
    {
        _town_defences_composition pushBack (_defences select _i);
    };
    _town setVariable ["cti_town_defenses_composition", _town_defences_composition];
};

_town_fortifications_composition = _town getvariable "cti_town_fortifications_composition";
if(isNil "_town_fortifications_composition")then{
    _town setVariable ["cti_town_fortifications_composition", _fortifications];
}else{
    for "_i" from 0 to ((count _fortifications) - 1) do
    {
        _town_fortifications_composition pushBack (_fortifications select _i);
    };
    _town setVariable ["cti_town_fortifications_composition", _town_fortifications_composition];
};