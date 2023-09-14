_hq = (side player) Call cti_CO_FNC_GetSideHQ;
sleep 5;
_hqPos = getPosATL _hq;

0 setFog [0.5, 0.05, 0];
_randomValue = random 100;

12452 cutText [(localize 'STR_WF_Loading')+"...","BLACK IN",5];

_camera = "camera" camCreate [((getPosATL _hq) select 0) + _randomValue, ((getPosATL _hq) select 1)+_randomValue,
                ((getPosATL _hq) select 2) + 500];
_camera cameraEffect ["Internal","back"];

_hours = date select 3;
_minutes = date select 4;
if (_hours < 10) then {_hours = '0' + str _hours};
if (_minutes < 10) then {_minutes = '0' + str _minutes};
_localTime = format ['Local time: %1:%2',_hours,_minutes];

_introText = format["%1","<t font='PuristaBold' align='center'>Region: " + worldName + " area<br /></t>" + _localTime];

_mseed = floor random [1,3,5];

switch(_mseed) do
{
	case 1: { playMusic "LeadTrack02_F_EPA"; };
	case 2: { playMusic "LeadTrack02b_F_EPA"; };
	case 3: { playMusic "LeadTrack04_F_EPC"; };
	case 4: { playMusic "BackgroundTrack02_F"; };
	case 5: { playMusic "LeadTrack01b_F"; };
};

[_introText,0.75,0.2,10,5,0,5] spawn bis_fnc_dynamicText;

_camera camSetTarget player;
_camera camPreparePos ([((getPosATL player) select 0) + 21,((getPosATL player) select 1) + 21,((getPosATL player) select 2)+ 25]);
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 30;

waituntil {camCommitted _camera};
_camera camPreparePos ([(getPosATL player) select 0,(getPosATL player) select 1,((getPosATL player) select 2)]);
_camera camCommitPrepared 4;
waituntil {camCommitted _camera};

_camera cameraEffect ["Terminate","back"];

WSW_EndIntro = true;

_logic = (cti_Client_SideJoined) Call cti_CO_FNC_GetSideLogic;
_sleepTime = 3;

if(!isNil {_logic getVariable "cti_votetime"}) then {
	_sleepTime = _sleepTime + (_logic getVariable "cti_votetime");
};

sleep _sleepTime;

