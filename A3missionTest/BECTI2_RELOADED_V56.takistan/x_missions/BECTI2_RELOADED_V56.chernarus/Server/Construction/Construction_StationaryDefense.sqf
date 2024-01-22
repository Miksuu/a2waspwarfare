/* Description: Creates Defenses. */
Private ["_buildings","_defense","_direction","_isAIQuery","_isArtillery","_manned","_position","_side","_sideID","_type","_area","_availweapons"];
_type = _this select 0;
_side = _this select 1;
_position = _this select 2;
_direction = _this select 3;
_manned = _this select 4;
_isAIQuery = _this select 5;
_manRange = if (count _this > 6) then {_this select 6} else {missionNamespace getVariable "cti_C_BASE_DEFENSE_MANNING_RANGE"};
_sideID = (_side) Call cti_CO_FNC_GetSideID;

_area = [_position,((_side) Call cti_CO_FNC_GetSideLogic) getVariable "cti_basearea"] Call cti_CO_FNC_GetClosestEntity4;// hintsilent format ["%1",_area];
_availweapons = _area getVariable "weapons";

_defense = createVehicle [_type, _position, [], 0, "NONE"];
//_defense enableDynamicSimulation true;// dynamic simulation breaks artillery order if distance high
_defense setDir _direction;
_defense setPos _position;
_defense setVariable ["side" ,_side];
["INFORMATION", Format ["Construction_StationaryDefense.sqf: [%1] Defense [%2] has been constructed.", str _side, _type]] Call cti_CO_FNC_LogContent;

