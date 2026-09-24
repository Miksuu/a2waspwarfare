/*
	Author: Marty
	Return the supply loaded in a supply truck (set by the supply mission), or 0.
	 Parameters:
		- Truck.
*/

Private ["_supply"];

_supply = _this getVariable "SupplyAmount";
if (isNil '_supply') then {_supply = 0};

_supply
