/*
	Author: Marty

	Purpose:
	Keep the local command bar in sync when one of the player's AI subordinates
	dies outside the leader's knowledge.

	The script updates local knowledge, detaches destroyed assigned vehicles,
	and silently removes dead AI from the player's group. It does not delete bodies
	or change the server-side cleanup flow.
*/

Private [
	"_checkInterval",
	"_aiId",
	"_aiIdNumber",
	"_aiVoiceToken1",
	"_aiVoiceToken2",
	"_aiVoiceToken",
	"_alreadyNotified",
	"_announcedDeadUnits",
	"_cleanupRequestTime",
	"_currentUnits",
	"_deadUnits",
	"_firstDigit",
	"_group",
	"_knownAliveUnits",
	"_knownUnits",
	"_lastVehicle",
	"_player",
	"_secondDigit",
	"_shouldReveal",
	"_silentRemoval",
	"_unit",
	"_unitGroup",
	"_vehicle",
	"_wasSeenAlive"
];

if (missionNamespace getVariable ["CommandBar_DeadUnits_Watchdog_Running", false]) exitWith {};
missionNamespace setVariable ["CommandBar_DeadUnits_Watchdog_Running", true];

_checkInterval = 1;
_announcedDeadUnits = [];
_knownAliveUnits = [];
_knownUnits = [];

sleep 5;

