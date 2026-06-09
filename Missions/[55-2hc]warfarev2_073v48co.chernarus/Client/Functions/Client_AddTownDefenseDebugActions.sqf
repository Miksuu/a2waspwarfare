/*
	Author: Marty
	Adds debug-only mouse wheel actions for town defense group saturation tests.
*/

Private ["_actionIDs","_oldActionIDs","_unit"];

_unit = _this;

if (isNull _unit || !(alive _unit)) exitWith {[]};

_oldActionIDs = _unit getVariable ["WFBE_TD_DebugGroupActions", []];
{if (_x >= 0) then {_unit removeAction _x}} forEach _oldActionIDs;

if !(WF_Debug) exitWith {
	_unit setVariable ["WFBE_TD_DebugGroupActions", [], false];
	[]
};

_actionIDs = [];
_actionIDs set [count _actionIDs, _unit addAction ["<t color='#ffcc66'>TD Test: create 50 WEST groups on HC</t>", "Client\Action\Action_TownDefenseGroupLoadTest.sqf", ["create", "WEST", 50], 0, false, true, "", "_target == player && WF_Debug"]];
_actionIDs set [count _actionIDs, _unit addAction ["<t color='#ff6666'>TD Test: create 50 EAST groups on HC</t>", "Client\Action\Action_TownDefenseGroupLoadTest.sqf", ["create", "EAST", 50], 0, false, true, "", "_target == player && WF_Debug"]];
_actionIDs set [count _actionIDs, _unit addAction ["<t color='#66cc66'>TD Test: create 50 GUER groups on HC</t>", "Client\Action\Action_TownDefenseGroupLoadTest.sqf", ["create", "GUER", 50], 0, false, true, "", "_target == player && WF_Debug"]];
_actionIDs set [count _actionIDs, _unit addAction ["TD Test: delete artificial WEST groups", "Client\Action\Action_TownDefenseGroupLoadTest.sqf", ["delete", "WEST", 0], 0, false, true, "", "_target == player && WF_Debug"]];
_actionIDs set [count _actionIDs, _unit addAction ["TD Test: delete artificial EAST groups", "Client\Action\Action_TownDefenseGroupLoadTest.sqf", ["delete", "EAST", 0], 0, false, true, "", "_target == player && WF_Debug"]];
_actionIDs set [count _actionIDs, _unit addAction ["TD Test: delete artificial GUER groups", "Client\Action\Action_TownDefenseGroupLoadTest.sqf", ["delete", "GUER", 0], 0, false, true, "", "_target == player && WF_Debug"]];
_actionIDs set [count _actionIDs, _unit addAction ["TD Test: delete all artificial groups", "Client\Action\Action_TownDefenseGroupLoadTest.sqf", ["delete", "ALL", 0], 0, false, true, "", "_target == player && WF_Debug"]];
_actionIDs set [count _actionIDs, _unit addAction ["TD Test: print HC group count", "Client\Action\Action_TownDefenseGroupLoadTest.sqf", ["count", "ALL", 0], 0, false, true, "", "_target == player && WF_Debug"]];

_unit setVariable ["WFBE_TD_DebugGroupActions", _actionIDs, false];

_actionIDs
