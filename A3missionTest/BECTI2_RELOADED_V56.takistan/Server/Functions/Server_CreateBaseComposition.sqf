private ["_posX", "_posY", "_multiplyMatrixFunc"];

_azi 	= _this select 0;
_lfResBasePositions = _this select 1;
_hfResBasePositions = _this select 2;
_afResBasePositions = _this select 3;

[_azi, _lfResBasePositions] Spawn {
    _azi = _this select 0;
    _lfResBasePositions = _this select 1;
    _positionsToBuildLF = [];

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

    if (count _lfResBasePositions > 0) then {
        while{count _positionsToBuildLF != 2} do {
            _selectedRandomLFBaseLocation = selectRandom _lfResBasePositions;
            if!(_selectedRandomLFBaseLocation in _positionsToBuildLF)then{
                if(count _positionsToBuildLF == 0)then{
                    _positionsToBuildLF pushBack (_selectedRandomLFBaseLocation);
                }else{
                    for [{_i = 0},{_i < count _positionsToBuildLF},{_i = _i + 1}] do {
                        _canPush = true;
                        _storedPosition = getPosATL ((_positionsToBuildLF select _i)select 0);
                        _selectedRandomLFBasePosition = getPosATL (_selectedRandomLFBaseLocation select 0);
                        if(_storedPosition distance _selectedRandomLFBasePosition < 4000) then{
                            _canPush = false;
                        };
                        if(_i == (count _positionsToBuildLF) - 1 && _canPush)then{
                            _positionsToBuildLF pushBack (_selectedRandomLFBaseLocation);
                        };
                    };

                };
            };
        };

        _objs   = missionNamespace getVariable "cti_NEURODEF_RESISTANCE_LF";
        for [{_i = 0},{_i < count _positionsToBuildLF},{_i = _i + 1}] do {
            _location = _positionsToBuildLF select _i;
            _pos = getPosATL (_location select 0);
            _posX = _pos select 0;
            _posY = _pos select 1;
            _defences = [];
            for "_j" from 0 to ((count _objs) - 1) do {
            	private ["_obj", "_type", "_relPos", "_azimuth", "_newObj"];
            	_obj = _objs select _j;
            	_type = _obj select 0;
            	_relPos = _obj select 1;
            	_azimuth = _obj select 2;

            	private ["_rotMatrix", "_newRelPos", "_newPos", "_z"];
            	_rotMatrix =[[cos _azi, sin _azi],[-(sin _azi), cos _azi]];
            	_newRelPos = [_rotMatrix, _relPos] call _multiplyMatrixFunc;
            	if ((count _relPos) > 2) then {_z = _relPos select 2;} else {_z = 0;};
            	_newPos = [_posX + (_newRelPos select 0), _posY + (_newRelPos select 1), _z];

                if(_type in cti_C_STATIC_DEFENCE_FOR_COMPOSITIONS)then{
                    _newObj = _type createVehicle [0,0,750];
                    _newObj enableSimulation false;
                    _newObj setPos _newPos;
                    _newObj enableSimulation true;
                    _defences pushBack _newObj;
                }else{
                    _newObj = _type createVehicle _newPos;
                };

            	if(_type in cti_C_GARBAGE_OBJECTS)then{ _newObj enableSimulation false; };

            	if(_type == ((missionNamespace getVariable Format["cti_%1STRUCTURENAMES",str resistance]) select 2)) then {
            	    [_newObj, resistance, _type, _i] spawn cti_SE_FNC_InitResLight
            	};

            	_newObj setDir (_azi + _azimuth);
            	_newObj setPos _newPos;

                if (WF_Debug) then {
                    if(_type == ((missionNamespace getVariable Format["cti_%1STRUCTURENAMES",str resistance]) select 2)) then {
                        _marker = format ['ResLF%1', time];
                        createMarker [_marker,getPosATL _newObj];
                        _marker setMarkerTextLocal format ['ResLF%1', time];
                        _marker setMarkerType "mil_box";
                        _marker setMarkerColor 'ColorGreen';
                    };
                };
            };
            [_defences, _pos] call cti_SE_FNC_ManningOfResBaseDefense;
        };
    };
};
[_azi, _hfResBasePositions] Spawn {
    _azi = _this select 0;
    _hfResBasePositions = _this select 1;
    _positionsToBuildHF = [];

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

    if (count _hfResBasePositions > 0) then {
        while{count _positionsToBuildHF != 2} do {
            _selectedRandomHFBaseLocation = selectRandom _hfResBasePositions;
            if!(_selectedRandomHFBaseLocation in _positionsToBuildHF)then{
                if(count _positionsToBuildHF == 0)then{
                    _positionsToBuildHF pushBack (_selectedRandomHFBaseLocation);
                }else{
                    for [{_i = 0},{_i < count _positionsToBuildHF},{_i = _i + 1}] do {
                        _canPush = true;
                        _storedPosition = getPosATL ((_positionsToBuildHF select _i)select 0);
                        _selectedRandomHFBasePosition = getPosATL (_selectedRandomHFBaseLocation select 0);
                        if(_storedPosition distance _selectedRandomHFBasePosition < 5000) then{
                            _canPush = false;
                        };
                        if(_i == (count _positionsToBuildHF) - 1 && _canPush)then{
                            _positionsToBuildHF pushBack (_selectedRandomHFBaseLocation);
                        };
                    };

                };
            };
        };

        _objs   = missionNamespace getVariable "cti_NEURODEF_RESISTANCE_HF";
        for [{_i = 0},{_i < count _positionsToBuildHF},{_i = _i + 1}] do {
            _location = _positionsToBuildHF select _i;
            _pos = getPosATL (_location select 0);
            _posX = _pos select 0;
            _posY = _pos select 1;
            _defences = [];
            for "_j" from 0 to ((count _objs) - 1) do {
                private ["_obj", "_type", "_relPos", "_azimuth", "_newObj"];
                _obj = _objs select _j;
                _type = _obj select 0;
                _relPos = _obj select 1;
                _azimuth = _obj select 2;

                private ["_rotMatrix", "_newRelPos", "_newPos", "_z"];
                _rotMatrix =[[cos _azi, sin _azi],[-(sin _azi), cos _azi]];
                _newRelPos = [_rotMatrix, _relPos] call _multiplyMatrixFunc;
                if ((count _relPos) > 2) then {_z = _relPos select 2;} else {_z = 0;};
                _newPos = [_posX + (_newRelPos select 0), _posY + (_newRelPos select 1), _z];
                if(_type in cti_C_STATIC_DEFENCE_FOR_COMPOSITIONS)then{
                    _newObj = _type createVehicle [0,0,750];
                    _newObj enableSimulation false;
                    _newObj setPos _newPos;
                    _newObj enableSimulation true;
                    _defences pushBack _newObj;
                }else{
                    _newObj = _type createVehicle _newPos;
                };

                if(_type == ((missionNamespace getVariable Format["cti_%1STRUCTURENAMES",str resistance]) select 4)) then {
                    [_newObj, resistance, _type, _i] spawn cti_SE_FNC_InitResHeavy
                };

                _newObj setDir (_azi + _azimuth);
                _newObj setPos _newPos;

                if (WF_Debug) then {
                    if(_type == ((missionNamespace getVariable Format["cti_%1STRUCTURENAMES",str resistance]) select 4)) then {
                        _marker = format ['ResHF%1', time];
                        createMarker [_marker,getPosATL _newObj];
                        _marker setMarkerTextLocal format ['ResHF%1', time];
                        _marker setMarkerType "mil_box";
                        _marker setMarkerColor 'ColorGreen';
                    };
                };
            };
            [_defences, _pos] call cti_SE_FNC_ManningOfResBaseDefense;
        };
    };
};

