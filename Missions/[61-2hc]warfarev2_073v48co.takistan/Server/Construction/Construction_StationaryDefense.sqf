/* Description: Creates Defenses. */
Private ["_buildings","_defense","_direction","_manRange","_isArtillery","_manned","_position","_side","_sideID","_type","_area","_availweapons"];
_type = _this select 0;
_side = _this select 1;
_position = _this select 2;
_direction = _this select 3;
_manned = _this select 4;
_manRange = missionNamespace getVariable "WFBE_C_BASE_DEFENSE_MANNING_RANGE";
_sideID = (_side) Call GetSideID;

_area = [_position,((_side) Call WFBE_CO_FNC_GetSideLogic) getVariable "wfbe_basearea"] Call WFBE_CO_FNC_GetClosestEntity4; hintsilent format ["%1",_area];
_availweapons = _area getVariable "weapons";

_defense = createVehicle [_type, _position, [], 0, "NONE"];
_defense setDir _direction;
_defense setPos _position;
_defense setVariable ["side" ,_side];
["INFORMATION", Format ["Construction_StationaryDefense.sqf: [%1] Defense [%2] has been constructed.", str _side, _type]] Call WFBE_CO_FNC_LogContent;

//--- If it's a minefield, we exit the script while spawning it.
if (_type == 'Sign_Danger') exitWith {
	Private ["_c","_h","_mine","_mineType","_toWorld"];
	_mineType = if (_side == west) then {'MineMine'} else {'MineMineE'};
	_h = -4;
	_c = 0;
	for [{_z=0}, {_z<9}, {_z=_z+1}] do{
		_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];
		_toWorld = _defense modelToWorld _array;
		_toWorld set[2,0];
		_mine = createMine [_mineType, _toWorld,[], 0];
		mines set [count mines, [_mine, time]];

		_c = _c + 4;
	};

	_h = 0;
	_c = 2;
	for [{_z=0}, {_z<8}, {_z=_z+1}] do{
		_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];
		_toWorld = _defense modelToWorld _array;
		_toWorld set[2,0];
		_mine = createMine [_mineType, _toWorld,[], 0];
		mines set [count mines, [_mine, time]];
		_c = _c + 4;
	};

	_h = 4;
	_c = 0;
	for [{_z=0}, {_z<9}, {_z=_z+1}] do{
		_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];
		_toWorld = _defense modelToWorld _array;
		_toWorld set[2,0];
		_mine = createMine [_mineType, _toWorld,[], 0];
		mines set [count mines, [_mine, time]];
		_c = _c + 4;
	};
	deleteVehicle _defense;
};

_defense setVariable ["wfbe_defense", true]; //--- This is one of our defenses.

/*if (_type == 'Concrete_Wall_EP1') then {
_t= createVehicle [_type, _position, [], 0, "NONE"];
_t setVariable ["wfbe_defense", true];
_t addEventHandler ['handleDamage',{if ((_this select 4) isKindOf "BulletBase") then {getDammage (_this select 0)+(_this select 2)/180}else{getDammage (_this select 0)+(_this select 2)/95}}];
_t setpos (_defense modelToWorld [0,0,1.5]);
_t setVectorDirAndUp  [vectorDir _defense,vectorUP _defense];
_defense addEventHandler ['handleDamage',{if ((_this select 4) isKindOf "BulletBase") then {getDammage (_this select 0)+(_this select 2)/180}else{getDammage (_this select 0)+(_this select 2)/95}}];
};*/

Call Compile Format ["_defense addEventHandler ['Killed',{[_this select 0,_this select 1,%1] Spawn WFBE_CO_FNC_OnUnitKilled}]",_sideID];

// Debug info
["DEBUG", Format ["FileName.sqf: Debug info [_defense, emptyPositions, missionNamespace, WFBE_C_BASE_DEFENSE_MAX_AI]", _defense, emptyPositions "gunner", missionNamespace getVariable "WFBE_C_BASE_DEFENSE_MAX_AI"]] Call WFBE_CO_FNC_LogContent;

if (_defense emptyPositions "gunner" > 0 && (missionNamespace getVariable "WFBE_C_BASE_DEFENSE_MAX_AI" > 0)) then {
    Private ["_alives","_check","_closest","_team"];

    // Debug info
    ["DEBUG", Format ["FileName.sqf: Debug info [_alives, _check, _closest, _team]", _alives, _check, _closest, _team]] Call WFBE_CO_FNC_LogContent;

    _team = _area getVariable "DefenseTeam";

    // Debug info
    ["DEBUG", Format ["FileName.sqf: Debug info [_team]", _team]] Call WFBE_CO_FNC_LogContent;

    if (isNil '_team') then {
        _team = createGroup _side;
        _area setVariable ["DefenseTeam", _team];

        // Debug info
        ["DEBUG", Format ["FileName.sqf: Debug info [_team, _area]", _team, _area]] Call WFBE_CO_FNC_LogContent;
    } else {
        if (side _team != _side) then {
            _team = createGroup _side;
        };
        _area setVariable ["DefenseTeam", _team];

        // Debug info
        ["DEBUG", Format ["FileName.sqf: Debug info [_team, _area]", _team, _area]] Call WFBE_CO_FNC_LogContent;
    };

    emptyQueu = emptyQueu + [_defense];
    [_defense] Spawn WFBE_SE_FNC_HandleEmptyVehicle;

    // Debug info
    ["DEBUG", Format ["FileName.sqf: Debug info [emptyQueu, _defense]", emptyQueu, _defense]] Call WFBE_CO_FNC_LogContent;

    if (_manned) then {
        _alives = (units _team) Call GetLiveUnits;

        // Debug info
        ["DEBUG", Format ["FileName.sqf: Debug info [_alives]", _alives]] Call WFBE_CO_FNC_LogContent;

        if (count _alives < _availweapons) then {
            _buildings = (_side) Call WFBE_CO_FNC_GetSideStructures;
            _closest = ['BARRACKSTYPE',_buildings,_manRange,_side,_defense] Call BuildingInRange;

            // Debug info
            ["DEBUG", Format ["FileName.sqf: Debug info [_buildings, _closest]", _buildings, _closest]] Call WFBE_CO_FNC_LogContent;

            //--- Manning Defenses.
            if (alive _closest) then {
                [_defense,_side,_team,_closest] Spawn HandleDefense;

                // Debug info
                ["DEBUG", Format ["FileName.sqf: Debug info [_defense, _side, _team, _closest]", _defense, _side, _team, _closest]] Call WFBE_CO_FNC_LogContent;
            };
        };
    };
};


if ((missionNamespace getVariable "WFBE_C_ARTILLERY_UI") > 0) then {
	Private ["_isAC","_isVeh"];
	_isVeh = getNumber(configFile >> "CfgVehicles" >> typeOf(_defense) >> "ARTY_IsArtyVehicle");
	_isAC = getNumber(configFile >> "CfgVehicles" >> typeOf(_defense) >> "artilleryScanner");
	if (_isVeh == 1 || _isAC == 1) then {
		_defense setVehicleInit "[this] ExecVM 'Common\Common_InitArtillery.sqf'";
		processInitCommands;
		["INFORMATION", Format ["Construction_StationaryDefense.sqf: [%1] Artillery [%2] has been given the BIS ARTY UI interface.", str _side, _type]] Call WFBE_CO_FNC_LogContent;
	};
};

/* Are we dealing with an artillery unit ? */
_isArtillery = [_type,_side] Call IsArtillery;
if (_isArtillery != -1) then {[_defense,_isArtillery,_side] Call EquipArtillery};

_defense