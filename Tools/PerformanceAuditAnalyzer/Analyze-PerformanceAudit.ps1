<#
	Author: Marty
	Description:
		Parse Arma 2 Warfare [Performance Audit] RPT lines and export Excel-friendly CSV summaries.

	Examples:
		.\Analyze-PerformanceAudit.ps1 -InputPath "C:\Users\Marty\AppData\Local\ArmA 2 OA" -OutputPath ".\PerformanceAuditResults" -Recurse
		.\Analyze-PerformanceAudit.ps1 -InputPath ".\arma2oa.rpt" -OutputPath ".\PerformanceAuditResults"
#>

[CmdletBinding()]
param(
	[Parameter(Mandatory = $true)]
	[string]$InputPath,

	[string]$OutputPath = ".\PerformanceAuditResults",

	[switch]$Recurse,

	[ValidateSet("Semicolon", "Comma", "Tab")]
	[string]$CsvDelimiter = "Semicolon",

	[int]$SpikeThresholdMs = 25
)

Set-StrictMode -Version 2.0
$ErrorActionPreference = "Stop"

$script:InvariantCulture = [System.Globalization.CultureInfo]::InvariantCulture

function Get-CsvDelimiter {
	param([string]$Name)

	switch ($Name) {
		"Comma" { return "," }
		"Tab" { return "`t" }
		default { return ";" }
	}
}

function ConvertTo-AuditNumber {
	param($Value)

	if ($null -eq $Value -or $Value -eq "") { return $null }

	$number = 0.0
	if ([double]::TryParse([string]$Value, [System.Globalization.NumberStyles]::Float, $script:InvariantCulture, [ref]$number)) {
		return $number
	}

	return $null
}

function Get-AuditValue {
	param(
		[hashtable]$Fields,
		[string]$Name,
		$Default = $null
	)

	if ($Fields.ContainsKey($Name)) { return $Fields[$Name] }
	return $Default
}

function Get-Percentile {
	param(
		[double[]]$Values,
		[double]$Percentile
	)

	if ($null -eq $Values -or $Values.Count -eq 0) { return $null }

	$sorted = @($Values | Sort-Object)
	if ($sorted.Count -eq 1) { return [math]::Round($sorted[0], 2) }

	$rank = ($Percentile / 100.0) * ($sorted.Count - 1)
	$lower = [math]::Floor($rank)
	$upper = [math]::Ceiling($rank)

	if ($lower -eq $upper) { return [math]::Round($sorted[$lower], 2) }

	$weight = $rank - $lower
	$value = ($sorted[$lower] * (1 - $weight)) + ($sorted[$upper] * $weight)
	return [math]::Round($value, 2)
}

function Get-Average {
	param([object[]]$Values)

	$numbers = @($Values | Where-Object { $null -ne $_ } | ForEach-Object { [double]$_ })
	if ($numbers.Count -eq 0) { return $null }

	return [math]::Round((($numbers | Measure-Object -Average).Average), 2)
}

function Get-Sum {
	param([object[]]$Values)

	$numbers = @($Values | Where-Object { $null -ne $_ } | ForEach-Object { [double]$_ })
	if ($numbers.Count -eq 0) { return 0 }

	return [math]::Round((($numbers | Measure-Object -Sum).Sum), 2)
}

function Get-Max {
	param([object[]]$Values)

	$numbers = @($Values | Where-Object { $null -ne $_ } | ForEach-Object { [double]$_ })
	if ($numbers.Count -eq 0) { return $null }

	return [math]::Round((($numbers | Measure-Object -Maximum).Maximum), 2)
}

function Get-Min {
	param([object[]]$Values)

	$numbers = @($Values | Where-Object { $null -ne $_ } | ForEach-Object { [double]$_ })
	if ($numbers.Count -eq 0) { return $null }

	return [math]::Round((($numbers | Measure-Object -Minimum).Minimum), 2)
}

function Get-AIBin {
	param($AI)

	if ($null -eq $AI) { return "unknown" }

	$value = [int]$AI
	if ($value -lt 100) { return "000-099" }
	if ($value -lt 150) { return "100-149" }
	if ($value -lt 200) { return "150-199" }
	if ($value -lt 250) { return "200-249" }
	if ($value -lt 300) { return "250-299" }
	return "300+"
}

