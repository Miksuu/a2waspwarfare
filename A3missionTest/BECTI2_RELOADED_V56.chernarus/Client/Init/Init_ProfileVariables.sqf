/*
	Attempt to load variables from the client profileNamespace.
		Note:
			- Do not use "with" as it won't work with the profileNamespace.
			- Sanitize the variable to prevent variable hijacking.
*/

//--- View distance.
_profile_var = profileNamespace getVariable "cti_PERSISTENT_CONST_OBJECT_DISTANCE";
if !(isNil '_profile_var') then {
	if (typeName _profile_var == "SCALAR") then {
		if (_profile_var <= (missionNamespace getVariable "cti_C_OBJECT_MAX_VIEW")) then {
			setObjectViewDistance _profile_var;
		};
	};
};

//--- View distance.
_profile_var = profileNamespace getVariable "cti_PERSISTENT_CONST_VIEW_DISTANCE";
if !(isNil '_profile_var') then {
	if (typeName _profile_var == "SCALAR") then {
		if (_profile_var <= (missionNamespace getVariable "cti_C_ENVIRONMENT_MAX_VIEW")) then {
			setViewDistance _profile_var;
		};
	};
};
/*	
//--- Terrain Grid.
_profile_var = profileNamespace getVariable "cti_PERSISTENT_CONST_TERRAIN_GRID";
if !(isNil '_profile_var') then {
	if (typeName _profile_var == "SCALAR") then {
		if (_profile_var <= (missionNamespace getVariable "cti_C_ENVIRONMENT_MAX_CLUTTER")) then {
			setTerrainGrid _profile_var;
			currentTG = _profile_var;
		};
	};
};

*/	
//--- Client Gear Templates.
_profile_var = profileNamespace getVariable Format["cti_PERSISTENT_%1_GEAR_TEMPLATE", cti_Client_SideJoinedText];
if !(isNil '_profile_var') then {
	if (typeName _profile_var == "ARRAY") then {
		(_profile_var) Call Compile preprocessFileLineNumbers "Client\Init\Init_ProfileGear.sqf";
	};
};

["INITIALIZATION", "Init_ProfileVariables.sqf: Possible profile variables were defined."] Call cti_CO_FNC_LogContent;