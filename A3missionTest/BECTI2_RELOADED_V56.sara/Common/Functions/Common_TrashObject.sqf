/*
	Trash an entity. Groups can only be removed once that all it's units are DELETED!
	 Parameters:
		- Object.
*/

Private ["_delay","_group","_isMan","_object"];

_object = _this;
if !(isNull _object) then {
	_isMan = if (_object isKindOf "Man") then {true} else {false};

	_group = if (_isMan) then {group _object} else {grpNull};
	if !(_isMan) then {_object removeAllEventHandlers "hit"};
	_object removeAllEventHandlers "killed";
	
	_object removeAllEventHandlers "HandleDamage";
	

/* a3 corpesmanager and wreckmanager is used now
	//--- Override?.
	_delay = missionNamespace getVariable "cti_C_UNITS_BODIES_TIMEOUT";
	if(!_isMan) then { _delay = _delay * 2; };

	sleep _delay;

    if !(isNull _object) then {
	["INFORMATION", Format["Server_TrashObject.sqf: Deleting [%1], it has been [%2] seconds.", _object, _delay]] Call cti_CO_FNC_LogContent;

	deleteVehicle _object;

	if (_isMan) then {
		if !(isNull _group) then {
			if (isNil {_group getVariable "cti_persistent"}) then {if (count (units _group) <= 0) then {deleteGroup _group}};
		};
	};
	
	
};
*/

};