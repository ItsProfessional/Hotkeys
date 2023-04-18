; NOTE: This only works if you have the Proton Square userchrome.css style applied. I made these scripts specifically for MY workflow, and I could not be bothered to change the colors to make it compatibile with vanilla firefox.
; https://github.com/leadweedy/Firefox-Proton-Square

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

CoordMode, Pixel, Client


#IfWinActive ahk_class MozillaWindowClass


$^l::
PixelGetColor, color, 139, 47, RGB

if(color = 0x2190A7)
	Send, ^a
else {
	Send, ^l
	sleep 5
	send ^a
}

return


$Esc::

PixelGetColor, color, 139, 47, RGB
if(color = 0x2190A7) { ; addressbar is focused (not the one that shows when typing)
	
	ClipSaved := ClipboardAll ; save current clipboard
	clipboard := "" ; empty clipboard
	Send, ^c ; copy selected text (if selected)
	ClipWait, 0.01 ; wait for the clipboard to contain data
	
	; if text_selected {
		; Send, {Esc}
		; Send, +{F6}
	; } else {
		; ; Send, ^a
		; ; Send, {Esc}
	; }
	
	
	Send, {Esc}
	
	if text_selected
		Send, +{F6}	

	; sleep, 100
	clipboard := ClipSaved ; restore original clipboard
	ClipSaved := "" ; free the memory in case the clipboard was very large
	
} else {
	Send, {Esc}
}

return


OnClipboardChange:
if(A_EventInfo=1)
	text_selected := true
else
	text_selected := false
return