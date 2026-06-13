/*
	Author: Marty
	Description:
		Deletes a local AI group once no living unit remains, force-clearing dead bodies that can pin deleteGroup.
*/

Private ["_context","_deadline","_deletedUnits","_group","_living","_machine","_players","_source","_stillPresent","_units"];

_group = _this select 0;
_source = if (count _this > 1) then {_this select 1} else {"unknown"};
_context = if (count _this > 2) then {_this select 2} else {""};
_machine = if (isServer) then {"SERVER"} else {if (hasInterface) then {"CLIENT"} else {"HC"}};

if (isNil "_group") exitWith {};
if (isNull _group) exitWith {};

while {!(missionNamespace getVariable ["WFBE_GameOver", false]) && !(isNull _group)} do {
	_living = {alive _x} count (units _group);
	if (_living == 0) exitWith {};
	sleep 5;
};

if (isNull _group) exitWith {};
if (missionNamespace getVariable ["WFBE_GameOver", false]) exitWith {};

_players = Call WFBE_CO_FNC_GetHumanPlayerCount;
_units = +units _group;
_deletedUnits = count _units;

// Marty: Dead units can remain inside static weapons and keep count units > 0, so clear them locally before deleteGroup.
if (_deletedUnits > 0) then {
	["INFORMATION", Format ["GROUP_DRAIN_CLEANUP force_clear machine:%1 source:%2 group:%3 units:%4 players:%5 context:%6", _machine, _source, _group, _deletedUnits, _players, _context]] Call WFBE_CO_FNC_LogContent;
	{deleteVehicle _x} forEach _units;
};

_deadline = time + 5;
waitUntil {sleep 0.1; isNull _group || (count (units _group)) == 0 || time > _deadline};

if (isNull _group) exitWith {
	["INFORMATION", Format ["GROUP_DRAIN_CLEANUP result machine:%1 source:%2 group:<NULL-group> deletedUnits:%3 deletedGroup:true stillPresent:false players:%4 context:%5", _machine, _source, _deletedUnits, _players, _context]] Call WFBE_CO_FNC_LogContent;
};

if ((count (units _group)) > 0) exitWith {
	["WARNING", Format ["GROUP_DRAIN_CLEANUP still_not_empty machine:%1 source:%2 group:%3 remaining:%4 players:%5 context:%6", _machine, _source, _group, count (units _group), _players, _context]] Call WFBE_CO_FNC_LogContent;
};

deleteGroup _group;
sleep 0.5;
_stillPresent = _group in allGroups;
["INFORMATION", Format ["GROUP_DRAIN_CLEANUP result machine:%1 source:%2 group:%3 deletedUnits:%4 deletedGroup:%5 stillPresent:%6 players:%7 context:%8", _machine, _source, _group, _deletedUnits, !_stillPresent, _stillPresent, _players, _context]] Call WFBE_CO_FNC_LogContent;
