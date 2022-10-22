private ["_canJoin","_get","_name","_player","_side","_sideOrigin","_uid","_skip","_otherside","_sidepros","_othersidepros","_playersinside","_playersinotherside","_totalSkillBLUFOR","_totalSkillOPFOR"];

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
_get = missionNamespace getVariable Format["WFBE_JIP_USER%1",_uid];

if !(isNil '_get') then { //--- Retrieve JIP Information if there's any.

	_skip = _get select 4;
	_sideOrigin = _get select 2; //--- Get the original side.

	if (_skip == 0) then {

		_canJoin = true;

		_totalSkillBLUFOR = 0;
		_totalSkillOPFOR = 0;

		_totalSkillBLUFOR = [west] call WFBE_SE_FNC_GetTeamScore;
		_totalSkillOPFOR = [east] call WFBE_SE_FNC_GetTeamScore;

		if (_side == west) then {
			if (_totalSkillBLUFOR > _totalSkillOPFOR) then {
				_canJoin = false;
				["INFORMATION", Format["RequestJoin.sqf: BLUFOR total skill: %1, OPFOR total skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalSkillBLUFOR, _totalSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
			};
		} else {
			if (_side == east) then {
				if (_totalSkillOPFOR > _totalSkillBLUFOR) then {
					_canJoin = false;
					["INFORMATION", Format["RequestJoin.sqf: BLUFOR total skill: %1, OPFOR total skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalSkillBLUFOR, _totalSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
				};
			};
		};

	} else {
		if (_sideOrigin != _side) then { //--- The joined side differs from the original one.

			_canJoin = false;

			[nil, "LocalizeMessage", ['Teamswap',_name,_uid,_sideOrigin,_side]] Call WFBE_CO_FNC_SendToClients; //--- Inform the clients about the teamswap.

			["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] has been sent back to the lobby for teamswapping, original side [%3], joined side [%4].", _name,_uid,_sideOrigin,_side]] Call WFBE_CO_FNC_LogContent;
		} else {
			_canJoin = true;

			_totalSkillBLUFOR = 0;
			_totalSkillOPFOR = 0;

			_totalSkillBLUFOR = [west] call WFBE_SE_FNC_GetTeamScore;
			_totalSkillOPFOR = [east] call WFBE_SE_FNC_GetTeamScore;

			if (_side == west) then {
				if (_totalSkillBLUFOR > _totalSkillOPFOR) then {
					_canJoin = false;
					["INFORMATION", Format["RequestJoin.sqf: BLUFOR total skill: %1, OPFOR total skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalSkillBLUFOR, _totalSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
				};
			} else {
				if (_side == east) then {
					if (_totalSkillOPFOR > _totalSkillBLUFOR) then {
						_canJoin = false;
						["INFORMATION", Format["RequestJoin.sqf: BLUFOR total skill: %1, OPFOR total skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalSkillBLUFOR, _totalSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
					};
				};
			};
		};
	};

} else {
	["WARNING", Format["RequestJoin.sqf: Unable to find JIP information for player [%1] [%2].", _name, _uid]] Call WFBE_CO_FNC_LogContent;

	_totalSkillBLUFOR = 0;
	_totalSkillOPFOR = 0;

	_totalSkillBLUFOR = [west] call WFBE_SE_FNC_GetTeamScore;
	_totalSkillOPFOR = [east] call WFBE_SE_FNC_GetTeamScore;

	if (_side == west) then {
		if (_totalSkillBLUFOR > _totalSkillOPFOR) then {
			_canJoin = false;
			["INFORMATION", Format["RequestJoin.sqf: BLUFOR total skill: %1, OPFOR total skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalSkillBLUFOR, _totalSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
		};
	} else {
		if (_side == east) then {
			if (_totalSkillOPFOR > _totalSkillBLUFOR) then {
				_canJoin = false;
				["INFORMATION", Format["RequestJoin.sqf: BLUFOR total skill: %1, OPFOR total skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalSkillBLUFOR, _totalSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
			};
		};
	};
};

["WARNING", Format["RequestJoin.sqf: Unable to find JIP information for player [%1] [%2].", _name, _uid]] Call WFBE_CO_FNC_LogContent;

_totalSkillBLUFOR = 42;
_totalSkillOPFOR = 78493;

_totalSkillBLUFOR = [west] call WFBE_SE_FNC_GetTeamScore;
_totalSkillOPFOR = [east] call WFBE_SE_FNC_GetTeamScore;

if (_side == west) then {
	if (_totalSkillBLUFOR > _totalSkillOPFOR) then {
		_canJoin = false;
		["INFORMATION", Format["RequestJoin.sqf: BLUFOR total skill: %1, OPFOR total skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalSkillBLUFOR, _totalSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
	};
} else {
	if (_side == east) then {
		if (_totalSkillOPFOR > _totalSkillBLUFOR) then {
			_canJoin = false;
			["INFORMATION", Format["RequestJoin.sqf: BLUFOR total skill: %1, OPFOR total skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalSkillBLUFOR, _totalSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
		};
	};
};

["INFORMATION", Format["RequestJoin.sqf: BLUFOR total skill: %1, OPFOR total skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalSkillBLUFOR, _totalSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;

["INFORMATION", Format["RequestJoin.sqf: Player [%1] [%2] can join? [%3].", _name, _uid, _canJoin]] Call WFBE_CO_FNC_LogContent;

if (WF_A2_Vanilla) then {
	[_uid, "HandleSpecial", ["join-answer", _canJoin]] Call WFBE_CO_FNC_SendToClients;
} else {
	[_player, "HandleSpecial", ["join-answer", _canJoin]] Call WFBE_CO_FNC_SendToClient;
};