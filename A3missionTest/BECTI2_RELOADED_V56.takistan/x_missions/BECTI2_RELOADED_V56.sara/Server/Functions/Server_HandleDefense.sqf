Private ["_buildings","_closest","_defense","_direction","_distance","_index","_position","_side","_soldier","_team","_type","_unit","_commander"];
_defense = _this select 0;
_side = _this select 1;
_team = _this select 2;
_closest = _this select 3;

_type_class_from_client=_this#4;//class namespace sended from client(to get uk defense manning)

_ai_delegation_enabled = missionNamespace getVariable "cti_C_AI_DELEGATION";
//_commander = (_side) call GetCommanderTeam;
_commander = (_side) call cti_CO_FNC_GetCommanderTeam;
_soldier = nil;



while {alive _defense} do {
	if (isNull(gunner _defense) || !alive gunner _defense) then {

		sleep 7;

		if (alive _closest && !(isNull _closest )) then {
			_type = typeOf _closest;
			_index = (missionNamespace getVariable Format["cti_%1STRUCTURENAMES",str _side]) find _type;
			_distance = (missionNamespace getVariable Format["cti_%1STRUCTUREDISTANCES",str _side]) select _index;
			_direction = (missionNamespace getVariable Format["cti_%1STRUCTUREDIRECTIONS",str _side]) select _index;
			_position = [getPos _closest,_distance,getDir (_closest) + _direction] Call cti_CO_FNC_GetPositionFrom;

			//_type = missionNamespace getVariable Format ["cti_%1SOLDIER",str _side];
			
			_type=_type_class_from_client;//comes from defense builder atm,maybe com solution not bad in future
			_use_server = true;

			//if(_ai_delegation_enabled > 0)then{
			//	switch (_ai_delegation_enabled) do {
			//		case 2: { //--- Headless Client delegation.
			//			if !(isServer) exitWith{};
			//			_HC = missionNamespace getVariable "cti_HEADLESSCLIENTS_ID";
			//			if (count _HC > 0) then {
			//
			//				_groups = [];
			//				[_groups, missionNamespace getVariable Format ["cti_%1SOLDIER", _side]] call cti_CO_FNC_ArrayPush;
			//				_positions = [];
			//				[_positions, _position] call cti_CO_FNC_ArrayPush;
			//				//[_side, _groups, _positions, _teams, _defense] Call cti_CO_FNC_DelegateAIStaticDefenceHeadless;
			//				[_side, _groups, _positions, _team, _defense, false] Call cti_CO_FNC_DelegateAIStaticDefenceHeadless;
			//				_use_server = false;
			//			};
			//		};
			//	};
			//};

			if(_use_server)then{
				_soldier = [_type,_team,_position,_side] Call cti_CO_FNC_CreateUnit;
				[_soldier] allowGetIn true;
				_soldier assignAsGunner _defense;
				[_soldier] orderGetIn true;
			};


			[str _side,'UnitsCreated',1] Call cti_CO_FNC_UpdateStatistics;

			["INFORMATION", Format ["Server_HandleDefense.sqf: [%1] Unit has been dispatched to a [%2] defense.", str _side,_type]] Call cti_CO_FNC_LogContent;

			//--- Calculate the average time in function of the distance and the speed.
			sleep ((((_soldier distance _defense)/(14*1000))*3600)+20);

			if ((vehicle _soldier != _defense)&& alive _soldier &&(!isNull _soldier)) then {
				if ((_defense emptyPositions "gunner" > 0) && alive _defense && (!isNull _defense)) then {_soldier moveInGunner _defense} else {deleteVehicle _soldier};

			};
			// [_soldier] joinSilent ( group leader _commander);
		} else {
			["INFORMATION", "Server_HandleDefense.sqf: Canceled auto manning, the barracks is destroyed."] Call cti_CO_FNC_LogContent;
		};
	};
	sleep 420;
};