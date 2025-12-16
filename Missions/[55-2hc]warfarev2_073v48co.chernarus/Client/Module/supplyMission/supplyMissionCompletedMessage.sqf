
"WFBE_Server_PV_SupplyMissionCompletedMessage" addPublicVariableEventHandler {
    
    private ["_message", "_side"];

    _message = (_this select 1) select 0;
    _side = (_this select 1) select 1;
    _supplyAmount = (_this select 1) select 2;
    _namePlayer = (_this select 1) select 3;
    
    if ((side player) == _side) then {
        if (_namePlayer == name player) then {
            _message = format ["You have successfully completed a supply mission and earned $%1 as a reward.", _supplyAmount];
            _message call GroupChatMessage;
        } else {
            _message call CommandChatMessage;
        };
    };

};