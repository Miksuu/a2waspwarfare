"WFBE_CLIENT_HAS_CONNECTED_AT_LAUNCH" addPublicVariableEventHandler {
	private ["_uid","_player"];

	_player = _this;
	_uid = getPlayedUID _player;

	diag_log format ["(Supposed) UID: %1", _uid];

	missionNamespace setVariable [format ["WFBE_PLAYER_%1_CONNECTED_AT_LAUNCH", _uid], true];

	WFBE_P_HAS_CONNECTED_AT_LAUNCH_ACK = true;
	
	(owner _player) publicVariableClient "WFBE_P_HAS_CONNECTED_AT_LAUNCH_ACK";
};