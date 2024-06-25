@echo off

REM Check if running as administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: This script requires administrator privileges.
    pause
    exit /b 1
)

REM Set service startup type to demand (only when requested)
sc config OVRService start= demand

REM Check service status and take action
sc query OVRService | findstr /i "RUNNING" >nul
if %errorlevel% == 0 (
    echo OVRService is running. Stopping...
    net stop OVRService
) else (
    echo OVRService is not running. Starting...
    net start OVRService
    if %errorlevel% neq 0 (
        echo Error: Failed to start OVRService.
        pause
    )
)
