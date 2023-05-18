@echo off
title HelixOS Post-Install Backend
echo HelixOS Post-Install Backend
cd /
cd HelixOS
cd HMK
start HelixOSPostInstall.exe
timeout 6 /nobreak > nul
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\HelixOS\HMK\DefaultWallpaper.jpg" /f
timeout 2 /nobreak > nul
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
taskkill /f /im HelixOSPostInstall.exe
taskkill /f /im "HelixOS PostInstall.exe"
start explorer.exe
exit