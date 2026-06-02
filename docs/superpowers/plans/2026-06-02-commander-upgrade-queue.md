# Commander Upgrade Queue Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Let the human commander queue tech upgrades that the server auto-starts as the side can afford them, with the current+next upgrade shown on the HUD and the queue managed in the WF upgrade menu.

**Architecture:** Purely additive. Queue state is a new replicated array `wfbe_upgrade_queue` on the side-logic object. A new server loop (`Server\FSM\upgradeQueue.sqf`) pops the queue head when idle + affordable + prereqs met, deducts server-side, and spawns the **unmodified** `WFBE_SE_FNC_ProcessUpgrade` exactly like the AI-commander path. Two PV handlers (`RequestEnqueue`/`RequestDequeue`) mutate the queue. The WF menu reuses the existing list + footer; the HUD adds two rows below server FPS.

**Tech Stack:** Arma 2 OA SQF + `.hpp` dialog/title configs. No unit-test harness exists for SQF — verification is preprocess-on-pack + dedicated-server `.rpt` error scan + scripted in-game behaviour (see Task 6).

**Spec:** `docs/superpowers/specs/2026-06-02-commander-upgrade-queue-design.md`

**Worktree:** `C:\Users\Steff\a2waspwarfare-upgrade-queue` (branch `feat/upgrade-queue` off `origin/master`). Primary tree authored here: `Missions\[55-2hc]warfarev2_073v48co.chernarus\`. (Mirrored to other trees in Task 7.)

**Verification reality (read first):** Steps that change SQF/HPP cannot be unit-tested. Each code task ends with a **static review checklist** (balanced `{}`/`[]`/`""`, exact variable/function names, no nested-`_x` shadowing) and a commit. The authoritative regression gate is **Task 6** (pack + boot dedicated server + `.rpt` scan + behaviour). Do NOT claim a task "works" before Task 6 — claim only that it is written and statically reviewed.

---

## File Structure

| File | Responsibility | New/Modify |
|---|---|---|
| `Server\Init\Init_Server.sqf` | initialise `wfbe_upgrade_queue` per side; `ExecVM` the driver | Modify (`:369`, `:531` area) |
| `Common\Init\Init_PublicVariables.sqf` | register `RequestEnqueue`/`RequestDequeue` PV channels | Modify (`:21`) |
| `Server\PVFunctions\RequestEnqueue.sqf` | validate + append an upgrade id to the queue | **New** |
| `Server\PVFunctions\RequestDequeue.sqf` | remove an upgrade id from the queue | **New** |
| `Server\FSM\upgradeQueue.sqf` | auto-start driver loop (pop → deduct → start) | **New** |
| `Rsc\Dialogs.hpp` | add the Queue button to `WFBE_UpgradeMenu` | Modify (`:131` area) |
| `Client\GUI\GUI_UpgradeMenu.sqf` | queue/dequeue action, row `[Q#]` tags, footer queue line, button label | Modify |
| `Rsc\Titles.hpp` | 4 new `RscText` rows under server FPS + `controls[]` | Modify (`:173`, `:427`) |
| `Client\Client_UpdateRHUD.sqf` | extend `_rhudIDC`/`_layoutPairs`/positioning; set the 2 upgrade rows each tick | Modify |
| `Server\Functions\Server_ProcessUpgrade.sqf` | **UNCHANGED** — must not appear in `git diff` | — |

---

## Task 1: Queue state + PV registration

**Files:**
- Modify: `Missions\[55-2hc]warfarev2_073v48co.chernarus\Server\Init\Init_Server.sqf:369`
- Modify: `Missions\[55-2hc]warfarev2_073v48co.chernarus\Common\Init\Init_PublicVariables.sqf:21`

- [ ] **Step 1: Initialise the queue on each side logic**

In `Init_Server.sqf`, the per-side block initialises upgrade vars. After line 369 (`_logik setVariable ["wfbe_upgrading_id", -1, true];`) add:

```sqf
		_logik setVariable ["wfbe_upgrade_queue", [], true];
```

(Match the leading tab indentation of the surrounding `_logik setVariable` lines.)

- [ ] **Step 2: Register the two server PV channels**

In `Init_PublicVariables.sqf`, after line 21 (`_l = _l + ["RequestAutoWallConstructinChange"];`) and before line 23 (`_serverCommandPV = _l;`) add:

```sqf
_l = _l + ["RequestEnqueue"];
_l = _l + ["RequestDequeue"];
```

The existing loop at `:48-51` will auto-compile `SRVFNCRequestEnqueue`/`SRVFNCRequestDequeue` from the files created in Task 2 and register their `addPublicVariableEventHandler`s.

- [ ] **Step 3: Static review**

Confirm: the new `Init_Server` line sits inside the `forEach`/per-side block (same indentation as siblings); the two `Init_PublicVariables` lines are before `_serverCommandPV = _l;`. No other lines touched.

- [ ] **Step 4: Commit**

```bash
git add "Missions/[55-2hc]warfarev2_073v48co.chernarus/Server/Init/Init_Server.sqf" "Missions/[55-2hc]warfarev2_073v48co.chernarus/Common/Init/Init_PublicVariables.sqf"
git commit -m "feat(upgrade-queue): init queue state + register enqueue/dequeue PV channels"
```

---

## Task 2: Server enqueue/dequeue PV handlers

**Files:**
- Create: `Missions\[55-2hc]warfarev2_073v48co.chernarus\Server\PVFunctions\RequestEnqueue.sqf`
- Create: `Missions\[55-2hc]warfarev2_073v48co.chernarus\Server\PVFunctions\RequestDequeue.sqf`

These run via `WFBE_SE_FNC_HandlePVF`, which does `_parameters Spawn (Call Compile _script)`, so inside each file `_this` = the payload `[side, upgradeId]`.

- [ ] **Step 1: Write `RequestEnqueue.sqf`**

```sqf
/*
	Add an upgrade to the side's auto-start queue.
	 Parameters: [ side, upgradeId ]
	Server re-validates everything (never trust the client): commander exists,
	upgrade enabled, not maxed, not the running upgrade, not already queued,
	prerequisites currently met.
*/

private ["_side","_id","_logik","_queue","_levels","_enabled","_upgrades","_current","_lnk","_li","_clink","_linkNeeded"];

_side = _this select 0;
_id   = _this select 1;

_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;
if (isNull _logik) exitWith {};

//--- Must have a (human) commander team to own/pay the queue.
if (isNull (_side Call WFBE_CO_FNC_GetCommanderTeam)) exitWith {};

_enabled = missionNamespace getVariable Format["WFBE_C_UPGRADES_%1_ENABLED", str _side];
if (_id < 0 || _id >= count _enabled) exitWith {};
if !(_enabled select _id) exitWith {};

_levels   = missionNamespace getVariable Format["WFBE_C_UPGRADES_%1_LEVELS", str _side];
_upgrades = _side Call WFBE_CO_FNC_GetSideUpgrades;
_current  = _upgrades select _id;

//--- Already at max.
if (_current >= (_levels select _id)) exitWith {};

//--- Currently running this one.
if ((_logik getVariable "wfbe_upgrading") && {(_logik getVariable "wfbe_upgrading_id") == _id}) exitWith {};

_queue = + (_logik getVariable "wfbe_upgrade_queue");
//--- Already queued.
if (_id in _queue) exitWith {};

//--- Prerequisites for the *next* level (same LINKS shape as GUI_UpgradeMenu).
_lnk = (missionNamespace getVariable Format["WFBE_C_UPGRADES_%1_LINKS", str _side]) select _id;
_lnk = _lnk select _current;
_linkNeeded = false;
if (count _lnk > 0) then {
	if (typeName (_lnk select 0) == "ARRAY") then {
		for "_li" from 0 to (count _lnk - 1) do {
			_clink = _lnk select _li;
			if ((_upgrades select (_clink select 0)) < (_clink select 1)) exitWith {_linkNeeded = true};
		};
	} else {
		if ((_upgrades select (_lnk select 0)) < (_lnk select 1)) then {_linkNeeded = true};
	};
};
if (_linkNeeded) exitWith {};

//--- Append and replicate.
_queue = _queue + [_id];
_logik setVariable ["wfbe_upgrade_queue", _queue, true];
```

- [ ] **Step 2: Write `RequestDequeue.sqf`**

```sqf
/*
	Remove an upgrade from the side's auto-start queue.
	 Parameters: [ side, upgradeId ]
*/

private ["_side","_id","_logik","_queue"];

_side = _this select 0;
_id   = _this select 1;

_logik = (_side) Call WFBE_CO_FNC_GetSideLogic;
if (isNull _logik) exitWith {};

_queue = + (_logik getVariable "wfbe_upgrade_queue");
if !(_id in _queue) exitWith {};

//--- Duplicates are forbidden at enqueue, so set-subtraction removes exactly one.
_queue = _queue - [_id];
_logik setVariable ["wfbe_upgrade_queue", _queue, true];
```

- [ ] **Step 3: Static review**

Confirm: balanced `{}`/`[]`/`""`; no nested `forEach` (links use `for "_li"`); function names exact (`WFBE_CO_FNC_GetSideLogic`, `WFBE_CO_FNC_GetCommanderTeam`, `WFBE_CO_FNC_GetSideUpgrades`); `+ (...)` copies the array before mutation; `str _side` used in every `Format` key.

- [ ] **Step 4: Commit**

```bash
git add "Missions/[55-2hc]warfarev2_073v48co.chernarus/Server/PVFunctions/RequestEnqueue.sqf" "Missions/[55-2hc]warfarev2_073v48co.chernarus/Server/PVFunctions/RequestDequeue.sqf"
git commit -m "feat(upgrade-queue): server enqueue/dequeue handlers with full re-validation"
```

---

## Task 3: Auto-start driver

**Files:**
- Create: `Missions\[55-2hc]warfarev2_073v48co.chernarus\Server\FSM\upgradeQueue.sqf`
- Modify: `Missions\[55-2hc]warfarev2_073v48co.chernarus\Server\Init\Init_Server.sqf:531` area

- [ ] **Step 1: Write the driver `Server\FSM\upgradeQueue.sqf`**

```sqf
/*
	Commander upgrade-queue auto-start driver.
	Every few seconds, for each side: if no upgrade is running and the queue head
	is affordable (full price, per currency mode) with its prerequisites met and a
	commander exists, deduct server-side and start it via WFBE_SE_FNC_ProcessUpgrade
	(server-initiated, full-timer path) exactly like the AI commander.
	Server_ProcessUpgrade.sqf is NOT modified.
*/

scriptName "Server\FSM\upgradeQueue.sqf";

private ["_interval","_logik","_queue","_id","_upgrades","_current","_levels","_costs","_cost","_comTeam","_lnk","_li","_clink","_linkNeeded","_canStart","_dual"];

_interval = 5;
_dual = (missionNamespace getVariable "WFBE_C_ECONOMY_CURRENCY_SYSTEM") == 0;

while {!gameOver} do {
	{
		_logik = (_x) Call WFBE_CO_FNC_GetSideLogic;
		if (!isNull _logik && {!(_logik getVariable "wfbe_upgrading")}) then {
			_queue = + (_logik getVariable "wfbe_upgrade_queue");
			if (count _queue > 0) then {
				_id = _queue select 0;
				_upgrades = (_x) Call WFBE_CO_FNC_GetSideUpgrades;
				_current = _upgrades select _id;
				_levels = missionNamespace getVariable Format["WFBE_C_UPGRADES_%1_LEVELS", str _x];

				if (_current >= (_levels select _id)) then {
					//--- Stale/maxed head: drop it and move on next tick.
					_queue = _queue - [_id];
					_logik setVariable ["wfbe_upgrade_queue", _queue, true];
				} else {
					_comTeam = (_x) Call WFBE_CO_FNC_GetCommanderTeam;
					if (!isNull _comTeam) then {
						_costs = missionNamespace getVariable Format["WFBE_C_UPGRADES_%1_COSTS", str _x];
						_cost = (_costs select _id) select _current;   // [supply, funds]

						_canStart = true;
						if (_dual && {((_x) Call WFBE_CO_FNC_GetSideSupply) < (_cost select 0)}) then {_canStart = false};
						if (_canStart && {(_comTeam Call WFBE_CO_FNC_GetTeamFunds) < (_cost select 1)}) then {_canStart = false};

						//--- Prerequisites for this level (for-loop, NOT a nested forEach — _x is the side).
						if (_canStart) then {
							_lnk = (missionNamespace getVariable Format["WFBE_C_UPGRADES_%1_LINKS", str _x]) select _id;
							_lnk = _lnk select _current;
							_linkNeeded = false;
							if (count _lnk > 0) then {
								if (typeName (_lnk select 0) == "ARRAY") then {
									for "_li" from 0 to (count _lnk - 1) do {
										_clink = _lnk select _li;
										if ((_upgrades select (_clink select 0)) < (_clink select 1)) exitWith {_linkNeeded = true};
									};
								} else {
									if ((_upgrades select (_lnk select 0)) < (_lnk select 1)) then {_linkNeeded = true};
								};
							};
							if (_linkNeeded) then {_canStart = false};
						};

						if (_canStart) then {
							//--- Pop head + replicate.
							_queue = _queue - [_id];
							_logik setVariable ["wfbe_upgrade_queue", _queue, true];
							//--- Gate synchronously so the next tick can't double-start (mirrors Server_AI_Com_Upgrade.sqf:43-44).
							_logik setVariable ["wfbe_upgrading", true, true];
							_logik setVariable ["wfbe_upgrading_id", _id, true];
							//--- Deduct (correct indices: cost = [supply, funds]). Result is >=0 because we checked affordability.
							if (_dual) then {
								[_x, -(_cost select 0), "Queued tech upgrade.", false] Call ChangeSideSupply;
							};
							[_comTeam, -(_cost select 1)] Call WFBE_CO_FNC_ChangeTeamFunds;
							//--- Start (server-initiated => full-timer path, like the AI commander).
							[_x, _id, _current, false] Spawn WFBE_SE_FNC_ProcessUpgrade;
							["INFORMATION", Format ["upgradeQueue.sqf: [%1] auto-started queued upgrade [%2] to level [%3].", _x, _id, _current + 1]] Call WFBE_CO_FNC_LogContent;
						};
					};
				};
			};
		};
	} forEach WFBE_PRESENTSIDES;

	sleep _interval;
};
```

- [ ] **Step 2: Spawn the driver from `Init_Server.sqf`**

Find the FSM-loop block around line 531 (`[] ExecVM "Server\FSM\updateresources.sqf";`). Immediately after that line add:

```sqf
[] ExecVM "Server\FSM\upgradeQueue.sqf";
```

- [ ] **Step 3: Static review**

Critical checks:
- The links check uses `for "_li"`, **never** a nested `forEach` (the outer `_x` is the side — a nested `forEach` would clobber it).
- `_cost select 0` → `ChangeSideSupply`; `_cost select 1` → `ChangeTeamFunds` (this is the CORRECT order; the AI path at `Server_AI_Com_Upgrade.sqf:47-51` has these swapped — do NOT copy that).
- Gate is set (`wfbe_upgrading`/`wfbe_upgrading_id`) before `Spawn`.
- `ProcessUpgrade` invoked with `_upgrade_isplayer = false`.
- Balanced braces; `str _x` in every Format key.

- [ ] **Step 4: Commit**

```bash
git add "Missions/[55-2hc]warfarev2_073v48co.chernarus/Server/FSM/upgradeQueue.sqf" "Missions/[55-2hc]warfarev2_073v48co.chernarus/Server/Init/Init_Server.sqf"
git commit -m "feat(upgrade-queue): server auto-start driver (pop/deduct/start like AI path)"
```

---

## Task 4: WF menu — Queue button, row tags, footer

**Files:**
- Modify: `Missions\[55-2hc]warfarev2_073v48co.chernarus\Rsc\Dialogs.hpp:131` (inside `WFBE_UpgradeMenu`)
- Modify: `Missions\[55-2hc]warfarev2_073v48co.chernarus\Client\GUI\GUI_UpgradeMenu.sqf`

- [ ] **Step 1: Add the Queue button to the dialog**

In `Dialogs.hpp`, inside `class WFBE_UpgradeMenu`, the Upgrade button is `class CA_Upgrade` (idc 504007) at `:122-131`. Immediately after its closing `};` (line 131) add a sibling button:

```cpp
		class CA_QueueUpgrade : RscButton_Main {
			idc = 504008;
			x = 0.385;
			y = 0.762;
			w = 0.2;
			h = 0.035;
			sizeEx = 0.035;
			text = "Queue";
			action = "WFBE_MenuAction = 3";
		};
```

(The Upgrade button is at `x = 0.595`; this places Queue just to its left at `x = 0.385`, same `y`/`w`/`h`.)

- [ ] **Step 2: Add the queue-toggle flag + commander gate in `GUI_UpgradeMenu.sqf`**

Near the other flag initialisers (`:33-37`, where `_purchase = false;` is declared) add:

```sqf
_queue_toggle = false;
_queue_old = [];
```

After line 41 (`if !(_player_commander) then {ctrlEnable [504007, false]};`) add:

```sqf
if !(_player_commander) then {ctrlEnable [504008, false]};
```

- [ ] **Step 3: Route the Queue action in the main loop**

At the top of the `while {alive player && dialog}` loop, next to the existing `if (WFBE_MenuAction == 1)` / `== 2` lines (`:113-114`) add:

```sqf
	if (WFBE_MenuAction == 3) then {WFBE_MenuAction = -1; if (_player_commander) then {_queue_toggle = true}};
```

- [ ] **Step 4: Handle the toggle (enqueue/dequeue)**

After the existing purchase block (it ends at `:262` with `};` closing the `if (_purchase)` block), add:

```sqf
		if (_queue_toggle) then {
			_queue_toggle = false;
			_ui_lnb_sel = lnbCurSelRow(504001);
			if (_ui_lnb_sel != -1) then {
				_id = lnbValue[504001, [_ui_lnb_sel, 0]];
				_queue = WFBE_Client_Logic getVariable "wfbe_upgrade_queue";
				if (isNil "_queue") then {_queue = []};
				if (_id in _queue) then {
					["RequestDequeue", [WFBE_Client_SideJoined, _id]] call WFBE_CO_FNC_SendToServer;
				} else {
					_upgrade_current = _upgrades select _id;
					if (_upgrade_current < (_upgrade_levels select _id) && {(WFBE_Client_Logic getVariable "wfbe_upgrading_id") != _id}) then {
						["RequestEnqueue", [WFBE_Client_SideJoined, _id]] call WFBE_CO_FNC_SendToServer;
						hint parseText(Format["<t color='#42b6ff' size='1.2' underline='1' shadow='1'>Information:</t><br /><br /><t>Queued <t color='#B6F563'>%1</t></t>", _upgrade_labels select _id]);
					};
				};
			};
		};
```

(Server re-validates; the client check is just to avoid obviously-pointless requests.)

- [ ] **Step 5: Tag queued rows + update the Queue button label**

The list repaint currently runs only when an upgrade *level* changes (`_update_list`, `:122-137`). Make it also run when the *queue* changes, and append a `[Q#]` tag. Replace the change-detection block at `:118-138` — locate:

```sqf
		if (time - _update_upgrade_lastcheck > 0.5) then {
			_update_list = false;
			_update_upgrade_lastcheck = time;
			for '_i' from 0 to count(_upgrades_old)-1 do {if ((_upgrades_old select _i) != (_upgrades select _i)) exitWith {_update_list = true}};
```

and change the condition so a queue change also forces a repaint by inserting, immediately after the `for '_i' ... _update_list = true}};` line:

```sqf
			_queue_now = WFBE_Client_Logic getVariable "wfbe_upgrade_queue";
			if (isNil "_queue_now") then {_queue_now = []};
			if !(_queue_now isEqualTo _queue_old) then {_update_list = true; _queue_old = + _queue_now};
```

Then, inside the `if (_update_list)` body, the existing row-text loop (`:127-132`) builds `Format ["%1/%2", level, max]`. Replace that inner `forEach` with a tag-aware version:

```sqf
				_i = 0;
				{
					if (_upgrade_enabled select _x) then {
						_qpos = _queue_old find _x;
						_qtag = if (_qpos >= 0) then {Format [" [Q%1]", _qpos + 1]} else {""};
						lnbSetText[504001, [_i, 0], Format ["%1/%2%3",_upgrades select _x,_upgrade_levels select _x,_qtag]];
						_i = _i + 1;
					};
				} forEach _upgrade_sorted;
```

Add `_queue_now`, `_qpos`, `_qtag` to the script's variable usage (they are implicit locals in SQF; no `private` declaration is required here as the file does not pre-declare its locals).

For the Queue button label, in the selection-change block (`_update_upgrade`, `:140-150`), after the existing `ctrlSetText[504002, ...]` line add:

```sqf
				_qsel = WFBE_Client_Logic getVariable "wfbe_upgrade_queue";
				if (isNil "_qsel") then {_qsel = []};
				ctrlSetText[504008, if (_id in _qsel) then {"Dequeue"} else {"Queue"}];
```

- [ ] **Step 6: Add the queue line to the footer**

The footer status (`504006`) is written in two places: the countdown spawn (`:101`/`:104`) and the running-state block (`:271-272`). Extend **only** the running-state block (`:264-273`) so it appends the queue. Locate:

```sqf
			_html = if (_upgrade_isupgrading) then {Format["<t><t color='#B6F563'>%1</t> is currently running</t>", _running_label]} else {""};
			((uiNamespace getVariable "wfbe_display_upgrades") displayCtrl 504006) ctrlSetStructuredText (parseText _html);
```

and replace with:

```sqf
			_qlist = WFBE_Client_Logic getVariable "wfbe_upgrade_queue";
			if (isNil "_qlist") then {_qlist = []};
			_qnames = "";
			{
				_qnames = _qnames + (if (_qnames == "") then {""} else {", "}) + (_upgrade_labels select _x);
			} forEach _qlist;
			_html = if (_upgrade_isupgrading) then {Format["<t><t color='#B6F563'>%1</t> is currently running</t>", _running_label]} else {""};
			if (count _qlist > 0) then {_html = _html + Format["<br /><t>Queued: <t color='#F5D363'>%1</t></t>", _qnames]};
			((uiNamespace getVariable "wfbe_display_upgrades") displayCtrl 504006) ctrlSetStructuredText (parseText _html);
```

Also widen the footer refresh trigger: this block only fires on running-state/id change (`:267`). Add the queue to that trigger by changing the `if (... ) then {` condition at `:267` to also fire when `_queue_old` changed this iteration. Since Step 5 already maintains `_queue_old`, add a tracking var `_queue_footer_old` near the flags (Step 2) initialised to `[]`, and OR the condition with `!(_qlist isEqualTo _queue_footer_old)`, setting `_queue_footer_old = + _qlist` inside the block. (The executing engineer: read `:264-273` in full, add the OR-term to the existing `if` condition, and assign `_queue_footer_old` inside.)

Note on the nested `forEach _qlist` above: it is safe — there is no enclosing `forEach` in this part of `GUI_UpgradeMenu.sqf` (the menu uses a `while` loop, not `forEach`), so `_x` is free to bind to the queue element here.

- [ ] **Step 7: Static review**

Confirm: button idc `504008` unique in `WFBE_UpgradeMenu`; `WFBE_MenuAction == 3` handled and reset; enqueue/dequeue use `WFBE_CO_FNC_SendToServer` with `[WFBE_Client_SideJoined, _id]`; `isEqualTo` used for array compare (available in A2 OA — already used elsewhere in the codebase? if unsure, replace with a length+element compare; verify during Task 6); row-tag loop preserves the `_i` counter exactly as the original; button-label line references `504008`.

- [ ] **Step 8: Commit**

```bash
git add "Missions/[55-2hc]warfarev2_073v48co.chernarus/Rsc/Dialogs.hpp" "Missions/[55-2hc]warfarev2_073v48co.chernarus/Client/GUI/GUI_UpgradeMenu.sqf"
git commit -m "feat(upgrade-queue): WF menu queue button, row tags, footer queue line"
```

> **Note for executor:** `isEqualTo` exists in Arma 2 OA 1.62+ but if the `.rpt` in Task 6 reports it as undefined, replace the two `isEqualTo` comparisons with a helper compare: equal iff `count a == count b` and `{(a select _k) != (b select _k)} count [0..] == 0`. Flag this at Task 6.

---

## Task 5: HUD — current + next under server FPS

**Files:**
- Modify: `Missions\[55-2hc]warfarev2_073v48co.chernarus\Rsc\Titles.hpp:173` and `:427`
- Modify: `Missions\[55-2hc]warfarev2_073v48co.chernarus\Client\Client_UpdateRHUD.sqf`

The RHUD uses label/value **pairs** addressed by index into `_rhudIDC`. Server FPS is the last pair (indices 21/22 → IDC 1366/1367). We add two pairs: **Upgrade** (indices 23/24 → IDC 1368/1369) and **Next** (indices 25/26 → IDC 1370/1371).

- [ ] **Step 1: Define the 4 new title controls**

In `Titles.hpp`, after `class RUBHUD_FPS_Server_Value` (ends at `:427` with `};`) and before the `//Original` comment (`:429`) add:

```cpp
		class RUBHUD_Upgrade: RscText {
			idc = 1368;
			text = "";
			x = 0.881728 * safezoneW + safezoneX;
			y = 0.406000 * safezoneH + safezoneY;
			w = 0.1025 * safezoneW;
			h = 0.0255556 * safezoneH;
			sizeEx = 0.026;
			colorText[] = {1,1,1,1};
		}

		class RUBHUD_Upgrade_Value: RscText {
			idc = 1369;
			text = "";
			x = 0.925958 * safezoneW + safezoneX;
			y = 0.406000 * safezoneH + safezoneY;
			w = 0.4401041 * safezoneW;
			h = 0.0255556 * safezoneH;
			sizeEx = 0.028;
			colorText[] = {1,1,1,1};
		}

		class RUBHUD_UpgradeNext: RscText {
			idc = 1370;
			text = "";
			x = 0.881728 * safezoneW + safezoneX;
			y = 0.426000 * safezoneH + safezoneY;
			w = 0.1025 * safezoneW;
			h = 0.0255556 * safezoneH;
			sizeEx = 0.026;
			colorText[] = {1,1,1,1};
		}

		class RUBHUD_UpgradeNext_Value: RscText {
			idc = 1371;
			text = "";
			x = 0.925958 * safezoneW + safezoneX;
			y = 0.426000 * safezoneH + safezoneY;
			w = 0.4401041 * safezoneW;
			h = 0.0255556 * safezoneH;
			sizeEx = 0.028;
			colorText[] = {1,1,1,1};
		}
```

- [ ] **Step 2: Register them in `controls[]`**

In the `controls[] = { ... }` array (the block at `:172-173` ending with `"RUBHUD_FPS_Server","RUBHUD_FPS_Server_Value",`), append the four class names so the array contains:

```cpp
		"RUBHUD_FPS_Client","RUBHUD_FPS_Client_Value","RUBHUD_FPS_Server","RUBHUD_FPS_Server_Value","RUBHUD_Upgrade","RUBHUD_Upgrade_Value","RUBHUD_UpgradeNext","RUBHUD_UpgradeNext_Value"};
```

(Read the exact current end of the array and add the 4 names before the closing `};`.)

- [ ] **Step 3: Extend `_rhudIDC` and declare HUD-upgrade state**

In `Client_UpdateRHUD.sqf:26`, append the four IDCs:

```sqf
_rhudIDC = [1345,1346,1347,1348,1349,1350,1351,1352,1353,1354,1355,1356,1357,1358,1359,1360,1361,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371];
```

In the top `private[...]` declaration (the block spanning `:13-19`) add the names `"_RHUDUpdateUpgrade", "_RHUD_upgId", "_RHUD_upgEnd"`. Then, just before the main `while {true} do {` loop (after the helper-function definitions, near `:180`), initialise:

```sqf
_RHUD_upgId = -1;
_RHUD_upgEnd = 0;
```

- [ ] **Step 4: Add the upgrade-row updater function**

After the `_RHUDUpdateFPS` definition (ends `:126`) add a sibling function:

```sqf
_RHUDUpdateUpgrade = {
	private ["_up","_id","_labels","_times","_lbl","_lvl","_dur","_remain","_mm","_ss","_txt","_queue","_upgrades"];
	_labels = missionNamespace getVariable "WFBE_C_UPGRADES_LABELS";
	if (isNil "_labels") exitWith {};

	_up = WFBE_Client_Logic getVariable "wfbe_upgrading";
	if (isNil "_up") then {_up = false};
	_id = WFBE_Client_Logic getVariable "wfbe_upgrading_id";
	if (isNil "_id") then {_id = -1};

	//--- Current (indices 23/24).
	if (_up && _id >= 0 && _id < count _labels) then {
		_lbl = _labels select _id;
		if (_RHUD_upgId != _id) then {
			_times = missionNamespace getVariable Format["WFBE_C_UPGRADES_%1_TIMES", WFBE_Client_SideJoinedText];
			_upgrades = (WFBE_Client_SideJoined) call WFBE_CO_FNC_GetSideUpgrades;
			_lvl = _upgrades select _id;
			_dur = 0;
			if (_lvl < count (_times select _id)) then {_dur = (_times select _id) select _lvl};
			_RHUD_upgId = _id;
			_RHUD_upgEnd = time + _dur;
		};
		_remain = ceil (_RHUD_upgEnd - time);
		if (_remain < 0) then {_remain = 0};
		_mm = floor (_remain / 60);
		_ss = _remain - (_mm * 60);
		_txt = if (_ss < 10) then {Format["%1 %2:0%3", _lbl, _mm, _ss]} else {Format["%1 %2:%3", _lbl, _mm, _ss]};
		[23, "Upgrade:"] call _RHUDSetText;
		[24, _txt] call _RHUDSetText;
	} else {
		_RHUD_upgId = -1;
		[23, ""] call _RHUDSetText;
		[24, ""] call _RHUDSetText;
	};

	//--- Next (indices 25/26).
	_queue = WFBE_Client_Logic getVariable "wfbe_upgrade_queue";
	if (isNil "_queue") then {_queue = []};
	if (count _queue > 0 && {(_queue select 0) < count _labels}) then {
		[25, "Next:"] call _RHUDSetText;
		[26, _labels select (_queue select 0)] call _RHUDSetText;
	} else {
		[25, ""] call _RHUDSetText;
		[26, ""] call _RHUDSetText;
	};
};
```

- [ ] **Step 5: Position the new rows (full + fps modes)**

In `_RHUDSetFullPosition`, extend `_layoutPairs` (`:169`) to:

```sqf
	_layoutPairs = [[1,2],[3,4],[5,6],[7,8],[9,10],[11,12],[13,14],[15,16],[17,18],[19,20],[21,22],[23,24],[25,26]];
```

In `_RHUDSetFPSPosition`, after the four `(_controls select 19..22) ctrlSetPosition ...` lines in the mini branch (`:149-152`) add two more rows and widen their value column (upgrade names are longer than FPS numbers):

```sqf
	(_controls select 23) ctrlSetPosition [_labelX, safezoneY + (0.22626 * safezoneH), _labelW, _lineH];
	(_controls select 24) ctrlSetPosition [_valueX - (0.090 * safezoneW), safezoneY + (0.22626 * safezoneH), 0.140 * safezoneW, _lineH];
	(_controls select 25) ctrlSetPosition [_labelX, safezoneY + (0.24626 * safezoneH), _labelW, _lineH];
	(_controls select 26) ctrlSetPosition [_valueX - (0.090 * safezoneW), safezoneY + (0.24626 * safezoneH), 0.140 * safezoneW, _lineH];
	{_x ctrlCommit 0} forEach [(_controls select 23), (_controls select 24), (_controls select 25), (_controls select 26)];
```

(`_RHUDSetFullPosition` commits all controls via its trailing `forEach _controls`, so no extra commit is needed there.)

- [ ] **Step 6: Call the updater in both HUD modes**

In the `"fps"` mode case, after the line `["Client:", "Server:", true] call _RHUDUpdateFPS;` (`:237`) add:

```sqf
				call _RHUDUpdateUpgrade;
```

In the `"full"` mode case, after the line `["FPS Client:", "FPS Server:", false] call _RHUDUpdateFPS;` (`:362`) add:

```sqf
			call _RHUDUpdateUpgrade;
```

- [ ] **Step 7: Static review**

Confirm: `_rhudIDC` has 27 entries (indices 0–26); `_layoutPairs` has 13 pairs; `_RHUDUpdateUpgrade` references only indices 23–26; `_RHUD_upgId`/`_RHUD_upgEnd` are declared in the top `private` and initialised before the loop; the function is `call`-ed (shares the local scope so `_RHUDSetText` is visible, same as `_RHUDUpdateFPS`); `controls[]` has exactly 4 new names matching the 4 new classes; new title IDCs 1368–1371 are unique.

- [ ] **Step 8: Commit**

```bash
git add "Missions/[55-2hc]warfarev2_073v48co.chernarus/Rsc/Titles.hpp" "Missions/[55-2hc]warfarev2_073v48co.chernarus/Client/Client_UpdateRHUD.sqf"
git commit -m "feat(upgrade-queue): HUD current+next upgrade rows under server FPS"
```

---

## Task 6: Integration verification (the real test)

**This is the authoritative regression gate.** Nothing before this is "verified" — only written + statically reviewed.

- [ ] **Step 1: Confirm isolation (no forbidden changes)**

```bash
git -C "C:/Users/Steff/a2waspwarfare-upgrade-queue" diff --name-only origin/master
```
Expected: only the 9 files in the File Structure table. `Server_ProcessUpgrade.sqf` and `Server_AI_Com_Upgrade.sqf` must NOT appear. The `feat/supply-helicopter` worktree must be untouched (check `git -C "C:/Users/Steff/a2waspwarfare" status -sb`).

- [ ] **Step 2: Pack the PBO**

Locate and run the packer (per project memory: `pack_pbo.py`). Find it:
```bash
ls "C:/Users/Steff/a2waspwarfare-upgrade-queue/Tools" 2>/dev/null; find "C:/Users/Steff/a2waspwarfare-upgrade-queue" -name "pack_pbo.py" -maxdepth 3
```
Run it against the primary mission folder. Expected: PBO builds with **no preprocessor/config errors**. A `.hpp` brace mismatch or bad `class` will fail here — fix before proceeding.

- [ ] **Step 3: Boot the dedicated server and scan the RPT**

Launch the local Arma 2 OA dedicated server with the packed mission (the WASP test rig). Let it reach mission init. Then scan the newest server `.rpt`:
```bash
# adjust path to the active server profile RPT
ls -t "$USERPROFILE"/AppData/Local/ArmA*OA/*.rpt 2>/dev/null | head -1
```
Grep the RPT for errors referencing the new files / symbols:
```
Error, Undefined variable, "upgradeQueue", "RequestEnqueue", "RequestDequeue", "wfbe_upgrade_queue", "_RHUDUpdateUpgrade", "504008", 1368
```
Expected: **zero** script errors. Specifically verify the `Init_PublicVariables` log line reports the increased server-PV count, and no "Undefined function SRVFNCRequestEnqueue".

- [ ] **Step 4: Behavioural checks (test rig, with a commander)**

Become/assign a commander, then verify:
1. Open the upgrade menu → the **Queue** button shows; selecting a queued upgrade flips it to **Dequeue**.
2. Queue an upgrade you can't yet afford → it appears as `[Q1]` in the list and in the footer `Queued: ...`; nothing is deducted yet.
3. Let town supply income accrue → when affordable, it **auto-starts** (HUD `Upgrade: <name> m:ss`, `wfbe_upgrading` true), and SV + commander funds drop at that moment.
4. Queue a second item → on completion of the first, the second promotes within ~5 s.
5. Dequeue a pending item → it disappears from list/footer; no resource change.
6. **Manual Upgrade button still behaves exactly as before** (instant when idle + affordable; "already running" hint otherwise).
7. HUD shows `Next: <name>` for the head of the queue; both lines blank when idle + empty.
8. (If `isEqualTo` errored in the RPT) apply the Task 4 fallback compare and re-test.

- [ ] **Step 5: Record results + commit any fixes**

Note pass/fail per check in the JOURNAL. Commit any fixes with `fix(upgrade-queue): ...`. Do not proceed to Task 7 until checks 1–7 pass and the RPT is clean.

---

## Task 7: Mirror to the other mission trees

**Files:** the same logical changes, applied to each additional tree present on `master`.

- [ ] **Step 1: Enumerate the trees**

```bash
ls -d "C:/Users/Steff/a2waspwarfare-upgrade-queue"/Missions_Vanilla/* "C:/Users/Steff/a2waspwarfare-upgrade-queue"/Modded_Missions/* 2>/dev/null
```
Expected primary mirror: `Missions_Vanilla\[61-2hc]warfarev2_073v48co.takistan\`. Confirm whether `Modded_Missions` contains full mission trees needing the change or only overlays.

- [ ] **Step 2: Apply the identical changes per tree**

For each tree, repeat Tasks 1–5. The new files (`RequestEnqueue.sqf`, `RequestDequeue.sqf`, `Server\FSM\upgradeQueue.sqf`) copy verbatim; the edits to `Init_Server.sqf`, `Init_PublicVariables.sqf`, `Dialogs.hpp`, `GUI_UpgradeMenu.sqf`, `Titles.hpp`, `Client_UpdateRHUD.sqf` apply at the equivalent anchors (verify each tree's line numbers — they differ; re-read before editing). Watch for per-tree divergences (e.g. vanilla vs CO upgrade configs) before assuming the anchors match.

- [ ] **Step 3: Re-pack + boot each mirrored tree** (repeat Task 6 Steps 2–4 per tree, at least an RPT-clean init).

- [ ] **Step 4: Commit per tree**

```bash
git add -A && git commit -m "feat(upgrade-queue): mirror queue feature to <tree name>"
```

---

## Task 8: Push + open PR

- [ ] **Step 1: Final isolation + diff review**

```bash
git -C "C:/Users/Steff/a2waspwarfare-upgrade-queue" diff origin/master --stat
```
Confirm only the intended files across the intended trees; `Server_ProcessUpgrade.sqf` and the AI path unchanged.

- [ ] **Step 2: Push the branch**

```bash
git -C "C:/Users/Steff/a2waspwarfare-upgrade-queue" push -u origin feat/upgrade-queue
```

- [ ] **Step 3: Open the PR** (base `master`)

```bash
gh pr create --repo rayswaynl/a2waspwarfare --base master --head feat/upgrade-queue --title "Commander upgrade queue (auto-start + HUD + WF-menu management)" --body "<summary from the spec: behaviour, server-authoritative queue, HUD, known v1 prereq limit, BattlEye-safe, ProcessUpgrade untouched; link the spec; note verification done on the local dedicated-server test rig>"
```

- [ ] **Step 4: Report the PR URL** to the user.

---

## Self-Review (run before execution)

**Spec coverage:**
- Queue state + auto-start → Tasks 1–3 ✓
- Full-price gate, deduct-on-start, server-side, correct indices → Task 3 ✓
- Enqueue/dequeue + re-validation + prereq check → Task 2 ✓
- WF menu (button, tags, footer, per-item cancel via toggle) → Task 4 ✓
- HUD current + next → Task 5 ✓
- BattlEye: no edits (confirmed in spec §9.6); nothing in the plan touches `BattlEyeFilter/` ✓
- `Server_ProcessUpgrade.sqf` unchanged → enforced in Task 6 Step 1 + Task 8 Step 1 ✓
- Mirrored trees → Task 7 ✓
- Out of scope (leaderboard, reorder, stacking) → not present ✓

**Placeholder scan:** All code blocks are concrete. The two soft spots are explicitly flagged, not hidden: (a) `isEqualTo` availability — fallback given in Task 4 note + Task 6 Step 4.8; (b) exact `controls[]`/footer-condition insertion points — "read current block then add" with the exact code to add. These are read-then-insert, not TBDs.

**Type/name consistency:** Variable `_logik` (not `_logic`) used throughout to match the codebase. Function names verified against real files: `WFBE_CO_FNC_GetSideLogic`, `WFBE_CO_FNC_GetCommanderTeam`, `WFBE_CO_FNC_GetSideUpgrades`, `WFBE_CO_FNC_GetSideSupply`, `WFBE_CO_FNC_GetTeamFunds`, `WFBE_CO_FNC_ChangeTeamFunds`, `ChangeSideSupply`, `WFBE_SE_FNC_ProcessUpgrade`, `WFBE_CO_FNC_SendToServer`, `WFBE_CO_FNC_LogContent`. Index scheme consistent: IDCs 1368–1371 ↔ `_rhudIDC` indices 23–26 ↔ `_layoutPairs` `[23,24],[25,26]` ↔ `_RHUDUpdateUpgrade` indices 23–26. Dialog button idc `504008` used consistently in Dialogs.hpp + the action route (`WFBE_MenuAction == 3`) + the label setter.
