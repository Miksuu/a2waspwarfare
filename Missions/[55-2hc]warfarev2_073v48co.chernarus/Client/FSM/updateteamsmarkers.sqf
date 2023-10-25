private["_sideText","_label","_count"];

_sideText = sideJoinedText;
_label = "";
_count = 1;

{
	_marker = Format["%1AdvancedSquad%2Marker",_sideText,_count];
	createMarkerLocal [_marker,[0,0,0]];
	_marker setMarkerTypeLocal "Arrow";
	_marker setMarkerColorLocal "ColorBlack";
	_marker setMarkerSizeLocal [1,1];
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
					_label = Format[" %1",name (leader _x)];
					_marker setMarkerTextLocal _label;

					if (vehicle (leader _x) != leader _x) then {
						// Player is in a vehicle
						_vehicle = vehicle (leader _x);
						_marker setMarkerPosLocal GetPos _vehicle;
						_marker setMarkerAlphaLocal 1;
						_vehicleDirection = getDir _vehicle;
						_marker setMarkerDirLocal _vehicleDirection;
					} else {
						// Player is on foot
						_marker setMarkerPosLocal GetPos (leader _x);
						_marker setMarkerAlphaLocal 1;
						_playerDirection = getDir leader _x;
						_marker setMarkerDirLocal _playerDirection;
					}
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
		};


		_count = _count + 1;
	} forEach clientTeams;
	sleep 0.05;
};