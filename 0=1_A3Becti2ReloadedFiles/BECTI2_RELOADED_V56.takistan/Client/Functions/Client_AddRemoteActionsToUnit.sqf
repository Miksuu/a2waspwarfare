/*
  # HEADER #
	Script: 		Client\Functions\Client_AddRemoteActionsToUnit.sqf
	Alias:			CTI_CL_FNC_AddRemoteActionsToUnit
	Description:	Add the contextual actions from the mission, and some mods, to the remoteControlled unit
					This file is called when controlling a unit
	Author: 		JEDMario
	Creation Date:	07-01-2018
	Revision Date:	06-08-2023
	
  # PARAMETERS #
    0	[Object]: The unit to add the action to
	
  # RETURNED VALUE #
	[ARRAY]: Two elements, the ID of the first action and the ID of the second action.
	
  # SYNTAX #
	[OBJECT] call CTI_CL_FNC_AddRemoteActionsToUnit
	
  # EXAMPLE #
    CTI_P_Controlled call CTI_CL_FNC_AddRemoteActionsToUnit
*/

params ["_unit"];
private ["_firstAction", "_lastAction"];
//--- Tablet Menu


// --- Vehicle actions

_firstAction =CTI_P_Controlled addAction ["<t color=""#FFE496"">" +"Attach AP Mine Charge", EtV_AttachCharge, ["APERSMine_Range_Mag",CTI_P_Controlled], 60, true, true, "","['APERSMine_Range_Mag',_target] call EtV_ChargeCheck",5];



[] spawn {
	while {CTI_P_Controlled != player} do {
		missionNamespace setVariable ["CTI_CL_FNC_EXT_SA_Nearby_Tow_Vehicles", ([] call CTI_CL_FNC_EXT_SA_Find_Nearby_Tow_Vehicles)];
		//missionNamespace setVariable ["CTI_CL_FNC_EXT_ASL_Nearby_Vehicles", ([] call CTI_CL_FNC_EXT_ASL_Find_Nearby_Vehicles)];
		sleep 2;
	};
};

CTI_P_Controlled addAction ["<t color=""#FFE496"">" +"Attach Claymore Charge", EtV_AttachCharge, ["ClaymoreDirectionalMine_Remote_Mag",CTI_P_Controlled], 59, true, true, "","['ClaymoreDirectionalMine_Remote_Mag',_target] call EtV_ChargeCheck",5];
CTI_P_Controlled addAction ["<t color=""#FFE496"">" +"Attach M6 Charge", EtV_AttachCharge, ["SLAMDirectionalMine_Wire_Mag",CTI_P_Controlled], 58, true, true, "","['SLAMDirectionalMine_Wire_Mag',_target] call EtV_ChargeCheck",5];
CTI_P_Controlled addAction ["<t color=""#FFE496"">" +"Attach C4 Charge", EtV_AttachCharge, ["DemoCharge_Remote_Mag",CTI_P_Controlled], 57, true, true, "","['DemoCharge_Remote_Mag',_target] call EtV_ChargeCheck",5];
CTI_P_Controlled addAction ["<t color=""#FFE496"">" +"Attach BIG C4 Charge", EtV_AttachCharge, ["SatchelCharge_Remote_Mag",CTI_P_Controlled], 56, true, true, "","['SatchelCharge_Remote_Mag',_target] call EtV_ChargeCheck",5];
CTI_P_Controlled addAction ["<t color=""#FFE496"">" +"Attach PipeBomb Charge", EtV_AttachCharge, ["CUP_PipeBomb_M",CTI_P_Controlled], 55, true, true, "","['CUP_PipeBomb_M',_target] call EtV_ChargeCheck",5];

	CTI_P_Controlled addAction ["Deploy Tow Ropes", { 
		[] call CTI_CL_FNC_EXT_SA_Take_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call CTI_CL_FNC_EXT_SA_Take_Tow_Ropes_Action_Check"];

	CTI_P_Controlled addAction ["Put Away Tow Ropes", { 
		[] call CTI_CL_FNC_EXT_SA_Put_Away_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call CTI_CL_FNC_EXT_SA_Put_Away_Tow_Ropes_Action_Check"];

	CTI_P_Controlled addAction ["Attach To Tow Ropes", { 
		[] call CTI_CL_FNC_EXT_SA_Attach_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call CTI_CL_FNC_EXT_SA_Attach_Tow_Ropes_Action_Check"];

	CTI_P_Controlled addAction ["Drop Tow Ropes", { 
		[] call CTI_CL_FNC_EXT_SA_Drop_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call CTI_CL_FNC_EXT_SA_Drop_Tow_Ropes_Action_Check"];
	
_lastAction = CTI_P_Controlled addAction ["Pickup Tow Ropes", { 
		[] call CTI_CL_FNC_EXT_SA_Pickup_Tow_Ropes_Action;
	}, nil, 0, false, true, "", "call CTI_CL_FNC_EXT_SA_Pickup_Tow_Ropes_Action_Check"];
	
[_firstAction, _lastAction]

