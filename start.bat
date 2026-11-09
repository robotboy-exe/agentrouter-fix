@echo off
cd /d "%~dp0"
powershell -NoProfile -Command "if (-not (Get-NetTCPConnection -LocalPort 8787 -State Listen -ErrorAction SilentlyContinue)) { Start-Process -WindowStyle Hidden python -ArgumentList 'proxy.py' }"
timeout /t 1 >nul
set OPENCODE_CONFIG=%~dp0oc.json
opencode %*
