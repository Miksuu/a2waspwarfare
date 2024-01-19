private ["_upgrade_level", "_item", "_var"];

_item = _this;

_upgrade_level = 0;
_var = missionNamespace getVariable format["cti_%1", _item];

if !(isNil '_var') then { _upgrade_level = (_var select 0) select 0 };

_upgrade_level