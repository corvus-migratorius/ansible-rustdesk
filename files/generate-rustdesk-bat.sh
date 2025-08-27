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

:: rewriting rustdesk config
(
echo [options]
echo custom-rendezvous-server = '$(curl ifconfig.me)'
echo key = '$(cat /opt/rustdesk-server/lib/*.pub)'
) > %appdata%\RustDesk\config\RustDesk2.toml


:: killing rustdesk process and restarting its service
taskkill /IM rustdesk.exe /F >nul 2>&1
sc stop RustDesk
sc start RustDesk

echo Конфигурация RustDesk обновлена


pause
EOF
