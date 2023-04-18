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

While, 1
{
 WinWaitActive, Rename ahk_class #32770
 WinGetTitle, Title, A
 If Title = Rename
	Send, y
}