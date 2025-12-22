private["_sideText","_label","_count","_marker","_markerType","_flashIconDelay","_lastFlashTime","_timeAtFiredEvent", "_lastBlinkTime","_blinkState", "_playerAFKstate"];

_sideText = sideJoinedText;
_label = "";
_count = 1;

{
	_marker = Format["%1AdvancedSquad%2Marker",_sideText,_count];
	createMarkerLocal [_marker,[0,0,0]];
	_marker setMarkerTypeLocal "Arrow";
	_marker setMarkerColorLocal "colorBlack";
	_marker setMarkerDirLocal 0;
	_marker setMarkerSizeLocal [0.7,0.7];
	_count = _count + 1;
} forEach clientTeams;

while {!gameOver} do {
	_count = 1;
	{
		deleteMarkerLocal "";
		_label = Format["AI [%1]",_count];
		deleteMarkerLocal _label;

		if !(isNil '_x') then {
			_markerType = "Arrow";
			_marker = Format["%1AdvancedSquad%2Marker",_sideText,_count];

			if (alive (leader _x)) then {
				_label = "TEST";
				if (isPlayer (leader _x)) then { 
					_playerAFKstate = leader _x getVariable "WASP_AFK";
					_label = if (!(isNil "_playerAFKstate") && (_playerAFKstate)) then { Format[" %1 (AFK)", name (leader _x)] } else { Format[" %1", name (leader _x)] };
					_marker setMarkerTextLocal _label;
					_marker setMarkerPosLocal GetPos (leader _x);
					_marker setMarkerDirLocal GetDir (vehicle (leader _x));
					_marker setMarkerAlphaLocal 1;
				} else {
					_label = "AI";
					_marker setMarkerTextLocal _label;
					_marker setMarkerPosLocal GetPos (leader _x);
					_marker setMarkerAlphaLocal 0;
				};
			} else {
				label = "";
				if (isPlayer (leader _x)) then {
					_label = Format["%1",name (leader _x)]
				};
				deleteMarkerLocal _label;
			};
			_marker setMarkerTypeLocal _markerType;

			if (player == leader _x) then {
				_marker setMarkerDirLocal GetDir (vehicle player);
				_marker setMarkerColorLocal "ColorOrange";
			};

			if (isNil "_lastBlinkTime") then { _lastBlinkTime = 0; };
			if (isNil "_blinkState") then { _blinkState = false; };

			if (_x getVariable ["WASP_FlashMapIconInCombat", false] && (side player == side _x)) then {

				if ((time - _lastBlinkTime) >= MARKER_BLINK_INTERVAL) then {
					_lastBlinkTime = time;
					_blinkState = !_blinkState;
				};

				_marker setMarkerColorLocal (
					if (_blinkState) then {"ColorRed"}
					else { if (player == leader _x) then {"ColorOrange"} else {"ColorGreen"} }
				);

			};

		_count = _count + 1;

		} forEach clientTeams;

	sleep 0.2;

	};

};