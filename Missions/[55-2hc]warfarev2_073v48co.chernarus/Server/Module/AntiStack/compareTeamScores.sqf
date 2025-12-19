private["_side","_name","_uid","_totalSkillBLUFOR","_totalSkillOPFOR","_canJoin","_playersOnBLUFOR","_playersOnOPFOR","_playerNumberDifferenceBLUFOR","_playerNumberDifferenceOPFOR","_player","_totalEffectiveSkillBLUFOR","_totalEffectiveSkillOPFOR"];

_side = _this select 0;
_name = _this select 1;
_uid = _this select 2;
_player = _this select 3;
_totalSkillBLUFOR = _this select 4;
_totalSkillOPFOR = _this select 5;

_playersOnBLUFOR = 0;
_playersOnOPFOR = 0;

_totalEffectiveSkillBLUFOR = _totalSkillBLUFOR;
_totalEffectiveSkillOPFOR = _totalSkillOPFOR;

_canJoin = true;

{
	if (isPlayer _x && (side _x == west)) then {
		_playersOnBLUFOR = _playersOnBLUFOR + 1;
	};
} forEach allUnits;

{
	if (isPlayer _x && (side _x == east)) then {
		_playersOnOPFOR = _playersOnOPFOR + 1;
	};
} forEach allUnits;

_playerNumberDifferenceBLUFOR = _playersOnBLUFOR - _playersOnOPFOR;
_playerNumberDifferenceOPFOR = _playersOnOPFOR - _playersOnBLUFOR;

if (_playerNumberDifferenceBLUFOR > 0) then {
	_totalEffectiveSkillBLUFOR = _totalSkillBLUFOR * (1 + (_playerNumberDifferenceBLUFOR * 0.15));
};

if (_playerNumberDifferenceOPFOR > 0) then {
	_totalEffectiveSkillOPFOR = _totalSkillOPFOR * (1 + (_playerNumberDifferenceOPFOR * 0.15));
};

if (_side == west) then {
	if (_totalEffectiveSkillBLUFOR > _totalEffectiveSkillOPFOR) then {
		_canJoin = false;
		["INFORMATION", Format["CompareTeamScores.sqf: BLUFOR total effective skill: %1, OPFOR total effective skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalEffectiveSkillBLUFOR, _totalEffectiveSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
		[leader group _player, "LocalizeMessage", ['Teamstack',_name,_uid,_side]] Call WFBE_CO_FNC_SendToClient;
	};
} else {
	if (_side == east) then {
		if (_totalEffectiveSkillOPFOR > _totalEffectiveSkillBLUFOR) then {
			_canJoin = false;
			["INFORMATION", Format["CompareTeamScores.sqf: BLUFOR total effective skill: %1, OPFOR total effective skill: %2, player (UID: %3) side: %4. Player can join: [%5]", _totalEffectiveSkillBLUFOR, _totalEffectiveSkillOPFOR, _uid, _side, _canJoin]] Call WFBE_CO_FNC_LogContent;
			[leader group _player, "LocalizeMessage", ['Teamstack',_name,_uid,_side]] Call WFBE_CO_FNC_SendToClient;
		};
	};
};

_canJoin