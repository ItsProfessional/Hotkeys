@echo off

:: Asks for Administrator Permissions
net session >nul 2>&1
if %errorlevel% neq 0 goto elevate
cd /d "%~dp0"
goto mainScript

:elevate
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd","/c %~s0 ::","","runas",1)(window.close)
exit

:mainScript
schtasks.exe /create /tn "Hotkeys" /xml Hotkeys.xml
pause
