/*
	Parameters Constants Initialization, use the same class name for parameter as variables.
*/

for '_i' from 0 to (count (missionConfigFile >> "Params"))-1 do {
	_paramName = (configName ((missionConfigFile >> "Params") select _i));
	_value = if (isMultiplayer) then {paramsArray select _i} else {getNumber (missionConfigFile >> "Params" >> _paramName >> "default")};
	
	missionNamespace setVariable [_paramName, _value];
};

// Marty: Dedicated town defense diagnostics avoids enabling broad WF_Debug logging.
missionNamespace setVariable ["TownDefenseDiagnosticsEnabled", (missionNamespace getVariable ["WFBE_C_TOWN_DEFENSE_DIAGNOSTICS", 0]) > 0];
if (missionNamespace getVariable ["TownDefenseDiagnosticsEnabled", false]) then {
	["INITIALIZATION", "Init_Parameters.sqf: Town defense diagnostics are enabled."] Call WFBE_CO_FNC_LogContent;
};

["INITIALIZATION", "Init_Parameters.sqf: Parameters are defined."] Call WFBE_CO_FNC_LogContent;
