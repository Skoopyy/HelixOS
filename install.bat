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
cd /
md HelixOS
cd HelixOS
powershell curl https://raw.githubusercontent.com/Skoopyy/HelixOS/main/Helper.bat -O Helper.bat > nul
cls
echo Please close any apps before installing HelixOS
powershell curl https://raw.githubusercontent.com/Skoopyy/HelixOS/main/defaultwallpaper.jpg -O DefaultWallpaper.jpg > nul
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\HelixOS\DefaultWallpaper.jpg" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
pause
start Helper.bat
exit

:nointernet
echo You don't have internet.
echo Press any key to exit.
pause > nul
exit