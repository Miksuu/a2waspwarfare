/*
	Triggered whenever the HQ is killed.
	 Parameters:
		- HQ
		- Shooter
*/

Private ["_building","_dammages","_dammages_current","_get","_killer","_logik","_origin","_structure","_structure_kind","_killerGroup"];

_structure = _this select 0;
_killer = _this select 1;

_structure_kind = typeOf _structure;
_side = _structure getVariable "wfbe_side";
_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;
_killerGroup = group _killer;

//--- If HQ was mobibilized, spawn a dead hq.
if ((_side) Call WFBE_CO_FNC_GetSideHQDeployStatus) then {
	Private ["_hq"];
	_hq = [missionNamespace getVariable Format["WFBE_%1MHQNAME", _side], getPos _structure, (_side) Call WFBE_CO_FNC_GetSideID, getDir _structure, false, false, false] Call WFBE_CO_FNC_CreateVehicle;
	_hq setPos (getPos _structure);
	_hq setVariable ["wfbe_trashable", false];
	_hq setVariable ["wfbe_side", _side];
	_hq setDamage 1;

	//--- HQ is now considered mobilized.
	_logik setVariable ["wfbe_hq_deployed", false, true];
	_logik setVariable ["wfbe_hq",_hq,true];

	//--- Remove the structure after the burial.
	(_structure) Spawn {sleep 10; deleteVehicle _this};
};

//--- Spawn a radio message.
[_side, "Destroyed", ["Base", _structure]] Spawn SideMessage;

//--- Teamkill? [_side, "SendMessage", ["command", "tkill", [name _killer, _structure_kind]]] Call WFBE_CO_FNC_SendToClients
_teamkill = if (side _killer == _side) then {true} else {false};


_killer_uid = getPlayerUID _killer;
//if (!paramShowUID) then {_killer_uid = "xxxxxxx"};

if ((!isNull _killer) && (isPlayer _killer)) then
{
    if (_teamkill) then
    {
        [_side, "LocalizeMessage", ["BuildingTeamkill", name _killer, _killer_uid, _structure_kind]] call WFBE_CO_FNC_SendToClients;
    }
    else
    {
        [nil, "LocalizeMessage", ["HeadHunterReceiveBounty", (name _killer), 30000, _structure_kind, _side]] call WFBE_CO_FNC_SendToClients;
    };
};

// Only awards score for non-teamkills of the HQ
if (_side != side _killer) then
{
    Private ["_score"];
    _score = 900; // HQ bounty award / 100*3

    // Change the score of the leader of the group upon killing the hq

	(leader _killerGroup) addScore _score;

    //['SRVFNCREQUESTCHANGESCORE',[leader _killerGroup, score leader _killerGroup + _score]] Spawn WFBE_SE_FNC_HandlePVF;
};

// Commented out for now, heavily bugged
// Marty : Marking HQ wreck on map 
//_marker_name 		= "HQ_WRECK_" + str(_side) ;
//_marker_position 	= getPos _structure ;
//_markerType 		= "Flag";
//_markerText 		= "HQ WRECK must be repaired";
//_markerColor 		= "ColorRed";
//_markerSide			= _side;

//[_marker_name, _marker_position, _markerType, _markerText, _markerColor, _markerSide] call WF_createMarker ;

// Marty : updating hq wreck mark in case of moron moving it for some reasons (very rare but some do it)
//if (_side == west) then
//{
	//diag_log format[ "1. DEBUG _side = %1 | type = %2", _side, typeName _side ];
	//diag_log format[ "2. DEBUG _marker_name = %1 | type = %2", _marker_name, typeName _marker_name ];

	//_IS_WEST_HQ_WRECK_ALIVE = false;
//	missionNamespace setVariable ["IS_WEST_HQ_WRECK_ALIVE", false];
//	publicVariable "IS_WEST_HQ_WRECK_ALIVE";

//	[_structure] spawn
//	{
//		_HQ_wreck = _this select 0;

//		sleep 2 ; //waiting for marker to be created

//		_is_west_hq_wreck_alive =  missionNamespace getVariable "IS_WEST_HQ_WRECK_ALIVE";
		//diag_log format[ "3. DEBUG _is_west_hq_wreck_alive = %1 | type = %2", _is_west_hq_wreck_alive, typeName _is_west_hq_wreck_alive ];

//		while {!_is_west_hq_wreck_alive} do
//		{
//			_marker_HQ_wreck_Position = getPos _HQ_wreck ;
//			"HQ_WRECK_WEST" setMarkerPos _marker_HQ_wreck_Position ;
//			_is_west_hq_wreck_alive =  missionNamespace getVariable "IS_WEST_HQ_WRECK_ALIVE";
//			sleep 1 ; // we can increase this value in order to reduce cpu usage if we want.
//		};
		//diag_log format[ "4. DEBUG _is_west_hq_wreck_alive = %1 | type = %2", _is_west_hq_wreck_alive, typeName _is_west_hq_wreck_alive ];
		
//	};

//};

//if (_side == east) then
//{
	//diag_log format[ "1. DEBUG _side = %1 | type = %2", _side, typeName _side ];
//	missionNamespace setVariable ["IS_EAST_HQ_WRECK_ALIVE", false];
//	publicVariable "IS_EAST_HQ_WRECK_ALIVE";

//	[_structure] spawn
//	{
//		_HQ_wreck = _this select 0;

//		sleep 2 ; //waiting for marker to be created

//		_is_east_hq_wreck_alive =  missionNamespace getVariable "IS_EAST_HQ_WRECK_ALIVE";
		//diag_log format[ "2. DEBUG _is_east_hq_wreck_alive = %1 | type = %2", _is_east_hq_wreck_alive, typeName _is_east_hq_wreck_alive ];

//		while {!_is_east_hq_wreck_alive} do
//		{
//			_marker_HQ_wreck_Position = getPos _HQ_wreck ;
//			"HQ_WRECK_EAST" setMarkerPos _marker_HQ_wreck_Position ;
//			_is_east_hq_wreck_alive =  missionNamespace getVariable "IS_EAST_HQ_WRECK_ALIVE";
//			sleep 1 ; // we can increase this value in order to reduce cpu usage if we want.
//		};
		//diag_log format[ "3. DEBUG _is_west_hq_wreck_alive = %1 | type = %2", _is_west_hq_wreck_alive, typeName _is_west_hq_wreck_alive ];

//	};

//};

["INFORMATION", Format["Server_OnHQKilled.sqf : [%1] HQ [%2] has been destroyed by [%3], Teamkill? [%4], Side Teamkill? [%5]", _side, _structure_kind, name _killer, _teamkill, side _killer]] Call WFBE_CO_FNC_LogContent;

/*
_msg = format ["Server_OnHQKilled.sqf: _this = %1", _this];
player sideChat _msg;
diag_log _msg;
*/