[_azi, _afResBasePositions] Spawn {
    _azi = _this select 0;
    _afResBasePositions = _this select 1;
    _positionsToBuildAF = [];

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

    if (count _afResBasePositions > 0) then {
        while{count _positionsToBuildAF != 1} do {
            _selectedRandomAFBaseLocation = selectRandom _afResBasePositions;
            if!(_selectedRandomAFBaseLocation in _positionsToBuildAF)then{
                if(count _positionsToBuildAF == 0)then{
                    _positionsToBuildAF pushBack (_selectedRandomAFBaseLocation);
                }else{
                    for [{_i = 0},{_i < count _positionsToBuildAF},{_i = _i + 1}] do {
                        _canPush = true;
                        _storedPosition = getPosATL ((_positionsToBuildAF select _i)select 0);
                        _selectedRandomAFBasePosition = getPosATL (_selectedRandomAFBaseLocation select 0);
                        if(_storedPosition distance _selectedRandomAFBasePosition < 7500) then{
                            _canPush = false;
                        };
                        if(_i == (count _positionsToBuildAF) - 1 && _canPush)then{
                            _positionsToBuildAF pushBack (_selectedRandomAFBaseLocation);
                        };
                    };

                };
            };
        };

        _objs   = missionNamespace getVariable "cti_NEURODEF_RESISTANCE_AF";
        for [{_i = 0},{_i < count _positionsToBuildAF},{_i = _i + 1}] do {
            _location = _positionsToBuildAF select _i;
            _pos = getPosATL (_location select 0);
            _posX = _pos select 0;
            _posY = _pos select 1;
            _defences = [];
            for "_j" from 0 to ((count _objs) - 1) do {
                private ["_obj", "_type", "_relPos", "_azimuth", "_newObj"];
                _obj = _objs select _j;
                _type = _obj select 0;
                _relPos = _obj select 1;
                _azimuth = _obj select 2;

                private ["_rotMatrix", "_newRelPos", "_newPos", "_z"];
                _rotMatrix =[[cos _azi, sin _azi],[-(sin _azi), cos _azi]];
                _newRelPos = [_rotMatrix, _relPos] call _multiplyMatrixFunc;
                if ((count _relPos) > 2) then {_z = _relPos select 2;} else {_z = 0;};
                _newPos = [_posX + (_newRelPos select 0), _posY + (_newRelPos select 1), _z];
                if(_type in cti_C_STATIC_DEFENCE_FOR_COMPOSITIONS)then{
                    _newObj = _type createVehicle [0,0,750];
                    _newObj enableSimulation false;
                    _newObj setPos _newPos;
                    _newObj enableSimulation true;
                    _defences pushBack _newObj;
                }else{
                    _newObj = _type createVehicle _newPos;
                };

                if(_type == ((missionNamespace getVariable Format["cti_%1STRUCTURENAMES",str resistance]) select 5)) then {
                    [_newObj, resistance, _type, _i] spawn cti_SE_FNC_InitResAir
                };

                _newObj setDir (_azi + _azimuth);
                _newObj setPos _newPos;

                if (WF_Debug) then {
                    if(_type == ((missionNamespace getVariable Format["cti_%1STRUCTURENAMES",str resistance]) select 5)) then {
                        _marker = format ['ResAF%1', time];
                        createMarker [_marker,getPosATL _newObj];
                        _marker setMarkerTextLocal format ['ResAF%1', time];
                        _marker setMarkerType "mil_box";
                        _marker setMarkerColor 'ColorGreen';
                    };
                };
            };
            [_defences, _pos] call cti_SE_FNC_ManningOfResBaseDefense;
        };
    };
};
