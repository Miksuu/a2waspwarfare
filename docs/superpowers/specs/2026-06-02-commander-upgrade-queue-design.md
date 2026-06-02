# Commander Upgrade Queue — Design Spec

- **Date:** 2026-06-02
- **Branch:** `feat/upgrade-queue` (worktree off `origin/master`)
- **Status:** Approved design, pre-implementation
- **Author:** rayswaynl (with Claude)

## 1. Context & motivation

Community feature request (Discord, Arma Warfare guild):

> **Miksuu:** "Let us queue upgrades, and they automatically start once there is enough SV. And maybe add current upgrade + upcoming ones below the server FPS on the HUD."
> **Marty:** "Just the current one would be enough."
> **Cristiano:** "It can be hidden in wf menu but I like to know what comm will upgrade next."

Today the commander can only run **one upgrade at a time**. The hard gate is the single boolean `wfbe_upgrading` on the side-logic object; there is no queue. A commander who wants to chain upgrades must babysit the menu, wait for supply, and click each one manually as the economy allows.

This feature lets the commander **queue upgrades that auto-start** as the side's supply income accrues, surfaces the current (and next) upgrade on the **HUD**, and exposes the queue in the **WF upgrade menu**.

## 2. Goals / non-goals

**Goals**
- Commander can queue upgrades; the server auto-starts the front item when the side can afford its full price and no upgrade is running.
- The queue is visible and manageable in the WF upgrade menu (add / cancel per item).
- HUD shows the current upgrade and the next queued one, below server FPS.
- Zero regression to the existing manual-upgrade flow.

**Non-goals (explicitly out of scope)**
- **Leaderboard / miksuu.com feed** — handled separately by the user in another effort.
- **Reordering** the queue (move up/down).
- **Stacking multiple levels of the same upgrade** in one queue (e.g. Barracks ×3 to max in a single queue).
- Touching the AI-commander upgrade path.

## 3. Key decisions (settled during brainstorming)

| Decision | Choice |
|---|---|
| Auto-start gate | **Full price** — wait until the side can afford both SV *and* commander funds, per the server currency mode (identical to a manual upgrade). |
| Spend timing | **Deduct at start** (server-side). Nothing reserved at queue time; cancelling costs/refunds nothing. |
| Queue model | **Simple FIFO list** of distinct upgrade IDs. No reorder, no stacking levels of the same upgrade. |
| Queue display | **Reuse** the existing upgrade list (tag queued rows) + existing footer text. No new listbox/panel. |
| Add/cancel UI | A **dedicated Queue/Dequeue button** (per-item, context-aware label) next to the existing Upgrade button. |
| HUD | **Current + next**, two lines below server FPS. |
| Ownership | Queue is **side-state** (on the side-logic object), so it survives commander death/resign/handover. |

## 4. Architecture overview

The queue is **purely additive**. The only existing file whose *logic* changes is `GUI_UpgradeMenu.sqf` (to add the Queue button + display), plus small additive edits to `Init_Server.sqf` (init + spawn driver), `Dialogs.hpp` (one button), `Titles.hpp` (two HUD rows) and `Client_UpdateRHUD.sqf` (two HUD lines). **`Server_ProcessUpgrade.sqf` is not modified.**

```
Commander (WF menu)
   │  Queue button → "RequestEnqueue" ──┐
   │  Dequeue       → "RequestDequeue" ──┤  (client → server PV)
   ▼                                     ▼
WFBE_L_<side> getVariable "wfbe_upgrade_queue"   ← new broadcast array on side logic
   ▲                                     │
   │   (read for display)                │  (read by driver)
   │                                     ▼
WF menu list tags + footer        Server\FSM\upgradeQueue.sqf  (new ~5s loop)
HUD lines (current + next)          • idle?  no upgrade running (wfbe_upgrading == false)
                                    • affordable?  side SV ≥ cost[0]  AND commander funds ≥ cost[1]
                                    • prereqs met?  (LINKS check)
                                    • commander exists?
                                       └─ yes → pop head, deduct SV + commander funds,
                                                Spawn WFBE_SE_FNC_ProcessUpgrade  (UNCHANGED)
```

## 5. Detailed design

### 5.1 Data model

