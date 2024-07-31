diag_log "CAMERA: specta_init";

// Connect handler for spectating script, check if camera on seagull for first 10 seconds and launch spectating script
for "_i" from 0 to 20 do {
	scopeName "SpectaLoop";
	if(typeof cameraOn == "SeaGull") then {[cameraOn,cameraOn,cameraOn] execVM "Client\Module\spect\specta.sqf";breakOut "SpectaLoop"};
	sleep 0.5;
};