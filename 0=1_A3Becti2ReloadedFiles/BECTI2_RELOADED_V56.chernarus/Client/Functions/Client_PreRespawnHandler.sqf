Private ["_hq","_unit"];

_unit = _this;
[] execVM "WASP\actions\OnKilled.sqf";

(player) Call cti_SK_FNC_Apply;


_allplayercontainer = [OTeamleader1,OTeamleader2,OTeamleader3,OTeamleader4,OTeamleader5,BTeamleader1,BTeamleader2,BTeamleader3,BTeamleader4,BTeamleader5,
						OEngineer1,OEngineer2,OEngineer3,OEngineer4,OEngineer5,BEngineer1,BEngineer2,BEngineer3,BEngineer4,BEngineer5,
		OMachinegunner1_1,OMachinegunner1_2,OMachinegunner2_1,OMachinegunner2_2,OMachinegunner3_1,OMachinegunner3_2,OMachinegunner4_1,OMachinegunner4_2,OMachinegunner5_1,OMachinegunner5_2,
		BMachinegunner1_1,BMachinegunner1_2,BMachinegunner2_1,BMachinegunner2_2,BMachinegunner3_1,BMachinegunner3_2,BMachinegunner4_1,BMachinegunner4_2,BMachinegunner5_1,BMachinegunner5_2,
		OMedic1,OMedic2,OMedic3,OMedic4,OMedic5,BMedic1,BMedic2,BMedic3,BMedic4,BMedic5,
		OSpecOps1,OSpecOps2,OSpecOps3,OSpecOps4,OSpecOps5,BSpecOps1,BSpecOps2,BSpecOps3,BSpecOps4,BSpecOps5];

