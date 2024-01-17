Private ['_add','_buildings','_built','_checks','_closest','_d','_dir','_driver','_group','_gunner','_lastWP','_lastWPpos','_logic','_logicMARTA','_pos','_radius','_sorted','_spawn','_step','_uav','_waypoints','_wp','_wpcount'];
_logic = WF_Logic;

if (!isNull playerUAV) then {if (!alive playerUAV) then {playerUAV = objNull}};
if (!isNull playerUAV) exitWith {
	//--- Disable targetting.
	{(driver playerUAV) disableAI _x} forEach ["TARGET","AUTOTARGET"];
	call WFVE_fnc_uav_interface;
};

if (isNil {missionNamespace getVariable Format ["cti_%1UAV",cti_Client_SideJoinedText]}) exitWith {};
if ((missionNamespace getVariable Format ["cti_%1UAV",cti_Client_SideJoinedText]) == "") exitWith {};

_buildings = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideStructures;
_checks = [cti_Client_SideJoined,missionNamespace getVariable Format ["cti_%1COMMANDCENTERTYPE",cti_Client_SideJoinedText],_buildings] Call cti_CO_FNC_GetFactories;
_closest = objNull;
if (count _checks > 0) then { _closest = [player,_checks] Call cti_CO_FNC_GetClosestEntity; };

if (isNull _closest) exitWith {};

_uav = createVehicle [missionNamespace getVariable Format ["cti_%1UAV",cti_Client_SideJoinedText],getPos _closest, [], 0, "FLY"];
playerUAV = _uav;
Call Compile Format ["_uav addEventHandler ['Killed',{[_this select 0,_this select 1,%1] Spawn cti_CO_FNC_OnUnitKilled}]",sideID];

[[[_uav,cti_Client_SideJoined], "Common\Init\Init_Unit.sqf"], "BIS_fnc_execVM", true, true] call BIS_fnc_MP;
removeAllWeapons _uav;

_group = createGroup [cti_Client_SideJoined, true];
_driver = [missionNamespace getVariable Format ["cti_%1SOLDIER",cti_Client_SideJoinedText],_group,getPos _uav,cti_Client_SideID] Call cti_CO_FNC_CreateUnit;
_driver moveInDriver _uav;

//--- Disable targetting.
{(driver playerUAV) disableAI _x} forEach ["TARGET","AUTOTARGET"];

_built = 1;
//--- OPFOR Uav has no gunner slot.
if (cti_Client_SideJoined == west) then {
	_gunner = [missionNamespace getVariable Format ["cti_%1SOLDIER",cti_Client_SideJoinedText],_group,getPos _uav,cti_Client_SideID] Call cti_CO_FNC_CreateUnit;
	_gunner MoveInGunner _uav;
	_built = _built + 1;
};
[cti_Client_SideJoinedText,'UnitsCreated',_built] Call cti_CO_FNC_UpdateStatistics;
[cti_Client_SideJoinedText,'VehiclesCreated',1] Call cti_CO_FNC_UpdateStatistics;

-12500 Call cti_CL_FNC_ChangePlayerFunds;

["uav",cti_Client_SideJoined,_uav,cti_Client_Team] remoteExecCall ["cti_SE_PVF_RequestSpecial",2];

sleep 0.02;

if ((count units _uav) > 1) then {[driver _uav] join grpnull};

_radius = 1000;
_wpcount = 4;
_step = 360 / _wpcount;
_add = 0;
_dir = 0;
if !(isNil "_lastWP") then {deleteWaypoint _lastWP};

//--- No need to preprocess those.
call WFVE_fnc_uav_interface;
[_uav] spawn WFVE_fnc_uav_spotter;

_spawn = [] spawn {};
while {alive _uav} do {
	waituntil {waypointDescription [group _uav,currentWaypoint group _uav] != ' ' || !alive _uav};
	terminate _spawn; //--- Terminate spawn from previous loop
	if !(alive _uav) exitWith {};

	_waypoints = waypoints _uav;
	_lastWP = _waypoints select (count _waypoints - 1);
	_lastWPpos = waypointPosition _lastWP;
	deleteWaypoint _lastWP;
	for "_d" from 0 to (360-_step) step _step do
	{
		_add = _d;
		_pos = [_lastWPpos, _radius, _dir+_add] call bis_fnc_relPos;
		_wp = (group _uav) addWaypoint [_pos,0];
		_wp setWaypointType "MOVE";
		_wp setWaypointDescription ' ';
		if(isNil '_wpcount')then{_wpcount = count waypoints _uav;};
		_wp setWaypointCompletionRadius (1000/_wpcount);
	};

	_spawn = [_uav,_add,_step,_lastWPpos,_radius,_dir] spawn {
		Private ['_add','_currentWP','_dir','_lastWPpos','_pos','_radius','_step','_uav','_wp'];
		scriptname "UAV Route planning";
		_uav = _this select 0;
		_add = _this select 1;
		_step = _this select 2;
		_lastWPpos = _this select 3;
		_radius = _this select 4;
		_dir = _this select 5;
		_currentWP = currentWaypoint group _uav;
		while {alive _uav} do {
			waitUntil {_currentWP != currentWaypoint group _uav};
			sleep .01;
			_add = _add + _step;
			_pos = [_lastWPpos, _radius, _dir+_add] call bis_fnc_relPos;
			_wp = (group _uav) addWaypoint [_pos,0];
			_wp setWaypointType "MOVE";
			_wp setWaypointDescription ' ';
			_wp setWaypointCompletionRadius (1000/_wpcount);
			_currentWP = currentWaypoint group _uav;
		};
	};

	_wpcount = count waypoints _uav;
	waitUntil {waypointDescription [group _uav,currentWaypoint group _uav] == ' ' || _wpcount != count waypoints _uav || !alive _uav};
	if (!(alive _uav)||isNull _uav) exitWith {};
};
