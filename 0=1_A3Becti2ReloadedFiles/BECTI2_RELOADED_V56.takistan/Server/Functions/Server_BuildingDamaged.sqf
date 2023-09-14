Private["_damage","_damagedBy","_logik","_side","_structure","_redu"];

_structure = _this select 0;
_damagedBy = _this select 1;
_damage = _this select 2;
_redu = if (_structure isKindOf "Warfare_HQ_base_unfolded") then {5} else {missionNamespace getVariable "cti_C_STRUCTURES_DAMAGES_REDUCTION"};
_side = _structure getVariable "cti_side";
_logik = (_side) Call cti_CO_FNC_GetSideLogic;

if(!(isNil "_logik"))then{
    if ((getDammage _structure) + (_damage / (_redu)) < 1) then {
    	if (time - (_logik getVariable "cti_structure_lasthit") > 2 && _damage > 0.05) then {
    		_logik setVariable ["cti_structure_lasthit", time];
    		[_side, "IsUnderAttack", ["Base", _structure]] Spawn cti_SE_FNC_SideMessage;
    	};
    };
};