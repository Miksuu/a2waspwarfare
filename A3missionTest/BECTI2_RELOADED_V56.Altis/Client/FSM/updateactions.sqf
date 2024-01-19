_optionsID = -1;
_lastVehicle = player;
_UpdateActions = true;
_lastUpdate = time;



if (Vehicle player != _lastVehicle) then {_UpdateActions = true};

if(alive player && _UpdateActions)then{
	_UpdateActions = false;
	_vehicle = Vehicle player;
	if (_vehicle != player) then {_optionsID = _vehicle addAction ["<t color='#42b6ff'>" + (localize "STR_WF_Options") + "</t>","Client\Action\Action_Menu.sqf", "", 1, false, true, "", ""]} else {_lastVehicle RemoveAction _optionsID};
	_lastVehicle = _vehicle;
};


	


while {alive player && !_UpdateActions} do {
	if (Vehicle player != _lastVehicle) then {_UpdateActions = true};

	_lastUpdate = time;
	if(alive player && _UpdateActions)then{
		_UpdateActions = false;
		_vehicle = Vehicle player;
		if (_vehicle != player) then {_optionsID = _vehicle addAction ["<t color='#42b6ff'>" + (localize "STR_WF_Options") + "</t>","Client\Action\Action_Menu.sqf", "", 1, false, true, "", ""]} else {_lastVehicle RemoveAction _optionsID};
		_lastVehicle = _vehicle;
	};

	sleep 5;
};

_lastVehicle RemoveAction _optionsID;