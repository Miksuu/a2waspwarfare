Private ["_allowCustom","_buildings","_charge","_funds","_get","_loadDefault","_listbp","_mode","_price","_skip","_spawn","_spawnInside","_typeof","_unit","_weaps"];

_unit = _this select 0;
_spawn = _this select 1;
_loadDefault = true;
_typeof = typeOf _spawn;

cti_Client_IsRespawning = false;
_allowCustom = true;


//--- Default gear enforcement on mobile respawn.
if ((missionNamespace getVariable "cti_C_RESPAWN_MOBILE") == 2) then {
	if (_typeof in (missionNamespace getVariable Format ["cti_%1AMBULANCES",cti_Client_SideJoinedText])) then {_allowCustom = false};
};

//--- Respawn.
if (_spawn isKindOf "Man") then {_spawn = vehicle _spawn};
_spawnInside = false;
if (_typeof in (missionNamespace getVariable Format ["cti_%1AMBULANCES",cti_Client_SideJoinedText]) && alive _spawn) then {
	if (_spawn emptyPositions "cargo" > 0 && (locked _spawn in [0, 1])) then {_unit moveInCargo _spawn;_spawnInside = true};
};

if !(_spawnInside) then {_unit setPos ([getPos _spawn,10,20] Call cti_CO_FNC_GetRandomPosition)};

//--Disable fatigue--
if ((missionNamespace getVariable "cti_C_GAMEPLAY_FATIGUE_ENABLED") == 0) then {_unit enableFatigue false;};

//--- Loadout.
if (!isNil 'cti_P_CurrentGear' && !cti_RespawnDefaultGear && _allowCustom) then {
	_mode = missionNamespace getVariable "cti_C_RESPAWN_PENALTY";

	if (_mode in [0,2,3,4,5]) then {
		//--- Calculate the price/funds.
		_skip = false;
		_gear_cost = _unit getVariable "cti_custom_gear_cost";
		if (_mode != 0) then {
			_price = 0;

			//--- Get the mode pricing.
			switch (_mode) do {
				case 2: {_price = _gear_cost};
				case 3: {_price = round(_gear_cost/2)};
				case 4: {_price = round(_gear_cost/4)};
				case 5: {_price = _gear_cost};
			};

			//--- Are we charging only on mobile respawn?
			_charge = true;
			if (_mode == 5) then {
				_buildings = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideStructures;
				if (_spawn in _buildings || _spawn == ((cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQ)) then {_charge = false};
			};

			//--- Charge if possible.
			_funds = Call cti_CL_FNC_GetPlayerFunds;
			if (_funds >= _price && _charge) then {
				-(_price) Call cti_CL_FNC_ChangePlayerFunds;
				(Format[localize 'STR_WF_CHAT_Gear_RespawnCharge',_price]) Call cti_CL_FNC_GroupChatMessage;
			};

			//--- Check that the player has enough funds.
			if (_funds < _price) then {_skip = true};
		};

		//--- Use the respawn loadout.
		if !(_skip) then {
			
			_respawn_gear = if (isNil 'cti_P_CurrentGear') then {missionNamespace getVariable format ["cti_AI_%1_DEFAULT_GEAR", cti_Client_SideJoined]} else {cti_P_CurrentGear};
			[player, _respawn_gear] call cti_CO_FNC_EquipUnit; //--- Equip the equipment
			
			_loadDefault = false;
		};
	};
};

//--- Load the default loadout.
if (_loadDefault) then {
	Private ["_default"];
	_default = [];
	
	
	/*
	switch (cti_SK_V_Type) do {

		case WSW_SNIPER: {_default = missionNamespace getVariable Format["cti_%1_DefaultGearSpot", cti_Client_SideJoinedText]};

		case WSW_SOLDIER: {_default = missionNamespace getVariable Format["cti_%1_DefaultGearSoldier", cti_Client_SideJoinedText]};

		case WSW_ENGINEER: {_default = missionNamespace getVariable Format["cti_%1_DefaultGearEngineer", cti_Client_SideJoinedText]};

		case WSW_SPECOPS: {_default = missionNamespace getVariable Format["cti_%1_DefaultGearLock", cti_Client_SideJoinedText]};

        case WSW_ARTY_OPERATOR: {_default = missionNamespace getVariable Format["cti_%1_DefaultGearArtOperator", cti_Client_SideJoinedText];};

        case WSW_UAV_OPERATOR: {_default = missionNamespace getVariable Format["cti_%1_DefaultGearUAVOperator", cti_Client_SideJoinedText];};
	};
	
	*/
	
	
	
	
	if (player in TeamleaderContainer) then	{
_default = missionNamespace getVariable Format["cti_%1_DefaultGearTeamleader", cti_Client_SideJoinedText];
}
else
	{
if (player in EngineerContainer) then	{
_default = missionNamespace getVariable Format["cti_%1_DefaultGearEngineer", cti_Client_SideJoinedText];
}
	else
		{
if (player in MachinegunnerContainer) then	{
_default = missionNamespace getVariable Format["cti_%1_DefaultGearMachinegunner", cti_Client_SideJoinedText];
}
		else	
			{
if (player in MedicContainer) then	{
_default = missionNamespace getVariable Format["cti_%1_DefaultGearMedic", cti_Client_SideJoinedText];
}
			else
				{
if (player in SpecsOpsContainer) then	{
_default = missionNamespace getVariable Format["cti_%1_DefaultGearSpecops", cti_Client_SideJoinedText];
}
				else
					{

if (player in UKTeamleaderContainer) then	{
_default = missionNamespace getVariable Format["cti_%1_DefaultGearUKTeamleader", cti_Client_SideJoinedText];
}
					else
						{
if (player in UKEngineerContainer) then	{
_default = missionNamespace getVariable Format["cti_%1_DefaultGearUKEngineer", cti_Client_SideJoinedText];
}
						else
							{
if (player in UKMachinegunnerContainer) then	{
_default = missionNamespace getVariable Format["cti_%1_DefaultGearUKMachinegunner", cti_Client_SideJoinedText];
}
							else	
								{
if (player in UKMedicContainer) then	{
_default = missionNamespace getVariable Format["cti_%1_DefaultGearUKMedic", cti_Client_SideJoinedText];
}
								else
									{
if (player in UKSpecsOpsContainer) then	{
_default = missionNamespace getVariable Format["cti_%1_DefaultGearUKSpecops", cti_Client_SideJoinedText];
}
									else
										{
}}}}}}}}}};


	
	
	
	
	
	
	
	
	
	
	
	
	
	[player, _default] call cti_CO_FNC_EquipUnit;
};