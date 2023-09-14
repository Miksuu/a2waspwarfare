
Private ["_allDefences","_action","_defense","_side","_spawn","_town","_units","_sideID","_pos"];

_allDefences = _this select 0;
_pos = _this select 1;
_side = resistance;

//--- Man the defenses.
{
    _defense = _x;
    if !(isNil '_defense') then {
        _positions = [];
        _groups = [];
        if !(alive gunner _defense) then { //--- Make sure that the defense gunner is null or dead.
            _positions pushBack (getPos _x);
            _groups pushBack (missionNamespace getVariable Format ["cti_%1SOLDIER", _side]);

            _team = missionNamespace getVariable Format ["cti_%1_DefenseTeam", _side];
            if(isNil '_team')then{
                _team = createGroup [_side, true];
            }else{
                if((count units _team) > 10) then {
                    _team = createGroup [_side, true];
                    missionNamespace setVariable [Format ["cti_%1_DefenseTeam", _side], _team]
                };
            };

            if (isNil '_team') then {
                _team = createGroup [_side, true];
                missionNamespace setVariable [format["cti_%1_DefenseTeam", _side], _team];
            };

            if (count(missionNamespace getVariable "cti_HEADLESSCLIENTS_ID") > 0) then {
                [_side, _groups, _positions, _team, _defense, true] Call cti_SE_FNC_DelegateAIStaticDefenceHeadless;
            }else{
                _unit = [missionNamespace getVariable Format ["cti_%1SOLDIER", _side],missionNamespace getVariable Format ["cti_%1_DefenseTeam", _side], getPos _x, _side] Call cti_CO_FNC_CreateUnit;
                _unit assignAsGunner _defense;
                [_unit] orderGetIn true;
                _unit moveInGunner _defense;
                [_unit, 350, _pos] Call cti_CO_FNC_RevealArea;
                [group _unit, 175, getPos _defense] spawn cti_CO_FNC_RevealArea;
                _x setVariable ["cti_defense_operator", _unit]; //--- Track the original gunner.
            };
        };
    };
} forEach (_allDefences);
