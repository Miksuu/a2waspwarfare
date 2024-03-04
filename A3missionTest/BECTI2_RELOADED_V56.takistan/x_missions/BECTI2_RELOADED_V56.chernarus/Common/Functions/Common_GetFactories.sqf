

Private ["_buildings","_kind","_list","_side","_type"];
_side = _this select 0;
_kind = _this select 1;
_buildings = _this select 2;

_list = [];
_pattern_need_string_not_object=if !((typeName _side)=="STRING")then{ str _side;}else{_side;};

//better solution to fix the string or object problem is catch and change all wrong input calls,but fastest is make condition here

//if ((typeName _side)=="SIDE")then{
//_pattern_need_string_not_object=str _side;
//systemchat "SIDE";
//};

//if ((typeName _side)=="STRING")then{
//_pattern_need_string_not_object=_side;
//systemChat "STRING";
//};

_type = (missionNamespace getVariable Format["cti_%1STRUCTURENAMES", _pattern_need_string_not_object]) select _kind;

//_type = (Format["cti_%1STRUCTURENAMES",str _side] Call GetNamespace) select _kind;

{if (typeOf _x == _type && alive _x) then {_list pushBack _x}} forEach _buildings;

_list

/*
Private ["_buildings","_kind","_list","_side","_type"];
_side = _this select 0;
_kind = _this select 1;
_buildings = _this select 2;

_list = [];
_type = (Format["WFBE_%1STRUCTURENAMES",str _side] Call GetNamespace) select _kind;
{if (typeOf _x == _type && alive _x) then {_list = _list + [_x]}} forEach _buildings;

_list


-------------------
Private ["_buildings","_kind","_list","_side","_type"];
_side = _this select 0;
_kind = _this select 1;
_buildings = _this select 2;

_list = [];
_type = (Format["WFBE_%1STRUCTURENAMES",str _side] Call GetNamespace) select _kind;
{if (typeOf _x == _type && alive _x) then {_list = _list + [_x]}} forEach _buildings;

_list


*/