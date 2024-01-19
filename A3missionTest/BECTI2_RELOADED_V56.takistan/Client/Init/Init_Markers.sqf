/*
	Client towns markers initialization.
*/

scriptName "Client\Init\Init_Markers.sqf";

{
	Private ["_townColor", "_townMarker", "_townSide"];

	//--- Wait for the sideID to be initialized.
	waitUntil {!isNil {_x getVariable "sideID"}};
	_townSide = _x getVariable "sideID";
	
	//--- Determine the coloration method.
	_townColor = missionNamespace getVariable "cti_C_UNKNOWN_COLOR";
	if (_townSide == cti_Client_SideID) then {
		_townColor = missionNamespace getVariable (Format ["cti_C_%1_COLOR",(_townSide) Call cti_CO_FNC_GetSideFromID]);
	};

	//--- Place a marker over the logic.
	_townMarker = Format ["cti_%1_CityMarker", str _x];
	createMarkerLocal [_townMarker, getPos _x];
    _townMarker setMarkerTextLocal (_x getVariable "name");
    _townMarker setMarkerTypeLocal "n_unknown";
	_townMarker setMarkerColorLocal _townColor;

	/*_townMarker = Format ["cti_%1_CityMarker", str (_x getVariable "name")];
	createMarkerLocal [_townMarker, getPos _x];
	_townMarker setMarkerTextLocal (_x getVariable "name"); 
	_townMarker setMarkerTypeLocal "hd_dot";
      	_townMarker setMarkerSize [1,1];*/
	
	//--- Wait for the camps to be initialized.
	waitUntil {!isNil {_x getVariable "camps"}};
	
	//--- The town may have some camps.
	{
		Private ["_campColor","_campMarker","_campSide"];
		
		//--- Wait for the sideID to be initialized.
		waitUntil {!isNil {_x getVariable "sideID"}};
		_campSide = _x getVariable "sideID";
		
		// --- Determine the coloration method.
		_campColor = missionNamespace getVariable "cti_C_UNKNOWN_COLOR";
		if (_townSide == cti_Client_SideID) then {
			_campColor = missionNamespace getVariable (Format ["cti_C_%1_COLOR",(_campSide) Call cti_CO_FNC_GetSideFromID]);
		};

		//--- Place a marker over the logic.
		_campMarker = _x getVariable "cti_camp_marker";
		createMarkerLocal [_campMarker, getPos _x];
		_campMarker setMarkerTypeLocal "o_unknown";
		_campMarker setMarkerColorLocal _campColor;
		_campMarker setMarkerSizeLocal [0.5,0.5];
	} forEach (_x getVariable "camps");
} forEach towns;