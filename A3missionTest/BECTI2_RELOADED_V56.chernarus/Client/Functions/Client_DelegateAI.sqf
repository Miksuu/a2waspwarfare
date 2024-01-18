/*
	Create a delegation request.
	 Parameters:
		- Side
		- Groups
		- Spawn positions
		- Teams
*/

Private ["_groups", "_positions", "_side", "_teams", "_town_vehicles"];

_side = _this select 0;
_unitType = _this select 1;
_position = _this select 2;
_team = _this select 3;
_dir = _this select 4;
_special = if(count _this > 5) then{_this select 5};


["INFORMATION", Format["Client_DelegateAI.sqf: Received a delegation request from the server for [%1].", _side]] Call cti_CO_FNC_LogContent;

sleep (random 1); //--- Delay a bit to prevent a bandwidth congestion.

if(isNil '_special')then{
    [_side, _unitType, _position, _team, _dir] call cti_CO_FNC_CreateUnitsForResBases;
} else {
    [_side, _unitType, _position, _team, _dir, _special] call cti_CO_FNC_CreateUnitsForResBases;
};
