private ["_supply"];

_supply = _this select 3 select 0;

[_supply] spawn = {
    _supply = _this select 0;

    _discountPercentage = 0;

    _discountPercentage = 1 - ((WFBE_C_ECONOMY_SUPPLY_MAX_TEAM_LIMIT - _supply) * (1/50000));

    _attackWaveLength = _discountPercentage * 600;

    sleep _attackWaveLength;

    ATTACK_WAVE_PRICE_MODIFIER = 
};