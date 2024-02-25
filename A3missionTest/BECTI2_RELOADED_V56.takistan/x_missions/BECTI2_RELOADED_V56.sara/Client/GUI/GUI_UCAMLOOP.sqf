
_lastUpdate=UIcurrentUnit;
_lastMode=UIcurrentMode;

//mapmanager
_map = displayCtrl 180010;
_map ctrlMapAnimAdd [0,.25,getPos UIcurrentUnit];
ctrlMapAnimCommit _map;

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
		//jump map to selected
		_scaleU = ctrlMapScale _map; //returns number from 1 to 0.001# save the zoom
		
		ctrlMapAnimClear _map;
		_map ctrlMapAnimAdd [1,_scaleU,getPos UIcurrentUnit];
		ctrlMapAnimCommit _map;
		
	};
	//update the map constant
	_scale = ctrlMapScale _map; //returns number from 1 to 0.001# save the zoom
	ctrlMapAnimClear _map;
	_map ctrlMapAnimAdd [1,_scale,getPos UIcurrentUnit];
	ctrlMapAnimCommit _map;


};