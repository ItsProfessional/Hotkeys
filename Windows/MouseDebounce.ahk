#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#NoTrayIcon
#InstallKeybdHook
#MaxHotkeysPerInterval 2000
Process, Priority, , H

; Currently my right click and middle click buttons are working normally (thankfully), so I have those commented out

; Set A_PriorHotkey
~LButton::return
~RButton::return
~MButton::return

#If A_PriorHotkey != "" && A_TimeSincePriorHotkey < 90 ; I previously used "10" as the debounce time, but that isn't enough sometimes
; Block hotkeys
LButton::return
RButton::return
MButton::return
#If
