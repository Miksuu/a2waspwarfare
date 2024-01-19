Private["_count","_held","_sideID"];

_held = 0;
_sideID = _this Call cti_CO_FNC_GetSideID;

{if ((_x getVariable 'sideID') == _sideID) then {_held = _held + 1}} forEach towns;

_held