while {!gameOver} do {
	sleep _checkInterval;

	Call {
		_player = player;

		if (isNull _player) exitWith {};
		if (!alive _player) exitWith {};

		_group = group _player;

		if (isNull _group) exitWith {};
		if (leader _group != _player) exitWith {};

		// Marty: Remember current AI subordinates so a dead unit can still be handled after a manual disband.
		_currentUnits = units _group;
		_announcedDeadUnits = _announcedDeadUnits - [objNull];
		_knownAliveUnits = _knownAliveUnits - [objNull];
		_knownUnits = _knownUnits - [objNull];
		_deadUnits = [];

		{
			_unit = _x;

			if (!isPlayer _unit && _unit != _player) then {
				if !(_unit in _knownUnits) then {_knownUnits = _knownUnits + [_unit]};
				if (alive _unit) then {
					if !(_unit in _knownAliveUnits) then {_knownAliveUnits = _knownAliveUnits + [_unit]};
				};

				_vehicle = assignedVehicle _unit;
				if (isNull _vehicle) then {_vehicle = vehicle _unit};

				if (!isNull _vehicle && _vehicle != _unit) then {
					_unit setVariable ["CommandBar_DeadUnits_LastVehicle", _vehicle, false];

					if (!alive _vehicle) then {
						_group reveal _vehicle;
						_player reveal _vehicle;
						_group leaveVehicle _vehicle;
					};
				};
			};
		} forEach _currentUnits;

		{
			_unit = _x;

			_shouldReveal = Call {
				if (isNull _unit) exitWith {false};
				if (alive _unit) exitWith {false};
				if (_unit == _player) exitWith {false};
				if (isPlayer _unit) exitWith {false};
				if (_unit in playableUnits) exitWith {false};

				true
			};

			if (_shouldReveal) then {_deadUnits = _deadUnits + [_unit]};
		} forEach _knownUnits;

		// Marty: Force the local command bar to forget dead subordinates without deleting their bodies.
		{
			_unit = _x;
			_group reveal _unit;
			_player reveal _unit;

			_vehicle = assignedVehicle _unit;
			_lastVehicle = _unit getVariable ["CommandBar_DeadUnits_LastVehicle", objNull];
			if (isNull _vehicle) then {_vehicle = _lastVehicle};
			if (isNull _vehicle) then {_vehicle = vehicle _unit};

			if (!isNull _vehicle && _vehicle != _unit) then {
				_group leaveVehicle _vehicle;
				_group reveal _vehicle;
				_player reveal _vehicle;
			};

			_unitGroup = group _unit;
			if (_unitGroup == _group) then {
				_cleanupRequestTime = _unit getVariable ["CommandBar_DeadUnits_ServerCleanupRequestTime", -1000];
				if ((time - _cleanupRequestTime) > 10) then {
					// Marty: Ask the server periodically to make group removal authoritative when locality blocks local cleanup.
					_unit setVariable ["CommandBar_DeadUnits_ServerCleanupRequestTime", time, false];
					["RequestSpecial", ["commandbar-cleanup-dead-unit", _player, _unit]] Call WFBE_CO_FNC_SendToServer;
				};

				_silentRemoval = _unit getVariable ["CommandBar_DeadUnits_SilentRemoval", false];
				_alreadyNotified = _unit in _announcedDeadUnits;
				_wasSeenAlive = _unit in _knownAliveUnits;
				if !(_alreadyNotified) then {_announcedDeadUnits set [count _announcedDeadUnits, _unit]};

				// Marty: Announce combat deaths once, but keep manual disband and repeated cleanup silent.
				Call {
					if (_silentRemoval) exitWith {};
					if (_alreadyNotified) exitWith {};
					if !(_wasSeenAlive) exitWith {};
					_aiId = _unit Call WFBE_CL_FNC_GetAIID;
					_aiIdNumber = parseNumber _aiId;
					_aiVoiceToken = switch (_aiIdNumber) do {
						case 1: {"one"};
						case 2: {"two"};
						case 3: {"three"};
						case 4: {"four"};
						case 5: {"five"};
						case 6: {"six"};
						case 7: {"seven"};
						case 8: {"eight"};
						case 9: {"nine"};
						case 10: {"ten"};
						case 11: {"eleven"};
						case 12: {"twelve"};
						default {""};
					};

					if (_aiVoiceToken != "") exitWith {
						_player kbTell [sideHQ, WFBE_V_HQTopicSide, "UnitDown", ["1", "", _aiId, [_aiVoiceToken]], true];
					};

					if (_aiIdNumber < 13) exitWith {
						_player kbTell [sideHQ, WFBE_V_HQTopicSide, "UnitDown", ["1", "", _aiId, [_aiId]], true];
					};

					if (_aiIdNumber > 59) exitWith {
						_player kbTell [sideHQ, WFBE_V_HQTopicSide, "UnitDown", ["1", "", _aiId, [_aiId]], true];
					};

					_firstDigit = floor (_aiIdNumber / 10);
					_secondDigit = _aiIdNumber - (_firstDigit * 10);

					// Marty: IDs 13-59 are spoken digit-by-digit so EP1 and vanilla protocols all have matching words.
					_aiVoiceToken1 = switch (_firstDigit) do {
						case 1: {"one2"};
						case 2: {"two2"};
						case 3: {"three2"};
						case 4: {"four2"};
						case 5: {"five2"};
						default {""};
					};
					_aiVoiceToken2 = switch (_secondDigit) do {
						case 0: {"zero2"};
						case 1: {"one2"};
						case 2: {"two2"};
						case 3: {"three2"};
						case 4: {"four2"};
						case 5: {"five2"};
						case 6: {"six2"};
						case 7: {"seven2"};
						case 8: {"eight2"};
						case 9: {"nine2"};
						default {""};
					};

					if (_aiVoiceToken1 == "") exitWith {
						_player kbTell [sideHQ, WFBE_V_HQTopicSide, "UnitDown", ["1", "", _aiId, [_aiId]], true];
					};

					if (_aiVoiceToken2 == "") exitWith {
						_player kbTell [sideHQ, WFBE_V_HQTopicSide, "UnitDown", ["1", "", _aiId, [_aiId]], true];
					};

					_player kbTell [sideHQ, WFBE_V_HQTopicSide, "UnitDownTwoPart", ["1", "", str _firstDigit, [_aiVoiceToken1]], ["2", "", str _secondDigit, [_aiVoiceToken2]], true];
				};

				player groupSelectUnit [_unit, false];
				[_unit] joinSilent grpNull;
			};

			_knownUnits = _knownUnits - [_unit];
		} forEach _deadUnits;
	};
};
