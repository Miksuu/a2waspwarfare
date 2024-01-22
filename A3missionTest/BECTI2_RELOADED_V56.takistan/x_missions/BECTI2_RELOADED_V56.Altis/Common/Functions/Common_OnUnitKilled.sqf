/*
	Triggerd upon a unit death.
	 Parameters:
		- Killed
		- Killer
		- Killed side ID.
*/

Private ["_get","_killed","_killed_isplayer","_killed_group","_killed_isman","_killed_side","_killed_type","_killer","_killer_group","_killer_isplayer","_killer_iswfteam","_killer_side","_killer_type","_killer_vehicle","_killer_uid"];









_killed = _this select 0;
_killer = _this select 1;
_killed_side = (_this select 2) Call cti_CO_FNC_GetSideFromID;
_type=typeOf _killed;








if (_killer == _killed || isNull _killer) then { //--- The killed may be the killer (suicide) or bailed before destruction.
	_last_hit = _killed getVariable "cti_lasthitby";
	if !(isNil '_last_hit') then {
		if (alive _last_hit) then {
			if (side _last_hit != _killed_side && time - (_killed getVariable "cti_lasthittime") < 25) then {_killer = _last_hit};
		};
	};
};

if (isNil '_killed_side') then {
	_killed_side = side _killed;
};

["INFORMATION", Format ["Common_OnUnitKilled.sqf: [%1] [%2] has been killed by [%3].", _killed_side, _killed, _killer]] Call cti_CO_FNC_LogContent;

if !(alive _killer) exitWith {}; //--- Killer is null or dead, nothing to see here.

//--- Retrieve basic information.
_killed_group = group _killed;
_killed_isman = if (_killed isKindOf "Man") then {true} else {false};
_killed_type = typeOf _killed;
_killer_group = group _killer;
_killer_isplayer = if (isPlayer _killer) then {true} else {false};
_killed_isplayer = if (isPlayer _killed) then {true} else {false};
_killer_iswfteam = if !(isNil {_killer_group getVariable "cti_funds"}) then {true} else {false};
_killer_side = side _killer;
_killer_type = typeOf _killer;
_killer_vehicle = vehicle _killer;
_killer_uid = getPlayerUID (leader _killer_group);


if (_killer_side == sideEnemy) then { //--- Make sure the killer is not renegade, if so, get the side from the config.
	if !(_killer isKindOf "Man") then {_killer_type = typeOf effectiveCommander(vehicle _killer)};
	_killer_side = switch (getNumber(configFile >> "CfgVehicles" >> _killer_type >> "side")) do {case 0: {east}; case 1: {west}; case 2: {resistance}; default {civilian}};
};

if (_killer_side == civilian) exitWith {}; //--- Side couldn't be determined? exit.

if (isServer) then {_killed setVariable ["cti_trashed", true];	_killed Spawn cti_CO_FNC_TrashObject};
if (_killed_isplayer) then {_killed setVariable ["cti_trashed", true];	_killed Spawn cti_CO_FNC_TrashObject};


if (_killed_side in cti_PRESENTSIDES) then { //--- Update the statistics if needed.
	if (_killed_isman) then {[str _killed_side,'Casualties',1] Call cti_CO_FNC_UpdateStatistics} else {[str _killed_side,'VehiclesLost',1] Call cti_CO_FNC_UpdateStatistics};
};

_get = missionNamespace getVariable _killed_type; //--- Get the killed informations.

if (!isNil '_get' && _killer_iswfteam) then { //--- Make sure that type killed type is defined in the core files and that the killer is a WF team.
	if (_killer_side != _killed_side) then { //--- Normal kill.
		if (isPlayer (leader _killer_group)) then { //--- The team is lead by a player.
			_killer_award = objNull;
			if !(_killer_isplayer) then { //--- An AI is the killer.
				_killer_award = _killer;
				_points = switch (true) do {
					case (_killed_type isKindOf "Infantry"): {1};
					case (_killed_type isKindOf "Car"): {2};
					case (_killed_type isKindOf "Ship"): {4};
					case (_killed_type isKindOf "Motorcycle"): {1};
					case (_killed_type isKindOf "Tank"): {4};
					case (_killed_type isKindOf "Helicopter"): {4};
					case (_killed_type isKindOf "Plane"): {6};
					case (_killed_type isKindOf "StaticWeapon"): {2};
					case (_killed_type isKindOf "Building"): {2};
					default {1};
				};

				if (isServer) then {
					//['SRVFNCREQUESTCHANGESCORE',[leader _killer_group, (score leader _killer_group) + _points]] Spawn cti_SE_FNC_HandlePVF;
					[leader _killer_group, (score leader _killer_group) + _points] call cti_SE_PVF_RequestChangeScore;


				} else {
					[leader _killer_group, (score leader _killer_group) + _points] remoteExecCall ["cti_SE_PVF_RequestChangeScore",2];
				};
			};

			//--- Award the bounty if needed.
			if (_killed_isplayer && _killer_isplayer) then {
				[_killed] remoteExecCall ["cti_CL_FNC_AwardBountyPlayer", _killer];
				
			};

			[_killed_type, false, _killer_award] remoteExecCall ["cti_CL_FNC_AwardBounty", leader _killer_group];
			if (vehicle _killed != _killed && alive _killed) then { //--- Kill assist (players in the same vehicle).
				{
					if (alive _x && isPlayer _x) then {
						[_objectType, true] remoteExecCall ["cti_CL_FNC_AwardBounty", getPlayerUID(_x)];
					}
				} forEach ((crew (vehicle _killed)) - [_killer, player]);
			};
		};
	} else { //--- Teamkill.
		if (isPlayer (leader _killer_group) && _killer != _killed && !(_killed_type isKindOf "Building")) then {

		//--- Only applies to player groups.
			['Teamkill'] remoteExecCall ["cti_CL_FNC_LocalizeMessage", _killer];
		};
	};
};

if(!isPlayer(_killed))then{
	_killed removeEventHandler ["killed", 0];
    if!(_killed_type isKindOf "Infantry")then{
        _killed removeEventHandler ["hit", 0];
    };
};