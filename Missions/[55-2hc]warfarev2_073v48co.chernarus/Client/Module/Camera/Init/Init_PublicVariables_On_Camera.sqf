scriptName "Client\Module\Camera\Init\Init_PublicVariables_On_Camera.sqf";

Private ['_l','_cameraCommandPV'];

// _l		= ["RequestVehicleLock"];
// _l = _l + ["RequestChangeScore"];
// _l = _l + ["RequestCommanderVote"];
// _l = _l + ["RequestNewCommander"];
// _l = _l + ["RequestStructure"];
// _l = _l + ["RequestDefense"];
// _l = _l + ["RequestJoin"];
// _l = _l + ["RequestMHQRepair"];
// _l = _l + ["RequestSpecial"];
// _l = _l + ["RequestTeamUpdate"];
// _l = _l + ["RequestUpgrade"];
// _l = _l + ["RequestAutoWallConstructinChange"];

//_serverCommandPV = _l;

// _l =      ["AllCampsCaptured"];
// _l = _l + ["AwardBounty"];
// _l = _l + ["AwardBountyPlayer"];
// _l = _l + ["CampCaptured"];
// _l = _l + ["ChangeScore"];
// _l = _l + ["HandleSpecial"];
_l =	  ["HandleSpecialSpectators"];
//_l = _l + ["LocalizeMessage"];
// _l = _l + ["SetTask"];
// _l = _l + ["SetVehicleLock"];
// _l = _l + ["TownCaptured"];
// _l = _l + ["SetMHQLock"];
// _l = _l + ["Available"];
// _l = _l + ["RequestBaseArea"];
// _l = _l + ["HandleParatrooperMarkerCreation"];

_cameraCommandPV = _l;

{
	Call Compile Format["CAMFNC%1 = compile preprocessFileLineNumbers 'Client\Module\Camera\PVFunctions\%1.sqf'", _x];
	if (!isServer || local player) then {
		Format['WFBE_PVF_%1',_x] addPublicVariableEventHandler {(_this select 1) Spawn WFBE_CL_FNC_HandlePVF};
		Format['WFBE_PVF_SPEC_%1',_x] addPublicVariableEventHandler {(_this select 1) Spawn WFBE_CL_FNC_HandlePVF};
	};
} forEach _cameraCommandPV;

// {
// 	Call Compile Format["SRVFNC%1 = compile preprocessFileLineNumbers 'Server\PVFunctions\%1.sqf'", _x];
// 	if (isServer) then {Format['WFBE_PVF_%1',_x] addPublicVariableEventHandler {(_this select 1) Spawn WFBE_SE_FNC_HandlePVF}};
// } forEach _serverCommandPV;

["CAM_INITIALIZATION", Format ["Init_PublicVariables_On_Camera.sqf : Initialized [%1] Camera PV", count _cameraCommandPV]] Call WFBE_CO_FNC_LogContent;