**Terminology note (per wiki cross-check).** The wiki uses "SV" to mean a *per-town* `supplyValue`. The resource upgrades actually cost — and that this feature gates on — is the **side supply pool** `wfbe_supply_<side>` (the wiki calls this "side supply"). Miksuu's request ("auto-start once there is enough SV") maps to the **side supply pool**, which is exactly what the upgrade affordability check already uses (`GUI_UpgradeMenu.sqf:208`, via `WFBE_CO_FNC_GetSideSupply`). This spec uses "side supply" for precision; "SV" in the original request = side supply.

New variable on each side-logic object (`WFBE_L_BLU` / `WFBE_L_OPF` / `WFBE_L_GUE`), broadcast:

- `wfbe_upgrade_queue` — `Array` of upgrade IDs (integers 0–21), front = next to start. Example `[2, 3, 1]`.

Initialised alongside the existing upgrade vars in `Server\Init\Init_Server.sqf` (the per-side block that already sets `wfbe_upgrades` / `wfbe_upgrading` / `wfbe_upgrading_id` at ~lines 366–369):

```sqf
_logik setVariable ["wfbe_upgrade_queue", [], true];
```

No new config (`Common\Config\Core_Upgrades\*`) is required — the queue is runtime state, not config. Existing `wfbe_upgrading` / `wfbe_upgrading_id` are reused as-is.

### 5.2 Server — the auto-start driver (new file)

`Server\FSM\upgradeQueue.sqf`, spawned once from `Init_Server.sqf` next to the other FSM loops (~line 531, beside `updateresources.sqf`):

```sqf
[] ExecVM "Server\FSM\upgradeQueue.sqf";
```

Loop (≈ every 5 s, FPS-aware via `GetSleepFPS`, `while {!gameOver}`), for each side in `WFBE_PRESENTSIDES`:

1. `_logik = _side Call WFBE_CO_FNC_GetSideLogic;`
2. If `_logik getVariable "wfbe_upgrading"` → skip (an upgrade is running).
3. `_queue = _logik getVariable "wfbe_upgrade_queue";` if empty → skip.
4. `_id = _queue select 0;` (front item)
5. `_current = (_side Call WFBE_CO_FNC_GetSideUpgrades) select _id;`
6. If `_current >= levels[_id]` (already maxed) → pop the head and continue (drop stale entry).
7. `_cost = (WFBE_C_UPGRADES_<side>_COSTS[_id])[_current];` → `[supplyCost, fundsCost]`.
8. Resolve the commander team: `_comTeam = _side Call WFBE_CO_FNC_GetCommanderTeam;` if `isNull _comTeam` → skip (no commander to pay; wait).
9. Affordability:
   - supply: when `WFBE_C_ECONOMY_CURRENCY_SYSTEM == 0`, require `(_side Call WFBE_CO_FNC_GetSideSupply) >= (_cost select 0)`.
   - funds: require `(_comTeam Call WFBE_CO_FNC_GetTeamFunds) >= (_cost select 1)`.
