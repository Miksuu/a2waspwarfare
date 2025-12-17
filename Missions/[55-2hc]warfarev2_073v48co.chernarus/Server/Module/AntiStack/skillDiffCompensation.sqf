private ["_teamSkillWest", "_teamSkillEast", "_teamWestSkillTicksTriggerThresholdExceeded0", "_teamEastSkillTicksTriggerThresholdExceeded", "_teamWestSkillTicksEndTriggerThresholdExceeded", "_teamEastSkillTicksEndTriggerThresholdExceeded", "_scoreDiff", "_teamWestSupplyIncome", "_teamEastSupplyIncome", "_skillTicksDifference", "_supplyCompensationPercentage", "_supplyCompensationAmount"];

while {!WFBE_GameOver} do {

    sleep 10;

    _teamSkillWest = ["REQUEST_SIDE_SKILL", west] call WFBE_SE_FNC_CallDatabaseRequestSideTotalSkill;
    _teamSkillEast = ["REQUEST_SIDE_SKILL", east] call WFBE_SE_FNC_CallDatabaseRequestSideTotalSkill;

    TEAM_SKILL_TICKS_WEST = TEAM_SKILL_TICKS_WEST + _teamSkillWest;
    TEAM_SKILL_TICKS_EAST = TEAM_SKILL_TICKS_EAST + _teamSkillEast;

    _teamWestSkillTicksTriggerThresholdExceeded = TEAM_SKILL_TICKS_WEST > TEAM_SKILL_TICKS_EAST + TEAM_SKILL_TICKS_DIFF_THRESHOLD;
    _teamEastSkillTicksTriggerThresholdExceeded = TEAM_SKILL_TICKS_EAST > TEAM_SKILL_TICKS_WEST + TEAM_SKILL_TICKS_DIFF_THRESHOLD;
    
    _teamWestSkillTicksEndTriggerThresholdExceeded = TEAM_SKILL_TICKS_EAST > TEAM_SKILL_TICKS_WEST + TEAM_SKILL_TICKS_END_THRESHOLD;
    _teamEastSkillTicksEndTriggerThresholdExceeded = TEAM_SKILL_TICKS_WEST > TEAM_SKILL_TICKS_EAST + TEAM_SKILL_TICKS_END_THRESHOLD;

    TEAM_WEST_SKILL_TICKS_END_TRIGGER_VALUE = 0;
    TEAM_EAST_SKILL_TICKS_END_TRIGGER_VALUE = 0;

    if (_teamWestSkillTicksTriggerThresholdExceeded) then {

            while {!_teamWestSkillTicksEndTriggerThresholdExceeded} do {

                _teamSkillWest = ["REQUEST_SIDE_SKILL", west] call WFBE_SE_FNC_CallDatabaseRequestSideTotalSkill;
                _teamSkillEast = ["REQUEST_SIDE_SKILL", east] call WFBE_SE_FNC_CallDatabaseRequestSideTotalSkill;

                _scoreDiff = _teamSkillEast - _teamSkillWest;

                if (_scoreDiff < 0) then {
                    _scoreDiff = 0;
                };

                TEAM_WEST_SKILL_TICKS_END_TRIGGER_VALUE = TEAM_WEST_SKILL_TICKS_END_TRIGGER_VALUE + _scoreDiff;

                if (TEAM_WEST_SKILL_TICKS_END_TRIGGER_VALUE < 0) then {
                    TEAM_WEST_SKILL_TICKS_END_TRIGGER_VALUE = 0;
                };

                if (TEAM_WEST_SKILL_TICKS_END_TRIGGER_VALUE > TEAM_SKILL_TICKS_END_THRESHOLD) then {
                    _teamWestSkillTicksEndTriggerThresholdExceeded = true;
                } else {
                    _teamWestSkillTicksEndTriggerThresholdExceeded = false;
                };

                _teamWestSupplyIncome = (west) call WFBE_CO_FNC_GetTownsSupply;
            
                _skillTicksDifference = _teamSkillWest - _teamSkillEast;
                _supplyCompensationPercentage = _skillTicksDifference * TEAM_SKILL_TICKS_COMPENSATION_MULTIPLIER * 100;
            
                if (_supplyCompensationPercentage > 100) then {
                    _supplyCompensationPercentage = 100;
                } else {
                    if (_supplyCompensationPercentage < 0) then {
                        _supplyCompensationPercentage = 0;
                    };
                };

                _supplyCompensationAmount = round(_teamWestSupplyIncome * (_supplyCompensationPercentage / 100));

                [east, _supplyCompensationAmount, format ["Anti-stack skill difference compensation applied: Supply compensation percentage: %1 %. Extra S %2 for team [%3].", _supplyCompensationPercentage, _supplyCompensationAmount, str west]] Call ChangeSideSupply;
            
                sleep 5;
            };

            TEAM_SKILL_TICKS_WEST = 0;
            TEAM_SKILL_TICKS_EAST = 0;

        } else {

            if (_teamEastSkillTicksTriggerThresholdExceeded) then {

                while {!_teamEastSkillTicksEndTriggerThresholdExceeded} do {

                    _teamSkillWest = ["REQUEST_SIDE_SKILL", west] call WFBE_SE_FNC_CallDatabaseRequestSideTotalSkill;
                    _teamSkillEast = ["REQUEST_SIDE_SKILL", east] call WFBE_SE_FNC_CallDatabaseRequestSideTotalSkill;

                    _scoreDiff = _teamSkillWest - _teamSkillEast;

                    if (_scoreDiff < 0) then {
                        _scoreDiff = 0;
                    };

                    TEAM_EAST_SKILL_TICKS_END_TRIGGER_VALUE = TEAM_EAST_SKILL_TICKS_END_TRIGGER_VALUE + _scoreDiff;

                    if (TEAM_EAST_SKILL_TICKS_END_TRIGGER_VALUE < 0) then {
                        TEAM_EAST_SKILL_TICKS_END_TRIGGER_VALUE = 0;
                    };

                    if (TEAM_EAST_SKILL_TICKS_END_TRIGGER_VALUE > TEAM_SKILL_TICKS_END_THRESHOLD) then {
                        _teamEastSkillTicksEndTriggerThresholdExceeded = true;
                    } else {
                        _teamEastSkillTicksEndTriggerThresholdExceeded = false;
                    };

                    _teamEastSupplyIncome = (east) call WFBE_CO_FNC_GetTownsSupply;
            
                    _skillTicksDifference = _teamSkillEast - _teamSkillWest;
                    _supplyCompensationPercentage = _skillTicksDifference * TEAM_SKILL_TICKS_COMPENSATION_MULTIPLIER * 100;
            
                    if (_supplyCompensationPercentage > 100) then {
                        _supplyCompensationPercentage = 100;
                    } else {
                        if (_supplyCompensationPercentage < 0) then {
                            _supplyCompensationPercentage = 0;
                        };
                    };

                    _supplyCompensationAmount = round(_teamEastSupplyIncome * (_supplyCompensationPercentage / 100));

                    [west, _supplyCompensationAmount, format ["Anti-stack skill difference compensation applied: Supply compensation percentage: %1 %. Extra S %2 for team [%3].", _supplyCompensationPercentage, _supplyCompensationAmount, str east]] Call ChangeSideSupply;
                
                    sleep 5;
                };

                TEAM_SKILL_TICKS_WEST = 0;
                TEAM_SKILL_TICKS_EAST = 0;

        };

    };

};
