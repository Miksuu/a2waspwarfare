/*
	Create units for static defence.
	 Parameters:
		- Side
		- Groups
		- Spawn positions
		- Teams
		- Defence
		- Move In Gunner immidietly or not
*/

Private ["_groups", "_position", "_position", "_side", "_sideID", "_team", "_teams"];

_side = _this select 0;
_groups = [_this select 1];
_position = _this select 2;
_team = _this select 3;
_dir = _this select 4;
_special = if(count _this > 5) then{_this select 5}else{"FORM"};
_sideID = (_side) call cti_CO_FNC_GetSideID;

_built = 0;
_builtveh = 0;
_teams = [];

for '_i' from 0 to count(_groups)-1 do {

	["INFORMATION", Format["Common_CreateUnitForstaticForResBases.sqf: [%1] will create a team template %2 at %3", _side, _groups select _i,_position]] Call cti_CO_FNC_LogContent;

	_sideID = (_side) Call cti_CO_FNC_GetSideID;
	if((_groups select _i) isKindOf "Man")then{
	    _unit = [_groups select _i, _team, _position, _sideID] Call cti_CO_FNC_CreateUnit;
        _built  = _built + 1;
        _teams pushBack _team;
        _unit allowFleeing 0; //--- Make the units brave.
	}else{

	    _vehicle = [_groups select _i, _position, _sideID, 0, true, true, true, _special] Call cti_CO_FNC_CreateVehicle;
        _vehicle setDir _dir;
        _type = if (_vehicle isKindOf 'Air') then {
                    missionNamespace getVariable Format ['cti_%1PILOT',_side]
                } else {
                    missionNamespace getVariable Format ['cti_%1CREW',_side]
                };
        _crew = missionNamespace getVariable Format["cti_%1RESSOLDIER",str _side];
        if ((_groups select _i) isKindOf "Tank") then {_crew = missionNamespace getVariable Format ["cti_%1RESCREW",str _side]};
        if ((_groups select _i) isKindOf "Air") then {_crew = missionNamespace getVariable Format ["cti_%1RESPILOT",str _side]};
        if (_vehicle emptyPositions 'driver' > 0) then {
            _driver = [_crew,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
            _driver moveInDriver _vehicle;
        };
        if (_vehicle emptyPositions 'gunner' > 0) then {
            _gunner = [_crew,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
            _gunner moveInGunner _vehicle;
        };
        if (_vehicle emptyPositions 'commander' > 0) then {
            _commander = [_crew,_team,_position,_sideID] Call cti_CO_FNC_CreateUnit;
            _commander moveInCommander _vehicle;
        };
        _vehicle engineOn true;
        _teams pushBack _team;
	};
};

if (_built > 0) then {[str _side,'UnitsCreated',_built] call cti_CO_FNC_UpdateStatistics};

["INFORMATION", Format["Common_CreateUnitForstaticForResBases.sqf:  [%1] was activated witha total of [%3] units.", _side, _built]] Call cti_CO_FNC_LogContent;

[_teams]