/*

Parameters:
0: UNIT - (object) the unit that will be doing the HALO
1: (optional) AUTOOPEN -(boolean) true to auto open parachute at 150m
2: (optional) SAVELOADOUT - (boolean) true to save backpack and its contents, and add a "fake" backpack to the front of the unit.
*/
if (!isServer || isDedicated) exitWith {};

//Parameters
private ["_unit","_autoOpen","_saveLoadOut"]; 
_unit 		 = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_autoOpen 	 = [_this, 1, false, [false]] call BIS_fnc_param;
_saveLoadOut = [_this, 2, true, [true]] call BIS_fnc_param;

//Validate parameters
if (isNull _unit) exitWith {"Unit parameter must not be objNull. Accepted: OBJECT" call BIS_fnc_error};

//create a log entry
["HALO function has started"] call BIS_fnc_log;


if (_autoOpen) then {

_unit allowDamage false;
_inv = name _unit;// Get Unique name for Unit's loadout.
[_unit, [missionNamespace, format["%1%2", "Inventory",_inv]]] call BIS_fnc_saveInventory;// Save Loadout

removeBackpack _unit; //remove the backpack
_unit addBackpack "b_parachute"; //add the parachute

_vehicle = vehicle _unit;
_unit disableCollisionWith _vehicle;// Sometimes units take damage when being ejected.

unassignvehicle _unit;
moveout _unit;

_unit setpos [(getpos _vehicle select 0)-5,(getpos _vehicle select 1)-5,(getpos _vehicle select 2)-3];

_unit action ["openParachute", _unit];

_dir = getDir _vehicle;
_unit setDir (_dir + 90);

sleep 1;


[_unit, [missionNamespace, format["%1%2", "Inventory",_inv]]] call BIS_fnc_loadInventory;// Reload Loadout.


_unit allowDamage true;

 _unit setDamage 0;

} else {//HALO-----------------------------------------------------------------------------------------









/*geht halb
_unit allowDamage false;
_inv = name _unit;// Get Unique name for Unit's loadout.
[_unit, [missionNamespace, format["%1%2", "Inventory",_inv]]] call BIS_fnc_saveInventory;// Save Loadout


removeBackpack _unit; //remove the backpack
_unit addBackpack "b_parachute"; //add the parachute

_vehicle = vehicle _unit;
_unit disableCollisionWith _vehicle;// Sometimes units take damage when being ejected.

unassignvehicle _unit;
moveout _unit;

_dir = getDir _vehicle;
_unit setDir (_dir + 90);

//set halo for every height
_hight= (getPosATL _unit select 2)-5; //enough ,setUnitFreefallHeight works with atl only
_unit setUnitFreefallHeight _hight;

sleep 1.5;

waitUntil {animationState _unit == "para_pilot"};
[_unit, [missionNamespace, format["%1%2", "Inventory",_inv]]] call BIS_fnc_loadInventory;// Reload Loadout.

*/











//_saveloadout is old name,its adapted script




if (!isPlayer _unit) then {

_unit allowDamage false;
_inv = name _unit;// Get Unique name for Unit's loadout.
[_unit, [missionNamespace, format["%1%2", "Inventory",_inv]]] call BIS_fnc_saveInventory;// Save Loadout


removeBackpack _unit; //remove the backpack
_unit addBackpack "b_parachute"; //add the parachute

_vehicle = vehicle _unit;
_unit disableCollisionWith _vehicle;// Sometimes units take damage when being ejected.

unassignvehicle _unit;
moveout _unit;





_dir = getDir _vehicle;
_unit setDir (_dir + 90);

//set halo for every height
_hight= (getPosATL _unit select 2)-5; //enough ,setUnitFreefallHeight works with atl only


_unit setUnitFreefallHeight _hight;
sleep 1.5;
_unit allowDamage true;


waitUntil {animationState _unit == "para_pilot"};
[_unit, [missionNamespace, format["%1%2", "Inventory",_inv]]] call BIS_fnc_loadInventory;// Reload Loadout.

}
else{ //PLAYER USE THE GOOD OLD SCRIPT FROM A2----------------------------------------------------------

_hight= (getPosATL _unit select 2)-5; 

sleep 1;
[_unit,_hight] spawn bis_fnc_halo;


};














 
}; 


//create a log
["HALO function has completed"] call BIS_fnc_log;

//Return Value
_unit;