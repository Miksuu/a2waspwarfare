"ATTACK_WAVE_DETAILS" addPublicVariableEventHandler {

	private ["_priceModifier", "_side", "_attackLength", "_attackLengthMinutes"];

	_side = ((_this select 1) select 0);
	_priceModifier = ((_this select 1) select 1);
    _attackLength = ((_this select 1) select 2);

    if (_attackLength > 0) then {
        _attackLengthMinutes = floor (_attackLength / 60);
    	["INFORMATION", Format["AttackWave.sqf: Team [%1] has activated heavy attack mode with price modifier: [%2].", _side, _priceModifier]] Call WFBE_CO_FNC_LogContent;

        [_side, "LocalizeMessage", ["AttackModeActivated", _priceModifier, _attackLengthMinutes]] call WFBE_CO_FNC_SendToClients;
    } else {
        ["INFORMATION", Format["AttackWave.sqf: Team [%1] heavy attack mode ending.", _side]] Call WFBE_CO_FNC_LogContent;
    };
};