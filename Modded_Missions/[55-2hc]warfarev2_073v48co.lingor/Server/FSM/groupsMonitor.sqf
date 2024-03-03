while {!gameOver} do {

	{
		_groupCount = count units _x;
		["DEBUG", Format ["groupsMonitor.sqf: Debug info [_groupCount] [%1]", _groupCount]] Call WFBE_CO_FNC_LogContent;
	} forEach allGroups;

	["DEBUG", Format ["groupsMonitor.sqf: Total groups monitored: %1", count allGroups]] Call WFBE_CO_FNC_LogContent;
	
	sleep 30;
};