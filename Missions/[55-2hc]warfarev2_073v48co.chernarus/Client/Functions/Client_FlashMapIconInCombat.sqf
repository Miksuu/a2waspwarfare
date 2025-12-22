if (isNil {_unit getVariable "WASP_FiredEH"}) then {
    _eh = _unit addEventHandler ["Fired", {
        _u = _this select 0;                 // unit that fired
        _u setVariable ["WASP_LastFiredTime", time, true];
    }];
    _unit setVariable ["WASP_FiredEH", _eh];
};