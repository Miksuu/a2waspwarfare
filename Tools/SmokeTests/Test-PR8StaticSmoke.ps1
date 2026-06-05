param(
	[string]$BaseRef = "origin/master",
	[string]$HeadRef = "HEAD"
)

$ErrorActionPreference = "Stop"

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..")
$missionRoot = Join-Path $repoRoot "Missions\[55-2hc]warfarev2_073v48co.chernarus"
$results = New-Object System.Collections.Generic.List[object]

function Add-Result {
	param([string]$Name, [bool]$Passed, [string]$Detail)
	$results.Add([pscustomobject]@{ Name = $Name; Passed = $Passed; Detail = $Detail }) | Out-Null
}

function Get-Text {
	param([string]$Path)
	return [System.IO.File]::ReadAllText($Path)
}

function Get-ChangedMissionFiles {
	$relative = & git -C $repoRoot diff --name-only "$BaseRef..$HeadRef" -- "Missions/[55-2hc]warfarev2_073v48co.chernarus"
	$files = @()
	foreach ($path in $relative) {
		if ($path -match '\.(sqf|fsm)$') {
			$full = Join-Path $repoRoot ($path -replace '/', '\')
			if (Test-Path -LiteralPath $full) { $files += $full }
		}
	}
	return $files
}

function Remove-LineComment {
	param([string]$Line)
	$idx = $Line.IndexOf("//")
	if ($idx -ge 0) { return $Line.Substring(0, $idx) }
	return $Line
}

function Test-ForbiddenA3Commands {
	$forbidden = @(
		"pushBack","pushBackUnique","selectRandom","isEqualTo","params",
		"parseSimpleArray","remoteExec","setGroupOwner","append","apply",
		"findIf","deleteAt","createHashMap","hashMap"
	)
	$pattern = "\b(" + (($forbidden | ForEach-Object {[regex]::Escape($_)}) -join "|") + ")\b"
	$hits = @()
	foreach ($file in Get-ChangedMissionFiles) {
		$lineNumber = 0
		foreach ($line in [System.IO.File]::ReadLines($file)) {
			$lineNumber++
			$code = Remove-LineComment $line
			if ($code -match $pattern) {
				$rel = Resolve-Path -LiteralPath $file -Relative
				$hits += "$rel`:$lineNumber $($matches[1])"
			}
		}
	}
	Add-Result "A2 OA command dialect" ($hits.Count -eq 0) ($(if ($hits.Count) { $hits -join "; " } else { "No forbidden A3-only commands in changed Chernarus mission files." }))
}

function Test-HqShield {
	$defenses = Join-Path $missionRoot "Server\Init\Init_Defenses.sqf"
	$hqSite = Join-Path $missionRoot "Server\Construction\Construction_HQSite.sqf"
	$defText = Get-Text $defenses
	$hqText = Get-Text $hqSite

	$templateMatch = [regex]::Match($defText, "WFBE_NEURODEF_HEADQUARTERS_WALLS'\s*,\s*\[(?<body>[\s\S]*?)\]\s*\];")
	$body = if ($templateMatch.Success) { $templateMatch.Groups["body"].Value } else { "" }
	$objectCount = ([regex]::Matches($body, "\['[^']+'\s*,\s*\[[^\]]+\]\s*,\s*-?[0-9.]+\]")).Count
	$hasConcrete = $body.Contains("Concrete_Wall_EP1")
	$hasBlocks = $body.Contains("Land_CncBlock")
	$hasRemovalNote = $defText.Contains("To remove for now, set this template to []")
	$spawns = $hqText.Contains('missionNamespace getVariable "WFBE_NEURODEF_HEADQUARTERS_WALLS"') -and $hqText.Contains("call CreateDefenseTemplate")
	$stores = $hqText.Contains('setVariable ["wfbe_hq_walls"')
	$cleans = $hqText.Contains('getVariable ["wfbe_hq_walls", []]') -and $hqText.Contains("deleteVehicle _x")

	$ok = $templateMatch.Success -and ($objectCount -gt 0) -and $hasConcrete -and $hasBlocks -and $hasRemovalNote -and $spawns -and $stores -and $cleans
	Add-Result "HQ shield deploy/cleanup" $ok "templateObjects=$objectCount concrete=$hasConcrete blocks=$hasBlocks removalNote=$hasRemovalNote spawns=$spawns stores=$stores cleans=$cleans"
}

function Test-PvfIntegrity {
	$initPv = Get-Text (Join-Path $missionRoot "Common\Init\Init_PublicVariables.sqf")
	$serverPvDir = Join-Path $missionRoot "Server\PVFunctions"
	$required = @("RequestEnqueue","RequestDequeue","RequestDefense","RequestSpecial","RequestUpgrade","RequestOnUnitKilled")
	$missing = @()
	foreach ($name in $required) {
		$registered = $initPv.Contains($name)
		$handler = Test-Path -LiteralPath (Join-Path $serverPvDir "$name.sqf")
		if (-not ($registered -and $handler)) { $missing += "$name registered=$registered handler=$handler" }
	}
	Add-Result "PVF registration/handlers" ($missing.Count -eq 0) ($(if ($missing.Count) { $missing -join "; " } else { "Core PR8 server PVF channels are registered and have handlers." }))
}

function Test-GuiImageTabGuard {
	$buyUnits = Join-Path $missionRoot "Client\GUI\GUI_Menu_BuyUnits.sqf"
	$text = Get-Text $buyUnits
	$danger = ($text -match "ctrlSet(Text|StructuredText)[\s\S]{0,120}(12001|12002|12003|12004)")
	Add-Result "Buy Units image-tab guard" (-not $danger) ($(if ($danger) { "Queue/text write appears close to an image-tab IDC." } else { "No ctrlSetText/ctrlSetStructuredText writes near factory image-tab IDCs." }))
}

Test-ForbiddenA3Commands
Test-HqShield
Test-PvfIntegrity
Test-GuiImageTabGuard

$failed = @($results | Where-Object { -not $_.Passed })
$results | Format-Table -AutoSize

if ($failed.Count -gt 0) {
	Write-Host ""
	Write-Host "FAILED: $($failed.Count) PR8 static smoke check(s)." -ForegroundColor Red
	exit 1
}

Write-Host ""
Write-Host "PASS: PR8 static smoke checks clean." -ForegroundColor Green
