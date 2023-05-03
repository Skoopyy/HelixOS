@echo off
title HelixOS Installer Backend
cd /
cd %temp%
echo Installing...
ping www.google.com > nul

if %errorlevel% equ 0 (
  goto install
) else (
  goto nointernet
)
:install
powershell curl https://raw.githubusercontent.com/Skoopyy/HelixOS/main/Helper.bat -O Helper.bat > nul
cls
echo Please close any apps before installing HelixOS
pause
start Helper.bat
exit

:nointernet
echo You don't have internet.
echo Press any key to exit.
pause > nul
exit