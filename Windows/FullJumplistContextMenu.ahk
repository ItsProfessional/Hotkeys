#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

#IfWinActive, ahk_class Windows.UI.Core.CoreWindow
$RButton:: ; Always use Shift + RButton when right clicking on jump lists
{
MouseGetPos,,, id
WinGetClass, Class, ahk_id %id%
WinGetTitle, Title, A
If(InStr(Title, "Jump List for ") = 1 && Class = "Windows.UI.Core.CoreWindow") ; Check whether the active window is the jump lists window and whether currently hovering over it
{
	Send, +{RButton}
}
Else
	Send, {RButton}
}

#IfWinActive