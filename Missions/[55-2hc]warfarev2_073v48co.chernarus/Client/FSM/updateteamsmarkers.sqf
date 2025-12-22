private["_sideText","_label","_count","_marker","_markerType","_playerAFKstate","_iconBlinkState", "_last", "_shouldBlink", "_h", "_iconBlinkHandle", "_u", "_m"];

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
	_count = _count +1;
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
				_label = "";
				if (isPlayer (leader _x)) then {
					_playerAFKstate = (leader _x) getVariable "WASP_AFK";
					_label = if (!(isNil "_playerAFKstate") && (_playerAFKstate)) then { Format[" %1 (AFK)", name (leader _x)] } else { Format[" %1", name (leader _x)] };
					// _label = Format[" %1",name (leader _x)];
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

	// ---

if (player == leader _x) then {

	{
    _marker setMarkerDirLocal (getDir (vehicle player));
	_marker setMarkerColorLocal "ColorOrange";

	diag_log "_x:";
	diag_log _x;

    _last = _x getVariable "WASP_LastFiredTime";
	
	if (!isNil "_last") then {
    
		_shouldBlink = ((time - _last) <= 10);
		diag_log "_last:";
		diag_log _last;

		diag_log "_shouldBlink:";
		diag_log _shouldBlink;

		_h = _x getVariable "WASP_BlinkHandle";   // nil if not set

		if (_shouldBlink) then {

			diag_log "About to blink!";

			// start blink thread once
			if (isNil { _h }) then {
				diag_log "Spawning thread";
				_h = [leader _x, _marker] spawn {
					_u = _this select 0;
					_m = _this select 1;

					diag_log "Almost blinking!";
					while { alive _u && ((time - (_u getVariable "WASP_LastFiredTime")) <= 10) } do {
						diag_log "BLINKING!";
						_m setMarkerColorLocal "ColorRed";
						sleep 1;
						_m setMarkerColorLocal "ColorOrange";
						sleep 1;
					};

					if (alive _u) then { _m setMarkerColorLocal "ColorOrange"; };
					diag_log "Blinking off.";
					_u setVariable ["WASP_BlinkHandle", nil];
				};
				diag_log "Assigning handle to thread.";
				_x setVariable ["WASP_BlinkHandle", _h];
			};

			// IMPORTANT: don't force orange every frame here, let the thread blink it

		} else {

			diag_log "Checking if handle exists.";
			// stop thread only if it exists
			if (!isNil { _h }) then {
				diag_log "Handle exists... deleting.";
				terminate _h;
				_x setVariable ["WASP_BlinkHandle", nil];
			};

			diag_log "Return back to color orange.";
			_marker setMarkerColorLocal "ColorOrange";
		};
	};
	} forEach _x;

};

		_count = _count + 1;

	} forEach clientTeams;

	sleep 0.2;
};
};