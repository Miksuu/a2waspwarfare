private["_victory","_total","_side","_hq","_structures","_towns","_factories"];

_victory = missionNamespace getVariable "WFBE_C_VICTORY_THREEWAY";
_total = totalTowns;
_innerTimer = 0;
_loopTimer = 60;

while {!gameOver} do {

	if (!gameOver && _victory == 0) then {
		{
			_side = _x;
			_hq = (_x) Call WFBE_CO_FNC_GetSideHQ;
			_structures = (_x) Call WFBE_CO_FNC_GetSideStructures;
			_towns = (_x) Call GetTownsHeld;

			_factories = 0;
			{
				_factories = _factories + count([_side,missionNamespace getVariable Format ["WFBE_%1%2TYPE",_side,_x], _structures] Call GetFactories);
			} forEach ["BARRACKS","LIGHT","HEAVY","AIRCRAFT"];

			if (!(alive _hq)  && _factories == 0 || _towns == _total && !WFBE_GameOver) then {
				[nil, "HandleSpecial", ["endgame", (_x) Call WFBE_CO_FNC_GetSideID]] Call 	WFBE_CO_FNC_SendToClients;
				WF_Logic setVariable ["WF_Winner", _x];
				gameOver = true;
				WFBE_GameOver = true;
				
				// Wait for the endgame to be handled, then restart the server with the callExtension command
				sleep 5; // temp 5, make more than 60sec

				// Restart the server with the callExtension command (send command to the backend C# plugin)
				"a2waspwarfare_Extension" callExtension format ["%1","RESTARTSERVER"];

				// Can add the following to the callExtension command to send more data to the C# plugin, such as for more reliable discord bot handling (unnecessary?)
				//"a2waspwarfare_Extension" callExtension format ["%1,%2,%3,%4,%5,%6",_cSharpClassName,_scoreSideWest,_scoreSideEast,_currentMap,_uptime,_playerCount];
			};
		} forEach WFBE_PRESENTSIDES - [WFBE_DEFENDER];
	};

	if(_innerTimer >= 300)then{
		_innerTimer = 0;
	};
	sleep _loopTimer;
	_innerTimer = _innerTimer + _loopTimer;
};
sleep 5;
diag_log Format["[WFBE (OUTRO)][frameno:%1 | ticktime:%2] server_victory_threeway.sqf: Mission end - [Done]",diag_frameno,diag_tickTime];
failMission "END1";