function ConvertFrom-PerformanceAuditLine {
	param(
		[string]$Line,
		[string]$SourceFile,
		[int]$LineNumber,
		[int]$Index
	)

	if ($Line -notlike "*[Performance Audit]*") { return $null }

	$fields = @{}
	$matches = [regex]::Matches($Line, '([A-Z_]+)=("([^"]*)"|\S+)')
	foreach ($match in $matches) {
		$key = $match.Groups[1].Value
		if ($match.Groups[3].Success) {
			$fields[$key] = $match.Groups[3].Value
		} else {
			$fields[$key] = $match.Groups[2].Value
		}
	}

	if ($fields.Count -eq 0) { return $null }

	$calls = ConvertTo-AuditNumber (Get-AuditValue $fields "CALLS")
	$avgMs = ConvertTo-AuditNumber (Get-AuditValue $fields "AVG_MS")
	$totalMs = $null
	if ($null -ne $calls -and $null -ne $avgMs) {
		$totalMs = [math]::Round(($calls * $avgMs), 2)
	}

	$maxMs = ConvertTo-AuditNumber (Get-AuditValue $fields "MAX_MS")

	return [pscustomobject]@{
		timestamp_index = $Index
		session_index = $null
		session_key = $null
		sid = Get-AuditValue $fields "SID"
		source_file = $SourceFile
		line_number = $LineNumber
		map = Get-AuditValue $fields "MAP"
		scope = Get-AuditValue $fields "SCOPE"
		player = Get-AuditValue $fields "PLAYER"
		uid = Get-AuditValue $fields "UID"
		script = Get-AuditValue $fields "NAME"
		fps = ConvertTo-AuditNumber (Get-AuditValue $fields "FPS")
		players = ConvertTo-AuditNumber (Get-AuditValue $fields "PLAYERS")
		ai = ConvertTo-AuditNumber (Get-AuditValue $fields "AI")
		units = ConvertTo-AuditNumber (Get-AuditValue $fields "UNITS")
		vehicles = ConvertTo-AuditNumber (Get-AuditValue $fields "VEHICLES")
		teams = ConvertTo-AuditNumber (Get-AuditValue $fields "TEAMS")
		towns_active = ConvertTo-AuditNumber (Get-AuditValue $fields "TOWNS_ACTIVE")
		markers = ConvertTo-AuditNumber (Get-AuditValue $fields "MARKERS")
		vd = ConvertTo-AuditNumber (Get-AuditValue $fields "VD")
		pvd = ConvertTo-AuditNumber (Get-AuditValue $fields "PVD")
		tfps = ConvertTo-AuditNumber (Get-AuditValue $fields "TFPS")
		ptg = ConvertTo-AuditNumber (Get-AuditValue $fields "PTG")
		dnc = ConvertTo-AuditNumber (Get-AuditValue $fields "DNC")
		daytime = ConvertTo-AuditNumber (Get-AuditValue $fields "DAYTIME")
		fog = ConvertTo-AuditNumber (Get-AuditValue $fields "FOG")
		overcast = ConvertTo-AuditNumber (Get-AuditValue $fields "OVERCAST")
		rain = ConvertTo-AuditNumber (Get-AuditValue $fields "RAIN")
		calls = $calls
		avg_ms = $avgMs
		max_ms = $maxMs
		total_ms = $totalMs
		spike_10ms = if ($null -ne $maxMs -and $maxMs -ge 10) { 1 } else { 0 }
		spike_25ms = if ($null -ne $maxMs -and $maxMs -ge 25) { 1 } else { 0 }
		spike_50ms = if ($null -ne $maxMs -and $maxMs -ge 50) { 1 } else { 0 }
		spike_100ms = if ($null -ne $maxMs -and $maxMs -ge 100) { 1 } else { 0 }
		ai_bin = Get-AIBin (ConvertTo-AuditNumber (Get-AuditValue $fields "AI"))
		extra = Get-AuditValue $fields "EXTRA"
		raw_line = $Line
	}
}

function Get-InputFiles {
	param([string]$Path)

	if (Test-Path -LiteralPath $Path -PathType Leaf) {
		return @(Get-Item -LiteralPath $Path)
	}

	if (Test-Path -LiteralPath $Path -PathType Container) {
		$parameters = @{
			LiteralPath = $Path
			File = $true
		}
		if ($Recurse) { $parameters["Recurse"] = $true }
		return @(Get-ChildItem @parameters | Where-Object { $_.Extension -in @(".rpt", ".log", ".txt") })
	}

	$resolved = @(Resolve-Path -Path $Path -ErrorAction SilentlyContinue)
	if ($resolved.Count -gt 0) {
		return @($resolved | ForEach-Object { Get-Item -LiteralPath $_.Path } | Where-Object { -not $_.PSIsContainer })
	}

	throw "InputPath not found: $Path"
}

function Export-AuditCsv {
	param(
		[object[]]$Rows,
		[string]$Path,
		[string]$Delimiter
	)

	$Rows | Export-Csv -LiteralPath $Path -NoTypeInformation -Encoding UTF8 -Delimiter $Delimiter
}

function ConvertTo-HtmlText {
	param($Value)

	if ($null -eq $Value) { return "" }
	return [System.Net.WebUtility]::HtmlEncode([string]$Value)
}

function Get-FpsClass {
	param($Fps)

	if ($null -eq $Fps) { return "" }
	if ([double]$Fps -lt 20) { return "critical" }
	if ([double]$Fps -lt 30) { return "warning" }
	return "ok"
}

function Get-SpikeClass {
	param($MaxMs)

	if ($null -eq $MaxMs) { return "" }
	if ([double]$MaxMs -ge 100) { return "critical" }
	if ([double]$MaxMs -ge 50) { return "warning" }
	if ([double]$MaxMs -ge 25) { return "notice" }
	return ""
}

