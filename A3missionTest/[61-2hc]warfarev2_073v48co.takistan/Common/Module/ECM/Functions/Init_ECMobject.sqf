_unit = _this#0;//the ECM source object "ECMunit"
_actionID= _this#2;

//ID
_varname= str _unit;
_OBJECTid=_varname+"id";



_varname= str _unit;
_OBJECTid=_varname+"id";
private _OBJECTSWITCH = missionNamespace getVariable _OBJECTid;
if (isNil "_OBJECTSWITCH") then
{
_OBJECTSWITCH =str _actionID;
missionNamespace setVariable [_OBJECTid, _OBJECTSWITCH];



_MARKERSWITCH=2;
_ECM_AREA_UNITS=[];
_ECM_AREA_VEHICLES=[];
_OUTSIDE_ECM_AREA_VEHICLES=[];

disableMapIndicators [true, true, false, false];

_switch= missionNamespace getVariable _OBJECTid;
_startmessage=2;

while {((alive _unit)&& (_OBJECTSWITCH isEqualTo _switch))} do {//________________LOOOOOOOOOOOOOOOOOP____________________________________________________________________________
_pos = getPosATL _unit;
_switch= missionNamespace getVariable _OBJECTid;

if (_startmessage==2) then{
systemChat "ECM-ON";  
_startmessage=5;};


//UAV KILLER
_allUAV_in_range=[];
{if ((_unit distance _x)<3000)then {_allUAV_in_range pushBackUnique _x};}forEach allUnitsUAV;
for "_i" from 0 to ((count _allUAV_in_range)-1) do {{_x disableUAVConnectability [_allUAV_in_range#_i, true];}forEach allPlayers;};
{_x setAutonomous false;_x EngineOn false;}forEach _allUAV_in_range;
 

if !(_ECM_AREA_UNITS isEqualTypeArray []) then {
	ECM_SYNC_AREA_UNITS = ECM_SYNC_AREA_UNITS - _ECM_AREA_UNITS};
//__________________________________________________________________________________________________________
//Create GLOBAL UNITSSPLITLIST FOR NON_ECM_SCRIPT HANDLING (if inf from inside area firing to outside)
_ECM_AREA_UNITS= allUnits inAreaArray [_pos, 3000, 3000, 0, False, 3000]; 
//add affected units in global list
{ECM_SYNC_AREA_UNITS pushBackUnique _x;}forEach _ECM_AREA_UNITS;
//__________________________________________________________________________________________________________



if !(_ECM_AREA_VEHICLES isEqualTypeArray []) then {
	ECM_SYNC_AREA_VEHICLES = ECM_SYNC_AREA_VEHICLES - _ECM_AREA_VEHICLES};
//__________________________________________________________________________________________________________
//vehicle part
_ECM_AREA_VEHICLES=[]; 
_ECM_AREA_VEHICLES= vehicles inAreaArray [_pos, 3000, 3000, 0, False, 3000];  
//sync condition lists for NON_ECM_SCRIPT
{ECM_SYNC_AREA_VEHICLES pushBackUnique _x;}forEach _ECM_AREA_VEHICLES;

{
	if (!(_x in _OUTSIDE_ECM_AREA_VEHICLES))then {
		
		if(_x == (vehicle player)) then {
		hintSilent "ATTENTION : ECM AREA";
		
		//DISABLE SENSORS
		_sensorlist=listVehicleSensors _x;
		for "_i" from 0 to ((count _sensorlist)-1) do{
		_sensor = _sensorlist#_i;
		if (_sensor isequaltype []) then {
		if (count _sensor > 0) then {
		_sensor = _sensorlist#_i#0;};};
		_x enableVehicleSensor [_sensor,false];};	
		
		//DISABLE DISPLAYCOMPONENTS 
		_allPOS=(allTurrets [_x, true])+[[-1]] ;
		_components=[];
		for "_h" from 0 to ((count _allPOS)-1) do{
		_componentsData = [_x, _allPOS#_h] infoPanelComponents "left"; 
		for "_i" from 0 to ((count _componentsData)-1) do{
		_components pushBackUnique _componentsData#_i#1;};};
		for "_j" from 0 to ((count _components)-1) do { 
		_VALUE=_components#_j; 	
		for "_k" from 0 to ((count _allPOS)-1) do {
		_dirs=["left","right"];
		for "_l" from 0 to ((count _dirs)-1) do {
		[_x,_allPOS#_k] enableInfoPanelComponent [_dirs#_l,_VALUE,false]};};};	 	
		};
	
	_x setVariable ["KILLSWITCH", 5];
	};
		
	_x removeAllEventHandlers "incomingMissile";
	_x addEventHandler ['incomingMissile', {_this Spawn cti_CO_FNC_HandleIncomingMissileECM}];
	sleep 1;
	if !(_x in _OUTSIDE_ECM_AREA_VEHICLES)then {hintSilent "";};
	
} forEach _ECM_AREA_VEHICLES;

//__________________________________________________________________________________________________________


if !(_OUTSIDE_ECM_AREA_VEHICLES isEqualTypeArray []) then {
	OUTSIDE_SYNC_ECM_AREA_VEHICLES = OUTSIDE_SYNC_ECM_AREA_VEHICLES - _OUTSIDE_ECM_AREA_VEHICLES};
//__________________________________________________________________________________________________________
_vehicles=vehicles;
_OUTSIDE_ECM_AREA_VEHICLES =_vehicles - ECM_SYNC_AREA_VEHICLES;
{OUTSIDE_SYNC_ECM_AREA_VEHICLES pushBackUnique _x;}forEach _OUTSIDE_ECM_AREA_VEHICLES;

{	if (((_x getVariable "KILLSWITCH")==5)&&(!(_x in ECM_SYNC_AREA_VEHICLES))&&(_x in OUTSIDE_SYNC_ECM_AREA_VEHICLES)) then {
	
	_x vehiclechat "STATUS : YOU LEAVING ECM AREA";
	
	
	if(_x == (vehicle player)) then {	
//ENABLE DISPLAYCOMPONENTS		 
		_allPOS=(allTurrets [_x, true])+[[-1]] ;
		_components=[];
		for "_h" from 0 to ((count _allPOS)-1) do{
		_componentsData = [_x, _allPOS#_h] infoPanelComponents "left"; 
		for "_i" from 0 to ((count _componentsData)-1) do{
		_components pushBackUnique _componentsData#_i#1;};};
		for "_j" from 0 to ((count _components)-1) do { 
		_VALUE=_components#_j; 	
		for "_k" from 0 to ((count _allPOS)-1) do {
		_dirs=["left","right"];
		for "_l" from 0 to ((count _dirs)-1) do {
		[_x,_allPOS#_k] enableInfoPanelComponent [_dirs#_l,_VALUE,true]};};};
			
//ENABLE SENSORS
		_sensorlist=listVehicleSensors _x;
		for "_i" from 0 to ((count _sensorlist)-1) do{
		_sensor = _sensorlist#_i;
		if (_sensor isequaltype []) then {
		if (count _sensor > 0) then {
		_sensor = _sensorlist#_i#0;};};
		_x enableVehicleSensor [_sensor,true];};
			
//REINITPART 
		if(driver vehicle player isEqualTo player) then {//reinit the displaycomponent
		_v=vehicle player;
		player setpos [(getpos player #0),(getpos player #1),(getpos player #2)+1234];
		player moveInDriver _v;_v EngineOn true;};
		
		if(gunner vehicle player isEqualTo player) then {//reinit the displaycomponent
		_v=vehicle player;
		player setpos [(getpos player #0),(getpos player #1),(getpos player #2)+1234];
		player moveInGunner _v;_v EngineOn true;};
		
		if(commander vehicle player isEqualTo player) then {//reinit the displaycomponent
		_v=vehicle player;
		player setpos [(getpos player #0),(getpos player #1),(getpos player #2)+1234];
		player moveInCommander _v;_v EngineOn true;};		
		};
	
	
	
	

	_x setVariable ["KILLSWITCH", 2];
	};
	
	_x removeAllEventHandlers "incomingMissile";
	_x addEventHandler ['incomingMissile', {_this Spawn cti_CO_FNC_HandleIncomingMissile}];
} forEach _OUTSIDE_ECM_AREA_VEHICLES;
//__________________________________________________________________________________________________________


if (_MARKERSWITCH ==2) then{//--________--MARKERBLOCK--________--MARKERBLOCK--________--MARKERBLOCK


//__________________________________________________________________________________________________________
_markername= str _unit;
for "_i" from 1 to 13 do { 
createMarker [_markername, _unit,0]; 
_markername setMarkerShape "ELLIPSE"; 
_markername setMarkerSize [3000, 3000]; 
_markername setMarkerBrush "SolidFull"; 
_markername=_markername+"1";
};
for "_i" from 1 to 7 do { 
createMarker [_markername, _unit,0]; 
_markername setMarkerType "loc_Transmitter"; 
_markername setMarkerSize [1, 1]; 
_markername=_markername+"1";
};

_MARKERSWITCH=5;

}else{//UPDATE_______________________________________________________________________________________________

		_markername= str _unit;
		for "_i" from 0 to 19 do { 
		deleteMarker _markername;
		_markername=_markername+"1";
		};
		_markername= str _unit;
		for "_i" from 1 to 13 do { 
		createMarker [_markername, _unit,0]; 
		_markername setMarkerShape "ELLIPSE"; 
		_markername setMarkerSize [3000, 3000]; 
		_markername setMarkerBrush "SolidFull"; 
		_markername=_markername+"1";
		 };
		for "_i" from 1 to 7 do { 
		createMarker [_markername, _unit,0]; 
		_markername setMarkerType "loc_Transmitter"; 
		_markername setMarkerSize [1, 1]; 
		_markername=_markername+"1";
		};
	};
sleep 0.5;
//________________________________________________________________________________________________________________________________
}; //____________________________________________________________________________________LOOP END_________________________________
//________________________________________________________________________________________________________________________________

//CLEAR SYNC LISTS
if !(_ECM_AREA_UNITS isEqualTypeArray []) then {
	ECM_SYNC_AREA_UNITS = ECM_SYNC_AREA_UNITS - _ECM_AREA_UNITS};
if !(_ECM_AREA_VEHICLES isEqualTypeArray []) then {
	ECM_SYNC_AREA_VEHICLES = ECM_SYNC_AREA_VEHICLES - _ECM_AREA_VEHICLES};
if !(_OUTSIDE_ECM_AREA_VEHICLES isEqualTypeArray []) then {
	OUTSIDE_SYNC_ECM_AREA_VEHICLES = OUTSIDE_SYNC_ECM_AREA_VEHICLES - _OUTSIDE_ECM_AREA_VEHICLES};	

//________________________________________________________________________________________________________________________________


{
		_x removeAllEventHandlers "incomingMissile";
		_x addEventHandler ['incomingMissile', {_this Spawn cti_CO_FNC_HandleIncomingMissile}];

		
	if(_x == (vehicle player)) then {	
//ENABLE DISPLAYCOMPONENTS		 
		_allPOS=(allTurrets [_x, true])+[[-1]] ;
		_components=[];
		for "_h" from 0 to ((count _allPOS)-1) do{
		_componentsData = [_x, _allPOS#_h] infoPanelComponents "left"; 
		for "_i" from 0 to ((count _componentsData)-1) do{
		_components pushBackUnique _componentsData#_i#1;};};
		for "_j" from 0 to ((count _components)-1) do { 
		_VALUE=_components#_j; 	
		for "_k" from 0 to ((count _allPOS)-1) do {
		_dirs=["left","right"];
		for "_l" from 0 to ((count _dirs)-1) do {
		[_x,_allPOS#_k] enableInfoPanelComponent [_dirs#_l,_VALUE,true]};};};
		
//ENABLE SENSORS
		_sensorlist=listVehicleSensors _x;
		for "_i" from 0 to ((count _sensorlist)-1) do{
		_sensor = _sensorlist#_i;
		if (_sensor isequaltype []) then {
		if (count _sensor > 0) then {
		_sensor = _sensorlist#_i#0;};};
		_x enableVehicleSensor [_sensor,true];};
			
//REINITPART 
		if(driver vehicle player isEqualTo player) then {
		_v=vehicle player;
		player setpos [(getpos player #0),(getpos player #1),(getpos player #2)+1234];
		player moveInDriver _v;_v EngineOn true;};
		
		if(gunner vehicle player isEqualTo player) then {
		_v=vehicle player;
		player setpos [(getpos player #0),(getpos player #1),(getpos player #2)+1234];
		player moveInGunner _v;_v EngineOn true;};
		
		if(commander vehicle player isEqualTo player) then {
		_v=vehicle player;
		player setpos [(getpos player #0),(getpos player #1),(getpos player #2)+1234];
		player moveInCommander _v;_v EngineOn true;};
	};


	//UAV REACTIVATION (only reactivated if ECM destroyed or off, to less cases are possible for sensefull constant reactivation check)
	_allUAV_in_range=[];
	{if ((_unit distance _x)<3000)then {_allUAV_in_range pushBackUnique _x};}forEach allUnitsUAV;
	for "_i" from 0 to ((count _allUAV_in_range)-1) do {{_x enableUAVConnectability [_allUAV_in_range#_i, true];}forEach allPlayers;};
	{_x setAutonomous true;_x EngineOn true;}forEach _allUAV_in_range;

	

} forEach _ECM_AREA_VEHICLES;

_markername= str _unit;
for "_i" from 0 to 19 do { 
deleteMarker _markername;
_markername=_markername+"1";
};
missionNamespace setVariable [_OBJECTid, nil];
 systemChat "ECM-OFF";   

//________________________________________________________________________________________________________________________________


}else {
_end=(str _actionID)+"2ndRUN";
missionNamespace setVariable [_OBJECTid, _end];
systemChat "ECM-SHUTTING DOWN";
};



