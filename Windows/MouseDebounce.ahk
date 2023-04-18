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

; Currently my right click and middle click buttons are working normally (thankfully), so I have those commented out

; Set A_PriorHotkey
~LButton::return
~RButton::return
~MButton::return

#If A_PriorHotkey != "" && A_TimeSincePriorHotkey < 10
; Block hotkeys
LButton::return
RButton::return
MButton::return
#If
