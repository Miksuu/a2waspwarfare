// Marty: Performance Audit locals and marker update cache.
private["_sideText","_label","_count","_marker","_markerIndex","_team","_leader","_leaderVehicle","_leaderChanged","_sharedVehicleUnits","_updateAILeaders","_updateThisLeader","_nextAIUpdate","_playerAFKstate","_markerColor","_markerAlpha","_markerNames","_lastLeaders","_lastTexts","_lastAlphas","_lastColors","_wfMenuDisplays","_mapConsumerVisible","_perfStart","_perfMarkerOps","_perfPlayerLeaders","_perfAILeaders","_perfSkippedWrites"];

_sideText = sideJoinedText;
_label = "";
_count = 1;
_markerNames = [];
_lastLeaders = [];
_lastTexts = [];
_lastAlphas = [];
_lastColors = [];
_nextAIUpdate = 0;

// Marty: Any open Warfare dialog can contain or lead to a minimap view; keep team markers live while these are visible.
_wfMenuDisplays = [11000,12000,13000,14000,17000,18000,20000,21000,22000,23000,503000,504000,505000,508000,511000];

// Marty: Create the local squad markers once and cache their names by team index.
{
	_marker = Format["%1AdvancedSquad%2Marker",_sideText,_count];
	_leader = objNull;
	createMarkerLocal [_marker,[0,0,0]];
	_marker setMarkerTypeLocal "Arrow";
	_marker setMarkerDirLocal 0;
	_marker setMarkerSizeLocal [0.7,0.7];
	_marker setMarkerAlphaLocal 0;

	_markerColor = "ColorBlack";
	if !(isNil "_x") then {
		_leader = leader _x;
		if (player == _leader) then {_markerColor = "ColorOrange"};
		_marker setMarkerColorLocal _markerColor;
		_leader setVariable ["unitMarkerBlink", _marker, false];
		_leader setVariable ["OriginalMarkerColor", _markerColor, false];
	};

	_markerNames set [_count - 1, _marker];
	_lastLeaders set [_count - 1, _leader];
	_lastTexts set [_count - 1, ""];
	_lastAlphas set [_count - 1, -1];
	_lastColors set [_count - 1, _markerColor];

	_count = _count + 1;
} forEach clientTeams;

while {!gameOver} do {
	// Marty: Only refresh marker state while the player can see map data through the map, GPS, or a Warfare dialog.
	_mapConsumerVisible = visibleMap || shownGPS;
	if (!_mapConsumerVisible) then {
		{
			if (!isNull (findDisplay _x)) exitWith {_mapConsumerVisible = true};
		} forEach _wfMenuDisplays;
	};

	if (!_mapConsumerVisible) then {
		sleep 0.5;
	} else {
		// Marty: Performance Audit timing for the visible local team marker update loop.
		_perfStart = diag_tickTime;
		_perfMarkerOps = 0;
		_perfPlayerLeaders = 0;
		_perfAILeaders = 0;
		_perfSkippedWrites = 0;
		_updateAILeaders = time >= _nextAIUpdate;
		if (_updateAILeaders) then {_nextAIUpdate = time + 1};

		_count = 1;
		{
			_markerIndex = _count - 1;
			_marker = _markerNames select _markerIndex;

			if !(isNil "_x") then {
				_team = _x;
				_leader = leader _team;

				if (alive _leader) then {
					_leaderChanged = ((_lastLeaders select _markerIndex) != _leader);
					_markerColor = "ColorBlack";
					if (player == _leader) then {_markerColor = "ColorOrange"};

					_markerAlpha = 0;
					_label = "AI";
					_updateThisLeader = false;

					if (isPlayer _leader) then {
						_perfPlayerLeaders = _perfPlayerLeaders + 1;
						_updateThisLeader = true;
						_markerAlpha = 1;
						_playerAFKstate = _leader getVariable "WASP_AFK";
						_label = Format[" %1", name _leader];
						if !(isNil "_playerAFKstate") then {
							if (_playerAFKstate) then {_label = Format[" %1 (AFK)", name _leader]};
						};
						// Marty: Keep the player leader arrow visible in shared vehicles, but hide the name so AI labels remain readable.
						call {
							if (player != _leader) exitWith {};
							if ((vehicle _leader) == _leader) exitWith {};

							_sharedVehicleUnits = 0;
							{
								if ((alive _x) && ((vehicle _x) == (vehicle _leader))) then {
									_sharedVehicleUnits = _sharedVehicleUnits + 1;
								};
							} forEach (units group player);

							if (_sharedVehicleUnits > 1) then {_label = ""};
						};
					} else {
						_perfAILeaders = _perfAILeaders + 1;
						if (_updateAILeaders) then {_updateThisLeader = true};
					};

					if (_updateThisLeader) then {
						_leaderVehicle = vehicle _leader;
						_marker setMarkerPosLocal getPos _leader;
						_marker setMarkerDirLocal getDir _leaderVehicle;
						_perfMarkerOps = _perfMarkerOps + 2;

						if ((_lastTexts select _markerIndex) != _label) then {
							_marker setMarkerTextLocal _label;
							_lastTexts set [_markerIndex, _label];
							_perfMarkerOps = _perfMarkerOps + 1;
						} else {
							_perfSkippedWrites = _perfSkippedWrites + 1;
						};

						if ((_lastAlphas select _markerIndex) != _markerAlpha) then {
							_marker setMarkerAlphaLocal _markerAlpha;
							_lastAlphas set [_markerIndex, _markerAlpha];
							_perfMarkerOps = _perfMarkerOps + 1;
						} else {
							_perfSkippedWrites = _perfSkippedWrites + 1;
						};

						if ((_lastColors select _markerIndex) != _markerColor) then {
							_marker setMarkerColorLocal _markerColor;
							_lastColors set [_markerIndex, _markerColor];
							_leader setVariable ["OriginalMarkerColor", _markerColor, false];
							_perfMarkerOps = _perfMarkerOps + 1;
						} else {
							_perfSkippedWrites = _perfSkippedWrites + 1;
						};

						if (_leaderChanged) then {
							_leader setVariable ["unitMarkerBlink", _marker, false];
							_lastLeaders set [_markerIndex, _leader];
							_leader setVariable ["OriginalMarkerColor", _markerColor, false];
						};
					};
				};
			};

			_count = _count + 1;
		} forEach clientTeams;

		// Marty: Performance Audit record for the visible local team marker update loop.
		if !(isNil "PerformanceAudit_Record") then {
			if (missionNamespace getVariable ["PerformanceAuditEnabled", true]) then {
				["updateteamsmarkers", diag_tickTime - _perfStart, Format["teams:%1;players:%2;ai:%3;markerOps:%4;skippedWrites:%5", count clientTeams, _perfPlayerLeaders, _perfAILeaders, _perfMarkerOps, _perfSkippedWrites], "CLIENT"] Call PerformanceAudit_Record;
			};
		};

		sleep 0.2;
	};
};
