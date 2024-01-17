	disableSerialization;

	_display = _this select 0;
	_map = _display DisplayCtrl 23002;

	if(isNil "mouseButtonUp") then {mouseButtonUp = -1};

	_hqDeployed = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideHQDeployStatus;
	if (!_hqDeployed || (missionNamespace getVariable "cti_C_STRUCTURES_CONSTRUCTION_MODE") == 0) then {ctrlEnable [23004, false];ctrlEnable [23006, false]};
	if ((missionNamespace getVariable "cti_C_STRUCTURES_CONSTRUCTION_MODE") == 0) then { ctrlSetText[23005, localize 'STR_WF_Disabled']};

	WF_MenuAction = -1;

	_income = (cti_Client_SideJoined) Call cti_CO_FNC_GetTownsIncome;
	_incomeCoef = missionNamespace getVariable "cti_C_ECONOMY_INCOME_COEF";
	_incomeDividision = missionNamespace getVariable "cti_C_ECONOMY_INCOME_DIVIDED";
	_supplySystem = missionNamespace getVariable "cti_C_ECONOMY_SUPPLY_SYSTEM";
	_lastComboUpdate = -30;
	_lastPurchase = -5;
	_commanderPercent = 0;
	_hasStarted = true;

	_lastUse = 0;
	ctrlEnable [23016,false];
	ctrlShow [23016, false];

	sliderSetRange[23010,50,missionNamespace getVariable "cti_C_ECONOMY_INCOME_PERCENT_MAX"];
	_commanderPercent = missionNamespace getVariable "cti_commander_percent";
	sliderSetPosition[23010, _commanderPercent];

		while {alive player && dialog} do 
		{	
			if (side player != cti_Client_SideJoined) exitWith {closeDialog 0};
			if !(dialog) exitWith {};
			
			_funds = Call cti_CL_FNC_GetPlayerFunds;
			
			//--- Income System.			
			_currentPercent = floor(sliderPosition 23010);
			ctrlSetText[23011, Format["%1%2",_currentPercent,"%"]];
			
			//_commanderPercent = floor(sliderPosition 23010);
			
			sliderSetPosition[23010, _currentPercent];
			
			_calInc = (cti_Client_SideJoined) Call cti_CO_FNC_GetTownsIncome;
			
			if (_currentPercent != _income || _hasStarted) then {
				if (_hasStarted) then {_hasStarted = false};
				
				_income_player = 0;
				_income_commander = 0;
				//_income_player = round(_calInc * (((100 - _income)/100)/cti_Client_Teams_Count));
				//_income_commander = round((_calInc * (_income/100)) / _incomeDividision) + _income_player;
				_income_player = round(_income + ((_income / 100) * (100 - _currentPercent)));
				_income_commander = round(((_income * _incomeCoef) / 100) * _currentPercent);
					
				ctrlSetText [23013, localize 'STR_WF_ECONOMY_Income_Sys_Com' + ": $" + str(_income_commander)];
				ctrlSetText [23014, localize 'STR_WF_ECONOMY_Income_Sys_Ply' + ": $" + str(_income_player)];				
			};
			
			if (WF_MenuAction == 3) then {
				WF_MenuAction = -1;
				
				if (_currentPercent != _commanderPercent) then {
					missionNamespace setVariable ["cti_commander_percent", _currentPercent, true];					
				};
			};
			
			//--- ST Handler.
			if (_supplySystem == 0) then {
				_isCommander = false;
				if (!isNull(commanderTeam)) then {if (commanderTeam == group player) then {_isCommander = true}};
				ctrlEnable [23016,if (time - _lastUse > 5 && _isCommander) then {true} else {false}];
			};
			
			//--- Respawn Supply Trucks.
			if (WF_MenuAction == 4) then {
				WF_MenuAction = -1;
				["RespawnST",cti_Client_SideJoined] remoteExecCall ["cti_SE_PVF_RequestSpecial",2];
				_lastUse = time;
			};
			
			//added-MrNiceGuy
			if (mouseButtonUp == 0) then {
				mouseButtonUp = -1;
				
				//--- Sell Building.
				if (WF_MenuAction == 105) then {
					WF_MenuAction = -1;
					_isCommander = false;
					if (!isNull(commanderTeam)) then {if (commanderTeam == group player) then {_isCommander = true}};
					if !(_isCommander) exitWith {};
					_position = _map posScreenToWorld[mouseX,mouseY];
					_structures = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideStructures;
					_closest = [_position,_structures] Call cti_CO_FNC_GetClosestEntity;
					if (!isNull _closest) then {
						//--- 100 meters close only.
						if (_closest distance _position < 100 && isNil {_closest getVariable "cti_SOLD"}) then {
							//--- Spawn a sell thread.
							(_closest) Spawn {
								Private ["_closest","_delay","_id","_supplyB","_type"];
								_closest = _this;
								_closest setVariable ["cti_SOLD", true];
								_delay = missionNamespace getVariable "cti_C_STRUCTURES_SALE_DELAY";
								_type = typeOf _closest;
								
								//--- Inform the side (before).
								['StructureSell',_type,_delay] remoteExecCall ["cti_CL_FNC_LocalizeMessage", cti_Client_SideJoined];
								
								sleep _delay;
								
								if !(alive _closest) exitWith {};
								
								_id = (missionNamespace getVariable Format ["cti_%1STRUCTURENAMES",cti_Client_SideJoinedText]) find _type;
								
								//--- TODO: Change the find system with a getvar system.
								if (_id > 0) then {
									_supplyB = (missionNamespace getVariable Format ["cti_%1STRUCTURECOSTS",cti_Client_SideJoinedText]) select _id;
									_supplyB = round((_supplyB * (missionNamespace getVariable "cti_C_STRUCTURES_SALE_PERCENT")) / 100);
								
									[cti_Client_SideJoined, _supplyB] Call cti_CO_FNC_ChangeSideSupply;
								};
								
								//--- Inform the side.
								['StructureSold',_type] remoteExecCall ["cti_CL_FNC_LocalizeMessage", cti_Client_SideJoined];
								if ((missionNamespace getVariable "cti_C_STRUCTURES_CONSTRUCTION_MODE") == 1) then {_closest setVariable ["sold",true,true]};
								_closest setDammage 1;
							};
						};
					};
		};
	};
	
	sleep 0.1;
	
	//--- Back Button.
	if (WF_MenuAction == 5) exitWith { //---added-MrNiceGuy
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "WF_Menu";
	};
};