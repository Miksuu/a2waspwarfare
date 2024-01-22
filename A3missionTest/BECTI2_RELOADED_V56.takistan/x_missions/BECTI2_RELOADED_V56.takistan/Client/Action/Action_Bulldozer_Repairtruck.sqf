
_BulldozerPrice = 1000;
_currency = Call cti_CL_FNC_GetPlayerFunds;
_currencySym = "$";

if (_currency < _BulldozerPrice) exitWith {hint Format [localize "STR_WF_INFO_Bulldozer_Funds",_currencySym,_BulldozerPrice - _currency]};

-(_BulldozerPrice) Call cti_CL_FNC_ChangePlayerFunds;

player groupChat format ["YOU PAID 1000$ FOR BULLDOZER"];

params [["_vehicle", ObjNull]];
if (isNull _vehicle) exitWith {};

//go no fuel if in vehicle 
private ["_fuel","_vehicle","_ID"];
_vehicle = vehicle (_this select 0);
_ID = _this select 2;
_vehicle setVariable ["ID",_ID];
_vehicle EngineOn false;
_vehicle setVariable ["stopped",true];
_vehicle setFuel 0;

//break if in vehicle
if (speed vehicle player >= 1) then {_forwardY = velocityModelSpace vehicle player select 1; vehicle player setVelocityModelSpace [0, _forwardY *.08, 0];};

//create list map objects
//private _list = nearestTerrainObjects [_vehicle, ["BUILDING", "HOUSE", "CHURCH", "CHAPEL", "BUNKER", "FORTRESS", "FOUNTAIN", "VIEW-TOWER", "LIGHTHOUSE", "QUAY", "FUELSTATION", "HOSPITAL", "FENCE", "WALL", "BUSSTOP", "TRANSMITTER", "STACK", "RUIN", "TOURISM", "WATERTOWER", "POWER LINES", "RAILWAY", "POWERSOLAR", "POWERWAVE", "POWERWIND", "HIDE", "SHIPWRECK","TREE", "SMALL TREE", "BUSH", "FOREST BORDER", "FOREST TRIANGLE", "FOREST SQUARE", "FOREST", "ROCK", "ROCKS", "HIDE"], 50, false, true];
//just take all
private _list = nearestTerrainObjects [_vehicle, [], 50, false, true];


//break again if in vehicle
if (speed vehicle player >= 1) then {_forwardY = velocityModelSpace vehicle player select 1; vehicle player setVelocityModelSpace [0, _forwardY *.08, 0];};



hintSilent parseText format ["<t align='left'>"+"STATUS : " +"<t color='#42b6ff'>"+" CLEARING WORLD IN PROGRESS..."+"</t>","" ];


//leader _vehicle groupChat format ["Clearing world in area near: %1",position _vehicle];
private _count = 0;

// WORLD cleanup
{[_x, true] remoteExec ["hideObjectGlobal", 0, true];_count = _count + 1;} forEach _list;


//-------------- crater cleaner

_list2 = nearestObjects [(getPos player),
 ["craterlong_02_small_f","land_uns_Crater","land_uns_Crater2","land_uns_Crater1","land_bomb_crater","Crater","CraterLong","CraterLong_02_F","wx_crater02","wx_crater04","wx_crater05","land_shellcrater_01_F","land_shellcrater_02_small_F","land_shellcrater_02_debris_F","land_shellcrater_02_large_F","land_shellcrater_02_extralarge_F"], 50];
{deleteVehicle _x} foreach _list2;



//grass cutter ,lets use the minefield script 



	Private ["_c","_h","_mine","_mineType","_toWorld"];
  	_defense = player;



//grass cleanermodul (130m E/W ,100m N/S)

//-------------break again if in vehicle
if (speed vehicle player >= 1) then {_forwardY = velocityModelSpace vehicle player select 1; vehicle player setVelocityModelSpace [0, _forwardY *.08, 0];};

