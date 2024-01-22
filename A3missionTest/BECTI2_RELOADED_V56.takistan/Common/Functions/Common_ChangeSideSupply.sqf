Private ['_amount','_change','_currentSupply','_side'];

_side = _this select 0;
_amount = _this select 1;
_maxSupplyLimit = cti_C_MAX_ECONOMY_SUPPLY_LIMIT;

_currentSupply = (_side) Call cti_CO_FNC_GetSideSupply;
if (isNil '_currentSupply') then {_currentSupply = 0};
_change = _currentSupply + _amount;
if (_change < 0) then {_change = _currentSupply - _amount};
if (_change >= _maxSupplyLimit) then {_change = _maxSupplyLimit};

(_side Call cti_CO_FNC_GetSideLogic) setVariable ["cti_supply", _change, true];