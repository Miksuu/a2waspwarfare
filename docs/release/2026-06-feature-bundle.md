# WASP Warfare — Feature Bundle Release (June 2026)

**Branch:** `release/2026-06-feature-bundle` (cut from `master` @ `2cdf5fb8`)
**Target map:** Chernarus — `Missions/[55-2hc]warfarev2_073v48co.chernarus`
**Status:** Integrated + static-verified. **In-engine smoke test NOT yet run** (see [Verification](#verification)).

This release bundles five community features and three performance/bug fixes into one branch, each as an isolated, individually-revertable commit. It is **documented for a live deploy**: what changed, how to deploy, how to remove any single feature, and what still needs testing in-engine.

---

## 1. Contents at a glance

| # | Item | Type | Source | Merge / commit |
|---|------|------|--------|----------------|
| 1 | Supply helicopters (per side) | Feature | `supply-heli-rescope` | `1a9799cd` |
| 2 | WDDM commander-buildable defense positions | Feature | `feat/commander-positions` | `2a9996ae` |
| 3 | Commander upgrade queue | Feature | PR #5 `feat/upgrade-queue` | `f91d0f36` |
| 4 | Engineer EASA at repair-truck service points | Feature | PR #6 `codex/engineer-repairpoint-rearm` | `3ec81e20` |
| 5 | Delayed vehicle-damage kill rewards | Feature | PR #7 `codex/delayed-vehicle-damage-rewards` | `147e06b8` |
| 6 | Supply command-center scan narrowing | Perf fix | this branch | `99bd4be8` |
| 7 | Factory queue-counter leak fix | Bug fix | this branch | `ab828d06` |
| 8 | Dead FPS publisher removal + busy-loop guard | Perf fix | this branch | `8372f5ce` |

---

## 2. Patchnotes (player-facing)

**New**
- **Supply helicopters** — each side can buy a single transport supply helicopter (alongside the supply truck). Fly to a friendly town, use **LOAD SUPPLIES**, deliver to your Command Center for the same reward/cooldown as the truck. Higher tiers add a heavy lift; a cash-run option pays the pilot and tithes a share to the commander.
- **Commander defense positions (WDDM)** — the commander can build pre-designed multi-object defense compositions and modular base walls from the build menu (9 presets: AA / artillery / mixed emplacements per side, plus wall straight/corner/gate). Guns are manned and scored exactly like hand-built defenses.
- **Commander upgrade queue** — queue tech upgrades; the server auto-starts the next one the moment the side can afford it. The current upgrade (with countdown) and the next queued upgrade show on the HUD under server FPS. Manage the queue from the WF upgrade menu. Nothing is charged until an upgrade actually starts.
- **Engineer EASA at repair points** — Engineer-class players can re-equip aircraft loadouts (EASA) at a service point **built from a repair truck**, with a 60-second cooldown after use. Base-built service points are unchanged.
- **Delayed vehicle-kill credit** — when a vehicle is destroyed but the engine reports no valid killer (null/self/dead), the kill is now credited to the last player who damaged it within a configurable 60-second window (previously a local-only 25 s fallback). Existing side/teamkill reward gates are unchanged.

**Improved / fixed**
- Supply runs are lighter on the server (command-center proximity checks now ask the engine for the one structure type instead of scanning every nearby object).
- Buying an empty vehicle no longer slowly "uses up" a factory's build queue (a counter leak that could eventually soft-lock a factory at its cap).
- Removed a redundant server-FPS publisher and stopped a possible CPU busy-loop on listen/self-hosted servers.

---

## 3. Feature detail + files touched

### 3.1 Supply helicopters — `1a9799cd`
Rescoped to **one supply helicopter per side** (not a whole class list). Reuses the existing supply-truck delivery pipeline (server-side delivery is vehicle-agnostic). Adds `WFBE_C_SUPPLY_VEHICLE_TYPES` as the single source of truth and de-duplicates three hardcoded classname lists.
Files: `Common/Init/Init_CommonConstants.sqf`, `Client/Module/supplyMission/supplyMissionStart.sqf`, `Client/Module/Skill/Skill_Apply.sqf`, `Client/GUI/GUI_Menu_BuyUnits.sqf`, `Client/Functions/Client_UIFillListBuyUnits.sqf`, `Server/Module/supplyMission/{supplyMissionStarted,supplyMissionCompleted,supplyMissionCompletedMessage}.sqf`.

### 3.2 WDDM commander positions — `2a9996ae`
Build-menu "anchor" classnames route through a new `Server_ConstructPosition` that resolves a `WFBE_NEURODEF_*` template and places each child through the stock `ConstructDefense` (so manning/scoring/artillery behave identically). Flat MVP prices; no upgrade gate.
Files: `Server/Functions/Server_ConstructPosition.sqf` (new), `Server/Init/Init_Defenses.sqf`, `Server/Init/Init_Server.sqf` (+compile line), `Server/PVFunctions/RequestDefense.sqf`, `Server/Construction/Construction_StationaryDefense.sqf`, `Client/Module/CoIn/coin_interface.sqf`, `Common/Config/Core/Core_CIV.sqf`, `Common/Config/Core_Structures/Structures_CO_{US,RU}.sqf`.

### 3.3 Commander upgrade queue — `f91d0f36`
Server-side driver (`Server/FSM/upgradeQueue.sqf`, ~5 s tick) starts the front of the queue when idle + affordable + prerequisites met + a commander exists. Queue is side-state (survives commander change). Deduct-on-start (queuing reserves nothing). New PV channels `RequestEnqueue` / `RequestDequeue`. **Includes a Takistan mirror** (already on its source branch).
Files: `Server/FSM/upgradeQueue.sqf` (new), `Server/PVFunctions/RequestEnqueue.sqf` + `RequestDequeue.sqf` (new), `Server/Init/Init_Server.sqf` (+execVM), `Common/Init/Init_PublicVariables.sqf`, `Client/Client_UpdateRHUD.sqf`, `Client/GUI/GUI_UpgradeMenu.sqf`, `Rsc/Dialogs.hpp`, `Rsc/Titles.hpp` (+ Takistan copies). Design docs under `docs/superpowers/`.

### 3.4 Engineer EASA at repair points — `3ec81e20`
EASA access through repair-truck-built service points for Engineer players only; 60 s cooldown; repair-truck service points are tagged (`WFBE_BuiltByRepairTruck` / `WFBE_RepairTruckServicePoint`) so base-built ones are unaffected. **Includes a Takistan mirror.**
Files: `Client/Functions/Client_CanUseRepairPointEASA.sqf` + `Client_GetRepairTruckServicePoints.sqf` (new), `Client/GUI/GUI_Menu_EASA.sqf`, `Client/GUI/GUI_Menu_Service.sqf`, `Client/Init/Init_Client.sqf`, `Client/Module/CoIn/coin_interface.sqf`, `Client/Module/Skill/Skill_Init.sqf`, `Server/Construction/Construction_StationaryDefense.sqf`, `Server/PVFunctions/RequestDefense.sqf` (+ Takistan copies).

> **Merge note (WDDM × EASA):** both features extend the defense/service-point build path. `Server/PVFunctions/RequestDefense.sqf` was resolved by hand to keep **both** behaviours: position-anchors spawn a WDDM composition; everything else uses the EASA-extended `ConstructDefense` signature (manning range + repair-truck flag). `ConstructDefense` defaults those two args when absent, so the WDDM composition path (6-arg call) is unaffected.

### 3.5 Delayed vehicle-damage kill rewards — `147e06b8`
Extends delayed vehicle-kill attribution from a local-only 25 s fallback to a configurable 60 s window. The vehicle `Hit` handler now publishes `wfbe_lasthitby` / `wfbe_lasthittime` so the server reward resolver can see the last hitter; the fallback fires **only** when Arma reports a null/self/dead killer (valid direct killers are never overridden), and the existing side/teamkill gates in `RequestOnUnitKilled.sqf` are untouched. **Includes a Takistan mirror.**
Files: `Common/Functions/Common_OnUnitHit.sqf`, `Common/Init/Init_CommonConstants.sqf` (config window), `Server/PVFunctions/RequestOnUnitKilled.sqf` (+ Takistan copies).

### 3.6–3.8 Fixes
- **`99bd4be8` (supply scans):** `supplyMissionStarted.sqf`, `supplyMissionActive.sqf`, `checkCCProximity.sqf` — `nearestObjects [...,[],r]` → `["Base_WarfareBUAVterminal"]`.
- **`ab828d06` (factory queue):** `Client/Functions/Client_BuildUnit.sqf` — empty-vehicle exit now releases the `WFBE_C_QUEUE_<type>` slot.
- **`8372f5ce` (server FPS):** deleted `Server/Module/serverFPS/monitorServerFPS.sqf` (dead — its PV had no reader) and removed its `execVM` from `Init_Server.sqf`; `serverFpsGUI.sqf` now early-exits on non-dedicated so it can't busy-loop on a listen host.

---

## 4. Deploy notes

- **This release targets Chernarus.** Build/host `Missions/[55-2hc]warfarev2_073v48co.chernarus`.
- **Takistan / map rotation — read this:** the Takistan tree on this branch contains **only** the upgrade-queue, Engineer-EASA, and delayed-vehicle-kill-rewards mirrors (carried from their source branches). Supply helicopters, WDDM positions, and the three fixes are **Chernarus-only** here. Do **not** host Takistan from this branch expecting parity. For full parity, run `Tools/LoadoutManager` (`dotnet run`, needs the `7za` env var) to regenerate Takistan from the now-updated Chernarus source — that propagates everything (all non-skip-listed files) in one pass.
- **BattlEye:** no filter changes required. The new PV channels (`WFBE_PVF_RequestEnqueue/RequestDequeue`) and broadcasts ride the existing pass-through `publicvariable.txt`.
- **No new mission parameters / no schema changes.** Per decision, features are not behind lobby toggles in this release — removal is via git (below).

---

## 5. How to remove a single feature

Each feature is its own merge commit, so any one can be pulled back out without disturbing the others:

```sh
# remove a FEATURE (merge commit) — keeps the rest of the release intact
git revert -m 1 <merge-sha>

# remove a FIX (ordinary commit)
git revert <commit-sha>
```

| To remove | Run |
|-----------|-----|
| Supply helicopters | `git revert -m 1 1a9799cd` |
| WDDM commander positions | `git revert -m 1 2a9996ae` |
| Commander upgrade queue | `git revert -m 1 f91d0f36` |
| Engineer EASA at repair points | `git revert -m 1 3ec81e20` |
| Delayed vehicle-kill rewards | `git revert -m 1 147e06b8` |
| Supply-scan fix | `git revert 99bd4be8` |
| Factory-queue fix | `git revert ab828d06` |
| Server-FPS fix | `git revert 8372f5ce` |

> SHAs are valid for this branch as pushed. If the branch is rebased/squashed before merge, re-read them with `git log --oneline master..HEAD`.
> Removing **EASA** or **WDDM** also reverts their shared touches to `RequestDefense.sqf` / `ConstructDefense` / `coin_interface.sqf`; revert the other of the pair only if you also want its changes gone.

---

## 6. Verification

**Done (static, on the merged Chernarus tree):**
- No merge-conflict markers anywhere.
- Brace/bracket/paren balance unchanged vs `master` on every modified file (pre-existing string/comment brackets aside).
- A2-OA dialect scan clean (no `params` / `isEqualTo` / bare `selectRandom` / `pushBack` / `parseSimpleArray` / `remoteExec` / `setGroupOwner`; only the OA-safe `BIS_fnc_selectRandom`).
- `Init_Server` wiring confirmed: `Server_ConstructPosition` compiled, `upgradeQueue.sqf` launched, `serverFpsGUI.sqf` launched, `monitorServerFPS` removed.

**NOT done — required before merge to `master` / live:** in-engine boot on an Arma 2 OA server (dev box has no Arma install). Per-feature smoke checklist:
1. **Supply heli:** buy the heli, LOAD SUPPLIES at a friendly town, deliver to CC → reward + town cooldown fire; RPT clean.
2. **WDDM positions:** commander builds each preset → composition spawns, guns manned/scored, cost charged; sell/cleanup works; RPT shows no missing classnames.
3. **Upgrade queue:** queue button appears for commander; auto-start fires when affordable; HUD rows show; manual Upgrade unchanged; RPT clean (`upgradeQueue`, `RequestEnqueue/Dequeue`).
4. **Engineer EASA:** only Engineers, only at repair-truck service points; 60 s cooldown; base service points unchanged.
5. **Delayed vehicle kills:** destroy a vehicle whose killer Arma reports as null/self/dead after a player damaged it within 60 s → the last hitter is credited; a direct kill still credits the actual killer; no teamkill reward.
6. **Fixes:** empty-vehicle purchase doesn't shrink the factory queue; supply runs complete; no `monitorServerFPS`/`serverFpsGUI` errors in RPT.
7. Full boot RPT scan: no script errors referencing any changed file.
