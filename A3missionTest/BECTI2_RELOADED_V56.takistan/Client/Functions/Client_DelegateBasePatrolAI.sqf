Private ["_site","_units", "_group", "_position", "_sideID", "_WF_Logic","_created"];

_site		= _this select 0;
_units 		= _this select 1;
_position 	= _this select 2;
_side		= _this select 3;
_WF_Logic	= _this select 4;
_created 	= 0;

_group = createGroup [_side, true];
cti_HC_BasePatrolTeams pushBack _group;

{
	if (alive _site) then {
		if (_x isKindOf 'Man') then {
			_sideID = (_side) Call cti_CO_FNC_GetSideID;
			_soldier = [_x,_group,_position,_sideID] Call cti_CO_FNC_CreateUnit;
			_created = _created + 1;
		};
	};
} forEach _units;

if (_created > 0) then {
	_built = _WF_Logic getVariable Format ["%1UnitsCreated",str _side];
	_built = _built + 1;
	_WF_Logic setVariable [Format["%1UnitsCreated",str _side],_built,true];
	[str _side,'UnitsCreated',_built] Call cti_CO_FNC_UpdateStatistics;
	[_group,_site,missionNamespace getVariable "cti_C_AI_PATROL_RANGE"] Spawn cti_SE_FNC_AIPatrol;
};