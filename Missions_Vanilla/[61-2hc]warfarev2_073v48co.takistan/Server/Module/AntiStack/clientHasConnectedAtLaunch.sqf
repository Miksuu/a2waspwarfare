"WFBE_CLIENT_HAS_CONNECTED_AT_LAUNCH" addPublicVariableEventHandler {
	private ["_uid","_player"];

	_player = _this select 1;
	_uid = getPlayerUID _player;

	diag_log format ["(Supposed) UID: %1", _uid];

	// Marty: ACK launch-time clients without recording AntiStack side state when the module is disabled.
	if ((missionNamespace getVariable ["WFBE_C_ANTISTACK_ENABLED", 1]) == 0) exitWith {
		WFBE_P_HAS_CONNECTED_AT_LAUNCH_ACK = true;
		(owner _player) publicVariableClient "WFBE_P_HAS_CONNECTED_AT_LAUNCH_ACK";
		["INFORMATION", Format ["clientHasConnectedAtLaunch.sqf: AntiStack is disabled; ACK sent without side tracking for UID [%1].", _uid]] Call WFBE_CO_FNC_LogContent;
	};

	if (!(isNil "_uid")) then {
		missionNamespace setVariable [format ["WFBE_PLAYER_%1_CONNECTED_AT_LAUNCH", _uid], side _player];

		WFBE_P_HAS_CONNECTED_AT_LAUNCH_ACK = true;

		(owner _player) publicVariableClient "WFBE_P_HAS_CONNECTED_AT_LAUNCH_ACK";
	};
};
