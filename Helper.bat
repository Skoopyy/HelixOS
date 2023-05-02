@echo off
title HelixOS Installer Backend
if not "%1"=="am_admin" (
    title HelixOS Installer Backend - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit 
)
title HelixOS Installer Backend
echo HelixOS Installer Backend
echo.
echo Preparing for install...
cls
echo EULA
echo.
echo 1. Skoopyy is not responsible for anything that happens during install
echo 2. You are responsible for any damages to your OS and your Computer
echo 3. If you install the Lite version, all of your Microsoft Store apps will be deleted.
echo 4. Microsoft Store apps may also include your drivers.
echo 5. Please activate your OS beforehand for a better experience
echo.
echo Press any key to accept the EULA.
pause > nul
echo.
echo Press any key to accept the EULA.
start HelixInstaller.exe
start /min Main.bat
taskkill /f /im explorer.exe
exit