Private ['_current','_find','_killer','_logik','_structure','_structures','_side','_tked','_type','_killer_uid','_side_killer'];
_structure = _this select 0;
_killer = _this select 1;
_type = _this select 2;

_side = _structure getVariable "cti_side";
if(isNil '_side')then{_side = resistance;};
if(_side != resistance)then{
  _logik = (_side) Call cti_CO_FNC_GetSideLogic;
};
//--- Teamkill?
_teamkill = if (side _killer == _side) then {true} else {false};
_side_killer = side _killer;
_killer_uid = getPlayerUID _killer;

if ((!isNull _killer) && (isPlayer _killer)) then{
    if (_teamkill) then{
		["BuildingTeamkill", name _killer, _killer_uid, _type] remoteExecCall ["cti_CL_FNC_LocalizeMessage", _side];
    }else{
        _supplies = 0;
            _bounty = if(_side != resistance)then{
                switch (true) do {
                    case ( _structure isKindOf "Base_WarfareBBarracks"):{3000};
                    case ( _structure isKindOf "Base_WarfareBLightFactory"):{4500};
                    case ( _structure isKindOf "Base_WarfareBHeavyFactory"):{7000};
                    case ( _structure isKindOf "Base_WarfareBAircraftFactory"):{8000};
                    case ( _structure isKindOf "Base_WarfareBUAVterminal"):{5000};
                    case ( _structure isKindOf "Base_WarfareBVehicleServicePoint"):{3000};
                    case ( _structure isKindOf "BASE_WarfareBAntiAirRadar"):{8000};
                    default {3000};
                };
            } else {2000};

         if(typeof _structure == "Gue_WarfareBBarracks")then{
            _bounty = 3000;
            _supplies = 500;
            ["HeadHunterReceiveBountyInSupplies", _side_killer, _type, _supplies, _side] remoteExecCall ["cti_CL_FNC_LocalizeMessage", _side_killer];
            ["HeadHunterReceiveBounty", (name _killer), _bounty, _type, _side] remoteExecCall ["cti_CL_FNC_LocalizeMessage", _side_killer];

            [_side_killer, _supplies] Call cti_CO_FNC_ChangeSideSupply;
         } else{
            ["HeadHunterReceiveBounty", (name _killer), _bounty, _type, _side] remoteExecCall ["cti_CL_FNC_LocalizeMessage", _side_killer];
         };

        if(_side == resistance)then{
            [_side, _structure] spawn cti_CO_FNC_CleanResBaseArea;
        }
	};
};

if (_teamkill) then{
    ["INFORMATION", Format ["Server_BuildingKilled.sqf: [%1] [%2] has teamkilled a friendly structure.", name _killer, _killer_uid]] Call cti_CO_FNC_LogContent;
}else{
    ["INFORMATION", Format ["Server_BuildingKilled.sqf: [%1] Structure [%2] has been destroyed by [%3].", str _side, _type, _killer]] Call cti_CO_FNC_LogContent;
};

//--- Decrement building limit.
if(_side != resistance)then{
    _find = (missionNamespace getVariable Format ['cti_%1STRUCTURENAMES',_side]) find _type;
    if (_find != -1) then {
    	_current = _logik getVariable "cti_structures_live";
    	_current set [_find - 1, (_current select (_find-1)) - 1];
    	_logik setVariable ["cti_structures_live", _current, true];
    };

    _logik setVariable ["cti_structures", (_logik getVariable "cti_structures") - [_structure, objNull], true];

    [_side, "Destroyed", ["Base", _structure]] Spawn cti_SE_FNC_SideMessage;
};
sleep 10;

deleteVehicle _structure;
