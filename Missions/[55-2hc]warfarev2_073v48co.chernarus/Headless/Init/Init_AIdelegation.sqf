// Assign the delegation for the Headless Client.
WFBE_CL_FNC_DelegateAI = Compile preprocessFileLineNumbers "Client\Functions\Client_DelegateAI.sqf";
["DEBUG", "Init_AIdelegation.sqf: Running the headless client initialization for the AI"] Call WFBE_CO_FNC_LogContent;

//--- We wait for the server full init (just in case!).
sleep 20;

//--- Notify the server that our headless client is here.
["RequestSpecial", ["connected-hc", player, "delegateAI"]] Call WFBE_CO_FNC_SendToServer;