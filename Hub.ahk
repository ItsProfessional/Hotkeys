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

#Include C:\Hotkeys\Windows\_Main.ahk
; #Include C:\Hotkeys\Premiere\_Main.ahk
#Include C:\Hotkeys\Games\Minecraft.ahk
; #Include C:\Hotkeys\Games\GeometryDash.ahk
