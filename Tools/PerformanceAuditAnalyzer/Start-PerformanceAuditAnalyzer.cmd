@echo off
setlocal
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Start-PerformanceAuditAnalyzer.ps1"
echo.
echo Press any key to close this window.
pause > nul
