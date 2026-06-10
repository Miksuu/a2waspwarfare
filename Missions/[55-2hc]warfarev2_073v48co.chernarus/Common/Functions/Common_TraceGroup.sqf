/*
	Author: Marty
	Description:
		Marks a newly created or reused group with its mission source and logs the creation context.
*/

Private ["_context","_group","_groupLocal","_leader","_machine","_side","_source"];

_group = _this select 0;
_source = if (count _this > 1) then {_this select 1} else {"unknown"};
_context = if (count _this > 2) then {_this select 2} else {""};

if (isNil "_group") exitWith {grpNull};
if (isNull _group) exitWith {grpNull};

_side = side _group;
_machine = if (isServer) then {"SERVER"} else {if (hasInterface) then {"CLIENT"} else {"HC"}};
_leader = leader _group;
_groupLocal = if (isNull _leader) then {false} else {local _leader};

_group setVariable ["WFBE_GroupTrace_Source", _source, false];
_group setVariable ["WFBE_GroupTrace_Context", _context, false];
_group setVariable ["WFBE_GroupTrace_Machine", _machine, false];
_group setVariable ["WFBE_GroupTrace_CreatedAt", time, false];

// Marty: Arma 2 OA local expects an object, so use the group leader when available.
["INFORMATION", Format ["GROUP_TRACE create machine:%1 source:%2 side:%3 group:%4 context:%5 local:%6 units:%7 total:%8", _machine, _source, _side, _group, _context, _groupLocal, (count (units _group)), (count allGroups)]] Call WFBE_CO_FNC_LogContent;

_group
