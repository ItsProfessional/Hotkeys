; Note: You have to install this userscript for this script to work
; https://pastebin.com/a3qXjyzt

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


#IfWinActive, ahk_class MozillaWindowClass
~LButton::
Sleep, 500
If !GetKeyState("LButton", P)
	return

KeyWait, LButton, U

CoordMode, Mouse, Window
MouseGetPos, xpos, ypos
If(xpos >= 249 && ypos >= 43 && ypos <= 67)
{
	OldClipboard := Clipboard
	WinGetTitle, BrowserTabTitle
	Loop, Parse, BrowserTabTitle, §
		If (A_Index==2)
		{
			Clipboard := A_LoopField
			; Msgbox, %A_LoopField%
			; msgbox, yay
			; return
		}
	
	Send, {Esc}
	Send, ^l
	Sleep 100
	Send, ^a^v
	Sleep 100
	Clipboard := OldClipboard
}
return

#IfWinActive
