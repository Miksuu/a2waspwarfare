//--- Nuke launching.
Private ['_cruise','_dropPosition','_dropPosX','_dropPosY','_dropPosZ','_misFlare','_nukeMarker','_path','_pathS','_planespawnpos','_target','_type'];
_target = _this select 0;
_nukeMarker = _this select 1;

['TacticalLaunch'] remoteExecCall ["cti_CL_FNC_LocalizeMessage"];

//if (isMultiplayer) then {(localize "STR_WF_CHAT_ICBM_Launch") Call cti_CL_FNC_CommandChatMessage};

sleep (missionNamespace getVariable "cti_C_INCOME_TIME_OF_ICBM");

_dropPosition = getpos _target;
_type = 'rhs_ammo_kh55sh';
_cruise = createVehicle [_type,[(_dropPosition select 0) - 4000, (_dropPosition select 1) - 4000, 13000],[], 0, "FLY"];
_cruise setVectorDir [ 0.1,- 1,+ 0.5];
//_cruise setPos [(getPos _cruise select 0) - 4000,(getPos _cruise select 1) + 4000,570];
_cruise setVelocity [0,2,0];
_cruise flyInHeight 13000;
_cruise setSpeedMode "FULL";
_perSecondsChecks = 100;
_missileSpeed = 500;

["ICBM",cti_Client_SideJoined,_target,_cruise,cti_Client_Team] remoteExecCall ["cti_SE_PVF_RequestSpecial",2];

sleep 1.5;

["icbm-display", _target, _cruise] remoteExecCall ["cti_CL_FNC_HandleSpecial"];

//create missile and setting pos
_pos = [(_dropPosition select 0) - 4000, (_dropPosition select 1) - 4000, 13000];

//ajusting missile pos while flying
while {alive _cruise} do {
	if (_cruise distance _target > (_missileSpeed / 10)) then {
		_dirHor = [_cruise, _target] call BIS_fnc_DirTo;
		_cruise setDir _dirHor;

		_dirVer = asin ((((getPosASL _cruise) select 2) - ((getPosASL _target) select 2)) / (_target distance _cruise));
		_dirVer = (_dirVer * -1);
		[_cruise, _dirVer, 0] call BIS_fnc_setPitchBank;

		_flyingTime = (_target distance _cruise) / _missileSpeed;
		_velocityX = (((getPosASL _target) select 0) - ((getPosASL _cruise) select 0)) / _flyingTime;
		_velocityY = (((getPosASL _target) select 1) - ((getPosASL _cruise) select 1)) / _flyingTime;
		_velocityZ = (((getPosASL _target) select 2) - ((getPosASL _cruise) select 2)) / _flyingTime;
		_cruise setVelocity [_velocityX, _velocityY, _velocityZ];


		sleep (1/ _perSecondsChecks);
	};
};

[_cruise] execVM "Client\Module\Nuke\scripts\exhaust1.sqf";


sleep 7;

waitUntil {!alive _cruise};

sleep 50;
deleteMarkerLocal _nukeMarker;
