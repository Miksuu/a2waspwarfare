private ["_canJoin","_get","_name","_player","_side","_sideOrigin","_uid","_skip","_otherside","_sidepros","_othersidepros","_playersinside","_playersinotherside"];

_player = _this select 0;
_side = _this select 1;
_name = name _player;

_skip = 0;
_otherside = west;
_playersinside = 0;
_playersinotherside = 0;
_sidepros = 0;
_othersidepros = 0;

_uid = getPlayerUID(_player);
_canJoin = true;

if (_side == west) then {_otherside = east;};

_playersinside = ({side _x == _side && isPlayer _x} count (playableUnits + switchableUnits));
_playersinotherside = ({side _x == _otherside && isPlayer _x} count (playableUnits + switchableUnits));
_get = missionNamespace getVariable Format["cti_JIP_USER%1",_uid];

if !(isNil '_get') then { //--- Retrieve JIP Information if there's any.

	_skip = _get select 4;
	_sideOrigin = _get select 2; //--- Get the original side.

	if (_skip == 0) then {

		_players_difference =  _playersinside - _playersinotherside;


		if(_players_difference > 2) then {
	        _canJoin = false;
			missionNamespace setVariable [format["cti_JIP_USER%1",_uid], nil];
			['Teamstack',_name,_uid,_side] remoteExecCall ["cti_CL_FNC_LocalizeMessage", _player];
			["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] has been sent back to the lobby for teamstacking,joined side [%3].", _name,_uid,_side]] Call cti_CO_FNC_LogContent;
			_get set [4,0];
		};

	}else{
		if (_sideOrigin != _side) then { //--- The joined side differs from the original one.

			_canJoin = false;

			['Teamswap',_name,_uid,_sideOrigin,_side] remoteExecCall ["cti_CL_FNC_LocalizeMessage"];

			[14000, ["\n \n" + (localize 'STR_WF_Teamswap'), "PLAIN", 10]] remoteExec ["cutText", _player];

			sleep 12;

			["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] has been sent back to the lobby for teamswapping, original side [%3], joined side [%4].", _name,_uid,_sideOrigin,_side]] Call cti_CO_FNC_LogContent;
		}else {
			_canJoin = true;
		};
	};

} else {
	["WARNING", Format["RequestJoin.sqf: Unable to find JIP information for player [%1] [%2].", _name, _uid]] Call cti_CO_FNC_LogContent;
};


["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] can join? [%3].", _name, _uid, _canJoin]] Call cti_CO_FNC_LogContent;
['join-answer', _canJoin] remoteExecCall ["cti_CL_FNC_HandleSpecial", _player];