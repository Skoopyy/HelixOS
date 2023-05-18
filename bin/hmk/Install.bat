@echo off
title HelixOS Installer Backend
cd /
cd %temp%
if not "%1"=="am_admin" (
    title HelixOS Installer Backend - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit 
)
echo HelixOS HMK Edition Installer Backend
echo.
echo Preparing for install...
powershell curl https://raw.githubusercontent.com/Skoopyy/HelixOS/main/bin/hmk/Main.bat -O Main.bat > nul
powershell curl https://github.com/Skoopyy/HelixOS/raw/main/bin/hmk/HelixInstaller.exe -O HelixInstaller.exe > nul
cls
echo EULA
echo.
echo 1. Skoopyy is not responsible for anything that happens during install
echo 2. You are responsible for any damages to your OS and your Computer
echo 3. UWP apps, Microsoft Store apps will be deleted.
echo 4. Microsoft Store apps may also include your drivers.
echo 5. Please activate your OS beforehand for a better experience
echo 6. HelixOS HMK Edition is only made for Microsoft Surfaces - take note before installing.
echo.
echo Press any key to accept the EULA and install HelixOS HMK Edition
pause > nul
echo.
echo Starting installation...
title HelixOS Installer Backend
echo Starting installation...
start HelixInstaller.exe
start /min Main.bat
taskkill /f /im explorer.exe
exit