<#
	Author: Marty
	Description:
		Small Windows picker for the Performance Audit Analyzer.
		Lets users choose an RPT file or folder through Explorer dialogs.
#>

Set-StrictMode -Version 2.0
$ErrorActionPreference = "Stop"

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

[System.Windows.Forms.Application]::EnableVisualStyles()

$scriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$analyzerPath = Join-Path $scriptDirectory "Analyze-PerformanceAudit.ps1"

function Show-InputModeDialog {
	$form = New-Object System.Windows.Forms.Form
	$form.Text = "Performance Audit Analyzer"
	$form.StartPosition = "CenterScreen"
	$form.FormBorderStyle = "FixedDialog"
	$form.MaximizeBox = $false
	$form.MinimizeBox = $false
	$form.ClientSize = New-Object System.Drawing.Size(390, 140)

	$label = New-Object System.Windows.Forms.Label
	$label.Text = "Choose what you want to analyze."
	$label.AutoSize = $true
	$label.Location = New-Object System.Drawing.Point(20, 20)
	$form.Controls.Add($label)

	$fileButton = New-Object System.Windows.Forms.Button
	$fileButton.Text = "RPT file"
	$fileButton.Size = New-Object System.Drawing.Size(100, 32)
	$fileButton.Location = New-Object System.Drawing.Point(20, 70)
	$fileButton.Add_Click({
		$form.Tag = "File"
		$form.Close()
	})
	$form.Controls.Add($fileButton)

	$folderButton = New-Object System.Windows.Forms.Button
	$folderButton.Text = "Folder"
	$folderButton.Size = New-Object System.Drawing.Size(100, 32)
	$folderButton.Location = New-Object System.Drawing.Point(145, 70)
	$folderButton.Add_Click({
		$form.Tag = "Folder"
		$form.Close()
	})
	$form.Controls.Add($folderButton)

	$cancelButton = New-Object System.Windows.Forms.Button
	$cancelButton.Text = "Cancel"
	$cancelButton.Size = New-Object System.Drawing.Size(100, 32)
	$cancelButton.Location = New-Object System.Drawing.Point(270, 70)
	$cancelButton.Add_Click({
		$form.Tag = "Cancel"
		$form.Close()
	})
	$form.Controls.Add($cancelButton)

	$form.AcceptButton = $fileButton
	$form.CancelButton = $cancelButton

	[void]$form.ShowDialog()
	return [string]$form.Tag
}

function Select-AuditFile {
	$dialog = New-Object System.Windows.Forms.OpenFileDialog
	$dialog.Title = "Select an Arma 2 RPT/log file"
	$dialog.Filter = "Arma logs (*.rpt;*.log;*.txt)|*.rpt;*.log;*.txt|All files (*.*)|*.*"
	$dialog.Multiselect = $false

	if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
		return $dialog.FileName
	}

	return $null
}

function Select-AuditFolder {
	param([string]$Description)

	$dialog = New-Object System.Windows.Forms.FolderBrowserDialog
	$dialog.Description = $Description
	$dialog.ShowNewFolderButton = $true

	if ($dialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
		return $dialog.SelectedPath
	}

	return $null
}

function Get-DefaultOutputPath {
	param(
		[string]$InputPath,
		[string]$Mode
	)

	$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
	if ($Mode -eq "File") {
		$parent = Split-Path -Parent $InputPath
		$name = [System.IO.Path]::GetFileNameWithoutExtension($InputPath)
		return Join-Path $parent ("PerformanceAuditResults_{0}_{1}" -f $name, $timestamp)
	}

	return Join-Path $InputPath ("PerformanceAuditResults_{0}" -f $timestamp)
}

if (!(Test-Path -LiteralPath $analyzerPath -PathType Leaf)) {
	[System.Windows.Forms.MessageBox]::Show("Analyzer script not found:`n$analyzerPath", "Performance Audit Analyzer", "OK", "Error") | Out-Null
	exit 1
}

$mode = Show-InputModeDialog
if ($mode -eq "Cancel" -or [string]::IsNullOrWhiteSpace($mode)) { exit 0 }

$inputPath = if ($mode -eq "File") {
	Select-AuditFile
} else {
	Select-AuditFolder "Select the folder containing Arma 2 RPT/log files."
}

if ([string]::IsNullOrWhiteSpace($inputPath)) { exit 0 }

$outputPath = Get-DefaultOutputPath -InputPath $inputPath -Mode $mode
[System.Windows.Forms.MessageBox]::Show("Results will be written to:`n$outputPath", "Performance Audit Analyzer", "OK", "Information") | Out-Null

try {
	if ($mode -eq "Folder") {
		& $analyzerPath -InputPath $inputPath -OutputPath $outputPath -Recurse
	} else {
		& $analyzerPath -InputPath $inputPath -OutputPath $outputPath
	}

	[System.Windows.Forms.MessageBox]::Show("Analysis complete.`n`nOutput folder:`n$outputPath", "Performance Audit Analyzer", "OK", "Information") | Out-Null
	Start-Process explorer.exe -ArgumentList "`"$outputPath`""
} catch {
	[System.Windows.Forms.MessageBox]::Show("Analysis failed:`n$($_.Exception.Message)", "Performance Audit Analyzer", "OK", "Error") | Out-Null
	throw
}
