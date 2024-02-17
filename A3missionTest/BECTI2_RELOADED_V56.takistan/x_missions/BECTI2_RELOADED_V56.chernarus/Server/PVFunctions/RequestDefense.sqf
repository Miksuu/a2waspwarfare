Private ["_defenseType","_dir","_index","_manned","_pos","_side","_structure"];
_side = _this select 0;
_defenseType = _this select 1;
_pos = _this select 2;
_dir = _this select 3;
_manned = _this select 4;
_type_manning=_this#5;//classname for manning soldier from builder client

//indexcheck not needed here,uk statics build should be fixed now
//_index = (missionNamespace getVariable Format["cti_%1DEFENSENAMES",str _side]) find _defenseType;
//if (_index != -1) then {
	[_defenseType,_side,_pos,_dir,_manned,false,_type_manning] Call cti_SE_FNC_ConstructDefense;
//};