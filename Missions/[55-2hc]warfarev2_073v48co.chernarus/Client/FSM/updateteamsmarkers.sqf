// Marty: Performance Audit locals.
private["_sideText","_label","_count","_marker","_markerType","_playerAFKstate","_markerColor","_perfStart","_perfMarkerOps"];

_sideText = sideJoinedText;
_label = "";
_count = 1;

{
	_marker = Format["%1AdvancedSquad%2Marker",_sideText,_count];
	createMarkerLocal [_marker,[0,0,0]];
	_marker setMarkerTypeLocal "Arrow";

	if (player == leader _x) then {
		_marker setMarkerColorLocal "ColorOrange";
		_x setVariable ["OriginalMarkerColor", "ColorOrange", false];
	} else {
		_marker setMarkerColorLocal "ColorBlack";
		_x setVariable ["OriginalMarkerColor", "ColorBlack", false];
	};
	
	_marker setMarkerDirLocal 0;
	_marker setMarkerSizeLocal [0.7,0.7];
	_count = _count +1;
} forEach clientTeams;

while {!gameOver} do {
	// Marty: Performance Audit timing for the local team marker update loop.
	_perfStart = diag_tickTime;
	_perfMarkerOps = 0;

	_count = 1;
	{
		deleteMarkerLocal "";
		_label = Format["AI [%1]",_count];
		deleteMarkerLocal _label;

		if !(isNil '_x') then {
			_markerType = "Arrow";
			_marker = Format["%1AdvancedSquad%2Marker",_sideText,_count];

			if (alive (leader _x)) then {
				_label = "";
				if (isPlayer (leader _x)) then {
					_label = Format[" %1",name (leader _x)];
					_marker setMarkerTextLocal _label;
					_marker setMarkerPosLocal GetPos (leader _x);
					_marker setMarkerDirLocal GetDir (vehicle (leader _x));
					_marker setMarkerAlphaLocal 1;
					// Marty: Performance Audit approximate marker operation count.
					_perfMarkerOps = _perfMarkerOps + 4;
					_playerAFKstate = (leader _x) getVariable "WASP_AFK";
					_label = if (!(isNil "_playerAFKstate") && (_playerAFKstate)) then { Format[" %1 (AFK)", name (leader _x)] } else { Format[" %1", name (leader _x)]};
					_marker setMarkerTextLocal _label;
					// Marty: Performance Audit approximate marker operation count.
					_perfMarkerOps = _perfMarkerOps + 1;
				} else {
					_label = "AI";
					_marker setMarkerTextLocal _label;
					_marker setMarkerPosLocal GetPos (leader _x);
					_marker setMarkerAlphaLocal 0;
					// Marty: Performance Audit approximate marker operation count.
					_perfMarkerOps = _perfMarkerOps + 3;
				};
			};
			
			_marker setMarkerTypeLocal _markerType;
			// Marty: Performance Audit approximate marker operation count.
			_perfMarkerOps = _perfMarkerOps + 1;

			if (player == leader _x) then {
				_marker setMarkerDirLocal GetDir (vehicle player);
				// Marty: Performance Audit approximate marker operation count.
				_perfMarkerOps = _perfMarkerOps + 1;
				leader _x setVariable ["unitMarkerBlink", _marker, false];
				leader _x setVariable ["OriginalMarkerColor", "ColorOrange", false];
			} else {
				leader _x setVariable ["unitMarkerBlink", _marker, false];
				leader _x setVariable ["OriginalMarkerColor", "ColorBlack", false];
			};
		};

		_count = _count + 1;
	} forEach clientTeams;

	// Marty: Performance Audit record for the local team marker update loop.
	if !(isNil "PerformanceAudit_Record") then {
		["updateteamsmarkers", diag_tickTime - _perfStart, Format["teams:%1;markerOps:%2", count clientTeams, _perfMarkerOps], "CLIENT"] Call PerformanceAudit_Record;
	};

	sleep 0.2;
};