/*

_h = -100;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -96;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -92;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -88;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -84;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -80;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -76;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -72;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -68;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -64;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -60;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

//-------------break again if in vehicle
if (speed vehicle player >= 1) then {_forwardY = velocityModelSpace vehicle player select 1; vehicle player setVelocityModelSpace [0, _forwardY *.08, 0];};


_h = -56;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -52;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -48;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -44;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -40;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -36;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -32;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

//-------------break again if in vehicle
if (speed vehicle player >= 1) then {_forwardY = velocityModelSpace vehicle player select 1; vehicle player setVelocityModelSpace [0, _forwardY *.08, 0];};


_h = -28;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -24;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -20;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -16;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -12;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -8;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -4;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = -0;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 4;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 8;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 12;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 16;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 20;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

//-------------break again if in vehicle
if (speed vehicle player >= 1) then {_forwardY = velocityModelSpace vehicle player select 1; vehicle player setVelocityModelSpace [0, _forwardY *.08, 0];};


_h = 24;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 28;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 32;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 36;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 40;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 44;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 48;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 52;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 56;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 60;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 64;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 68;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 72;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 76;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

//-------------break again if in vehicle
if (speed vehicle player >= 1) then {_forwardY = velocityModelSpace vehicle player select 1; vehicle player setVelocityModelSpace [0, _forwardY *.08, 0];};


_h = 80;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 84;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 88;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 92;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 96;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

_h = 100;_c = -105;																	for [{_z=0;}, 
{_z<62}																				, {_z=_z+1;}] do{_array = [((_defense worldToModel (getPos _defense)) select 0) - 16 +_c,((_defense worldToModel (getPos _defense)) select 1) + _h];_toWorld = _defense modelToWorld _array;_toWorld set[2,0];_mine = createVehicle ["CUP_A1_ClutterCutter", _toWorld, [], 0, "CAN_COLLIDE"];_c = _c + 4;};

			
*/


//delete cluttercutter 

/*gives little bugs if you do same place twice
_list = nearestObjects [(getPos player), ["CUP_A1_ClutterCutter"], 160];
{deleteVehicle _x} foreach _list;

*/


/*hide clutter
//maybe useless now,if cleaner do the job

params [["_vehicle", ObjNull]];

if (isNull _vehicle) exitWith {};private _lst = nearestObjects [position _vehicle, [], 160];{if (

"cluttercutter.p3d"

in ((str _x) splitString " ")) then { leader _vehicle groupChat "Plowing crater";[_x, true] remoteExec ["hideObjectGlobal", 0, true];};} forEach _lst;_vehicle;

*/


//------------end of grass cleanermodul

//-------------break again if in vehicle
if (speed vehicle player >= 1) then {_forwardY = velocityModelSpace vehicle player select 1; vehicle player setVelocityModelSpace [0, _forwardY *.08, 0];};







sleep 3;
//--------------break again if in vehicle
if (speed vehicle player >= 1) then {_forwardY = velocityModelSpace vehicle player select 1; vehicle player setVelocityModelSpace [0, _forwardY *.08, 0];};
sleep 3;
//--------------break again if in vehicle
if (speed vehicle player >= 1) then {_forwardY = velocityModelSpace vehicle player select 1; vehicle player setVelocityModelSpace [0, _forwardY *.08, 0];};
sleep 3;


//-------------get vehicle action back
private ["_fuel","_vehicle","_ID"];
_vehicle = vehicle (_this select 0);
_ID = _this select 2;
_vehicle setVariable ["ID",_ID];
_vehicle setFuel 100;
_vehicle setVariable ["stopped",false];





hintSilent parseText format ["STATUS : " +"<t color='#00FF00'>"+" WORLD CLEARED..."+"</t>","" ];
//leader _vehicle groupChat format ["Area has been cleared of %2 objects near: %1", position _vehicle, _count];


//hint (localize "STR_WF_INFO_Bulldozer_used");



_vehicle;