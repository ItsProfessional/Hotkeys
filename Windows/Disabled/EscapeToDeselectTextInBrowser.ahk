#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#NoTrayIcon
#InstallKeybdHook
#MaxHotkeysPerInterval 2000
Process, Priority, , H

CoordMode, Pixel, Client


; Browser
GroupAdd, Browser, ahk_exe chrome.exe
GroupAdd, Browser, ahk_exe brave.exe
GroupAdd, Browser, ahk_exe msedge.exe
GroupAdd, Browser, ahk_exe firefox.exe
GroupAdd, Browser, ahk_exe Discord.exe ; for discord

#IfWinActive ahk_group Browser

~Esc::

PixelGetColor, color, 139, 47, RGB
if(color != 0x2190A7 && color != 0x42414D) { ; addressbar is focused (not the one that shows when typing)
	ClipSaved := ClipboardAll ; save current clipboard
	clipboard := "" ; empty clipboard
	Send, ^c ; copy selected text (if selected)
	ClipWait, 0.01 ; wait for the clipboard to contain data
	
	if text_selected {
		WinGetPos,,,Xmax,Ymax,A ; get active window size
		Ycenter := Ymax/2
		Send, {ALTDOWN}
		ControlClick, x10 y%Ycenter%, A ; this is the safest point, I think
		Send, {ALTUP}
	}

	; sleep, 100
	clipboard := ClipSaved ; restore original clipboard
	ClipSaved := "" ; free the memory in case the clipboard was very large
	
}

return


OnClipboardChange:
if(A_EventInfo=1)
	text_selected := true
else
	text_selected := false
return
