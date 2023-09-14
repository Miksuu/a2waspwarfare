/*
	Script: Skill System by Benny.
	Description: Skill Initialization.
*/

/* Skills Root */
cti_SK_V_Root = 'Client\Module\Skill\Skill_';

/* Functions */
//cti_SK_FNC_Apply = Compile preprocessFile "Client\Module\Skill\Skill_Apply.sqf";

/* Define which classname belong to which skill group */

cti_SK_V_Engineers = ['CUP_O_RU_Engineer_VDV','CUP_B_US_Soldier_Engineer_UCP','CUP_B_BAF_Soldier_Engineer_MTP'];
cti_SK_V_Medics = ['CUP_O_RU_Medic_VDV','CUP_B_US_Medic_UCP','CUP_B_BAF_Soldier_Medic_MTP'];
cti_SK_V_TeamLeaders = ['CUP_O_RU_Soldier_TL_VDV','CUP_B_US_Soldier_TL_UCP','CUP_B_BAF_Soldier_TeamLeader_MTP'];
cti_SK_V_SpecsOps = ['CUP_O_RUS_SpecOps','CUP_B_USMC_MARSOC','CUP_B_BAF_Spotter_MTP'];







/*
cti_SK_V_Engineers = ['OEngineer1','OEngineer2','OEngineer3','OEngineer4','OEngineer5','OEngineer6','OEngineer7','OEngineer8','OEngineer9','OEngineer10','OEngineer11','OEngineer12','BEngineer1','BEngineer2','BEngineer3','BEngineer4','BEngineer5','BEngineer6','BEngineer7','BEngineer8','BEngineer9','BEngineer10','BEngineer11','BEngineer12'];
cti_SK_V_Medics = ['BMedic1','BMedic2','BMedic3','BMedic4','BMedic5','BMedic6','OMedic1','OMedic2','OMedic3','OMedic4','OMedic5','OMedic6'];
cti_SK_V_TeamLeaders = ['OTeamleader1','OTeamleader2','OTeamleader3','OTeamleader4','OTeamleader5','OTeamleader6','BTeamleader1','BTeamleader2','BTeamleader3','BTeamleader4','BTeamleader5','BTeamleader6'];
cti_SK_V_SpecsOps = ['OSpecOps1','OSpecOps2','OSpecOps3','OSpecOps4','OSpecOps5','OSpecOps6','BSpecOps1','BSpecOps2','BSpecOps3','BSpecOps4','BSpecOps5','BSpecOps6'];

*/


teamleader_LastUse_LR = -1200;
teamleader_Reload_LR = 300;
medic_LastUse_LR = -1200;
medic_Reload_LR = 300;
engineer_LastUse_Repair = -1200;
engineer_Reload_Repair = 5;
specops_LastUse_LR = -1200;
specops_LastUse_Lockpick = -1200;
specops_LastUse_Spot = -1200;
specops_Reload_LR = 300;
specops_Reload_Lockpick = 5;
specops_Reload_Spot = 8;


/* Skills Variables */
cti_SK_V_LastUse_Repair = -1200;
cti_SK_V_LastUse_LR = -1200;
cti_SK_V_LastUse_Lockpick = -1200;
cti_SK_V_LastUse_Spot = -1200;

/* Skills Timeout */
cti_SK_V_Reload_Repair = 5;
cti_SK_V_Reload_LR = 300;
cti_SK_V_Reload_Lockpick = 5;
cti_SK_V_Reload_Spot = 8;

// Find the player type 
cti_SK_V_Type = "";
if (playerType in cti_SK_V_Engineers) then {cti_SK_V_Type = 'Engineer'};
if (playerType in cti_SK_V_TeamLeaders) then {cti_SK_V_Type = 'TeamLeader'};
if (playerType in cti_SK_V_Medics) then {cti_SK_V_Type = 'Medic'};
if (playerType in cti_SK_V_SpecsOps) then {cti_SK_V_Type = 'SpecOps'};

/* Special one time init */
/* The Officer and Spec Ops can hire more units than the others leader */
if (player == OTeamleader1) then {missionNamespace setVariable ['CTI_C_PLAYERS_AI_MAX',ceil (3*(missionNamespace getVariable "CTI_C_PLAYERS_AI_MAX"))];};
if (player == OTeamleader2) then {missionNamespace setVariable ['CTI_C_PLAYERS_AI_MAX',ceil (3*(missionNamespace getVariable "CTI_C_PLAYERS_AI_MAX"))];};
if (player == OTeamleader3) then {missionNamespace setVariable ['CTI_C_PLAYERS_AI_MAX',ceil (3*(missionNamespace getVariable "CTI_C_PLAYERS_AI_MAX"))];};
if (player == OTeamleader4) then {missionNamespace setVariable ['CTI_C_PLAYERS_AI_MAX',ceil (3*(missionNamespace getVariable "CTI_C_PLAYERS_AI_MAX"))];};
if (player == OTeamleader5) then {missionNamespace setVariable ['CTI_C_PLAYERS_AI_MAX',ceil (3*(missionNamespace getVariable "CTI_C_PLAYERS_AI_MAX"))];};
if (player == BTeamleader1) then {missionNamespace setVariable ['CTI_C_PLAYERS_AI_MAX',ceil (3*(missionNamespace getVariable "CTI_C_PLAYERS_AI_MAX"))];};
if (player == BTeamleader2) then {missionNamespace setVariable ['CTI_C_PLAYERS_AI_MAX',ceil (3*(missionNamespace getVariable "CTI_C_PLAYERS_AI_MAX"))];};
if (player == BTeamleader3) then {missionNamespace setVariable ['CTI_C_PLAYERS_AI_MAX',ceil (3*(missionNamespace getVariable "CTI_C_PLAYERS_AI_MAX"))];};
if (player == BTeamleader4) then {missionNamespace setVariable ['CTI_C_PLAYERS_AI_MAX',ceil (3*(missionNamespace getVariable "CTI_C_PLAYERS_AI_MAX"))];};
if (player == BTeamleader5) then {missionNamespace setVariable ['CTI_C_PLAYERS_AI_MAX',ceil (3*(missionNamespace getVariable "CTI_C_PLAYERS_AI_MAX"))];};
