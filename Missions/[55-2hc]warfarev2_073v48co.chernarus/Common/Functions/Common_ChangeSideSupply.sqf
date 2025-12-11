Private ['_amount','_change','_currentSupply','_side'];

_side = _this select 0;
_amount = _this select 1;
<<<<<<<< HEAD:Missions/[55-2hc]warfarev2_073v48co.chernarus/Common/Functions/Common_ChangeSideSupply.sqf
_reason = "";

if (count _this > 2) then {
	_reason = _this select 2;
};

_maxSupplyLimit = missionNameSpace getvariable "WFBE_C_MAX_ECONOMY_SUPPLY_LIMIT";
========
_maxSupplyLimit = cti_C_MAX_ECONOMY_SUPPLY_LIMIT;
>>>>>>>> AntiStackPreparation:A3missionTest/BECTI2_RELOADED_V56.takistan/x_missions/BECTI2_RELOADED_V56.sara/Common/Functions/Common_ChangeSideSupply.sqf

_currentSupply = (_side) Call cti_CO_FNC_GetSideSupply;
if (isNil '_currentSupply') then {_currentSupply = 0};
_change = _currentSupply + _amount;
if (_change < 0) then {_change = _currentSupply - _amount};
if (_change >= _maxSupplyLimit) then {_change = _maxSupplyLimit};

<<<<<<<< HEAD:Missions/[55-2hc]warfarev2_073v48co.chernarus/Common/Functions/Common_ChangeSideSupply.sqf
missionNamespace setVariable [format ["wfbe_supply_temp_%1", _side], [_side, _amount, _reason]];

publicVariableServer format ["wfbe_supply_temp_%1", _side];

// (_side Call WFBE_CO_FNC_GetSideLogic) setVariable ["wfbe_supply", _change, true];
========
(_side Call cti_CO_FNC_GetSideLogic) setVariable ["cti_supply", _change, true];
>>>>>>>> AntiStackPreparation:A3missionTest/BECTI2_RELOADED_V56.takistan/x_missions/BECTI2_RELOADED_V56.sara/Common/Functions/Common_ChangeSideSupply.sqf
