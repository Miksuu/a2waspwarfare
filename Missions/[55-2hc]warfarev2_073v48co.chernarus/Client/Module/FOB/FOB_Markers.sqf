/*
	Author: Marty
	Keep local map markers on the friendly FOBs, with their current budget.
*/

Private ["_fob","_fobs","_marker","_markers","_kept"];

_markers = []; //--- [[FOB, marker name], ...]

while {!gameOver} do {
	_fobs = Call WFBE_CL_FNC_FOB_GetList;

	//--- Remove the markers of destroyed FOBs.
	_kept = [];
	{
		if ((_x select 0) in _fobs) then {_kept set [count _kept, _x]} else {deleteMarkerLocal (_x select 1)};
	} forEach _markers;
	_markers = _kept;

	{
		_fob = _x;
		_marker = "";
		{if ((_x select 0) == _fob) exitWith {_marker = _x select 1}} forEach _markers;

		if (_marker == "") then {
			WFBE_CL_VAR_FOB_MARKER_COUNT = WFBE_CL_VAR_FOB_MARKER_COUNT + 1;
			_marker = Format ["wfbe_fob_marker_%1", WFBE_CL_VAR_FOB_MARKER_COUNT];
			createMarkerLocal [_marker, getPos _fob];
			//--- Flag in side color, scaled like the base factory markers.
			_marker setMarkerTypeLocal "mil_flag";
			_marker setMarkerColorLocal "ColorBlack";
			_marker setMarkerSizeLocal [0.5,0.5];
			_markers set [count _markers, [_fob, _marker]];
		};

		_marker setMarkerTextLocal Format ["FOB - $%1", _fob Call WFBE_CL_FNC_FOB_GetCash];
	} forEach _fobs;

	sleep 10;
};