if (player in _allplayercontainer) then	{
//player addAction ["<t color='#FF0000'>BISHALO","HALO.sqf"];

player addAction ["<t color=""#FFE496"">" +"Attach AP Mine Charge", EtV_AttachCharge, ["APERSMine_Range_Mag",player], 1, true, true, "","['APERSMine_Range_Mag',_target] call EtV_ChargeCheck",5];


player addAction ["<t color=""#FFE496"">" +"Attach Claymore Charge", EtV_AttachCharge, ["ClaymoreDirectionalMine_Remote_Mag",player], 1, true, true, "","['ClaymoreDirectionalMine_Remote_Mag',_target] call EtV_ChargeCheck",5];

player addAction ["<t color=""#FFE496"">" +"Attach M6 Charge", EtV_AttachCharge, ["SLAMDirectionalMine_Wire_Mag",player], 1, true, true, "","['SLAMDirectionalMine_Wire_Mag',_target] call EtV_ChargeCheck",5];


player addAction ["<t color=""#FFE496"">" +"Attach C4 Charge", EtV_AttachCharge, ["DemoCharge_Remote_Mag",player], 1, true, true, "","['DemoCharge_Remote_Mag',_target] call EtV_ChargeCheck",5];

player addAction ["<t color=""#FFE496"">" +"Attach BIG C4 Charge", EtV_AttachCharge, ["SatchelCharge_Remote_Mag",player], 1, true, true, "","['SatchelCharge_Remote_Mag',_target] call EtV_ChargeCheck",5];

player addAction ["<t color=""#FFE496"">" +"Attach PipeBomb Charge", EtV_AttachCharge, ["CUP_PipeBomb_M",player], 1, true, true, "","['CUP_PipeBomb_M',_target] call EtV_ChargeCheck",5];


player addAction ["Deploy Tow Ropes", {
		[] call SA_Take_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Take_Tow_Ropes_Action_Check"];
 
	player addAction ["Put Away Tow Ropes", {
		[] call SA_Put_Away_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Put_Away_Tow_Ropes_Action_Check"];
 
	player addAction ["Attach To Tow Ropes", {
		[] call SA_Attach_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Attach_Tow_Ropes_Action_Check"];
 
	player addAction ["Drop Tow Ropes", {
		[] call SA_Drop_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Drop_Tow_Ropes_Action_Check"];
 
	player addAction ["Pickup Tow Ropes", {
		[] call SA_Pickup_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call SA_Pickup_Tow_Ropes_Action_Check"];


//player addAction ["<t color=""#FFE496"">" +"Touch-Off Explosives", EtV_TouchOff, [player], 1, true, true, "","[_target] call EtV_UnitCheck"];
//player addAction ["<t color=""#FFE496"">" +"+30Secs to Timer", EtV_Timer, [player], 1, true, true, "","[_target] call EtV_UnitCheckTimer"];




//player addAction ["<img image='\a3\ui_f\data\gui\cfg\Hints\Voice_ca.paa' />", "Client\Module\Jumper\Earplugtoogle.sqf", [], 1, TRUE, FALSE, "", ""];
player addAction ["<img image='\a3\ui_f\data\gui\cfg\Hints\ammo_ap_ca.paa' />", "Client\Module\Jumper\Earplugtoogle.sqf", [], 100, FALSE, FALSE, "", ""];

};




//RADIOBLOCK

_OTEAM1=[OTeamleader1,OEngineer1,OMachinegunner1_1,OMachinegunner1_2,OMedic1,OSpecOps1];
_OTEAM2=[OTeamleader2,OEngineer2,OMachinegunner2_1,OMachinegunner2_2,OMedic2,OSpecOps2];
_OTEAM3=[OTeamleader3,OEngineer3,OMachinegunner3_1,OMachinegunner3_2,OMedic3,OSpecOps3];
_OTEAM4=[OTeamleader4,OEngineer4,OMachinegunner4_1,OMachinegunner4_2,OMedic4,OSpecOps4];
_OTEAM5=[OTeamleader5,OEngineer5,OMachinegunner5_1,OMachinegunner5_2,OMedic5,OSpecOps5];

_BTEAM1=[BTeamleader1,BEngineer1,BMachinegunner1_1,BMachinegunner1_2,BMedic1,BSpecOps1];
_BTEAM2=[BTeamleader2,BEngineer2,BMachinegunner2_1,BMachinegunner2_2,BMedic2,BSpecOps2];
_BTEAM3=[BTeamleader3,BEngineer3,BMachinegunner3_1,BMachinegunner3_2,BMedic3,BSpecOps3];
_BTEAM4=[BTeamleader4,BEngineer4,BMachinegunner4_1,BMachinegunner4_2,BMedic4,BSpecOps4];
_BTEAM5=[BTeamleader5,BEngineer5,BMachinegunner5_1,BMachinegunner5_2,BMedic5,BSpecOps5];


if (_unit in _OTEAM1) then	{1 radioChannelAdd [_unit];};
if (_unit in _OTEAM2) then	{2 radioChannelAdd [_unit];};
if (_unit in _OTEAM3) then	{3 radioChannelAdd [_unit];};
if (_unit in _OTEAM4) then	{4 radioChannelAdd [_unit];};
if (_unit in _OTEAM5) then	{5 radioChannelAdd [_unit];};

if (_unit in _BTEAM1) then	{6 radioChannelAdd [_unit];};
if (_unit in _BTEAM2) then	{7 radioChannelAdd [_unit];};
if (_unit in _BTEAM3) then	{8 radioChannelAdd [_unit];};
if (_unit in _BTEAM4) then	{9 radioChannelAdd [_unit];};
if (_unit in _BTEAM5) then	{10 radioChannelAdd [_unit];};

//_____END RADIOUPDATE



_TeamleaderContainer = [OTeamleader1,OTeamleader2,OTeamleader3,OTeamleader4,OTeamleader5,BTeamleader1,BTeamleader2,BTeamleader3];
_EngineerContainer = [OEngineer1,OEngineer2,OEngineer3,OEngineer4,OEngineer5,BEngineer1,BEngineer2,BEngineer3];

_MachinegunnerContainer = [OMachinegunner1_1,OMachinegunner1_2,OMachinegunner2_1,OMachinegunner2_2,OMachinegunner3_1,OMachinegunner3_2,OMachinegunner4_1,OMachinegunner4_2,OMachinegunner5_1,OMachinegunner5_2,BMachinegunner1_1,BMachinegunner1_2,BMachinegunner2_1,BMachinegunner2_2,BMachinegunner3_1,BMachinegunner3_2];

_MedicContainer =  [OMedic1,OMedic2,OMedic3,OMedic4,OMedic5,BMedic1,BMedic2,BMedic3];

_SpecsOpsContainer = [OSpecOps1,OSpecOps2,OSpecOps3,OSpecOps4,OSpecOps5,BSpecOps1,BSpecOps2,BSpecOps3];


_UKTeamleaderContainer = [BTeamleader4,BTeamleader5];
_UKEngineerContainer = [BEngineer4,BEngineer5];

_UKMachinegunnerContainer = [BMachinegunner4_1,BMachinegunner4_2,BMachinegunner5_1,BMachinegunner5_2];

_UKMedicContainer = [BMedic4,BMedic5];

_UKSpecsOpsContainer = [BSpecOps4,BSpecOps5];


if (_unit in _TeamleaderContainer) then	{
_unit addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
};
if (_unit in _UKTeamleaderContainer) then	{
_unit addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
};

if (_unit in _EngineerContainer) then	{
_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Destroy_Camp' + "</t>",'Client\Action\Action_DestroyCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
_unit addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),(CTI_SK_V_Root + 'Engineer' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Repair > CTI_SK_V_Reload_Repair"];
};
if (_unit in _UKEngineerContainer) then	{
_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Destroy_Camp' + "</t>",'Client\Action\Action_DestroyCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
_unit addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),(CTI_SK_V_Root + 'Engineer' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Repair > CTI_SK_V_Reload_Repair"];
};


if (_unit in _MachinegunnerContainer) then	{
_unit addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
_unit setUnitRecoilCoefficient 0.25;
};
if (_unit in _UKMachinegunnerContainer) then	{
_unit addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
_unit setUnitRecoilCoefficient 0.25;
};


if (_unit in _MedicContainer) then	{
_unit addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
};
if (_unit in _UKMedicContainer) then	{
_unit addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
};


if (_unit in _SpecsOpsContainer) then	{
_unit addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
_unit addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),(CTI_SK_V_Root + 'SpecOps' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_Lockpick > CTI_SK_V_Reload_Lockpick && vehicle player == player)"];
_unit addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),(CTI_SK_V_Root + 'Sniper' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Spot > CTI_SK_V_Reload_Spot"];
//_unit setUnitTrait [""UAVHacker"",true];


};
if (_unit in _UKSpecsOpsContainer) then	{
_unit addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
_unit addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
_unit addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),(CTI_SK_V_Root + 'SpecOps' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_Lockpick > CTI_SK_V_Reload_Lockpick && vehicle player == player)"];
_unit addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),(CTI_SK_V_Root + 'Sniper' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Spot > CTI_SK_V_Reload_Spot"];
//_unit setUnitTrait [""UAVHacker"",true];


};


/*

//camp repair
OMedic1 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
OMedic2 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
OMedic3 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
OMedic4 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
OMedic5 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BMedic1 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BMedic2 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BMedic3 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BMedic4 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BMedic5 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
OSpecOps1 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
OSpecOps2 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
OSpecOps3 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
OSpecOps4 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
OSpecOps5 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BSpecOps1 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BSpecOps2 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BSpecOps3 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BSpecOps4 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BSpecOps5 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Repair_Camp' + "</t>",'Client\Action\Action_RepairCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
//uav hack
OSpecOps1 setUnitTrait [""UAVHacker"",true];
OSpecOps2 setUnitTrait [""UAVHacker"",true];
OSpecOps3 setUnitTrait [""UAVHacker"",true];
OSpecOps4 setUnitTrait [""UAVHacker"",true];
OSpecOps5 setUnitTrait [""UAVHacker"",true];
BSpecOps1 setUnitTrait [""UAVHacker"",true];
BSpecOps2 setUnitTrait [""UAVHacker"",true];
BSpecOps3 setUnitTrait [""UAVHacker"",true];
BSpecOps4 setUnitTrait [""UAVHacker"",true];
BSpecOps5 setUnitTrait [""UAVHacker"",true];


//camp destroy
OEngineer1 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Destroy_Camp' + "</t>",'Client\Action\Action_DestroyCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
OEngineer2 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Destroy_Camp' + "</t>",'Client\Action\Action_DestroyCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
OEngineer3 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Destroy_Camp' + "</t>",'Client\Action\Action_DestroyCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
OEngineer4 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Destroy_Camp' + "</t>",'Client\Action\Action_DestroyCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
OEngineer5 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Destroy_Camp' + "</t>",'Client\Action\Action_DestroyCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BEngineer1 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Destroy_Camp' + "</t>",'Client\Action\Action_DestroyCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BEngineer2 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Destroy_Camp' + "</t>",'Client\Action\Action_DestroyCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BEngineer3 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Destroy_Camp' + "</t>",'Client\Action\Action_DestroyCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BEngineer4 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Destroy_Camp' + "</t>",'Client\Action\Action_DestroyCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
BEngineer5 addAction ["<t color='#11ec52'>" + localize 'STR_WF_Destroy_Camp' + "</t>",'Client\Action\Action_DestroyCampEngineer.sqf',[],97,false,true,'','[player] call CTI_CL_FNC_Client_GetNearestCamp'];
//light repair
OMachinegunner1_1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMachinegunner1_2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMachinegunner2_1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMachinegunner2_2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMachinegunner3_1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMachinegunner3_2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMachinegunner4_1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMachinegunner4_2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMachinegunner5_1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMachinegunner5_2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMachinegunner1_1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMachinegunner1_2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMachinegunner2_1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMachinegunner2_2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMachinegunner3_1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMachinegunner3_2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMachinegunner4_1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMachinegunner4_2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMachinegunner5_1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMachinegunner5_2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BTeamleader1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BTeamleader2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BTeamleader3 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BTeamleader4 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BTeamleader5 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OTeamleader1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OTeamleader2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OTeamleader3 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OTeamleader4 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OTeamleader5 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMedic1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMedic2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMedic3 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMedic4 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OMedic5 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMedic1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMedic2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMedic3 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMedic4 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BMedic5 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OSpecOps1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OSpecOps2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OSpecOps3 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OSpecOps4 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
OSpecOps5 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BSpecOps1 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BSpecOps2 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BSpecOps3 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BSpecOps4 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
BSpecOps5 addAction [(localize "STR_WASP_actions_fastrep"),(CTI_SK_V_Root + 'LR' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_LR > CTI_SK_V_Reload_LR)&&((cursorTarget isKindOf 'Landvehicle' )|| (cursorTarget isKindOf 'Air'))&&(player distance cursorTarget<5)"];
//advanced repair
OEngineer1 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),(CTI_SK_V_Root + 'Engineer' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Repair > CTI_SK_V_Reload_Repair"];
BEngineer1 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),(CTI_SK_V_Root + 'Engineer' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Repair > CTI_SK_V_Reload_Repair"];
OEngineer2 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),(CTI_SK_V_Root + 'Engineer' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Repair > CTI_SK_V_Reload_Repair"];
BEngineer2 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),(CTI_SK_V_Root + 'Engineer' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Repair > CTI_SK_V_Reload_Repair"];
OEngineer3 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),(CTI_SK_V_Root + 'Engineer' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Repair > CTI_SK_V_Reload_Repair"];
BEngineer3 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),(CTI_SK_V_Root + 'Engineer' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Repair > CTI_SK_V_Reload_Repair"];
OEngineer4 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),(CTI_SK_V_Root + 'Engineer' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Repair > CTI_SK_V_Reload_Repair"];
BEngineer4 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),(CTI_SK_V_Root + 'Engineer' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Repair > CTI_SK_V_Reload_Repair"];
OEngineer5 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),(CTI_SK_V_Root + 'Engineer' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Repair > CTI_SK_V_Reload_Repair"];
BEngineer5 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Repair'+ "</t>"),(CTI_SK_V_Root + 'Engineer' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Repair > CTI_SK_V_Reload_Repair"];
//lockpick
OSpecOps1 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),(CTI_SK_V_Root + 'SpecOps' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_Lockpick > CTI_SK_V_Reload_Lockpick && vehicle player == player)"];
OSpecOps2 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),(CTI_SK_V_Root + 'SpecOps' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_Lockpick > CTI_SK_V_Reload_Lockpick && vehicle player == player)"];
OSpecOps3 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),(CTI_SK_V_Root + 'SpecOps' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_Lockpick > CTI_SK_V_Reload_Lockpick && vehicle player == player)"];
OSpecOps4 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),(CTI_SK_V_Root + 'SpecOps' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_Lockpick > CTI_SK_V_Reload_Lockpick && vehicle player == player)"];
OSpecOps5 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),(CTI_SK_V_Root + 'SpecOps' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_Lockpick > CTI_SK_V_Reload_Lockpick && vehicle player == player)"];
BSpecOps1 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),(CTI_SK_V_Root + 'SpecOps' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_Lockpick > CTI_SK_V_Reload_Lockpick && vehicle player == player)"];
BSpecOps2 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),(CTI_SK_V_Root + 'SpecOps' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_Lockpick > CTI_SK_V_Reload_Lockpick && vehicle player == player)"];
BSpecOps3 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),(CTI_SK_V_Root + 'SpecOps' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_Lockpick > CTI_SK_V_Reload_Lockpick && vehicle player == player)"];
BSpecOps4 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),(CTI_SK_V_Root + 'SpecOps' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_Lockpick > CTI_SK_V_Reload_Lockpick && vehicle player == player)"];
BSpecOps5 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Lockpick'+ "</t>"),(CTI_SK_V_Root + 'SpecOps' + '.sqf'), [], 80, false, true, "", "(time - CTI_SK_V_LastUse_Lockpick > CTI_SK_V_Reload_Lockpick && vehicle player == player)"];
//spotting
OSpecOps1 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),(CTI_SK_V_Root + 'Sniper' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Spot > CTI_SK_V_Reload_Spot"];
OSpecOps2 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),(CTI_SK_V_Root + 'Sniper' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Spot > CTI_SK_V_Reload_Spot"];
OSpecOps3 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),(CTI_SK_V_Root + 'Sniper' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Spot > CTI_SK_V_Reload_Spot"];
OSpecOps4 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),(CTI_SK_V_Root + 'Sniper' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Spot > CTI_SK_V_Reload_Spot"];
OSpecOps5 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),(CTI_SK_V_Root + 'Sniper' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Spot > CTI_SK_V_Reload_Spot"];
BSpecOps1 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),(CTI_SK_V_Root + 'Sniper' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Spot > CTI_SK_V_Reload_Spot"];
BSpecOps2 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),(CTI_SK_V_Root + 'Sniper' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Spot > CTI_SK_V_Reload_Spot"];
BSpecOps3 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),(CTI_SK_V_Root + 'Sniper' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Spot > CTI_SK_V_Reload_Spot"];
BSpecOps4 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),(CTI_SK_V_Root + 'Sniper' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Spot > CTI_SK_V_Reload_Spot"];
BSpecOps5 addAction [("<t color='#f8d664'>" + localize 'STR_WF_ACTION_Spot'+ "</t>"),(CTI_SK_V_Root + 'Sniper' + '.sqf'), [], 80, false, true, "", "time - CTI_SK_V_LastUse_Spot > CTI_SK_V_Reload_Spot"];


//recoil part
OMachinegunner1_1 setUnitRecoilCoefficient 0.25;
OMachinegunner1_2 setUnitRecoilCoefficient 0.25;
OMachinegunner2_1 setUnitRecoilCoefficient 0.25;
OMachinegunner2_2 setUnitRecoilCoefficient 0.25;
OMachinegunner3_1 setUnitRecoilCoefficient 0.25;
OMachinegunner3_2 setUnitRecoilCoefficient 0.25;
OMachinegunner4_1 setUnitRecoilCoefficient 0.25;
OMachinegunner4_2 setUnitRecoilCoefficient 0.25;
OMachinegunner5_1 setUnitRecoilCoefficient 0.25;
OMachinegunner5_2 setUnitRecoilCoefficient 0.25;
BMachinegunner1_1 setUnitRecoilCoefficient 0.25;
BMachinegunner1_2 setUnitRecoilCoefficient 0.25;
BMachinegunner2_1 setUnitRecoilCoefficient 0.25;
BMachinegunner2_2 setUnitRecoilCoefficient 0.25;
BMachinegunner3_1 setUnitRecoilCoefficient 0.25;
BMachinegunner3_2 setUnitRecoilCoefficient 0.25;
BMachinegunner4_1 setUnitRecoilCoefficient 0.25;
BMachinegunner4_2 setUnitRecoilCoefficient 0.25;
BMachinegunner5_1 setUnitRecoilCoefficient 0.25;
BMachinegunner5_2 setUnitRecoilCoefficient 0.25;

*/

[] spawn cti_CL_FNC_UpdateActions;

Options = _unit addAction ["<t color='#42b6ff'>" + (localize "STR_WF_Options") + "</t>","Client\Action\Action_Menu.sqf", "", 999, false, true, "", "_target == player"];

if (!isNull commanderTeam) then {
	_hq = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQ;
	if (commanderTeam == group _unit) then {HQAction = _unit addAction [localize "STR_WF_BuildMenu","Client\Action\Action_Build.sqf", [_hq], 1000, false, true, "", "hqInRange && canBuildWHQ && (_target == player)"];};
   if (commanderTeam == group _unit) then {Bulldozer = leader(group player) addAction ["<t color='#504315'>" + ('Bulldozer') + "</t>","Client\Action\Action_Bulldozer.sqf", [_MHQ], 995, false, true, "", "hqInRange && canBuildWHQ && (_target == player)"];};
   //if (commanderTeam == group _unit) then {BuyHQ = leader(group player) addAction ["<t color='#FF0000'>"+ "RECOVER HQ" + "  " + str (missionNameSpace getVariable 'cti_C_BASE_HQ_REPAIR_PRICE_CASH') +"$" +"</t>", "Client\Action\Action_RepairMHQDepot.sqf", [], 1001, false, true, "", "(!(alive ((cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQ)))&&(leader  (cti_Client_SideJoined call cti_CO_FNC_GetCommanderTeam) == leader (vehicle player))&&(typeOf cursorTarget in ['Fort_CAmp','cti_C_DEPOT'])&&(cursorTarget distance player < 100)"];};

  // player addAction ["<t color='#FF0000'>"+ "RECOVER HQ" + "  " + str (missionNameSpace getVariable 'cti_C_BASE_HQ_REPAIR_PRICE_CASH') +"$" +"</t>", "Client\Action\Action_RepairMHQDepot.sqf", [], 1, false, true, "", "(!(alive ((cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQ)))&&(leader  (cti_Client_SideJoined call cti_CO_FNC_GetCommanderTeam) == leader (vehicle player))&&(typeOf cursorTarget in ['Fort_CAmp','cti_C_DEPOT'])&&(cursorTarget distance player < 100)"];
};

// adjusting fatigue
if ((missionNamespace getVariable "cti_C_GAMEPLAY_FATIGUE_ENABLED") == 1) then {
    player setCustomAimCoef 0.35;
    player setUnitRecoilCoefficient 0.75;
    player enablestamina false;
};

[cti_Client_SideJoinedText,'UnitsCreated',1] Call cti_CO_FNC_UpdateStatistics;