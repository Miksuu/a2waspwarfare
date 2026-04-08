You are a Coding Agent editing originally an ancient, but now modernized fork of a Arma 2 Warfare mission.

When requested to edit the mission file, only edit the [55-2hc]warfarev2_073v48co.chernarus folder in the Missions folder. With our Tools\LoadoutManager program, the changes will be copied to the Missions_Vanilla\[61-2hc]warfarev2_073v48co.takistan folder with the following way:
On each Coding Agent run: cd to Tools\LoadoutManager and do ``dotnet run`` to copy the files over on to Takistan currently.
Possible error cases during the run:
1) the command doesn't successfully complete, stop trying, end the conversation and tell the user to install the dotnet dev framework.
2) 7za variable isn't set. That's okay, but the missions won't be packed for easy server deployment. Ignore.

Be sure to always refer to the official documentation by Bohemia Interactive using the following link: https://community.bistudio.com/wiki/Category:Arma_2:_Operation_Arrowhead:_Scripting_Commands
Since we are developing the mission for Arma TWO (Operation Arrowhead 1.64 EOL), ignore any documentation for Arma THREE.

Useful mission conventions for future feature work:
- Global gameplay hotkeys are wired from `Missions\[55-2hc]warfarev2_073v48co.chernarus\Client\Init\Init_Client.sqf` via `findDisplay 46` `KeyDown` handlers. Keep unrelated features in separate `Common\Functions\Common_*.sqf` files and register each handler there. Gear filler hotkeys are separate in `Client\Init\Init_Keybind.sqf`.
- Player unit purchases for Barracks, Light Factory, Heavy Factory, Aircraft Factory and Hangar all funnel through `Client\GUI\GUI_Menu_BuyUnits.sqf` into `Client\Functions\Client_BuildUnit.sqf`. AI team purchases use `Server\Functions\Server_BuyUnit.sqf`.
- Factory spawn markers in `Client\Functions\Client_BuildUnit.sqf`: Barracks uses nearby `Sr_border`, Light uses `HeliH` but filters out `HeliHCivil` and `HeliHRescue`, Heavy uses `HeliHRescue`, Aircraft uses `HeliHCivil`, and Hangar/Airport uses `WFBE_C_HANGAR_BUY_DISTANCE` plus `WFBE_C_HANGAR_BUY_DIR` fallback logic.
- For waypoint-driven features, check `currentWaypoint _group` against `count (waypoints _group)` before trusting it. The BI docs note that groups start with one completed waypoint by default, so `currentWaypoint` can already point past the last valid index. Use `waypointPosition [_group, index]` only after that validity check.
- If you need to nudge newly spawned AI toward an already active player waypoint without rewriting the group waypoint chain, prefer `doMove` over `move`; BI docs note that `move` ignores the active waypoint.
