Private ["_difference","_building","_redu"];
_building =_this select 0;
_ammo = _this select 2;


_redu = if (_building isKindOf "Warfare_HQ_base_unfolded") then {3} else {missionNamespace getVariable "cti_C_STRUCTURES_DAMAGES_REDUCTION"};


_difference = ((_this select 1) - (getDammage (_this select 0)))/(_redu);
((getDammage (_this select 0))+_difference)