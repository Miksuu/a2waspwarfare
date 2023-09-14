/*
	Triggered whenever the HQ is killed.
	 Parameters:
		- HQ
		- Shooter
*/

Private ["_building","_dammages","_dammages_current","_get","_killer","_logik","_origin","_structure","_structure_kind"];

_structure = _this select 0;
_killer = _this select 1;

_structure_kind = typeOf _structure;
_side = _structure getVariable "cti_side";

while {isNil "_side"}do{
	_side = _structure getVariable "cti_side";
	if(isNil "_side")then{sleep 1};
};

_logik = (_side) Call cti_CO_FNC_GetSideLogic;
//_logik setVariable ["cti_hq",_structure,true];

//--- If HQ was mobibilized, spawn a dead hq.
if ((_side) Call cti_CO_FNC_GetSideHQDeployStatus) then {
	Private ["_hq"];
	_hq = [missionNamespace getVariable Format["cti_%1MHQNAME", _side], getPos _structure, (_side) Call cti_CO_FNC_GetSideID, getDir _structure, false, false, false] Call cti_CO_FNC_CreateVehicle;
	_hq setPos (getPos _structure);
	_hq setVariable ["cti_trashable", false];
	_hq setVariable ["cti_side", _side];
	_hq setDamage 1;

	//--- HQ is now considered mobilized.
	_logik setVariable ["cti_hq_deployed", false, true];
	_logik setVariable ["cti_hq",_hq,true];

	//--- Remove the structure after the burial.
	(_structure) Spawn {sleep 10; deleteVehicle _this};
};

//--- Spawn a radio message.
[_side, "Destroyed", ["Base", _structure]] Spawn cti_SE_FNC_SideMessage;

_teamkill = if (side _killer == _side) then {true} else {false};


_killer_uid = getPlayerUID _killer;
//if (!paramShowUID) then {_killer_uid = "xxxxxxx"};

if ((!isNull _killer) && (isPlayer _killer)) then
{
    if (_teamkill) then
    {
		["BuildingTeamkill", name _killer, _killer_uid, _structure_kind] remoteExecCall ["cti_CL_FNC_LocalizeMessage", _side];
    }
    else
    {
		["HeadHunterReceiveBounty", (name _killer), 30000, _structure_kind, _side] remoteExecCall ["cti_CL_FNC_LocalizeMessage"];
    };
};

["INFORMATION", Format["Server_OnHQKilled.sqf : [%1] HQ [%2] has been destroyed by [%3], Teamkill? [%4], Side Teamkill? [%5]", _side, _structure_kind, name _killer, _teamkill, side _killer]] Call cti_CO_FNC_LogContent;