function Add-HtmlTable {
	param(
		[System.Collections.Generic.List[string]]$Lines,
		[string]$Title,
		[string]$Description,
		[object[]]$Rows,
		[string[]]$Columns,
		[hashtable]$Labels,
		[string]$Kind = ""
	)

	$Lines.Add("<section>")
	$Lines.Add("<h2>$(ConvertTo-HtmlText $Title)</h2>")
	if (![string]::IsNullOrWhiteSpace($Description)) {
		$Lines.Add("<p class=""section-note"">$(ConvertTo-HtmlText $Description)</p>")
	}

	if ($null -eq $Rows -or $Rows.Count -eq 0) {
		$Lines.Add("<p class=""empty"">No data available for this section.</p>")
		$Lines.Add("</section>")
		return
	}

	$Lines.Add("<table>")
	$Lines.Add("<thead><tr>")
	foreach ($column in $Columns) {
		$label = if ($Labels.ContainsKey($column)) { $Labels[$column] } else { $column }
		$Lines.Add("<th>$(ConvertTo-HtmlText $label)</th>")
	}
	$Lines.Add("</tr></thead>")
	$Lines.Add("<tbody>")

	foreach ($row in $Rows) {
		$rowClass = ""
		if ($Kind -eq "fps") { $rowClass = Get-FpsClass $row.fps }
		if ($Kind -eq "spike") { $rowClass = Get-SpikeClass $row.max_ms }
		if ($Kind -eq "map") { $rowClass = Get-FpsClass $row.min_fps }

		$Lines.Add("<tr class=""$rowClass"">")
		foreach ($column in $Columns) {
			$value = $row.$column
			$cellClass = if ($value -is [int] -or $value -is [double] -or $value -is [decimal]) { "number" } else { "" }
			$Lines.Add("<td class=""$cellClass"">$(ConvertTo-HtmlText $value)</td>")
		}
		$Lines.Add("</tr>")
	}

	$Lines.Add("</tbody>")
	$Lines.Add("</table>")
	$Lines.Add("</section>")
}

function New-ScriptSummary {
	param([object[]]$Rows)

	$scriptRows = @($Rows | Where-Object { $_.script -and $_.script -notin @("snapshot", "session") })
	$summary = foreach ($group in ($scriptRows | Group-Object session_key, map, scope, script)) {
		$items = @($group.Group)
		$totalCalls = Get-Sum ($items | ForEach-Object { $_.calls })
		$totalMs = Get-Sum ($items | ForEach-Object { $_.total_ms })
		$weightedAvg = $null
		if ($totalCalls -gt 0) { $weightedAvg = [math]::Round(($totalMs / $totalCalls), 2) }

		[pscustomobject]@{
			session_index = $items[0].session_index
			session_key = $items[0].session_key
			sid = $items[0].sid
			map = $items[0].map
			scope = $items[0].scope
			script = $items[0].script
			samples = $items.Count
			total_calls = $totalCalls
			total_ms = $totalMs
			weighted_avg_ms = $weightedAvg
			max_ms = Get-Max ($items | ForEach-Object { $_.max_ms })
			avg_fps = Get-Average ($items | ForEach-Object { $_.fps })
			min_fps = Get-Min ($items | ForEach-Object { $_.fps })
			avg_players = Get-Average ($items | ForEach-Object { $_.players })
			max_players = Get-Max ($items | ForEach-Object { $_.players })
			avg_ai = Get-Average ($items | ForEach-Object { $_.ai })
			max_ai = Get-Max ($items | ForEach-Object { $_.ai })
			avg_markers = Get-Average ($items | ForEach-Object { $_.markers })
			max_markers = Get-Max ($items | ForEach-Object { $_.markers })
			spike_rows_10ms = Get-Sum ($items | ForEach-Object { $_.spike_10ms })
			spike_rows_25ms = Get-Sum ($items | ForEach-Object { $_.spike_25ms })
			spike_rows_50ms = Get-Sum ($items | ForEach-Object { $_.spike_50ms })
			spike_rows_100ms = Get-Sum ($items | ForEach-Object { $_.spike_100ms })
		}
	}

	return @($summary | Sort-Object total_ms -Descending)
}

