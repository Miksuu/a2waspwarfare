"ATTACK_WAVE_DETAILS" addPublicVariableEventHandler {

	private ["_priceModifier", "_side", "_attackLength", "_attackLengthMinutes", "_priceModifierPercentage"];

	_side = ((_this select 1) select 0);
	_priceModifier = ((_this select 1) select 1);
    _attackLength = ((_this select 1) select 2);

    diag_log _side;
    diag_log _priceModifier;
    diag_log _attackLength;

    _priceModifierPercentage = round (_priceModifier * 100);

    if (_attackLength > 0) then {
        _attackLengthMinutes = floor (_attackLength / 60);

        [_side, -(_side call GetSideSupply),"Heavy attack mode activated."] Call ChangeSideSupply;

        [_side, "HandleSpecial", ["attack-wave", _priceModifier]] Call WFBE_CO_FNC_SendToClients;

    	["INFORMATION", Format["AttackWave.sqf: Team [%1] has activated heavy attack mode with price modifier: [%2].", _side, _priceModifier]] Call WFBE_CO_FNC_LogContent;

        [_side, "LocalizeMessage", ["AttackModeActivated", _priceModifierPercentage, _attackLengthMinutes]] call WFBE_CO_FNC_SendToClients;
    } else {
        ["INFORMATION", Format["AttackWave.sqf: Team [%1] heavy attack mode ending.", _side]] Call WFBE_CO_FNC_LogContent;

        [_side, "HandleSpecial", ["attack-wave", 1]] Call WFBE_CO_FNC_SendToClients;

        [_side, "LocalizeMessage", ["AttackModeEnd"]] call WFBE_CO_FNC_SendToClients;
    };
};