10. Prerequisites: re-run the same LINKS check the menu uses (`WFBE_C_UPGRADES_<side>_LINKS[_id][_current]`). Since levels only increase and we forbid queuing unmet prereqs (§5.4), this is defensive; if unmet → skip (do not pop — wait).
11. If all pass → **start it** (mirroring `Server_AI_Com_Upgrade.sqf:41-51`'s structure, with corrected indices):
    - Pop the head: `_queue deleteAt 0; _logik setVariable ["wfbe_upgrade_queue", _queue, true];`
    - **Set the gate synchronously** so the next 5 s tick can't double-start: `_logik setVariable ["wfbe_upgrading", true, true]; _logik setVariable ["wfbe_upgrading_id", _id, true];` (the AI path does this at `:43-44`; `ProcessUpgrade` sets them again — redundant but race-safe).
    - **Deduct (correct indices — NOT the AI-path swap at `:47-51`):**
      - `[_side, -(_cost select 0), "Queued tech upgrade.", false] Call ChangeSideSupply;` (only when currency system 0). Calling `ChangeSideSupply` from server code is proven safe — the income loop does exactly this at `updateresources.sqf:49`. Because we deduct only *after* confirming `supply >= cost`, the result is ≥ 0, so the negative-flip branch in `Server_ChangeSideSupply.sqf` is never hit.
      - `[_comTeam, -(_cost select 1)] Call WFBE_CO_FNC_ChangeTeamFunds;`
    - `[_side, _id, _current, false] Spawn WFBE_SE_FNC_ProcessUpgrade;` — `_upgrade_isplayer = false` so it runs the full-timer path (no client sync needed), exactly like the AI commander.

`WFBE_SE_FNC_ProcessUpgrade` itself sets `wfbe_upgrading`/`wfbe_upgrading_id`, runs the timer, increments the level, and broadcasts `upgrade-complete`. **It is not modified.** When it finishes and clears `wfbe_upgrading`, the next driver tick promotes the next queued item.

### 5.3 Server — PV handlers (new files)

Mirror the existing tiny `Server\PVFunctions\RequestUpgrade.sqf` (which just `_this Spawn WFBE_SE_FNC_ProcessUpgrade`).

- `Server\PVFunctions\RequestEnqueue.sqf` — payload `[side, upgradeId]`. Validates (commander exists for that side, upgrade enabled, not maxed, not already running, not already queued, prereqs currently met) then appends `upgradeId` to `wfbe_upgrade_queue` and re-broadcasts.
- `Server\PVFunctions\RequestDequeue.sqf` — payload `[side, upgradeId]`. Removes the first matching id from `wfbe_upgrade_queue` and re-broadcasts.

**Registration (verified mechanism).** Add `"RequestEnqueue"` and `"RequestDequeue"` to the `_serverCommandPV` list in `Common\Init\Init_PublicVariables.sqf` (lines 9–22) and drop the two files in `Server\PVFunctions\`. The init loop auto-compiles `SRVFNC<Name>` and registers an `addPublicVariableEventHandler` on `WFBE_PVF_<Name>` → `WFBE_SE_FNC_HandlePVF` → spawns the handler with the payload. The client sends via `["RequestEnqueue", [side, id]] call WFBE_CO_FNC_SendToServer` (each request name rides its own `WFBE_PVF_<Name>` channel). Server re-validates (never trust the client) — this matters because deduction is server-side and enqueue is the only authority on what enters the queue.

*(Alternative considered: piggyback on the existing `RequestSpecial` channel via new `Server_HandleSpecial.sqf` cases — zero registration changes — but dedicated handlers match how `RequestUpgrade` itself is structured, so we keep them dedicated.)*

### 5.4 Client — WF upgrade menu (`GUI_UpgradeMenu.sqf` + `Dialogs.hpp`)

**Dialog (`Rsc\Dialogs.hpp`, `WFBE_UpgradeMenu`):** add one button — `CA_Queue`, e.g. IDC `504008` — beside the existing Upgrade button (IDC `504007`), with `action = "WFBE_MenuAction = 3"`. No new listbox.

**Handler (`GUI_UpgradeMenu.sqf`):** all additive within the existing `while {alive player && dialog}` loop:

- **Button enable:** like Upgrade (`504007`), enable Queue (`504008`) only for the commander (extend the existing `_player_commander` gate at line 41).
- **`WFBE_MenuAction == 3` (toggle):** read selected upgrade id (`lnbValue[504001, [sel,0]]`). If it's already in `wfbe_upgrade_queue` → send `RequestDequeue`; else validate locally (enabled, not maxed, not the running id, prereqs met) and send `RequestEnqueue`. Server re-validates.
- **Row tags:** the list already repopulates row text each time `_update_list` fires (lines 122–137). Extend that to append a queue tag, e.g. `Heavy Factory [Q2]`, by reading the queue and finding each id's 1-based position. (String build inside the loop that already runs — negligible.)
- **Footer (`504006`):** the existing running-status text (lines 264–273, and the countdown spawn at 46–110) is extended to also list the queue, e.g. `Running: Barracks — 1:12 · Queued: Heavy, Air`. When idle with a waiting queue: `Next: Heavy (waiting on SV/funds)`.
- **Queue button label:** when the selection changes (the existing `_update_upgrade` path, lines 140–150), set the button text to `Dequeue` if the selected id is queued, else `Queue`.

**Manual Upgrade button:** unchanged behaviour (instant when idle + affordable + prereqs met; deducts client-side as today).

### 5.5 Client — HUD (`Client_UpdateRHUD.sqf` + `Rsc\Titles.hpp`)

**Titles.hpp:** add two `RscText` controls below the server-FPS row (the current last row, IDC `1366`/`1367`), with new IDCs (e.g. `1368`, `1369`). Add them to the `controls[]` array.

**Client_UpdateRHUD.sqf:** add the new IDCs to `_rhudIDC`, position them in `_RHUDSetFullPosition` and `_RHUDSetFPSPosition` (one row-height below server FPS), and in the existing 1 s loop set their text:

- **Line 1 (current):** if `WFBE_Client_Logic getVariable "wfbe_upgrading"` → `Upgrading: <label> <m:ss>`; else blank.
- **Line 2 (next):** if `wfbe_upgrade_queue` non-empty → `Next: <label of queue#0>`; else blank.

**Countdown source:** computed **client-locally**, mirroring the upgrade menu's existing approach (`GUI_UpgradeMenu.sqf:80-90`): when the HUD first observes `wfbe_upgrading` go true (or `wfbe_upgrading_id` change), record `endTime = time + duration` (duration from `WFBE_C_UPGRADES_<side>_TIMES[id][currentLevel]`); show `endTime - time`. **No new server broadcast for timing** — this honours Marty's deliberate "publish only the active upgrade id" design and keeps the change additive. Imprecision only for a client that enables the HUD mid-upgrade (over-estimates once), exactly matching the menu's current behaviour.

**Visibility:** the HUD lines ride the existing `RUBHUD` / `RUBFPSHUD` toggles (off by default, toggled from the WF menu) — no new toggle. The full queue is always viewable in the WF menu (Cristiano's "hidden in wf menu").

## 6. Edge cases & decisions

- **No commander:** driver waits (does not start) until a commander exists to pay funds. Queue persists.
- **Commander handover / death:** queue is side-state, survives. The *current* commander's funds are charged when an item fires.
- **Maxed at fire time:** driver drops the stale head and moves on.
- **Prereq limitation (known v1 limit):** you cannot queue an upgrade whose prerequisite isn't already built — enqueue blocks it (same LINKS check the Upgrade button uses). This is the case full stacking/Option-1 would have solved; intentionally deferred.
- **Manual upgrade of a queued item:** allowed; the queued entry simply advances it another level when it fires (or drops if maxed). Non-breaking.
- **Currency modes:** "full price" honours `WFBE_C_ECONOMY_CURRENCY_SYSTEM` — funds-only servers (mode 1) skip the supply check/deduction; the queue still gates on funds.
- **Duplicate prevention:** an upgrade already queued or currently running cannot be enqueued again (Queue button shows Dequeue when queued).
- **AI commander non-interference:** the driver only acts when a human commander team exists and the queue is non-empty. Under an AI commander the queue stays empty (only a human commander can enqueue) and the commander-funds read is ~0, so the driver is inert and cannot collide with `Server_AI_Com_Upgrade.sqf`.
- **HQ destruction:** handled transitively — losing the HQ loses the commander, so `GetCommanderTeam` returns objNull and the driver waits. Queued state persists as side-state until a commander returns.
- **Alignment with planned economy-authority migration (DR-23):** the wiki flags that upgrade purchase is slated to move server-authoritative. This queue is *already* server-authoritative (server-side deduction), so it aligns with — rather than fights — that migration. The manual instant-upgrade path keeps its existing client-side debit (unchanged; that pre-existing P1 gap is out of scope here).

## 7. Discovered issues (out of scope — flagged, not fixed here)

- **`Server_AI_Com_Upgrade.sqf:47-51`** deducts cost with **swapped indices** (`_cost select 0` (supply) → `ChangeAICommanderFunds`; `_cost select 1` (funds) → `ChangeSideSupply`), inconsistent with its own validation at `:34`. Dormant because the AI-commander upgrade path is compiled but never invoked. Noted for a future fix; this PR does not touch the AI path.

## 8. Mission-tree replication

The change must be mirrored across the parallel mission trees, the same way existing "update taki" commits sync them:
- `Missions\[55-2hc]warfarev2_073v48co.chernarus\` (primary, authored here)
- `Missions_Vanilla\[61-2hc]warfarev2_073v48co.takistan\`
- `Modded_Missions\…` variants (if present on `master`)

A diff of the tree list will be confirmed at implementation time; identical logical changes are copied per tree.

## 9. Verification plan ("breaks nothing")

1. **SQF/config sanity:** every new/edited `.sqf` preprocesses without error; `.hpp` controls parse (matched braces, unique IDCs).
2. **Pack the PBO** with the existing `pack_pbo.py` to confirm the mission builds.
3. **Boot the local Arma 2 OA dedicated server** (the WASP test rig) with the packed mission; scan the server `.rpt` for script errors during mission init — a clean init proves all new scripts compile and the `Init_Server` additions don't break startup. This is the primary regression guard.
4. **Behavioural (where feasible on the test rig):** queue several upgrades, confirm they auto-fire as town supply income accrues; confirm SV + commander funds are deducted on fire (not on queue); cancel a queued item; confirm HUD shows current + next and footer/tags update; confirm the **manual Upgrade button still behaves exactly as before** (instant when idle + affordable).
5. **Isolation check:** `git diff` confirms `Server_ProcessUpgrade.sqf` and the AI path are unmodified, and `feat/supply-helicopter` is untouched.
6. **BattlEye (verified):** no filter edits required. `BattlEyeFilter/publicvariable.txt` contains only `5 "kickAFK"` with no default-deny, and there is no `scripts.txt`/`remoteexec.txt`. The new `WFBE_PVF_RequestEnqueue`/`RequestDequeue` channels and the `setVariable [...,true]` queue broadcast pass unfiltered — consistent with the existing posture (none of the current `RequestX` PVFs are filtered either). The feature will not kick players.

## 10. File-by-file change list (primary tree; ×N for mirrored trees)

| File | Change | ~LOC |
|---|---|---|
| `Server\Init\Init_Server.sqf` | init `wfbe_upgrade_queue`; `ExecVM` the driver | ~3 |
| `Server\FSM\upgradeQueue.sqf` | **new** — auto-start driver loop | ~60 |
| `Server\PVFunctions\RequestEnqueue.sqf` | **new** — validate + append | ~30 |
| `Server\PVFunctions\RequestDequeue.sqf` | **new** — remove by id | ~12 |
| `Common\Init\Init_PublicVariables.sqf` | add 2 names to `_serverCommandPV` | ~2 |
| `Client\GUI\GUI_UpgradeMenu.sqf` | Queue/Dequeue action, row tags, footer queue text, button label | ~55 |
| `Rsc\Dialogs.hpp` | one Queue button in `WFBE_UpgradeMenu` | ~12 |
| `Client\Client_UpdateRHUD.sqf` | two HUD lines + client-local countdown | ~45 |
| `Rsc\Titles.hpp` | two `RscText` rows below server FPS | ~18 |
| **Server_ProcessUpgrade.sqf** | **UNCHANGED** | 0 |
| **Per-tree total** | | **~240 LOC** |

## 11. Out of scope (recap)

Leaderboard/miksuu.com feed; queue reordering; stacking multiple levels of one upgrade; AI-path index-bug fix.

## 12. Wiki cross-check (2026-06-02)

Verified against the project developer wiki (local clone confirmed up to date with the live GitHub wiki):

- **CONFIRMED:** upgrades cost supply + funds; one-at-a-time gated by `wfbe_upgrading`; **no existing upgrade queue**; commander is a voted player with funds on the team object (`wfbe_funds`) resolved via side-logic `wfbe_commander`; upgrade state (`wfbe_upgrades`/`wfbe_upgrading`/`wfbe_upgrading_id`) is replicated; server FPS rides a toggleable RHUD. (`Upgrades-And-Research-Atlas.md`, `Economy-Authority-First-Cut.md`, `Commander-HQ-Lifecycle-Atlas.md`, `Client-UI-Systems-Atlas.md`.)
- **CORRECTED:** "SV" in the wiki = per-town `supplyValue`; the resource this feature gates on is the **side supply pool** (`wfbe_supply_<side>`). See the §5.1 terminology note.
- **EXISTING QUEUE PATTERN:** the factory unit-production FIFO (`queu` on the building + `WFBE_C_QUEUE_<type>` client caps) is FIFO, no-reorder, with a queue-hint display — our simple-list upgrade queue is UX-consistent with it. We deliberately do **not** copy its client-authoritative, token-based mechanism (known-fragile, DR-33); the upgrade queue is server-authoritative side-state instead.
- **NO CONFLICTING INTENT:** no prior plan or abandoned feature for upgrade queuing (the AI `WFBE_C_UPGRADES_<side>_AI_ORDER` is AI-only).
- **BattlEye:** no edits required (see §9.6).
