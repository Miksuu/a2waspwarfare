Private["_commanderTeam","_income","_incomeSystem","_side","_ply"];

_side = _this;

_income = (_side) Call cti_CO_FNC_GetTownsIncome;
_commanderTeam = (_side) Call cti_CO_FNC_GetCommanderTeam;
_income_commander = 0;
_income_player = 0;
_incomeCoef = missionNamespace getVariable "cti_C_ECONOMY_INCOME_COEF";
_divisor = missionNamespace getVariable "cti_C_ECONOMY_INCOME_DIVIDED";

if (isNull _commanderTeam) then {_commanderTeam = grpNull};

_logik = (_side) Call cti_CO_FNC_GetSideLogic;
_team_count = (_logik getVariable "cti_teams_count");
					
/*if(_team_count > 0) then {
	_commanderPercent = (_logik getVariable "cti_commander_percent") / 100;	
	_income_player = round(_income - (_income_player * _commanderPercent));		
};

if(_team_count <= 1) then {
	_income_commander = _income_player;	
} else {
	_income_commander = (_income_player + round((_team_count-1) *  _income_player));	
};*/

//missionNamespace getVariable "cti_C_ECONOMY_INCOME_COEF";
_commanderPercent = missionNamespace getVariable "cti_commander_percent";
			
//_income_player = _income;
//_income_commander = _income_player * _incomeCoef;
_income_player = round(_income + ((_income / 100) * (100 - _commanderPercent)));
_income_commander = round(((_income * _incomeCoef) / 100) * _commanderPercent);

if (_commanderTeam == group player) then {
	_income = _income_commander
} else {
	_income = _income_player
};

_income