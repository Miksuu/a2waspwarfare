Private ["_defenseType","_dir","_index","_manned","_pos","_side","_structure"];
_side = _this select 0;
_defenseType = _this select 1;
_pos = _this select 2;
_dir = _this select 3;
_manned = _this select 4;

_index = (missionNamespace getVariable Format["WFBE_%1DEFENSENAMES",str _side]) find _defenseType;
if (_index != -1) then {
	//--- Position anchors spawn a whole WDDM composition; everything else is a single defense (unchanged path).
	if (!isNil "WFBE_POSITION_ANCHOR_NAMES" && {(WFBE_POSITION_ANCHOR_NAMES find _defenseType) != -1}) then {
		[_side,_defenseType,_pos,_dir,_manned] Spawn Server_ConstructPosition;
	} else {
		[_defenseType,_side,_pos,_dir,_manned,false] Call ConstructDefense;
	};
};