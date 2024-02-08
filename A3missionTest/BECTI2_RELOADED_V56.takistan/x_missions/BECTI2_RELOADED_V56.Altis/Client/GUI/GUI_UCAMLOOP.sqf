
_lastUpdate=UIcurrentUnit;
_lastMode=UIcurrentMode;

while {UCAMSWITCH} do {
	
	sleep 0.1;
	if !(alive player) then{//end this loop
	UCAMSWITCH=false;
	};
			
	if (Side player != cti_Client_SideJoined || !dialog) exitWith {};

	
	if !(alive UIcurrentUnit) then {//jump back to player
		UIcurrentUnit = (player) Call cti_CO_FNC_GetUnitVehicle;
		
	};
	
	//--- Update the Camera.
	if (!(UIcurrentUnit == _lastUpdate)||!(UIcurrentMode==_lastMode)) then {//something changed	
		UIcurrentUnit switchCamera UIcurrentMode;
		_lastUpdate=UIcurrentUnit;
		_lastMode=UIcurrentMode;
	};
};