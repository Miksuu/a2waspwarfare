Private ["_income","_incomeCoef","_incomeSystem","_side"];
_side = (_this) Call cti_CO_FNC_GetSideID;

_income = 0;
_incomeCoef = 0;

{
	if ((_x getVariable "sideID") == _side) then {
		_income = _income + (_x getVariable "supplyValue")
	};
} forEach towns;

_income