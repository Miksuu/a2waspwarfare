/*
	Author: Marty

	Name:
		Func_Client_AI_LowGear_Manager.sqf

	Description:
		Starts AI low gear assist for local AI-driven tanks controlled by the player's group.
*/

Private ["_unit","_vehicle", "_driver"];

while {!gameOver} do {

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
				_vehicle spawn Compile preprocessFileLineNumbers "Client\Module\Valhalla\Common_AI_LowGear.sqf";
			};
		};

	} forEach units group player;

	sleep 5;
};