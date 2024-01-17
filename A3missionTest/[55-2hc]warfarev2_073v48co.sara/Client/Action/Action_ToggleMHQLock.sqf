Private ["_lock","_MHQ"];

_MHQ = _this select 0;

_lock = if (locked _MHQ) then {false} else {true};

// cti_RequestVehicleLock = ['SRVFNCREQUESTVEHICLELOCK',[_MHQ,_lock]];
// publicVariable 'cti_RequestVehicleLock';
// if (isHostedServer) then {['SRVFNCREQUESTVEHICLELOCK',[_MHQ,_lock]] Spawn HandleSPVF};

//--- If HQ is local to the client, then just perform the action locally.
if (local _MHQ) then {
	_MHQ lock _lock;
} else {
	[_MHQ,_lock] remoteExecCall ["cti_SE_PVF_RequestVehicleLock",2];
};