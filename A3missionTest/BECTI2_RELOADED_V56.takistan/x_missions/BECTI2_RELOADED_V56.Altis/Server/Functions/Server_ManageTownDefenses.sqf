/*
	Manage or spawn defenses in a town if needed.
	 Parameters:
		- Town.
		- Side.
*/

Private ["_defense","_side","_side_old","_sideID","_spawn","_town"];

_town = _this select 0;
_side = _this select 1;
_sideID_old = _this select 2;
_sideID = (_side) Call cti_CO_FNC_GetSideID;

//--- Browse all the defenses of the town.
{
	_defense = _x getVariable "cti_defense";
	_spawn = false;
	if (isNil '_defense') then {
		_spawn = true;
	} else {
		if (!alive _defense || _sideID_old != _sideID) then { //--- Remove if non-null.
			if !(isNull _defense) then {deleteVehicle _defense};
			_spawn = true;
		};
	};
	
	if (_spawn) then { //--- Spawn a defense according to the types (if it exists).
		[_x, _side] Call cti_SE_FNC_SpawnTownDefense;
	};
} forEach (_town getVariable "cti_town_defenses");

{
	_defense = _x getVariable "cti_defense";
    if !(isNil '_defense') then {
        if (!alive _defense || (_sideID_old != -1 &&_sideID_old != _sideID)) then { //--- Remove if non-null.
            if !(isNull _defense) then {deleteVehicle _defense};
        };
    };
} forEach (_town getVariable "cti_town_defenses_composition");

if (_sideID_old != -1 && _sideID_old != _sideID) then {
    _town_fortifications_composition = (_town getVariable "cti_town_fortifications_composition");
    if!(isNil "_town_fortifications_composition")then{
        {
            deleteVehicle _x;
        } forEach _town_fortifications_composition;
    };
}