@echo off
:: ====================================================
:: Created by: Randy Grizzelli
:: Email: grizzellir@gmail.com
:: Version: 0.1
:: Date: 2025-05-03
:: Purpose: Surreptitious collection using !BasicCollection and !SANS_Triage targets from a live Windows system.
:: GitHub: https://github.com/rsgrizz
:: ====================================================

:: Self-elevate if not admin
fltmc >nul 2>&1 || (
    echo [*] Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Get safe date format (YYYY-MM-DD)
for /f %%a in ('wmic os get localdatetime ^| find "."') do set dt=%%a
set dt=%dt:~0,4%-%dt:~4,2%-%dt:~6,2%

:: System name and output/log paths
set hn=%COMPUTERNAME%
set dest=%~d0\KAPE_Collected\%hn%_%dt%
set log_basic=%dest%\KAPE_RunLog_Basic.txt
set log_sans=%dest%\KAPE_RunLog_SANS.txt
set master_log=%dest%\KAPE_MasterLog.txt

:: Create output directory
mkdir "%dest%"
cd /d "%~dp0KAPE"

:: Begin master log
echo [*] KAPE Collection Session - %DATE% %TIME% > "%master_log%"
echo [*] Hostname: %hn% >> "%master_log%"
echo [*] Output Path: %dest% >> "%master_log%"
echo. >> "%master_log%"

:: Run !BasicCollection
echo [*] Running !BasicCollection...
echo [*] Running !BasicCollection... >> "%master_log%"
kape.exe ^
  --tsource C: ^
  --tdest "%dest%" ^
  --target !BasicCollection ^
  --targetCompound ^
  --log "%log_basic%" ^
  --trace ^
  --vhdx false

echo [*] !BasicCollection complete. >> "%master_log%"
echo. >> "%master_log%"

:: Run !SANS_Triage
echo [*] Running !SANS_Triage...
echo [*] Running !SANS_Triage... >> "%master_log%"
kape.exe ^
  --tsource C: ^
  --tdest "%dest%" ^
  --target !SANS_Triage ^
  --targetCompound ^
  --log "%log_sans%" ^
  --trace ^
  --vhdx false

echo [*] !SANS_Triage complete. >> "%master_log%"
echo. >> "%master_log%"

:: Wrap-up
echo [*] KAPE collection completed successfully. >> "%master_log%"
echo [*] Logs saved to: >> "%master_log%"
echo     - %log_basic% >> "%master_log%"
echo     - %log_sans% >> "%master_log%"
echo [*] Master session log: %master_log% >> "%master_log%"

echo.
echo ============================
echo KAPE Collection Complete.
echo All data stored at: %dest%
echo Master log: %master_log%
echo ============================
pause
