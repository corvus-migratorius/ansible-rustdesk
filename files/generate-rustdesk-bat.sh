#!/bin/bash

cat <<EOF > /opt/rustdesk-server/lib/update-rustdesk.bat
:: turning printing executed commands off
:: and changing encoding to utf-8
@echo off
chcp 65001 >nul

:: elevation
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Требуются права администора. Перезапуск...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: killing rustdesk process and stoping its service
sc stop RustDesk >nul 2>&1
taskkill /IM rustdesk.exe /F >nul 2>&1
:: /IM - image name (process name in human language or the name of an executed file)
:: /F - force

:: rewriting rustdesk config
mkdir "%appdata%\RustDesk\config\" 2>nul
(
echo [options]
echo custom-rendezvous-server = '$(curl ifconfig.me)'
echo key = '$(cat /opt/rustdesk-server/lib/*.pub)'
) > %appdata%\RustDesk\config\RustDesk2.toml

echo Конфигурация RustDesk обновлена

pause
EOF
