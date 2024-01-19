disableSerialization;

_display = _this select 0;
WF_MenuAction = -1;

_currentVD = viewDistance;
_currentOD = getObjectViewDistance select 0;
_funds = Call cti_CL_FNC_GetPlayerFunds;

if (votePopUp) then {
	ctrlSetText[13019, localize "STR_WF_VOTING_PopUpOffButton"];
} else {
	ctrlSetText[13019, localize "STR_WF_VOTING_PopUpOnButton"];
};

ctrlSetText [13101, Format [localize "STR_WF_TEAM_ObjectDistanceLabel",_currentOD]];
ctrlSetText [13002, Format [localize "STR_WF_TEAM_ViewDistanceLabel",_currentVD]];
//ctrlSetText [13004, Format [localize "STR_WF_TEAM_TerrainGridLabel",currentTG]];
ctrlSetText [13006, Format [localize "STR_WF_TEAM_MoneyTransfer",0]];
ctrlSetText [13010, Format [localize "STR_WF_Income",Call cti_CL_FNC_GetPlayerFunds,(cti_Client_SideJoined) Call cti_CL_FNC_GetIncome]];

SliderSetRange[130039, 1, missionNamespace getVariable "cti_C_OBJECT_MAX_VIEW"];
SliderSetRange[13003, 1, missionNamespace getVariable "cti_C_ENVIRONMENT_MAX_VIEW"];
//SliderSetRange[13005, 1, missionNamespace getVariable "cti_C_ENVIRONMENT_MAX_CLUTTER"];
SliderSetRange[13007,0,_funds];
SliderSetPosition[130039,_currentOD];
SliderSetPosition[13003,_currentVD];
//SliderSetPosition[13005,currentTG];
_lastod = _currentOD;
_lastvd = _currentVD;
//_lasttg = currentTG;	
_timer = 0;
_need_save = false;

_i = 1;
{
	_xtra = if (isPlayer (leader _x)) then {name (leader _x)} else {"AI"};
	lbAdd[13008,Format ["[%1] %2",_i,_xtra]];
	_i = _i + 1;
} forEach cti_Client_Teams; 
lbSetCurSel[13008,0];

_units = ((units group player) Call cti_CO_FNC_GetLiveUnits);
_units = _units - [player];
{
	_desc = [typeOf _x, 'displayName'] Call cti_CO_FNC_GetConfigInfo;
	_finalNumber = (_x) Call cti_CO_FNC_GetAIDigit;
	_isInVehicle = "";
	if (_x != vehicle _x) then {
		_descVehi = [typeOf (vehicle _x), 'displayName'] Call cti_CO_FNC_GetConfigInfo;
		_isInVehicle = " [" + _descVehi + "] ";
	};
	_txt = "["+_finalNumber+"] "+ _desc + _isInVehicle;
	lbAdd[13013,_txt];
} forEach _units;
lbSetCurSel[13013,0];

{lbAdd[13018,_x]} forEach ["None","FX 1","FX 2","FX 3","FX 4","FX 5"];
lbSetCurSel[13018,currentFX];

