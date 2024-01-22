 
Private ["_count","_destination","_index","_type","_units"];

_destination = _this select 0;
_index = _this select 1;
_artygroup = _this select 2;
_type = 0;

scopeName "FireMission";

_units = [_artygroup,false,_index,cti_Client_SideJoinedText] Call cti_CO_FNC_GetTeamArtillery;

if (count _units < 1) exitWith {};
_type = ((Format ['cti_%1_ARTILLERY_CLASSNAMES',cti_Client_SideJoinedText] Call GetNamespace) select _index) find (typeOf (_units select 0));

if (_type < 0) exitWith {_type};

_units = [_artygroup,false,_index,cti_Client_SideJoinedText] Call cti_CO_FNC_GetTeamArtillery;
if (Count _units < 1) then {breakTo "FireMission"};

for [{_count = count _units - 1},{_count >= 0},{_count = _count - 1}] do {
	[_units select _count,_destination,cti_Client_SideJoined,artyRange,_index] Spawn cti_CO_FNC_FireArtillery;
};


