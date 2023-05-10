@echo off
title HelixOS Post-Install Backend
echo HelixOS Post-Install Backend
cd /
cd HelixOS
start HelixOSPostInstall.exe
timeout 10 /nobreak > nul
taskkill /f /im HelixOSPostInstall.exe
taskkill /f /im "HelixOS PostInstall.exe"
start explorer.exe
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\HelixOS\DefaultWallpaper.jpg" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
exit