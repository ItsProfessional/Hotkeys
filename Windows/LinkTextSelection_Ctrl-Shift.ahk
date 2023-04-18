#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#NoTrayIcon
#InstallKeybdHook
#MaxHotkeysPerInterval 2000
Process, Priority, , H
SendMode Input

CoordMode, Mouse, Screen
GroupAdd, ChromiumBrowser, ahk_exe chrome.exe
GroupAdd, ChromiumBrowser, ahk_exe brave.exe
GroupAdd, ChromiumBrowser, ahk_exe msedge.exe

#IfWinActive ahk_group ChromiumBrowser
~LButton::
If !getkeystate("Alt","P") return ;! is logical not

msgbox, yay

; BlockInput, SendAndMouse
; BlockInput, MouseMove
; BlockInput, On

; MouseGetPos, mouseX, mouseY





; MouseMove, mouseX, mouseY, 0

; BlockInput MouseMoveOff
; BlockInput Off

return

#IfWinActive
