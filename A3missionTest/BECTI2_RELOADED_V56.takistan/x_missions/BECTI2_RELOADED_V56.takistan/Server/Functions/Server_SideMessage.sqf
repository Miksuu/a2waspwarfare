Private ["_logik","_message","_parameters","_receiver","_side","_speaker","_topicside"];

_side = _this select 0;
_message = _this select 1;
_parameters = if (count _this > 2) then {_this select 2} else {[]};

_logik = (_side) Call cti_CO_FNC_GetSideLogic;

_speaker = _logik getVariable "cti_radio_hq";
_receiver = _logik getVariable "cti_radio_hq_rec";
_topicSide = _logik getVariable "cti_radio_hq_id";

switch (true) do {
	case (_message in ["Lost","Captured","HostilesDetectedNear"]): {
		_locRaw = str _parameters;
		_rlName = _parameters getVariable "name";
		
		_dub = _parameters getVariable "cti_town_dubbing";
		_speaker kbTell [_receiver, _topicSide, format["%1%2", _message, _side],["1","",_dub,[format ["\Townsound\%1%2.ogg",_dub, _side]]],true];
	};
	case (_message in ["CapturedNear","LostAt"]): {
		_locRaw = str (_parameters select 1);
		_rlName = (_parameters select 1) getVariable "name";

		_dub = (_parameters select 1) getVariable "cti_town_dubbing";
		_speaker kbTell [_receiver, _topicSide, format["%1%2", _message, _side],["1","",(_parameters select 0),[(_parameters select 0)]],["2","",_dub,[format ["\Townsound\%1%2.ogg",_dub, _side]]],true];
		
		
		
	};
	case (_message in ["Constructed","Destroyed","Deployed","Mobilized","IsUnderAttack"]): {
		
		_localizedString = "";
		_value = "";
		if ((_parameters select 0 ) == "Base") then {
			switch ((_parameters select 1) getVariable "cti_structure_type") do {
				case "Headquarters": {_localizedString = localize "STRHeadquarters";_value = "Headquarters"};
				case "Barracks": {_localizedString = localize "strwfbarracks";_value = "Barracks"};
				case "Light": {_localizedString = localize "STRLightVehicleSupply";_value = "LightVehicleSupply"};
				case "CommandCenter": {
					_localizedString = localize "STR_WF_CommandCenter";
					_value = "UAVTerminal";
				};
				case "Heavy": {_localizedString = localize "STRHeavyVehicleSupply";_value = "HeavyVehicleSupply"};
				case "Aircraft": {_localizedString = localize "STRHelipad";_value = "Helipad"};
				case "ServicePoint": {_localizedString = localize "STRServicePoint";_value = "ServicePoint"};
				case "AARadar": {_localizedString = localize "STRAntiAirRadar";_value = "AntiAirRadar"};
				case "ArtyRadar": {_localizedString = localize "STRArtilleryRadar";_value = "ArtilleryRadar"};
			};
		} else {
			_localizedString = (_parameters select 1) getVariable "name";
			_dub = (_parameters select 1) getVariable "cti_town_dubbing";
			_value = _dub;
		};		

		
		if ((_parameters select 0 ) == "Base") then {
		_speaker kbTell [_receiver, _topicSide, format["%1%2", _message, _side],["1","",_localizedString,[format ["\Sounds\%1%2.ogg",_value, _side]]],true];
		} else {
		_speaker kbTell [_receiver, _topicSide, format["%1%2", _message, _side],["1","",_localizedString,[format ["\Townsound\%1%2.ogg",_value, _side]]],true];
		};
	
	};
	case (_message in ["VotingForNewCommander","NewIntelAvailable","MMissionFailed","NewMissionAvailable"]): {		
		_speaker kbTell [_receiver, _topicSide, format["%1%2", _message, _side], true]
	};
	case (_message in ["MMissionComplete","ExtractionTeam","ExtractionTeamCancel"]): {
		_speaker kbTell [_receiver, _topicSide, _message,["1","",_parameters select 0,[_parameters select 1]],true];
	};
};