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

CoordMode, Pixel, Client


#IfWinActive ahk_class MozillaWindowClass





$^l::
	PixelGetColor, color, 139, 47, RGB

	if(color = 0x2190A7)
		Send, ^a ; address bar already focused, just select all (this is what happens in chrome, which I'm replicating in firefox)
	else { ; if addressbar is NOT focused, focus it and then select all. Because sometimes it focuses the addressbar and nothing is selected
		Send, ^l
		
		; So after focussing the addressbar, we have to wait for it to get focused before we press ^a (to select everything in the addressbar), otherwise it will sometimes press ^a on the webpage instead. Instead of using an arbitrary "sleep 30" or something, I'm using a loop to wait until the addressbar is selected
		done := false
		while(!done)
		{
			PixelGetColor, color, 139, 47, RGB
			if(color = 0x2190A7)
				done = true
			sleep 10
		}
		
		
		send ^a ; after addressbar has been focused, select all (chrome selects all by default, which I'm replicating in firefox)
	}

return


$Esc::

	PixelGetColor, color, 139, 47, RGB
	if(color = 0x2190A7) { ; addressbar is focused (NOT the one that shows when typing/searching!!!!!!!!!)
		; the one that shows when typing/searching will go back to the addressbar after pressing escape once, which I think is fine, so we don't have to override that
		
		ClipSaved := ClipboardAll ; save current clipboard
		clipboard := "" ; empty clipboard
		Send, ^c ; copy selected text (if selected)
		ClipWait, 0.01 ; wait for the clipboard to contain data
		
		Send, {Esc}
		Send, {Esc}
		Send, {Esc}
		Send, {Esc}
		
		if (text_selected) {
			; Send, {F6}
			WinGetPos,,,Xmax,Ymax,A ; get active window size
			Ycenter := Ymax/2
			Send, {ALTDOWN}
			ControlClick, x10 y%Ycenter%, A ; this is the safest point, I think
			Send, {ALTUP}
		}

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
