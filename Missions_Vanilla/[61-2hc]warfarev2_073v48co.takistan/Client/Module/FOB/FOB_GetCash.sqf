/*
	Author: Marty
	Return a FOB cash budget.
	 Parameters:
		- FOB.
*/

Private ["_cash"];

_cash = _this getVariable "wfbe_fob_cash";
if (isNil '_cash') then {_cash = 0};

_cash
