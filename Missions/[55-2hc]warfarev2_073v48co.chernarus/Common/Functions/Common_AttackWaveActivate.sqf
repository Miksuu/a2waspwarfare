private ["_supply"];

_supply = _this select 3 select 0;

[_supply] spawn = {
    private ["_supply", "_discountPercentage", "_attackWaveLength"];

    _supply = _this select 0;

    _discountPercentage = 0;

    _discountPercentage = 1 - ((WFBE_C_ECONOMY_SUPPLY_MAX_TEAM_LIMIT - _supply) * (1/50000));

    _discountPercentage = 0.7 * _discountPercentage;

    ATTACK_WAVE_PRICE_MODIFIER = _discountPercentage;

    ATTACK_WAVE_DETAILS = [(sideJoined), ATTACK_WAVE_PRICE_MODIFIER];

    publicVariableServer "ATTACK_WAVE_DETAILS";

    _attackWaveLength = _discountPercentage * 900;

    ATTACK_WAVE_DETAILS = [(sideJoined), ATTACK_WAVE_PRICE_MODIFIER, _attackWaveLength];

    publicVariableServer "ATTACK_WAVE_DETAILS";

    sleep _attackWaveLength;

    _attackWaveLength = 0;

    // Return to normal units' pricing after the wave
    ATTACK_WAVE_PRICE_MODIFIER = 1;

    ATTACK_WAVE_DETAILS = [(sideJoined), ATTACK_WAVE_PRICE_MODIFIER, _attackWaveLength];

    publicVariableServer "ATTACK_WAVE_DETAILS";
};