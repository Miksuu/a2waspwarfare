
_Remember_townspawn_setting1=missionNamespace getVariable "cti_C_TOWNS_OCCUPATION";
_Remember_townspawn_setting2=missionNamespace getVariable "cti_C_TOWNS_DEFENDER";


while {true} do {
    if(isServer) then {
        // Send the current Server FPS to every client, stored in the variable "SERVER_FPS".
        SERVER_FPS = round (diag_fps);
        publicVariable "SERVER_FPS";
        sleep 1;
		
		
		
	if ((missionNamespace getVariable "cti_C_FPS_MANAGER") == 0) then {
//____________________________________________________________________________________________________________		
		if (((missionNamespace getVariable "SERVER_FPS") < 26)) then {
				
		//_res = [];
		//{if ((side _x) == resistance) then {_res pushBack _x};} forEach allUnits;				
		//{_x disableAI "MOVE"; } forEach _res;
		
		
		
		{_x disableAI "MOVE"; } forEach allUnits;
		//systemChat "läuft nicht";
		
		//---------------reduce townspawn until fps are better-----------------
		if ((missionNamespace getVariable "cti_C_TOWNS_OCCUPATION")>1)then{
		missionNamespace setVariable ["cti_C_TOWNS_OCCUPATION", 1];
		};
		if ((missionNamespace getVariable "cti_C_TOWNS_DEFENDER")>1)then{
		missionNamespace setVariable ["cti_C_TOWNS_DEFENDER", 1];
		};
		
		//_status=missionNamespace getVariable "cti_C_TOWNS_DEFENDER";
		//systemChat str _status;
		
		FPS_SWITCH=5;
		sleep 1;
		};
		
//____________________________________________________________________________________________________________		
		if (((missionNamespace getVariable "SERVER_FPS") > 26)&&(FPS_SWITCH == 5)) then {
				
		//_res = [];
		//{if ((side _x) == resistance) then {_res pushBack _x};} forEach allUnits;
		//{_x enableAI "MOVE"; } forEach _res;
		
		{_x enableAI "MOVE"; } forEach allUnits;
		
		
		//------------------get parameter setting back---------------------------------
		if ((missionNamespace getVariable "cti_C_TOWNS_OCCUPATION")!=_Remember_townspawn_setting1)then{
		missionNamespace setVariable ["cti_C_TOWNS_OCCUPATION", _Remember_townspawn_setting1];
		};
		if ((missionNamespace getVariable "cti_C_TOWNS_DEFENDER")!=_Remember_townspawn_setting2)then{
		missionNamespace setVariable ["cti_C_TOWNS_DEFENDER", _Remember_townspawn_setting2];
		};
		
		//_status=missionNamespace getVariable "cti_C_TOWNS_DEFENDER";
		//systemChat str _status;
		//systemChat "läuft";
		FPS_SWITCH=2;
		};
		
	  };
		
    };
};