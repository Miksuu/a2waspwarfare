disableSerialization;

CutRsc["OptionsAvailable","PLAIN",0];
_icons = ["",""];

if (isNil 'BIS_CONTROL_CAM') then { RUBHUD = True } else {RUBHUD = false};

sleep 5;
waituntil{!(isNil "towns") && (count towns) != 0};
_total = count towns;

while {true} do {
	sleep 1;

	if (isNull (["currentCutDisplay"] call BIS_FNC_GUIget)) then {CutRsc["OptionsAvailable","PLAIN",0];_delay = 0};	
	if (!isNull (["currentCutDisplay"] call BIS_FNC_GUIget)) then {
		_lineLabel0 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1344;	
		_lineLabel = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1345;	
		_textLabel1 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1346;
		_textLabel2 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1348;
		_textLabel3 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1370; //Commander name
		_textLabel4 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1350;
		_textLabel5 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1352;
		_textLabel6 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1354;
		_textLabel7 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1356;
		_textLabel8 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1358;
		_textLabel9 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1360;
		//_flagwest01 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1362;
		//_flageast01 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1365;
		
		_player = Leader player;
		//Show background
		
		_lineLabel ctrlShow true;
		_linelabel0 ctrlShow true;
		
		if (side player == WEST) then {
			_lineLabel0 CtrlSetBackgroundColor [0,0.4,1,1];
			_lineLabel CtrlSetBackgroundColor [0,0.4,1,1]; 
		} else {
			_lineLabel0 CtrlSetBackgroundColor [1,0.2,0,1];
			_lineLabel CtrlSetBackgroundColor [1,0.2,0,1];
		};
		
		_textLabel1 ctrlSetText "Health:";
		_textLabel2 ctrlSetText "UpTime:";
		_textLabel3 ctrlSetText "Com:";
		
		_textLabel4 ctrlSetText "Money:";
		_textLabel5 ctrlSetText "Income:";
		_textLabel6 ctrlSetText "Supply:";
		_textLabel7 ctrlSetText "SV Min:";
		_textLabel8 ctrlSetText "Towns:";
		_textLabel9 ctrlSetText "C|S:";
		//_flagwest01 ctrlSetText "Client\Images\flag_bluefor_ca.paa";
		//_flageast01 ctrlSetText "Client\Images\flag_opfor_ca.paa";
		_textLabel1 ctrlShow true;
		_textLabel2 ctrlShow true;
		_textLabel3 ctrlShow true;
		_textLabel4 ctrlShow true;
		_textLabel5 ctrlShow true;
		_textLabel6 ctrlShow true;
		_textLabel7 ctrlShow true;
		_textLabel8 ctrlShow true;
		_textLabel9 ctrlShow true;
		_lineLabel  ctrlShow true;	
		_lineLabel0 ctrlShow true;
	//	_flagwest01 ctrlShow true;
	//	_flageast01 ctrlShow true;

		//HEALT			
		_textControl5 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1347;
		_textControl5 ctrlShow true;
		_status = damage _player;
		_health = 1 - _status;
		_healthAct = (1 - _status) * 100;
		_textControl5 ctrlSetText Format ["%1",str(round _healthAct)] + " %";
		if (_health <= 1) then {_textControl5 ctrlSetTextColor [0, 1, 0, 1]};
		if (_health <= 0.89) then {_textControl5 ctrlSetTextColor [1, 0.8831, 0, 1]};
		if (_health <= 0.79) then {_textControl5 ctrlSetTextColor [1, 0.65, 0, 1]};
		if (_health <= 0.60) then {_textControl5 ctrlSetTextColor [1, 0.15, 0, 1]};
		if (_health <= 0.08) then {_textControl5 ctrlSetTextColor [0.45, 0.25, 0.25, 1]};
		
		//UPTIME
		_uptime = Call cti_CL_FNC_GetTime; //added-MrNiceGuy
		_textControl4 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1349;
		_textControl4 ctrlShow true;
		_textControl4 ctrlSetTextColor [0.7, 0.7, 0.7, 1];_textControl4 ctrlSetText Format ["%1:%2:%3",_uptime select 1,_uptime select 2, _uptime select 3];
		
		//COMMANDER
		_textControl22 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1371;
		_textControl22 ctrlShow true;
		if (!isNull commanderTeam) then {
		_textControl22 ctrlSetTextColor [0.85, 0, 0, 1];_textControl22 ctrlSetText Format [" %1", name (leader commanderTeam)];	
		}else{
		_textControl22 ctrlSetTextColor [0.85, 0, 0, 1];_textControl22 ctrlSetText Format [" %1", "AI"];
		};
		
		//MONEY
		_textControl2 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1351;
		_textControl2 ctrlShow true;
		_textControl2 ctrlSetTextColor [0, 0.825294, 0.449803, 1];_textControl2 ctrlSetText Format ["%1 $",Call cti_CL_FNC_GetPlayerFunds];
		_textControl3 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1353;
		_textControl3 ctrlShow true;
		_textControl3 ctrlSetTextColor [0, 0.825294, 0.449803, 1];_textControl3 ctrlSetText Format ["+ %1 $",cti_Client_SideJoined Call cti_CL_FNC_GetIncome];
		
		//SUPPLY
		_textControl7 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1355;
		_textControl7 ctrlShow true;
		_textControl7 ctrlSetTextColor [1, 0.8831, 0, 1];_textControl7 ctrlSetText Format ["%1",(cti_Client_SideJoined) Call cti_CO_FNC_GetSideSupply];
		_textControl8 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1357;
		_textControl8 ctrlShow true;
		_textControl8 ctrlSetTextColor [1, 0.6831, 0, 1];_textControl8 ctrlSetText Format ["+ %1", cti_Client_SideJoined Call cti_CO_FNC_GetTotalSupplyValue];
		_textControl9 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1359;
		_textControl9 ctrlShow true;
		_textControl9 ctrlSetTextColor [0.1, 0.7, 0.9, 1];_textControl9 ctrlSetText Format ["%1 on %2", cti_Client_SideJoined Call cti_CO_FNC_GetTownsHeld, _total];
		
		//SERVERFPS			
		_textControl10 = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1361;
		_textControl10 ctrlShow true;

		_clientFPS = round(diag_fps);
		_serverFPS = missionNamespace getVariable "SERVER_FPS";			
	
		_level = "Perfect";

		if (isNil '_clientFPS') then { _clientFPS=50 };
		if ((_clientFPS < 52)&&(_clientFPS >= 45)) then {_textControl10 ctrlSetTextColor [0, 1, 1, 1]; _level="Perfect";};
		if ((_clientFPS < 45)&&(_clientFPS >= 39)) then {_textControl10 ctrlSetTextColor [0, 1, 0, 1]; _level="Very Good";};
		if ((_clientFPS < 39)&&(_clientFPS >= 28)) then {_textControl10 ctrlSetTextColor [0.5, 1, 0.15, 1]; _level="Good";};
		if ((_clientFPS < 28)&&(_clientFPS >= 21)) then {_textControl10 ctrlSetTextColor [0.9, 1, 0, 1]; _level="Average";};
		if ((_clientFPS < 21)&&(_clientFPS >= 11)) then {_textControl10 ctrlSetTextColor [1, 0.6, 0, 1]; _level="Low";};
		if ((_clientFPS < 11)&&(_clientFPS >= 0)) then {_textControl10 ctrlSetTextColor [1, 0.3, 0, 1]; _level="Very Low";};
		
		_textControl10 ctrlSetText Format ["%1|%2 FPS %3",_clientFPS,_serverFPS,_level];
			
		/* 
		
		// OSD SCORE BLUFOR - OPFOR
		_playersWestCount = {isplayer _x && side _x == west } count allunits; 
		_playersEastCount = {isplayer _x && side _x == east } count allunits; 
		
		_playerWestCountIndicator   = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1364;
		_playerEastCountIndicator   = (["currentCutDisplay"] call BIS_FNC_GUIget) DisplayCtrl 1367;
		
		_spacewest = "";
		_spaceeast = "";
		
		if ( ( _playersWestCount < 10) && ( _playersWestCount >= 0) ) then { _spacewest = "   "};
		if ( ( _playersWestCount >= 10) && ( _playersWestCount < 100)) then { _spacewest = "  "};
		
		if ( ( _playersEastCount < 10) && ( _playersEastCount >= 0) ) then { _spaceeast = "   "};
		if ( ( _playersEastCount >= 10) && ( _playersEastCount < 100)) then { _spaceeast = "  "};
				
		if ( ( _playersWestCount < 0) && (_playersWestCount > -10)) then { _spacewest = "  "};
		if ( ( _playersEastCount < 0) && (_playersEastCount > -10)) then { _spaceeast = "  "};
		
		if ( _playersWestCount < 0 ) then { _playerWestCountIndicator ctrlSetTextColor [ 1,0.51,0,1];} else {_playerWestCountIndicator ctrlSetTextColor [ 0.96,0.96,0.96,1];};
		if ( _playersEastCount < 0 ) then { _playerEastCountIndicator ctrlSetTextColor [ 1,0.51,0,1];} else {_playerEastCountIndicator ctrlSetTextColor [ 0.96,0.96,0.96,1];};
		
		_playerWestCountIndicator ctrlSetText Format [_spacewest + "%1",_playersWestCount];
		_playerEastCountIndicator ctrlSetText Format [_spaceeast + "%1",_playersEastCount];
		
		_playerWestCountIndicator ctrlShow true;
		_playerEastCountIndicator ctrlShow true;
		*/
	};
};