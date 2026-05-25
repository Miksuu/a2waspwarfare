/*
	Author: Marty

	Name:
		Func_Client_AI_LowGear_Manager.sqf

	Description:
		Starts AI low gear assist for local AI-driven tanks controlled by the player's group.
*/

// Marty: Performance Audit locals.
Private ["_unit","_vehicle", "_driver", "_perfStart", "_perfUnits", "_perfStarted"];

while {!gameOver} do {

	// Marty: Performance Audit timing for local AI low gear manager.
	_perfStart = diag_tickTime;
	_perfUnits = count (units group player);
	_perfStarted = 0;

	{
		_vehicle = vehicle _x;

		if (
			!isNull _vehicle &&
			{_vehicle != _x} &&
			{alive _vehicle} &&
			{canMove _vehicle} &&
			{_vehicle isKindOf "Tank"} &&
			{local _vehicle} &&
			{!(_vehicle getVariable ["AI_LowGear_Running", false])}
		) then {

			_driver = driver _vehicle;

			if (!isNull _driver && {!isPlayer _driver}) then {
				// Marty: Performance Audit counter for low gear assist scripts started.
				_perfStarted = _perfStarted + 1;
				_vehicle spawn Compile preprocessFileLineNumbers "Client\Module\Valhalla\Common_AI_LowGear.sqf";
			};
		};

	} forEach units group player;

	// Marty: Performance Audit record for local AI low gear manager.
	if !(isNil "PerformanceAudit_Record") then {
		if (missionNamespace getVariable ["PerformanceAuditEnabled", true]) then {
			["ai_lowgear_manager", diag_tickTime - _perfStart, Format["groupUnits:%1;started:%2", _perfUnits, _perfStarted], "CLIENT"] Call PerformanceAudit_Record;
		};
	};

	sleep 5;
};
