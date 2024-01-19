Private ["_logic", "_side", "_commander"];

_side = _this;
_commander = _this select 1;
_logic = (_side) Call cti_CO_FNC_GetSideLogic;


//--- Notify the clients.
["new-commander-assigned", _commander] remoteExecCall ["cti_CL_FNC_HandleSpecial", _side];

//--- Process the AI Commander FSM if it's not running.
if !(isNull _commander) then {
	if (_logic getVariable "cti_aicom_running") then {_logic setVariable ["cti_aicom_running", false]};
};