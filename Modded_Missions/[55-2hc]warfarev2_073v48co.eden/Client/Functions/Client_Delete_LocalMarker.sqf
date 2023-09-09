/* 
	Author: Marty
	Name: Client_Delete_LocalMarker.sqf
	Parameters:
	  0 - marker created with the createMarkerLocal command. 
	  1 - Number of seconds as a type number to wait before removing.
	Description:
	     Delete the specified local marker after a specified time on the client calling it. It is asynchronized thanks to the use of the spawn command, then it doesnt make sleep the calling script. 
		
*/

private ["_nukeMarker", "_deleteTime"];

_nukeMarker = _this select 0;
_deleteTime = _this select 1;

[_nukeMarker,_deleteTime]spawn 
{
	_nukeMarker = _this select 0;
	_deleteTime = _this select 1;
	
	sleep _deleteTime;
	
	deleteMarkerLocal _nukeMarker;
};		