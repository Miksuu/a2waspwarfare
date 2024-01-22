Private ["_areas","_deployed","_direction","_grp","_HQ","_HQName","_logic","_logik","_MHQ","_near","_position","_side","_sideText","_site","_type","_update"];

_type = _this select 0;
_side = _this select 1;
_position = _this select 2;
_direction = _this select 3;
_sideText = _side;
_sideID = (_side) Call cti_CO_FNC_GetSideID;
_logik = (_side) Call cti_CO_FNC_GetSideLogic;

if (typeName _position == "OBJECT") then {_position = position _position};

/* Handle the LAG. */
waitUntil {!(_logik getVariable "cti_hqinuse")};
_logik setVariable ["cti_hqinuse", true];

_HQ = (_side) Call cti_CO_FNC_GetSideHQ;
_deployed = (_side) Call cti_CO_FNC_GetSideHQDeployStatus;

if (!_deployed) then {
	_HQ setPos [1,1,1];
	
	
	
	
	
	_site = createVehicle [_type, _position, [], 0, "NONE"];
	_site setDir _direction;
	_site setPos _position;
	_site setVariable ["cti_side", _side];
	_site setVariable ["cti_structure_type", "Headquarters"];
	
	//stone deploy prevention
	_cleanlist = nearestTerrainObjects [(getPos _site), ["BUILDING", "HOUSE", "CHURCH", "CHAPEL", "BUNKER", "FORTRESS", "FOUNTAIN", "VIEW-TOWER", "LIGHTHOUSE", "QUAY", "FUELSTATION", "HOSPITAL", "FENCE", "WALL", "BUSSTOP", "TRANSMITTER", "STACK", "RUIN", "TOURISM", "WATERTOWER", "POWER LINES", "RAILWAY", "POWERSOLAR", "POWERWAVE", "POWERWIND", "HIDE", "SHIPWRECK","TREE", "SMALL TREE", "BUSH", "FOREST BORDER", "FOREST TRIANGLE", "FOREST SQUARE", "FOREST", "ROCK", "ROCKS", "HIDE"], 19, false, true];
	_countC = 0;
	{[_x, true] remoteExec ["hideObjectGlobal", 0, true];_countC = _countC + 1;} forEach _cleanlist;
	

	
	
	
	_logik setVariable ['cti_hq_deployed', true, true];
	_logik setVariable ["cti_hq", _site, true];
	
	[[[_site,true,_sideID], "Client\Init\Init_BaseStructure.sqf"], "BIS_fnc_execVM", true, true] call BIS_fnc_MP;
	
	[_side,"Deployed", ["Base", _site]] Spawn cti_SE_FNC_SideMessage;
	_site addEventHandler ['killed', {_this Spawn cti_SE_FNC_OnHQKilled}];
	_site addEventHandler ["hit",{_this Spawn cti_SE_FNC_BuildingDamaged}];
	_site addEventHandler ['handleDamage',{[_this select 0,_this select 2,_this select 3, _this select 4] Call cti_SE_FNC_BuildingHandleDamages}];
	
	//--- base area limits.
	if ((missionNamespace getVariable "cti_C_BASE_AREA") > 0) then {
		_update = true;
		_areas = _logik getVariable "cti_basearea";
		_near = [_position,_areas] Call cti_CO_FNC_GetClosestEntity;
		if (!isNull _near) then {
			if (_near distance _position < ((missionNamespace getVariable "cti_C_BASE_AREA_RANGE") + (missionNamespace getVariable "cti_C_BASE_HQ_BUILD_RANGE"))) then {_update = false};
		};
		if (_update) then {
			_grp = createGroup sideLogic;
			_logic = _grp createUnit ["Logic",[0,0,0],[],0,"NONE"];	
			_logic setVariable ["DefenseTeam", createGroup [_side, true]];
            (_logic getVariable "DefenseTeam") setVariable ["cti_persistent", true];
	        _logic setVariable ["weapons",missionNamespace getVariable "cti_C_BASE_DEFENSE_MAX_AI"];
			[_logic, _position,_side,_logik,_areas] remoteExecCall ["cti_CL_FNC_RequestBaseArea",_side];
		};
	};
	
	["INFORMATION", Format ["Construction_HQSite.sqf: [%1] MHQ has been deployed.", _sideText]] Call cti_CO_FNC_LogContent;
	
	deleteVehicle _HQ;
} else {
	_position = getPosATL _HQ;
	_direction = getDir _HQ;
	_HQName = missionNamespace getVariable Format["cti_%1MHQNAME",_sideText];
	
	_MHQ = [_HQName, [1,1,1], _sideID, _direction, true, false] Call cti_CO_FNC_CreateVehicle;
	//_MHQ  spawn {_this allowDamage false; sleep 10; _this allowDamage true};
	
	_MHQ setVelocity [0,0,-1];
	_MHQ setVariable ["cti_Taxi_Prohib", true];
	_MHQ setVariable ["cti_side", _side];
	_MHQ setVariable ["cti_trashable", false];
	_MHQ setVariable ["cti_structure_type", "Headquarters"];
	_MHQ addEventHandler ["hit",{_this Spawn cti_SE_FNC_BuildingDamaged}];
	_logik setVariable ["cti_hq", _MHQ, true];
	_logik setVariable ['cti_hq_deployed', false, true];
	_MHQ setPos _position;
	[_side,"Mobilized", ["Base", _MHQ]] Spawn cti_SE_FNC_SideMessage;
	_MHQ addEventHandler ['killed', {_this Spawn cti_SE_FNC_OnHQKilled}]; //--- Killed EH fires localy, this is the server.
	
	if (isMultiplayer) then {
		["set-hq-killed-eh", _mhq] remoteExecCall ["cti_CL_FNC_HandleSpecial", _side];
		["set-hq-lock-unlock-actions", _mhq] remoteExecCall ["cti_CL_FNC_HandleSpecial", _side];
	};

	//_MHQ addEventHandler ['handleDamage',{[_this select 0,_this select 2,_this select 3] Call cti_SE_FNC_BuildingHandleDamages}];
	["INFORMATION", Format ["Construction_HQSite.sqf: [%1] MHQ has been mobilized.", _sideText]] Call cti_CO_FNC_LogContent;
	_MHQ addAction [localize "STR_WF_Unlock_MHQ","Client\Action\Action_ToggleLock.sqf", [], 95, false, true, '', 'alive _target && (locked _target == 2)'];
    _MHQ addAction [localize "STR_WF_Lock_MHQ","Client\Action\Action_ToggleLock.sqf", [], 94, false, true, '', 'alive _target && (locked _target == 0)'];
	deleteVehicle _HQ;
};

/* Handle the LAG. */
_logik setVariable ["cti_hqinuse", false];