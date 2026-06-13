/*
	Author: Marty
	Description:
		Counts connected human players for diagnostics while excluding registered headless client groups.
*/

Private ["_count","_headlessGroups","_unit","_unitGroup"];

_headlessGroups = missionNamespace getVariable ["WFBE_HEADLESSCLIENTS_ID", []];
_count = 0;

{
	_unit = _x;
	call {
		if !(isPlayer _unit) exitWith {};
		_unitGroup = group _unit;
		if (_unitGroup in _headlessGroups) exitWith {};
		if ((side _unit) == civilian && (typeOf _unit) == "Functionary1") exitWith {};
		_count = _count + 1;
	};
} forEach allUnits;

_count
