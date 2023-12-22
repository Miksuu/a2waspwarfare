// Assign the delegation for the Headless Client.
WFBE_CL_FNC_DelegateAIStaticDefence = Compile preprocessFileLineNumbers "Client\Functions\Client_DelegateAIStaticDefence.sqf";
["DEBUG", "Init_StaticDefenceAIdelegation.sqf: Running the headless client initialization for Static Defences AI"] Call WFBE_CO_FNC_LogContent;

//--- We wait for the server full init (just in case!).
sleep 20;

//--- Notify the server that our headless client is here.
["RequestSpecial", ["connected-hc", player]] Call WFBE_CO_FNC_SendToServer;