function New-Timeline {
	param([object[]]$Rows)

	return @($Rows | Where-Object { $_.script -eq "snapshot" -or $_.script -eq "session" } | Select-Object `
		timestamp_index, session_index, session_key, sid, source_file, line_number, map, scope, player, uid, script, fps, players, ai, ai_bin, units, vehicles, teams, towns_active, markers, vd, pvd, tfps, ptg, dnc, daytime, fog, overcast, rain, extra)
}

function New-SpikeTable {
	param(
		[object[]]$Rows,
		[int]$ThresholdMs
	)

	return @($Rows |
		Where-Object { $_.script -and $_.script -notin @("snapshot", "session") -and $null -ne $_.max_ms -and $_.max_ms -ge $ThresholdMs } |
		Sort-Object max_ms -Descending |
		Select-Object timestamp_index, session_index, session_key, sid, source_file, line_number, map, scope, player, uid, script, fps, players, ai, ai_bin, units, vehicles, markers, vd, dnc, daytime, fog, overcast, rain, calls, avg_ms, max_ms, total_ms, extra)
}

function New-FpsContext {
	param([object[]]$TimelineRows)

	$groups = $TimelineRows | Where-Object { $_.script -eq "snapshot" } | Group-Object session_key, map, scope, player, ai_bin
	$summary = foreach ($group in $groups) {
		$items = @($group.Group)
		[pscustomobject]@{
			session_index = $items[0].session_index
			session_key = $items[0].session_key
			sid = $items[0].sid
			map = $items[0].map
			scope = $items[0].scope
			player = $items[0].player
			uid = $items[0].uid
			ai_bin = $items[0].ai_bin
			samples = $items.Count
			avg_fps = Get-Average ($items | ForEach-Object { $_.fps })
			min_fps = Get-Min ($items | ForEach-Object { $_.fps })
			p10_fps = Get-Percentile ([double[]]@($items | Where-Object { $null -ne $_.fps } | ForEach-Object { [double]$_.fps })) 10
			p90_fps = Get-Percentile ([double[]]@($items | Where-Object { $null -ne $_.fps } | ForEach-Object { [double]$_.fps })) 90
			avg_players = Get-Average ($items | ForEach-Object { $_.players })
			max_players = Get-Max ($items | ForEach-Object { $_.players })
			avg_ai = Get-Average ($items | ForEach-Object { $_.ai })
			max_ai = Get-Max ($items | ForEach-Object { $_.ai })
			avg_units = Get-Average ($items | ForEach-Object { $_.units })
			avg_vehicles = Get-Average ($items | ForEach-Object { $_.vehicles })
			avg_markers = Get-Average ($items | ForEach-Object { $_.markers })
			avg_vd = Get-Average ($items | ForEach-Object { $_.vd })
			dnc = $items[0].dnc
		}
	}

	return @($summary | Sort-Object session_index, map, scope, player, ai_bin)
}

function New-PlayerSummary {
	param([object[]]$TimelineRows)

	$groups = $TimelineRows | Where-Object { $_.script -eq "snapshot" } | Group-Object session_key, map, scope, player, uid
	$summary = foreach ($group in $groups) {
		$items = @($group.Group)
		[pscustomobject]@{
			session_index = $items[0].session_index
			session_key = $items[0].session_key
			sid = $items[0].sid
			map = $items[0].map
			scope = $items[0].scope
			player = $items[0].player
			uid = $items[0].uid
			samples = $items.Count
			avg_fps = Get-Average ($items | ForEach-Object { $_.fps })
			min_fps = Get-Min ($items | ForEach-Object { $_.fps })
			p10_fps = Get-Percentile ([double[]]@($items | Where-Object { $null -ne $_.fps } | ForEach-Object { [double]$_.fps })) 10
			p90_fps = Get-Percentile ([double[]]@($items | Where-Object { $null -ne $_.fps } | ForEach-Object { [double]$_.fps })) 90
			avg_players = Get-Average ($items | ForEach-Object { $_.players })
			max_players = Get-Max ($items | ForEach-Object { $_.players })
			avg_ai = Get-Average ($items | ForEach-Object { $_.ai })
			max_ai = Get-Max ($items | ForEach-Object { $_.ai })
			avg_markers = Get-Average ($items | ForEach-Object { $_.markers })
			max_markers = Get-Max ($items | ForEach-Object { $_.markers })
			avg_vd = Get-Average ($items | ForEach-Object { $_.vd })
		}
	}

	return @($summary | Sort-Object avg_fps)
}

function New-MapSummary {
	param([object[]]$TimelineRows)

	$groups = $TimelineRows | Where-Object { $_.script -eq "snapshot" } | Group-Object session_key, map, scope
	$summary = foreach ($group in $groups) {
		$items = @($group.Group)
		[pscustomobject]@{
			session_index = $items[0].session_index
			session_key = $items[0].session_key
			sid = $items[0].sid
			map = $items[0].map
			scope = $items[0].scope
			samples = $items.Count
			avg_fps = Get-Average ($items | ForEach-Object { $_.fps })
			min_fps = Get-Min ($items | ForEach-Object { $_.fps })
			p10_fps = Get-Percentile ([double[]]@($items | Where-Object { $null -ne $_.fps } | ForEach-Object { [double]$_.fps })) 10
			p50_fps = Get-Percentile ([double[]]@($items | Where-Object { $null -ne $_.fps } | ForEach-Object { [double]$_.fps })) 50
			p90_fps = Get-Percentile ([double[]]@($items | Where-Object { $null -ne $_.fps } | ForEach-Object { [double]$_.fps })) 90
			avg_players = Get-Average ($items | ForEach-Object { $_.players })
			max_players = Get-Max ($items | ForEach-Object { $_.players })
			avg_ai = Get-Average ($items | ForEach-Object { $_.ai })
			max_ai = Get-Max ($items | ForEach-Object { $_.ai })
			avg_units = Get-Average ($items | ForEach-Object { $_.units })
			avg_vehicles = Get-Average ($items | ForEach-Object { $_.vehicles })
			avg_markers = Get-Average ($items | ForEach-Object { $_.markers })
			avg_vd = Get-Average ($items | ForEach-Object { $_.vd })
		}
	}

	return @($summary | Sort-Object session_index, map, scope)
}

function Write-MarkdownReport {
	param(
		[string]$Path,
		[object[]]$Rows,
		[object[]]$TimelineRows,
		[object[]]$ScriptSummary,
		[object[]]$Spikes,
		[object[]]$PlayerSummary,
		[object[]]$MapSummary
	)

	$lines = New-Object System.Collections.Generic.List[string]
	$lines.Add("# Performance Audit Report")
	$lines.Add("")
	$lines.Add("Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')")
	$lines.Add("")
	$lines.Add("## Input Summary")
	$lines.Add("")
	$lines.Add("- Audit rows: $($Rows.Count)")
	$lines.Add("- Timeline rows: $($TimelineRows.Count)")
	$lines.Add("- Script summary rows: $($ScriptSummary.Count)")
	$lines.Add("- Spike rows: $($Spikes.Count)")
	$lines.Add("")

	$lines.Add("## Map / Scope FPS")
	$lines.Add("")
	$lines.Add("| Session | Map | Scope | Samples | Avg FPS | Min FPS | P10 FPS | P50 FPS | P90 FPS | Avg AI | Max AI | Avg Markers |")
	$lines.Add("|---:|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|")
	foreach ($row in $MapSummary) {
		$lines.Add("| $($row.session_index) | $($row.map) | $($row.scope) | $($row.samples) | $($row.avg_fps) | $($row.min_fps) | $($row.p10_fps) | $($row.p50_fps) | $($row.p90_fps) | $($row.avg_ai) | $($row.max_ai) | $($row.avg_markers) |")
	}
	$lines.Add("")

	$lines.Add("## Top Scripts By Total Cost")
	$lines.Add("")
	$lines.Add("| Session | Map | Scope | Script | Samples | Calls | Total ms | Weighted avg ms | Max ms | Spike rows >=25ms |")
	$lines.Add("|---:|---|---|---|---:|---:|---:|---:|---:|---:|")
	foreach ($row in ($ScriptSummary | Select-Object -First 15)) {
		$lines.Add("| $($row.session_index) | $($row.map) | $($row.scope) | $($row.script) | $($row.samples) | $($row.total_calls) | $($row.total_ms) | $($row.weighted_avg_ms) | $($row.max_ms) | $($row.spike_rows_25ms) |")
	}
	$lines.Add("")

	$lines.Add("## Top Spikes")
	$lines.Add("")
	$lines.Add("| Session | Map | Scope | Player | Script | FPS | Players | AI | Markers | Calls | Avg ms | Max ms | Extra |")
	$lines.Add("|---:|---|---|---|---|---:|---:|---:|---:|---:|---:|---:|---|")
	foreach ($row in ($Spikes | Select-Object -First 20)) {
		$extra = ([string]$row.extra).Replace("|", "/")
		$lines.Add("| $($row.session_index) | $($row.map) | $($row.scope) | $($row.player) | $($row.script) | $($row.fps) | $($row.players) | $($row.ai) | $($row.markers) | $($row.calls) | $($row.avg_ms) | $($row.max_ms) | $extra |")
	}
	$lines.Add("")

	$lines.Add("## Worst FPS Snapshots")
	$lines.Add("")
	$lines.Add("| Session | Map | Scope | Player | FPS | Players | AI | Units | Vehicles | Markers | VD | DNC | Daytime | Fog | Overcast | Rain |")
	$lines.Add("|---:|---|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|")
	foreach ($row in ($TimelineRows | Where-Object { $_.script -eq "snapshot" } | Sort-Object fps | Select-Object -First 20)) {
		$lines.Add("| $($row.session_index) | $($row.map) | $($row.scope) | $($row.player) | $($row.fps) | $($row.players) | $($row.ai) | $($row.units) | $($row.vehicles) | $($row.markers) | $($row.vd) | $($row.dnc) | $($row.daytime) | $($row.fog) | $($row.overcast) | $($row.rain) |")
	}
	$lines.Add("")

	$lines.Add("## Player Summary")
	$lines.Add("")
	$lines.Add("| Session | Map | Scope | Player | Samples | Avg FPS | Min FPS | P10 FPS | Avg AI | Max AI | Avg VD |")
	$lines.Add("|---:|---|---|---|---:|---:|---:|---:|---:|---:|---:|")
	foreach ($row in $PlayerSummary) {
		$lines.Add("| $($row.session_index) | $($row.map) | $($row.scope) | $($row.player) | $($row.samples) | $($row.avg_fps) | $($row.min_fps) | $($row.p10_fps) | $($row.avg_ai) | $($row.max_ai) | $($row.avg_vd) |")
	}

	[System.IO.File]::WriteAllLines($Path, $lines, [System.Text.Encoding]::UTF8)
}

function Write-HtmlReport {
	param(
		[string]$Path,
		[object[]]$Rows,
		[object[]]$TimelineRows,
		[object[]]$ScriptSummary,
		[object[]]$Spikes,
		[object[]]$PlayerSummary,
		[object[]]$MapSummary
	)

	$lines = New-Object System.Collections.Generic.List[string]
	$generatedAt = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
	$snapshotRows = @($TimelineRows | Where-Object { $_.script -eq "snapshot" })
	$worstSnapshots = @($snapshotRows | Sort-Object fps | Select-Object -First 20)
	$topScripts = @($ScriptSummary | Select-Object -First 15)
	$topSpikes = @($Spikes | Select-Object -First 20)
	$minFps = Get-Min ($snapshotRows | ForEach-Object { $_.fps })
	$avgFps = Get-Average ($snapshotRows | ForEach-Object { $_.fps })
	$maxAi = Get-Max ($snapshotRows | ForEach-Object { $_.ai })
	$maxPlayers = Get-Max ($snapshotRows | ForEach-Object { $_.players })
	$totalScriptMs = Get-Sum ($ScriptSummary | ForEach-Object { $_.total_ms })
	$sessionCount = @($Rows | Group-Object session_key).Count

	$labels = @{
		session_index = "Session"
		session_key = "Session id"
		sid = "SID"
		map = "Map"
		scope = "Scope"
		player = "Player"
		script = "Script"
		samples = "Samples"
		total_calls = "Calls"
		total_ms = "Total ms"
		weighted_avg_ms = "Weighted avg ms"
		max_ms = "Max ms"
		spike_rows_25ms = "Spikes >=25ms"
		fps = "FPS"
		players = "Players"
		ai = "AI"
		units = "Units"
		vehicles = "Vehicles"
		markers = "Markers"
		vd = "View distance"
		dnc = "Day/night"
		daytime = "Daytime"
		fog = "Fog"
		overcast = "Overcast"
		rain = "Rain"
		avg_fps = "Avg FPS"
		min_fps = "Min FPS"
		p10_fps = "P10 FPS"
		p50_fps = "P50 FPS"
		p90_fps = "P90 FPS"
		avg_ai = "Avg AI"
		max_ai = "Max AI"
		avg_markers = "Avg markers"
		avg_vd = "Avg VD"
		calls = "Calls"
		avg_ms = "Avg ms"
		extra = "Extra"
	}

	$lines.Add("<!doctype html>")
	$lines.Add("<html>")
	$lines.Add("<head>")
	$lines.Add("<meta charset=""utf-8"">")
	$lines.Add("<title>Performance Audit Report</title>")
	$lines.Add("<style>")
	$lines.Add("body{font-family:'Segoe UI',Arial,sans-serif;margin:0;background:#f4f6f8;color:#1f2933;}")
	$lines.Add(".page{max-width:1280px;margin:0 auto;padding:28px;}")
	$lines.Add(".hero{background:#12324a;color:white;padding:28px 34px;border-radius:10px;margin-bottom:22px;}")
	$lines.Add(".hero h1{margin:0 0 8px 0;font-size:30px;}")
	$lines.Add(".hero p{margin:0;color:#d8e6ef;font-size:14px;}")
	$lines.Add(".cards{display:grid;grid-template-columns:repeat(5,1fr);gap:12px;margin-bottom:22px;}")
	$lines.Add(".card{background:white;border:1px solid #d9e2ec;border-radius:8px;padding:14px;}")
	$lines.Add(".card .label{font-size:12px;text-transform:uppercase;color:#627d98;font-weight:700;}")
	$lines.Add(".card .value{font-size:24px;font-weight:700;margin-top:6px;color:#102a43;}")
	$lines.Add("section{background:white;border:1px solid #d9e2ec;border-radius:8px;margin-bottom:20px;padding:18px;}")
	$lines.Add("h2{font-size:20px;margin:0 0 8px 0;color:#102a43;}")
	$lines.Add(".section-note{margin:0 0 14px 0;color:#52606d;line-height:1.45;}")
	$lines.Add(".empty{color:#829ab1;font-style:italic;}")
	$lines.Add("table{border-collapse:collapse;width:100%;font-size:12px;}")
	$lines.Add("th{background:#d9e8f5;color:#102a43;text-align:left;padding:8px;border:1px solid #bcccdc;position:sticky;top:0;}")
	$lines.Add("td{padding:7px 8px;border:1px solid #d9e2ec;vertical-align:top;}")
	$lines.Add("td.number{text-align:right;font-variant-numeric:tabular-nums;}")
	$lines.Add("tr:nth-child(even){background:#f8fbfd;}")
	$lines.Add("tr.ok{background:#edf8f1;}")
	$lines.Add("tr.notice{background:#fffbea;}")
	$lines.Add("tr.warning{background:#fff3e6;}")
	$lines.Add("tr.critical{background:#ffe8e8;}")
	$lines.Add(".legend{display:flex;gap:10px;flex-wrap:wrap;margin-top:10px;}")
	$lines.Add(".pill{border-radius:999px;padding:5px 10px;font-size:12px;border:1px solid #bcccdc;background:#f8fbfd;}")
	$lines.Add(".footer{color:#627d98;font-size:12px;margin:18px 0;}")
	$lines.Add("@media print{body{background:white}.page{padding:0}.hero,section,.card{break-inside:avoid}.cards{grid-template-columns:repeat(3,1fr)}th{position:static}}")
	$lines.Add("</style>")
	$lines.Add("</head>")
	$lines.Add("<body>")
	$lines.Add("<div class=""page"">")
	$lines.Add("<div class=""hero"">")
	$lines.Add("<h1>Performance Audit Report</h1>")
	$lines.Add("<p>Generated $generatedAt. This report summarizes Arma 2 Warfare audit logs and highlights FPS context, script cost and execution spikes.</p>")
	$lines.Add("</div>")

	$lines.Add("<div class=""cards"">")
	$lines.Add("<div class=""card""><div class=""label"">Audit rows</div><div class=""value"">$($Rows.Count)</div></div>")
	$lines.Add("<div class=""card""><div class=""label"">Sessions</div><div class=""value"">$sessionCount</div></div>")
	$lines.Add("<div class=""card""><div class=""label"">Average FPS</div><div class=""value"">$avgFps</div></div>")
	$lines.Add("<div class=""card""><div class=""label"">Minimum FPS</div><div class=""value"">$minFps</div></div>")
	$lines.Add("<div class=""card""><div class=""label"">Max AI / Players</div><div class=""value"">$maxAi / $maxPlayers</div></div>")
	$lines.Add("</div>")

	$lines.Add("<section>")
	$lines.Add("<h2>How To Read This Report</h2>")
	$lines.Add("<p class=""section-note"">Start with <strong>Map / Scope FPS</strong> to see the global FPS situation, then read <strong>Top Scripts By Total Cost</strong> for scripts consuming the most cumulative time. <strong>Top Spikes</strong> shows sudden expensive frames. <strong>Worst FPS Snapshots</strong> shows the game context when FPS was lowest.</p>")
	$lines.Add("<div class=""legend""><span class=""pill"">Green: acceptable FPS or low spike</span><span class=""pill"">Yellow/orange: warning</span><span class=""pill"">Red: critical FPS or spike</span><span class=""pill"">Total ms = calls * avg ms</span></div>")
	$lines.Add("</section>")

	Add-HtmlTable `
		-Lines $lines `
		-Title "Map / Scope FPS" `
		-Description "Global FPS context grouped by session, map and locality. P10 means 10 percent of snapshots were at or below that FPS; it is useful for measuring bad moments without relying only on the absolute minimum." `
		-Rows $MapSummary `
		-Columns @("session_index","map","scope","samples","avg_fps","min_fps","p10_fps","p50_fps","p90_fps","avg_ai","max_ai","avg_markers") `
		-Labels $labels `
		-Kind "map"

	Add-HtmlTable `
		-Lines $lines `
		-Title "Top Scripts By Total Cost" `
		-Description "Scripts ranked by cumulative measured cost. A script can be important either because it is expensive once, or because it runs very often. Weighted average is total_ms divided by total calls." `
		-Rows $topScripts `
		-Columns @("session_index","map","scope","script","samples","total_calls","total_ms","weighted_avg_ms","max_ms","spike_rows_25ms") `
		-Labels $labels `
		-Kind "spike"

	Add-HtmlTable `
		-Lines $lines `
		-Title "Top Spikes" `
		-Description "Largest MAX_MS rows. These rows identify rare but visible stalls. The Extra column gives script-specific context such as marker operations, AI counts, town counts or network writes." `
		-Rows $topSpikes `
		-Columns @("session_index","map","scope","player","script","fps","players","ai","markers","calls","avg_ms","max_ms","extra") `
		-Labels $labels `
		-Kind "spike"

	Add-HtmlTable `
		-Lines $lines `
		-Title "Worst FPS Snapshots" `
		-Description "Lowest FPS snapshots and their mission context. This helps correlate bad FPS with AI count, player count, view distance, markers, day/night and weather." `
		-Rows $worstSnapshots `
		-Columns @("session_index","map","scope","player","fps","players","ai","units","vehicles","markers","vd","dnc","daytime","fog","overcast","rain") `
		-Labels $labels `
		-Kind "fps"

	Add-HtmlTable `
		-Lines $lines `
		-Title "Player Summary" `
		-Description "Client-oriented summary. Compare players to separate mission-wide performance issues from one client machine or settings profile." `
		-Rows $PlayerSummary `
		-Columns @("session_index","map","scope","player","samples","avg_fps","min_fps","p10_fps","avg_ai","max_ai","avg_vd") `
		-Labels $labels `
		-Kind "map"

	$lines.Add("<section>")
	$lines.Add("<h2>Generated Files</h2>")
	$lines.Add("<p class=""section-note"">Use <strong>performance_pivot_ready.csv</strong> for Excel pivot tables and charts. Use <strong>performance_by_script.csv</strong> and <strong>performance_spikes.csv</strong> for optimization priorities. The older Markdown report is still generated for quick text sharing.</p>")
	$lines.Add("</section>")

	$lines.Add("<p class=""footer"">Total script cost represented in summaries: $totalScriptMs ms. Report generated by Performance Audit Analyzer.</p>")
	$lines.Add("</div>")
	$lines.Add("</body>")
	$lines.Add("</html>")

	[System.IO.File]::WriteAllLines($Path, $lines, [System.Text.Encoding]::UTF8)
}

$delimiter = Get-CsvDelimiter $CsvDelimiter
$outputDirectory = New-Item -ItemType Directory -Force -Path $OutputPath
$files = @(Get-InputFiles $InputPath)

if ($files.Count -eq 0) {
	throw "No input files found for: $InputPath"
}

Write-Host "Reading $($files.Count) file(s)..."

$rows = New-Object System.Collections.Generic.List[object]
$index = 0
$sidIndexes = @{}
$nextSidIndex = 0
$legacySessionIndex = 0
$lastRowWasSessionStart = $false

foreach ($file in $files) {
	$lineNumber = 0
	Get-Content -LiteralPath $file.FullName | ForEach-Object {
		$lineNumber++
		if ($_ -like "*[Performance Audit]*") {
			$index++
			$row = ConvertFrom-PerformanceAuditLine -Line $_ -SourceFile $file.FullName -LineNumber $lineNumber -Index $index
			if ($null -ne $row) {
				if (![string]::IsNullOrWhiteSpace($row.sid)) {
					if (!$sidIndexes.ContainsKey($row.sid)) {
						$nextSidIndex++
						$sidIndexes[$row.sid] = $nextSidIndex
					}
					$row.session_index = $sidIndexes[$row.sid]
					$row.session_key = $row.sid
					$lastRowWasSessionStart = $false
				} else {
					$isSessionStart = ($row.script -eq "session" -and ([string]$row.extra) -like "state:start*")
					if ($isSessionStart -and !$lastRowWasSessionStart) {
						$legacySessionIndex++
					}
					if ($legacySessionIndex -eq 0) { $legacySessionIndex = 1 }
					$row.session_index = $legacySessionIndex
					$row.session_key = "LEGACY_{0:000}" -f $legacySessionIndex
					$lastRowWasSessionStart = $isSessionStart
				}

				$rows.Add($row)
			}
		}
	}
}

$allRows = @($rows.ToArray())
if ($allRows.Count -eq 0) {
	Write-Warning "No [Performance Audit] lines were found."
	return
}

$timeline = @(New-Timeline $allRows)
$scriptSummary = @(New-ScriptSummary $allRows)
$spikes = @(New-SpikeTable $allRows $SpikeThresholdMs)
$fpsContext = @(New-FpsContext $timeline)
$playerSummary = @(New-PlayerSummary $timeline)
$mapSummary = @(New-MapSummary $timeline)

Export-AuditCsv $allRows (Join-Path $outputDirectory.FullName "performance_raw.csv") $delimiter
Export-AuditCsv $allRows (Join-Path $outputDirectory.FullName "performance_pivot_ready.csv") $delimiter
Export-AuditCsv $timeline (Join-Path $outputDirectory.FullName "performance_timeline.csv") $delimiter
Export-AuditCsv $scriptSummary (Join-Path $outputDirectory.FullName "performance_by_script.csv") $delimiter
Export-AuditCsv $spikes (Join-Path $outputDirectory.FullName "performance_spikes.csv") $delimiter
Export-AuditCsv $fpsContext (Join-Path $outputDirectory.FullName "performance_fps_context.csv") $delimiter
Export-AuditCsv $playerSummary (Join-Path $outputDirectory.FullName "performance_by_player.csv") $delimiter
Export-AuditCsv $mapSummary (Join-Path $outputDirectory.FullName "performance_by_map.csv") $delimiter

Write-MarkdownReport `
	-Path (Join-Path $outputDirectory.FullName "performance_report.md") `
	-Rows $allRows `
	-TimelineRows $timeline `
	-ScriptSummary $scriptSummary `
	-Spikes $spikes `
	-PlayerSummary $playerSummary `
	-MapSummary $mapSummary

$htmlReportPath = Join-Path $outputDirectory.FullName "performance_report.html"
Write-HtmlReport `
	-Path $htmlReportPath `
	-Rows $allRows `
	-TimelineRows $timeline `
	-ScriptSummary $scriptSummary `
	-Spikes $spikes `
	-PlayerSummary $playerSummary `
	-MapSummary $mapSummary

Copy-Item -LiteralPath $htmlReportPath -Destination (Join-Path $outputDirectory.FullName "performance_report_word.doc") -Force

Write-Host "Done."
Write-Host "Output: $($outputDirectory.FullName)"
Write-Host "Rows: $($allRows.Count)"
Write-Host "Spikes >= $SpikeThresholdMs ms: $($spikes.Count)"
