@echo off
:Start
"D:\xampp\htdocs\canary-main\canary.exe"
:: Wait 30 seconds before restarting.
TIMEOUT /T 30
GOTO:Start