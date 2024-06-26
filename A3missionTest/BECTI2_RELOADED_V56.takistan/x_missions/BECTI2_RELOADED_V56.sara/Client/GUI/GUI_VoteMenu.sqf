scriptName "Client\GUI\GUI_VoteMenu.sqf";

//--- Register the UI.
uiNamespace setVariable ["cti_display_vote", _this select 0];
//['chat',cti_Client_Teams] remoteExecCall ["cti_CL_FNC_LocalizeMessage"];
_u = 1;
lnbClear 500100;
lnbAddRow[500100, ["AI Commander", "0"]];
lnbSetValue[500100, [0, 0], -1];
for '_i' from 0 to count(cti_Client_Teams)-1 do {
	if (isPlayer leader (cti_Client_Teams select _i)) then {
		lnbAddRow[500100, [name leader (cti_Client_Teams select _i), "0"]];
		lnbSetValue[500100, [_u, 0], _i];
		_u = _u + 1;
	};
};

cti_MenuAction = -1;

_update_list = -5;
_voteArray = [];

while {alive player && dialog} do {
	_voteTime = cti_Client_Logic getVariable "cti_votetime";

	//--- Exit when the timeout is reached.
	if (_voteTime < 0) exitWith {closeDialog 0};

	for '_i' from 0 to cti_Client_Teams_Count do {_voteArray set [_i , 0]};

	//--- The client has voted for x.
	if (cti_MenuAction == 1) then {
		cti_MenuAction = -1;
		_index = lnbValue [500100,[lnbCurSelRow 500100, 0]];
		if ((cti_Client_Team getVariable "cti_vote") != _index) then {cti_Client_Team setVariable ["cti_vote", _index, true]};
	};

	//--- Update the votes.
	_playerCount = 0;
	{
		if (isPlayer leader _x) then {
			_vote = (_x getVariable "cti_vote") + 1;
			_voteArray set [_vote, (_voteArray select _vote) + 1];
			_playerCount = _playerCount + 1;
		};
	} forEach cti_Client_Teams;

	_highestId = 0;
	for '_i' from 0 to cti_Client_Teams_Count do {if ((_voteArray select _i) > (_voteArray select _highestId)) then {_highestId = _i}}; //--- Get the most voted person.

	if (time - _update_list > 1) then { //--- Refresh the list.
		_update_list = time;

		_list_present = [];
		for '_i' from 1 to ((lnbSize 500100) select 0)-1 do { //--- Remove potential non-player controlled slots.
			_value = lnbValue [500100,[_i, 0]];
			_team = cti_Client_Teams select _value;
			if !(isPlayer leader _team) then {lnbDeleteRow [500100, _i]} else {_list_present pushBack _value};
		};

		for '_i' from 0 to cti_Client_Teams_Count do { //--- Add potential new player controlled slots.
			_team = cti_Client_Teams select _i;
			if(!(isNil "_team"))then{
				if (isPlayer leader _team && !(_i in _list_present)) then {
					lnbAddRow[500100, [name leader _team, "0"]];
					lnbSetValue[500100, [((lnbSize 500100) select 0)-1, 0], _i];
				};
			};
		};
	};

	if ((((uiNamespace getVariable "cti_display_vote") displayCtrl 500100) lnbText [0, 1]) != str(_voteArray select 0)) then {lnbSetText [500100, [0, 1], str(_voteArray select 0)]}; //--- AI Commander

	for '_i' from 1 to ((lnbSize 500100) select 0)-1 do { //--- Update the UI list properties (name / votes) for players.
		_value = lnbValue [500100,[_i, 0]];
		_team = cti_Client_Teams select _value;
		if ((((uiNamespace getVariable "cti_display_vote") displayCtrl 500100) lnbText [_i, 0]) != name leader _team) then {lnbSetText [500100, [_i, 0], name leader _team]};
		if ((((uiNamespace getVariable "cti_display_vote") displayCtrl 500100) lnbText [_i, 1]) != str(_voteArray select _value+1)) then {lnbSetText [500100, [_i, 1], str(_voteArray select _value+1)]};
	if (((cti_Client_Teams select _i) getVariable "cti_vote") != -1) then {
	lnbSetColor [500100, [_i+1,0], [0.9,0.5,0.1,1]]
	} else {
	lnbSetColor [500100, [_i+1,0], [1,1,1,1]]
	};

	};

	//--- Update the text
	_voted_commander = if ((_voteArray select _highestId) <= (_playerCount/2) || _highestId == 0) then {localize "STR_WF_AI"} else {name leader (cti_Client_Teams select _highestId-1)};
	ctrlSetText [500101, _voted_commander];
	ctrlSetText [500102, Format ["%1",_voteTime]];

	sleep 0.05;
};

//--- Release the UI.
uiNamespace setVariable ["cti_display_vote", nil];