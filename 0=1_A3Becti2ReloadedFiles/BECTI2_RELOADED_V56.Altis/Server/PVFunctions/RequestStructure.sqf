Private ['_dir','_index','_pos','_script','_side','_structure','_structureType'];

_side = _this select 0;
_structureType = _this select 1;
_pos = _this select 2;
_dir = _this select 3;

_index = (missionNamespace getVariable Format ["cti_%1STRUCTURENAMES",str _side]) find _structureType;
if (_index != -1) then {
	_script = (missionNamespace getVariable Format ["cti_%1STRUCTURESCRIPTS",str _side]) select _index;
	switch(_script)do{
	    case "HQSite": {[_structureType,_side,_pos,_dir,_index] spawn cti_SE_FNC_Server_Construction_HQSite;};
	    case "MediumSite": {[_structureType,_side,_pos,_dir,_index] spawn cti_SE_FNC_Server_Construction_MediumSite;};
	    case "SmallSite": {[_structureType,_side,_pos,_dir,_index] spawn cti_SE_FNC_Server_Construction_SmallSite;};
	};
};