//--- If it's a minefield, we exit the script while spawning it.
if (_type == 'Sign_Danger') exitWith {
	
	Private ["_c","_h","_mine","_mineType","_toWorld"];
   _mineType = "ATMine";
   //if (_side == west) then {"ATMine"} else {"ATMine"};
	_h = -4;
	_c = 0;
	for [{_z=0;}, {_z<9}, {_z=_z+1;}] do{
		_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];
		_toWorld = _defense modelToWorld _array;
		_toWorld set[2,0];
		_mine = createMine [_mineType, _toWorld,[], 0];
		mines set [count mines, [_mine, time]];
		[[[_mine,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;



//kinds=["Sign_Danger","Thing","All"]
//kinds=["ATMine","MineBase","MineGeneric","Static","All"]

		_c = _c + 4;
	};

	_h = 0;
	_c = 2;
	for [{_z=0;}, {_z<8}, {_z=_z+1;}] do{
		_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];
		_toWorld = _defense modelToWorld _array;
		_toWorld set[2,0];
		_mine = createMine [_mineType, _toWorld,[], 0];
		mines set [count mines, [_mine, time]];
		[[[_mine,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
		
	
		_c = _c + 4;
	
	
	};

	_h = 4;
	_c = 0;
	for [{_z=0;}, {_z<9}, {_z=_z+1;}] do{
		_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];
		_toWorld = _defense modelToWorld _array;
		_toWorld set[2,0];
		_mine = createMine [_mineType, _toWorld,[], 0];
		mines set [count mines, [_mine, time]];
		[[[_mine,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
		
	
		
		_c = _c + 4;
	};
	deleteVehicle _defense;
};

//minefield ap
if (_type == 'Sign_DangerMines_ACR') exitWith {
	
	Private ["_c","_h","_mine","_mineType","_toWorld"];
   _mineType = "APERSMine";
   //if (_side == west) then {"APERSMine"} else {"APERSMine"};
	_h = -4;
	_c = 0;
	for [{_z=0;}, {_z<9}, {_z=_z+1;}] do{
		_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];
		_toWorld = _defense modelToWorld _array;
		_toWorld set[2,0];
		_mine = createMine [_mineType, _toWorld,[], 0];
		mines set [count mines, [_mine, time]];
		[[[_mine,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
		_c = _c + 4;
	};

//kinds=["Sign_DangerMines_ACR","Sign_1L_Border","Thing","All"]
//kinds=["APERSMine","MineBase","MineGeneric","Static","All"]

	_h = 0;
	_c = 2;
	for [{_z=0;}, {_z<8}, {_z=_z+1;}] do{
		_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];
		_toWorld = _defense modelToWorld _array;
		_toWorld set[2,0];
		_mine = createMine [_mineType, _toWorld,[], 0];
		mines set [count mines, [_mine, time]];
		[[[_mine,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
		_c = _c + 4;
	};

	_h = 4;
	_c = 0;
	for [{_z=0;}, {_z<9}, {_z=_z+1;}] do{
		_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];
		_toWorld = _defense modelToWorld _array;
		_toWorld set[2,0];
		_mine = createMine [_mineType, _toWorld,[], 0];
		mines set [count mines, [_mine, time]];
		[[[_mine,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
		_c = _c + 4;
	};
	deleteVehicle _defense;
};

//Mapmarker for COIN Ammocrates
if (_type == 'CUP_BOX_TK_WpsSpecial_F') then {

[[[_defense,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
};

if (_type == 'CUP_BOX_US_ARMY_WpsSpecial_F') then {

[[[_defense,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
};

if (_type == 'CUP_BOX_GB_WpsSpecial_F') then {

[[[_defense,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
};


//Mapmarker for static Arty
/*
CUP_O_2b14_82mm_RU
CUP_O_D30_RU

CUP_B_L16A2_BAF_DDPM
cwr3_b_uk_l118

CUP_B_M252_USMC
pook_M777

*/


if (_type == 'CUP_O_2b14_82mm_RU') then {

 
[[[_defense,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
};




if (_type == 'CUP_O_D30_RU') then {

[[[_defense,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
};

if (_type == 'CUP_B_L16A2_BAF_DDPM') then {

[[[_defense,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
};

if (_type == 'cwr3_b_uk_l118') then {

[[[_defense,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
};

if (_type == 'CUP_B_M252_USMC') then {

[[[_defense,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
};

if (_type == 'pook_M777') then {

[[[_defense,_sideID], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", false, false] call BIS_fnc_MP;
};







_defense setVariable ["cti_defense", true]; //--- This is one of our defenses.

Call Compile Format ["_defense addEventHandler ['Killed',{[_this select 0,_this select 1,%1] Spawn cti_CO_FNC_OnUnitKilled}]",_sideID];

if (_defense emptyPositions "gunner" > 0 && (((missionNamespace getVariable "cti_C_BASE_DEFENSE_MAX_AI") > 0) || _isAIQuery)) then {
	Private ["_alives","_check","_closest","_team"];
	_team = _area getVariable "DefenseTeam";

	if (isNil '_team') then {
        _team = createGroup [_side, true];
        _area setVariable ["DefenseTeam", _team];
    }else{
        if(side _team != _side) then{
            _team = createGroup [_side, true];
        };
        if((count units _team) > 10) then {
            _team = createGroup [_side, true];
        };
        _area setVariable ["DefenseTeam", _team];
    };
	emptyQueu pushBack _defense;
	[_defense] Spawn cti_SE_FNC_HandleEmptyVehicle;

	if((typeOf _defense) in cti_C_ADV_AIR_DEFENCE) then{
	    createVehicleCrew _defense;
            [_team, 2000, getPosATL _defense] spawn cti_CO_FNC_RevealArea;
	    if(_side == east) then {
	        _defense addeventhandler ["fired", {(_this select 0) setvehicleammo 1}];
	    };
	    if(_side == west) then {
            _defense addeventhandler ["fired", {[_this] spawn {
            		_objectArray = _this select 0;
            		(_objectArray select 0) setvehicleammo 0;
            		sleep cti_CENTURION_RELOAD_TIME;
            		(_objectArray select 0) setvehicleammo 1;
            	};
            }];
	    };
	};

	if (_manned) then {
        _alives = (units _team) Call cti_CO_FNC_GetLiveUnits;
        if (count _alives < _availweapons || _isAIQuery) then {
            _buildings = (_side) Call cti_CO_FNC_GetSideStructures;
            _closest = ['BARRACKSTYPE',_buildings,_manRange,_side,_defense] Call cti_CO_FNC_BuildingInRange;

            //--- Manning Defenses.
            if (alive _closest) then { [_defense,_side,_team,_closest] spawn cti_SE_FNC_HandleDefense; };
        };
	};
};

/* Are we dealing with an artillery unit ? */
_isArtillery = [_type,_side] Call cti_CO_FNC_IsArtillery;
if (_isArtillery != -1) then {[_defense,_isArtillery,_side] Call cti_CO_FNC_EquipArtillery};

_defense