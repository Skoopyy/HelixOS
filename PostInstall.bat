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
exit