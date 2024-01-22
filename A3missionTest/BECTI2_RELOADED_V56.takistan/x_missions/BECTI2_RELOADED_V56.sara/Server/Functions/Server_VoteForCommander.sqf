/*
	Trigger a commander's vote.
	 Parameters:
		- Side.
*/

Private ["_logic", "_side", "_voteTime"];

_side = _this;
_voteTime = (missionNamespace getVariable 'cti_C_GAMEPLAY_VOTE_TIME');
_logic = (_side) Call cti_CO_FNC_GetSideLogic;

//--- Vote countdown.
while {_voteTime > -1} do {_voteTime = _voteTime - 1;_logic setVariable ["cti_votetime", _voteTime, true];sleep 1};

//--- Get the most voted person.
Private ["_aiVotes","_count","_highest","_highestTeam","_tie","_teams","_vote","_votes"];
_aiVotes = 0;
_votes = [];
_teams = _logic getVariable "cti_teams";
_teams = _teams - [grpNull];
//--- Get the votes from everyone.
for '_i' from 0 to (count _teams)-1 do {_votes pushBack 0};
{
	if (isPlayer leader _x) then {
		_vote = _x getVariable "cti_vote";
		if (_vote == -1) then {_aiVotes = _aiVotes + 1;} else {_votes set [_vote, (_votes select _vote) + 1]};
	};
} forEach _teams;

//--- Who was the most voted for?
_count = 0;_highest = 0;_highestTeam = -1;
_tie = false;
{
	if (_x == _highest && _x > 0) then {_tie = true;};
	if (_x > _highest) then {_highestTeam = _count;_highest = _x;_tie = false;};
	_count = _count + 1;
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

