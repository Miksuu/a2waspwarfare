Private ["_delay","_lastCheck","_lastSID","_lastUpdate","_txt","_colorBlue","_colorGreen","_colorRed","_colorBlack","_ui_bg","_town_capture_mode"];

disableSerialization;
_delay = 4;
diag_log format["TITLECAPTURE: _delay initialized to %1", _delay];
_lastCheck = "";
diag_log format["TITLECAPTURE: _lastCheck initialized to %1", _lastCheck];
_lastSID = -1;
diag_log format["TITLECAPTURE: _lastSID initialized to %1", _lastSID];
_lastUpdate = time;
diag_log format["TITLECAPTURE: _lastUpdate initialized to %1", _lastUpdate];
_txt = "";
diag_log format["TITLECAPTURE: _txt initialized to %1", _txt];

_colorBlue = [0,0,0.7,0.6];
diag_log format["TITLECAPTURE: _colorBlue initialized to %1", _colorBlue];
_colorGreen = [0,0.7,0,0.6];
diag_log format["TITLECAPTURE: _colorGreen initialized to %1", _colorGreen];
_colorRed = [0.7,0,0,0.6];
diag_log format["TITLECAPTURE: _colorRed initialized to %1", _colorRed];
_colorBlack = [0,0,0,0.6];
diag_log format["TITLECAPTURE: _colorBlack initialized to %1", _colorBlack];

_ui_bg = [0,0,0,0.7];
diag_log format["TITLECAPTURE: _ui_bg initialized to %1", _ui_bg];
_town_capture_mode = missionNamespace getVariable "WFBE_C_TOWNS_CAPTURE_MODE";
diag_log format["TITLECAPTURE: _town_capture_mode initialized to %1", _town_capture_mode];

while {!WFBE_GameOver} do {
	_selectedCamera = KEGscameras select KEGs_cameraIdx;
	diag_log format["TITLECAPTURE: _selectedCamera: %1", _selectedCamera];
	_nearest = [_selectedCamera,towns] Call WFBE_CO_FNC_GetClosestEntity;
	diag_log format["TITLECAPTURE: _nearest: %1", _nearest];
	_update = if (_selectedCamera distance _nearest < (_nearest getVariable "range")) then {true} else {false};
	diag_log format["TITLECAPTURE: _update: %1", _update];
	
	if(_update && !WFBE_GameOver)then{
		_sideID = _nearest getVariable "sideID";
		diag_log format["TITLECAPTURE: _sideID: %1", _sideID];
		_curSV = _nearest getVariable "supplyValue";
		diag_log format["TITLECAPTURE: _curSV: %1", _curSV];
		_maxSV = _nearest getVariable "maxSupplyValue";
		diag_log format["TITLECAPTURE: _maxSV: %1", _maxSV];

		_camp = [vehicle player, 12, true] Call WFBE_CL_FNC_GetClosestCamp;
		diag_log format["TITLECAPTURE: _camp: %1", _camp];

		if (_town_capture_mode != 0 && !isNull _camp) then {
			if (alive (_camp getVariable "wfbe_camp_bunker")) then {
				_sideID = _camp getVariable "sideID";
				diag_log format["TITLECAPTURE: _sideID updated to: %1", _sideID];
				_curSV = _camp getVariable "supplyValue";
				diag_log format["TITLECAPTURE: _curSV updated to: %1", _curSV];
				if (_lastCheck == "Town") then {_delay = 0};
				diag_log format["TITLECAPTURE: _delay updated to: %1", _delay];
				_txt = "";
				diag_log format["TITLECAPTURE: _txt updated to: %1", _txt];
				_lastCheck = "Camp";
				diag_log format["TITLECAPTURE: _lastCheck updated to: %1", _lastCheck];
			};
		} else {
		_txt = Format [localize "STR_WF_TownSV", _curSV,_maxSV];
		diag_log format["TITLECAPTURE: _txt updated to: %1", _txt];
		_lastCheck = "Town";
		diag_log format["TITLECAPTURE: _lastCheck updated to: %1", _lastCheck];
		};

		if (_sideID != _lastSID) then {_delay = 0};
		diag_log format["TITLECAPTURE: _delay updated to: %1", _delay];
		if (isNull (uiNamespace getVariable "wfbe_title_capture")) then {600200 cutRsc["CaptureBar","PLAIN",0];_delay = 0};
		diag_log format["TITLECAPTURE: _delay updated to: %1", _delay];
		if !(isNull (uiNamespace getVariable "wfbe_title_capture")) then {
	
			_barColor = _colorGreen;
			if (_sideID == WESTID) then {_barColor = _colorBlue}; 
			if (_sideID == EASTID) then {_barColor = _colorRed};
			diag_log format["TITLECAPTURE: _barColor: %1", _barColor];

			_control = (uiNamespace getVariable "wfbe_title_capture") displayCtrl 601001;
			diag_log format["TITLECAPTURE: _control: %1", _control];
			_control ctrlShow true;
			_control ctrlSetBackgroundColor _barColor;
			_backgroundControl = (uiNamespace getVariable "wfbe_title_capture") displayCtrl 601000;
			diag_log format["TITLECAPTURE: _backgroundControl: %1", _backgroundControl];
			_backgroundControl ctrlShow true;
			_backgroundControl ctrlSetBackgroundColor _ui_bg;
			_textControl = (uiNamespace getVariable "wfbe_title_capture") displayCtrl 601002;
			diag_log format["TITLECAPTURE: _textControl: %1", _textControl];
			_textControl ctrlShow true;
			_textControl ctrlSetText _txt;
			_maxWidth = (ctrlPosition _backgroundControl Select 2) - 0.02;
			diag_log format["TITLECAPTURE: _maxWidth: %1", _maxWidth];
			_position = ctrlPosition _control;
			diag_log format["TITLECAPTURE: _position: %1", _position];
			_position set [2,_maxWidth * _curSV / _maxSV];
			diag_log format["TITLECAPTURE: _position updated to: %1", _position];
			_control ctrlSetPosition _position;
			_control ctrlCommit _delay;
			_delay = 4;
			diag_log format["TITLECAPTURE: _delay updated to: %1", _delay];
			_lastSID = _sideID;
			diag_log format["TITLECAPTURE: _lastSID updated to: %1", _lastSID];
		};
	};
	if(!_update && !WFBE_GameOver)then{
		_delay = 0;
		diag_log format["TITLECAPTURE: _delay updated to: %1", _delay];
		if (isNull (uiNamespace getVariable "wfbe_title_capture")) then {600200 cutRsc["CaptureBar","PLAIN",0]};
		if (!isNull (uiNamespace getVariable "wfbe_title_capture")) then {
			{((uiNamespace getVariable "wfbe_title_capture") displayCtrl _x) ctrlShow false} forEach [601000,601001,601002];
			diag_log "TITLECAPTURE: Hide controls 601000, 601001, 601002";
		};
	};
	//sleep 0.05;
};