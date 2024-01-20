/*
	Trigger a commander's vote.
	 Parameters:
		- Side.
*/

Private ["_logic", "_side", "_voteTime"];

_side = _this;
["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_side] [%1] on the beginning", _side]] Call cti_CO_FNC_LogContent;
_voteTime = (missionNamespace getVariable 'cti_C_GAMEPLAY_VOTE_TIME');
["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_voteTime] [%1]", _voteTime]] Call cti_CO_FNC_LogContent;
_logic = (_side) Call cti_CO_FNC_GetSideLogic;
["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_logic] [%1]", _logic]] Call cti_CO_FNC_LogContent;

//--- Vote countdown.
while {_voteTime > -1} do {
	_voteTime = _voteTime - 1;
	_logic setVariable ["cti_votetime", _voteTime, true];
	["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_voteTime] [%1]", _voteTime]] Call cti_CO_FNC_LogContent;
	sleep 1;
};

["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_side] [%1] after the vote countdown", _side]] Call cti_CO_FNC_LogContent;

//--- Get the most voted person.
Private ["_aiVotes","_count","_highest","_highestTeam","_tie","_teams","_vote","_votes"];
_aiVotes = 0;
["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_aiVotes] [%1]", _aiVotes]] Call cti_CO_FNC_LogContent;
_votes = [];
_teams = _logic getVariable "cti_teams";
_teams = _teams - [grpNull];
["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_teams] [%1]", _teams]] Call cti_CO_FNC_LogContent;

//--- Get the votes from everyone.
for '_i' from 0 to (count _teams)-1 do {
	_votes pushBack 0;
};

{
	if (isPlayer leader _x) then {
		_vote = _x getVariable "cti_vote";
		["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_vote] [%1]", _vote]] Call cti_CO_FNC_LogContent;
		if (_vote == -1) then {
			_aiVotes = _aiVotes + 1;
			["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_aiVotes] [%1]", _aiVotes]] Call cti_CO_FNC_LogContent;
		} else {
			_votes set [_vote, (_votes select _vote) + 1];
			["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_votes] [%1]", _votes]] Call cti_CO_FNC_LogContent;
		};
	};
} forEach _teams;

//--- Who was the most voted for?
_count = 0;
_highest = 0;
_highestTeam = -1;
_tie = false;

// Remove all the nil votes, there might be a better way to do this (remove objects from the array in the first place if player is not connected to the slot).
_votes = _votes select {!isNil"_x"};

["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_votes] after removal: [%1]", _votes]] Call cti_CO_FNC_LogContent;

{
	if (_x == _highest && _x > 0) then {
		_tie = true;
		["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_tie] [%1]", _tie]] Call cti_CO_FNC_LogContent;
	};
	if (_x > _highest) then {
		_highestTeam = _count;
		_highest = _x;
		_tie = false;
		["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_highestTeam, _highest, _tie] [%1, %2, %3]", _highestTeam, _highest, _tie]] Call cti_CO_FNC_LogContent;
	};
	_count = _count + 1;
	["DEBUG", Format ["Server_VoteForCommander.sqf: Debug info [_count] [%1]", _count]] Call cti_CO_FNC_LogContent;
} forEach _votes;

_commander = objNull;

//--- Attempt to get a playable team.
if ((!_tie && _highest >= _aiVotes && _highestTeam != -1) || (!_tie && _highest <= _aiVotes && _highestTeam != -1)) then {_commander = _teams select _highestTeam;};

//--- Player voted for an ai...?
if !(isNull _commander) then {if !(isPlayer leader _commander) then {_commander = objNull;}};

//--- Finally set the commander, null = ai, team = player.
_logic setVariable ["cti_commander", _commander, true];

//--- Notify the clients.
["commander-vote", _commander] remoteExecCall ["cti_CL_FNC_HandleSpecial", _side];

//--- Process the AI Commander FSM if it's not running.
if (isNull _commander) then {
	if ((missionNamespace getVariable "cti_C_AI_COMMANDER_ENABLED") > 0) then {
		sleep 300; // if players decide to revote we give them 120 seconds to revote
		if !(isNull _commander) then {if !(isPlayer leader _commander) then {_commander = objNull;}};
		if (isNull _commander) then {
			if !(_logic getVariable "cti_aicom_running") then {
				_logic setVariable ["cti_aicom_running", true];
				[_side] ExecFSM "Server\FSM\aicommander.fsm";
			};
		};
	};
} else {
	if (_logic getVariable "cti_aicom_running") then {_logic setVariable ["cti_aicom_running", false]};
};

