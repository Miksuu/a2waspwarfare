//--- Zeta Cargo by Benny.

//--- Unit allowed to hook.
Zeta_Lifter = ["MH60S","MV22","C130J","Mi17_Ins","Mi17_medevac_RU","UH60M_EP1","UH60M_MEV_EP1","CH_47F_EP1","C130J_US_EP1","Mi17_TK_EP1","BAF_Merlin_HC3_D","CH_47F_BAF","Mi17_Civilian","An2_TK_EP1"];
//--- Zeta Cargo can lift these types.
Zeta_Types = ["Car","Motorcycle","Tank","Ship"];
//--- Zeta Cargo default Position.
Zeta_DefaultPos = [0,0,-10];

//--- Special vehicle with special position.
Zeta_Special = ["C130J","C130J_US_EP1"];

_distance = 5;

// Get the position and direction of the target
_targetPosition = getPos target;
_targetDirection = getDir target;

// Calculate the position behind the target
_newX = _targetPosition select 0 - (sin _targetDirection * _distance);
_newY = _targetPosition select 1 - (cos _targetDirection * _distance);
_newZ = _targetPosition select 2;  // Keep the Z-coordinate the same

// Set the new special position
Zeta_SpecialPosition = [_newX, _newY, _newZ];