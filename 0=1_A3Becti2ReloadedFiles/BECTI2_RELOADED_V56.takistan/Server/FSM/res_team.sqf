private["_side", "_template", "_buildings", "_status", "_barrack", "_light", "_heavy", "_air",
"_destination", "_orderComplete", "_end", "_inf_group"];

_side = _this select 0;
_template = _this select 1;
_barrack = _this select 2;
_action_type = _this select 3;

_destination = objNull;
_orderComplete = true;
_end = false;
_alives = [];
_inf_group = createGroup [_side, true];
if(count _alives == 0) then{
	{
		_buyFrom = _barrack;
		if !(isNull _buyFrom) then {
			_IDS = [];
			[_IDS,_buyFrom,_x,_side,_inf_group] call cti_SE_FNC_Server_ResBuyUnit;
		};
	} forEach _template;
};

while{!_end}do{

	_alives = (units _inf_group) Call cti_CO_FNC_GetLiveUnits;
	if(count _alives > 0)then{
		_end = false;
	} else {
		_end = true;
	};

	if(_action_type == "moveto")then{
		_WestBaseStructures = missionNamespace getVariable Format["cti_%1STRUCTURES",west];
		_EastBaseStructures = missionNamespace getVariable Format["cti_%1STRUCTURES",east];
		_WestMHQ = (west) Call cti_CO_FNC_GetSideHQ;
		_EastMHQ = (east) Call cti_CO_FNC_GetSideHQ;
		_buildings = (_WestBaseStructures) + (_EastBaseStructures) + [_EastMHQ,_WestMHQ];
		_near = [_barrack, _buildings] Call cti_CO_FNC_SortByDistance;
		_target = _near select 0;
		[_inf_group, true, [[_target, 'SAD', 100, 60, "", []]]] Call cti_SE_FNC_AIWPAdd;
	}else{
		if (_orderComplete) then {
			_orderComplete = false;
			_destination = [leader _inf_group, [_barrack]] Call cti_CO_FNC_GetClosestEntity;
			[_inf_group,_destination,400] Call cti_SE_FNC_AIPatrol;
		};
	};
	sleep 180;
};

