/*
	Spawn defenses in a town.
	 Parameters:
		- Defense Logic.
		- Side.
*/

Private ["_defense","_defense_logic","_kind","_kinds","_nils","_random","_side","_sideID"];
_defense_logic = _this select 0;
_side = _this select 1;
_sideID = (_side) Call cti_CO_FNC_GetSideID;
_defense = "";

//--- Retrieve the possible kinds.
_kinds = _defense_logic getVariable "cti_defense_kind";

//--- At least one type is needed.
if (count _kinds == 0 || _sideID != cti_C_GUER_ID) exitWith {};

_nils = [];
if (count _kinds > 1) then {
	//--- Get a random one.
	while {true} do {
		_random = floor(random count _kinds);
		_kind = missionNamespace getVariable Format ["cti_%1_Defenses_%2", _side, _kinds select _random];
		if !(isNil '_kind') then {_defense = _kind select floor(random count _kind);} else {_nils pushBack (_kinds select _random); _kinds = [_kinds, [_random]] Call cti_CO_FNC_ArrayShift;};
		if (count _kinds == 0 || _defense != "") exitWith {};
	};
} else {
	//--- Use the default one.
	_kind = missionNamespace getVariable Format ["cti_%1_Defenses_%2", _side, _kinds select 0];
	if !(isNil '_kind') then {_defense = _kind select floor(random count _kind);};
};

//--- Learn and adapt, remove if nil.
if (count _nils > 0) then {_defense_logic setVariable ["cti_defense_kind",(_defense_logic getVariable "cti_defense_kind") - _nils]};

//--- If found, create a defense.

if (_defense != "") then {
	//if(!(_defense in cti_C_STATIC_DEFENCE_FOR_COMPOSITIONS))then {
		Private["_entitie"];
		_entitie = createVehicle [_defense, getPos _defense_logic, [], 0, "NONE"];
		_entitie setDir (direction _defense_logic);
		_entitie setPos (getPos _defense_logic);
		
		//set on ground
		_entitie setPosASL [(getPosASL _entitie)#0,(getPosASL _entitie)#1,(getTerrainHeightASL[(getPosASL _entitie)#0,(getPosASL _entitie)#1])];
		_entitie setVectorUp surfaceNormal (getposATL _entitie);

		
		_entitie addEventHandler ['killed', Format ["[_this select 0, _this select 1, %1] Spawn cti_CO_FNC_OnUnitKilled;", _sideID]];
		_defense_logic setVariable ["cti_defense", _entitie];
	//};
};