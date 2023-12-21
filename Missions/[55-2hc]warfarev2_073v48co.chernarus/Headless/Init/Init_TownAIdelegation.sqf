// Assign the delegation for the Headless Client.
WFBE_CL_FNC_DelegateTownAI = Compile preprocessFileLineNumbers "Client\Functions\Client_DelegateTownAI.sqf";
["DEBUG", "Init_TownAIdelegation.sqf: Running the headless client initialization for Town AI"] Call WFBE_CO_FNC_LogContent;

//--- We wait for the server full init (just in case!).
sleep 20;

//--- Notify the server that our headless client is here.
["RequestSpecial", ["connected-hc", player, "delegateTownAI"]] Call WFBE_CO_FNC_SendToServer;