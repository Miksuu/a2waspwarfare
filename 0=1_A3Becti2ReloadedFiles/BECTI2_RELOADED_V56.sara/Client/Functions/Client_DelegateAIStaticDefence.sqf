/*
	Create a delegation request.
	 Parameters:
		- Side
		- Groups
		- Spawn positions
		- Teams
		- defence
		- Move In Gunner immidietly or not
*/

Private ["_groups", "_positions", "_side", "_teams", "_town_vehicles"];

_side = _this select 0;
_groups = _this select 1;
_positions = _this select 2;
_team = _this select 3;
_defence = _this select 4;
_moveInGunner = _this select 5;

["INFORMATION", Format["Client_DelegateAIStaticDefence.sqf: Received a delegation request from the server for [%1].", _side]] Call cti_CO_FNC_LogContent;

sleep (random 1); //--- Delay a bit to prevent a bandwidth congestion.

if (isNil '_team') then {
    switch (_side)do{
        case west: {
            if(isNil 'cti_HC_DEFENCE_GROUP_WEST')then{
                _team = createGroup [_side, true];
                cti_HC_DEFENCE_GROUP_WEST = _team;
            }else{
                if((count units cti_HC_DEFENCE_GROUP_WEST) > 10) then {
                    _team = createGroup [_side, true];
                    cti_HC_DEFENCE_GROUP_WEST = _team;
                };
            };
        };
        case east: {
            if(isNil 'cti_HC_DEFENCE_GROUP_EAST')then{
    _team = createGroup [_side, true];
                cti_HC_DEFENCE_GROUP_EAST = _team;
            }else{
                if((count units cti_HC_DEFENCE_GROUP_EAST) > 10) then {
                    _team = createGroup [_side, true];
                    cti_HC_DEFENCE_GROUP_EAST = _team;
                };
};
        };
    };
};

[_side, _groups, _positions, _team, _defence, _moveInGunner] call cti_CO_FNC_CreateUnitForStaticDefence;
