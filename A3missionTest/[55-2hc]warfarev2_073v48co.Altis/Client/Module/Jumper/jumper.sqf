if (isNull player) exitwith {} ;

fn_Animation =
{
    _unit = _this select 0;
    _anim = _this select 1;
    _unit switchMove _anim;// PLAY ANIMATION JUMP
    //_unit playMovenow _anim;
};

dokeyDown={
    private ["_r","_key_delay","_max_height"] ;
    _key_delay  = 0.3;// MAX TIME BETWEEN KEY PRESSES 
    _max_height = 4.3;// SET MAX JUMP HEIGHT
    // player setvariable ["key",false];// ENABLE THIS LINE FOR SINGLE KEYPRESS BY REMOVING // AT THE START OF THE LINE
	_r = false;
     
	//HINT (format["%1; %2; %3", _this select 0, _this select 1, _this select 2]);// show key number	
   
	// VARIOUS CHECKS 
	//if (player getvariable["key",true] and (_this select 1)  == 46) exitwith {player setvariable["key",false]; [_key_delay] spawn {sleep (_this select 0);player setvariable["key",true]; };_r};
     //if ((_this select 1)  == 46 and speed player >8) then {
       //if  (player == vehicle player  and player getvariable ["jump",true] and isTouchingGround player ) then  {	
	
	if (_this select 2 and _this select 1  == 47 and speed player >8) then {
		if  (player == vehicle player  and player getvariable ["jump",true] and isTouchingGround player ) then  {
   
		//player setvariable["key",true];// RESTE DOUBLE KEY TAP    
		player setvariable ["jump",false];// DISABLE JUMP
    
	    _height = 6-((load player)*10);// REDUCE HEIGHT BASED ON WEIGHT
	    //hint str _height;

		// MAKE JUMP IN RIGHT DIRECTION
		_vel = velocity player;
		_dir = direction player;
		_speed = 0.4;
		If (_height > _max_height) then {_height = _max_height};// MAXIMUM HEIGHT OF JUMP 
		player setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+(cos _dir*_speed),(_vel select 2)+_height];

		[[player,"AovrPercMrunSrasWrflDf"],"fn_Animation",nil,false] spawn BIS_fnc_MP; //BROADCAST ANIMATION
		 player spawn {sleep 1;_this setvariable ["jump",true]};// RE-ENABLE JUMP
    
	};	
	
    //_r=true;
    };
    //_r;	
	
	if (_this select 1 in (actionKeys "User18")) then {
		//_earplugsctrl = (_this select 0) displayCtrl 999001;
			//if(isNull(_earplugsctrl)) then {
				//_earplugsctrl = (_this select 0) ctrlCreate ["RscText", 999001];
				//_earplugsctrl ctrlSetPosition [SafeZoneXAbs, SafeZoneY + (SafeZoneH - 0.05) / 2, 0.2, 0.03];
				//_earplugsctrl ctrlSetFontHeight 0.03;
				//_earplugsctrl ctrlSetText "Earplugs";
				//_earplugsctrl ctrlShow false;
				//_earplugsctrl ctrlCommit 0;
			//};
			//_shown = ctrlShown _earplugsctrl;
			//0.1 fadeSound (if(_shown)then{1}else{0.1});
			//_earplugsctrl ctrlShow !_shown;
		
		if(player getvariable["_earplugs", true]) then {
			0.1 fadeSound 0.1;
			player setvariable["_earplugs", false];
			HINT parseText(localize 'STR_HINT_EARPLUGS_INSERTED');
		} else {
			0.1 fadeSound 1;
			player setvariable["_earplugs", true];
			HINT parseText(localize 'STR_HINT_EARPLUGS_REMOVED');
		}		
	};
};

waituntil {!(IsNull (findDisplay 46))};
(FindDisplay 46) displayAddEventHandler ["keydown","_this call dokeyDown"];