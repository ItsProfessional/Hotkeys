#SingleInstance Force#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
#NoTrayIcon

#IfWinActive, ahk_class Photoshop
*$^z::
while GetKeyState("Ctrl", "P") && GetKeyState("z", "P")
{
	Send, ^z
	Sleep, 150
}
return

*$^y::
while GetKeyState("Ctrl", "P") && GetKeyState("y", "P")
{
	Send, ^y
	Sleep, 150
}
return
