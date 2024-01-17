private["_side", "_sideText", "_structurePos", "_resTemplates", "_resTemplatesTypes", "_heavyTemplate"];

_building = _this select 0;
_side = _this select 1;
_type = _this select 2;
_facIndex = _this select 3;
_sideText = str _side;

Call Compile Format ["_building AddEventHandler ['killed',{[_this select 0,_this select 1,'%1'] Spawn cti_SE_FNC_BuildingKilled}];",_type];

_building addEventHandler ['handleDamage',{[_this select 0,_this select 2,_this select 3] Call cti_SE_FNC_BuildingHandleDamages}];

_resTemplates = missionNamespace getVariable Format["cti_%1RESTEAMTEMPLATES",_sideText];
_resTemplatesTypes = missionNamespace getVariable Format["cti_%1RESTEAMTYPES",_sideText];
_heavyTemplate = [];
_o = 0;
{
	if (_resTemplatesTypes select _o == 3) then {_heavyTemplate pushBack _o};
	_o = _o + 1;
} forEach _resTemplates;

WF_Logic setVariable [Format["%1%2TeamBaseHeavyPatrol%3",_sideText, _facIndex, 1],false];

while{alive _building}do{
    _patrolTeamAlive = WF_Logic getVariable Format["%1%2TeamBaseHeavyPatrol%3",_sideText, _facIndex, 1];
	if (!_patrolTeamAlive) then {
        _ranTemp = _heavyTemplate select (random((count _heavyTemplate)-1));
        _templateToUse = _resTemplates select _ranTemp;
        [_side,_templateToUse,_building,Format["%1%2TeamBaseHeavyPatrol%3",_sideText, _facIndex, 1], false] spawn cti_SE_FNC_ResVehTeam;
        WF_Logic setVariable [Format["%1%2TeamBaseHeavyPatrol%3",_sideText, _facIndex, 1],true];
	};
	sleep 1200;
};

