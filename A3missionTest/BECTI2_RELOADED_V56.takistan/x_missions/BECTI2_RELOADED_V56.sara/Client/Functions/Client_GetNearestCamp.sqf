Private ["_camps","_range","_temp"];

_unit = _this select 0;
_range = missionNamespace getVariable "cti_C_CAMPS_REPAIR_RANGE";
_result = false; 

if(!(isNil "_unit") && (alive _unit))then{	
	//--- Attempt to get a nearby camp.
	_camps = (_unit) nearEntities [cti_Logic_Camp, _range];

	//--- Only get the "real" camps, remove the possible undefined ones.
	_temp = _camps;
	{
		if (isNil {_x getVariable 'sideID'}) then {_camps deleteAt _forEachIndex};
	} forEach _temp;

	//--- Make sure that there is at least one camp nearby, abort otherwise.
	if (count _camps == 0) exitWith {_result = false};

	//--- Get the closest camp then.
	_camp = [_unit, _camps] Call cti_CO_FNC_GetClosestEntity;
	if (!isNil "_camp")  exitwith {
		_result = true;
	};
};


_result