while {alive player && dialog} do {
	sleep 0.05;
	
	if (Side player != cti_Client_SideJoined) exitWith {closeDialog 0};
	if (!dialog) exitWith {};
	
	_curSel = lbCurSel 13008;
	_currentOD = Floor (SliderPosition 130039);
	_currentVD = Floor (SliderPosition 13003);
	//currentTG = Floor (SliderPosition 13005);
	_transferAmount = Floor (SliderPosition 13007);
	
	ctrlSetText [13101, Format [localize "STR_WF_TEAM_ObjectDistanceLabel",_currentOD]];
	ctrlSetText [13002, Format [localize "STR_WF_TEAM_ViewDistanceLabel",_currentVD]];
	//ctrlSetText [13004, Format [localize "STR_WF_TEAM_TerrainGridLabel",currentTG]];
	ctrlSetText [13006, Format [localize "STR_WF_TEAM_MoneyTransfer",_transferAmount]];
	
	if (WF_MenuAction == 1) then {
		WF_MenuAction = -1;
		if ((_transferAmount != 0)&&((cti_Client_Teams select _curSel) != group player)) then {
			[(cti_Client_Teams select _curSel),_transferAmount] Call cti_CO_FNC_ChangeTeamFunds;
			-_transferAmount Call cti_CL_FNC_ChangePlayerFunds;
			_funds = Call cti_CL_FNC_GetPlayerFunds;
			if (isPlayer leader (cti_Client_Teams select _curSel)) then {
				['FundsTransfer',_transferAmount,name player] remoteExecCall ["cti_CL_FNC_LocalizeMessage", leader (cti_Client_Teams select _curSel)];
			};
			sliderSetRange[13007,0,_funds];
		};
	};
	
	if (WF_MenuAction == 3) then {
		WF_MenuAction = -1;
		_curUnitSel = lbCurSel 13013;
		if (_curUnitSel != -1) then {
			_vehicle = vehicle (_units select _curUnitSel);
			_destroy = [(_units select _curUnitSel)];
			if (_vehicle != (_units select _curUnitSel)) then {_destroy = _destroy + [_vehicle]};
			{
				if !(isPlayer _x) then {
					if (_x isKindOf 'Man') then {removeAllWeapons _x};
					_x setDammage 1;
				};
			} forEach _destroy;
			
			_units = (units group player) Call cti_CO_FNC_GetLiveUnits;
			_units = _units - [leader group player];
			lbClear 13013;
			{
				_desc = [typeOf _x, 'displayName'] Call cti_CO_FNC_GetConfigInfo;
				_finalNumber = (_x) Call cti_CO_FNC_GetAIDigit;
				_isInVehicle = "";
				if (_x != vehicle _x) then {
					_descVehi = [typeOf (vehicle _x), 'displayName'] Call cti_CO_FNC_GetConfigInfo;
					_isInVehicle = " [" + _descVehi + "] ";
				};
				_txt = "["+_finalNumber+"] "+ _desc + _isInVehicle;
				lbAdd[13013,_txt];
			} forEach _units;
			lbSetCurSel[13013,0];
		};
	};
	
	if (WF_MenuAction == 6) then {
		WF_MenuAction = -1;
		currentFX = lbCurSel 13018;
		[currentFX] Spawn cti_CL_FNC_FX;
	};
	
	//--- Vote Pop-Up //added-MrNiceGuy
	if (WF_MenuAction == 13) then {
		WF_MenuAction = -1;
		if (votePopUp) then {
			votePopUp = false;
			ctrlSetText[13019, localize "STR_WF_VOTING_PopUpOnButton"];
		} else {
			votePopUp = true;
			ctrlSetText[13019, localize "STR_WF_VOTING_PopUpOffButton"];
		};
	};
	
	//--- WF3 Adv Funds transfers.
	if (WF_MenuAction == 101) exitWith {
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "cti_TransferMenu";
	};
	
	if (_currentOD != _lastod) then {
		setObjectViewDistance _currentOD;
		setShadowDistance _currentOD;
		if !(isNil 'cti_CO_FNC_SetProfileVariable') then {['cti_PERSISTENT_CONST_OBJECT_DISTANCE', _currentOD] Call cti_CO_FNC_SetProfileVariable; _need_save = true};
	};
	
	if (_currentVD != _lastvd) then {
		setViewDistance _currentVD;
		if !(isNil 'cti_CO_FNC_SetProfileVariable') then {['cti_PERSISTENT_CONST_VIEW_DISTANCE', _currentVD] Call cti_CO_FNC_SetProfileVariable; _need_save = true};
	};
	/*
	if (currentTG != _lasttg) then {
		setTerrainGrid currentTG;
		if !(isNil 'cti_CO_FNC_SetProfileVariable') then {['cti_PERSISTENT_CONST_TERRAIN_GRID', currentTG] Call cti_CO_FNC_SetProfileVariable; _need_save = true};
	};
	*/
	_lastod = _currentOD;
	_lastvd = _currentVD;
	//_lasttg = currentTG;
	
	if (_timer > 2) then {ctrlSetText [13010, Format [localize "STR_WF_Income",Call cti_CL_FNC_GetPlayerFunds,(cti_Client_SideJoined) Call cti_CL_FNC_GetIncome]];_timer = 0};
	_timer = _timer + 0.05;
	
	//--- Back Button.
	if (WF_MenuAction == 8) exitWith { //---added-MrNiceGuy
		WF_MenuAction = -1;
		closeDialog 0;
		createDialog "WF_Menu";
	};
};

if (_need_save) then {
	if !(isNil 'cti_CO_FNC_SaveProfile') then {Call cti_CO_FNC_SaveProfile};
};
