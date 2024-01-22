Private ['_artyNames','_retVal','_side','_unit','_artyNamesAll','_count'];
_unit = _this select 0;
_side = _this select 1;

_retVal = -1;
_artyNamesAll = missionNamespace getVariable Format ["cti_%1_ARTILLERY_CLASSNAMES",_side];
_count=(count _artyNamesAll) -1;
_artyNames = missionNamespace getVariable Format ["cti_%1_ARTILLERY_CLASSNAMES",_side] select [1,_count];


for '_i' from 0 to (count _artyNames)-1 do {
	if (_unit in (_artyNames select _i)) exitWith {_retVal = _i};
};

_retVal