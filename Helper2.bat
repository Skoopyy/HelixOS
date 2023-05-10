@echo off
title HelixOS Installer Backend
if not "%1"=="am_admin" (
    title HelixOS Installer Backend - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit 
)
title HelixOS Installer Backend
cd /
cd %temp%
echo HelixOS Installer Backend
echo.
echo Do you also want to delete all UWP apps? Type 1 for yes, 2 for no
set /p op=Type option: 
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2

:op1
echo Deleting...
PowerShell -Command "Get-AppxPackage *Microsoft* | Remove-AppxPackage"
PowerShell -Command "Get-AppXProvisionedPackage -online | Remove-AppxProvisionedPackage -online"
PowerShell -Command "Get-AppXPackage | Remove-AppxPackage"
PowerShell -Command "Get-AppXPackage -User  | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage -AllUsers | Remove-AppxPackage"
goto op2

:op2
cls
echo Finishing installation...
cd /
cd HelixOS
taskkill /f /im HelixInstaller.exe
taskkill /f /im HelixOS.exe
start /min PostInstall.bat
exit