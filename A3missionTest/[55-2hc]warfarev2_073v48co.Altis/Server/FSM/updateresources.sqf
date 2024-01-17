private["_ii","_incomeCoef","_divisor","_logik","_income","_income_player","_income_commander","_supply","_comTeam","_paycheck"];

_ii = missionNamespace getVariable "cti_C_ECONOMY_INCOME_INTERVAL";

_incomeCoef = 1;
_divisor = 0;
_suppluy_max_limit = missionNamespace getVariable "cti_C_ECONOMY_SUPPLY_MAX_TEAM_LIMIT";

_incomeCoef = missionNamespace getVariable "cti_C_ECONOMY_INCOME_COEF";
_divisor = missionNamespace getVariable "cti_C_ECONOMY_INCOME_DIVIDED";

while {!cti_GameOver} do {
	{		
		_logik = (_x) Call cti_CO_FNC_GetSideLogic;
		_income = 0; // declares money
		_income_player = 0; // declares money income for a player
		_income_commander = 0; // declares money income for a commander
		_supply = 0; // declares supplies

		_supply =  (_x) Call cti_CO_FNC_GetTownsSupply;
		//////
		if(_supply  < _suppluy_max_limit) then {

			_income = _supply;
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
			_commanderPercent = missionNamespace getVariable "cti_commander_percent";
			
			//_income_player = _income;
			//_income_commander = _income_player * _incomeCoef;
			_income_player = round(_income + ((_income / 100) * (100 - _commanderPercent)));
			_income_commander = round(((_income * _incomeCoef) / 100) * _commanderPercent);			
			
			if (_income > 0) then {
				[_x, _supply] Call cti_CO_FNC_ChangeSideSupply;

				_comTeam = (_x) Call cti_CO_FNC_GetCommanderTeam;
				if (isNull _comTeam) then {_comTeam = grpNull};
				{
					if !(isNil '_x') then {
						if(isPlayer (leader _x))then{
							_paycheck = if (_comTeam != _x) then {_income_player} else {_income_commander};								
							if (_paycheck != 0) then {[_x, _paycheck] call cti_CO_FNC_ChangeTeamFunds};
						};
					};
				} forEach (_logik getVariable "cti_teams");
			};
				
			
		};

	} forEach cti_PRESENTSIDES;

	sleep _ii;
};