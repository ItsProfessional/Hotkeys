#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 2

CoordMode "Pixel"

SetWorkingDir(A_WorkingDir)
#Include "AutoCobbleGENAfk.ahk"

#HotIf WinActive("ahk_class GLFW30")

; Check if window is actually minecraft
try {
	title := WinGetTitle("A")
} catch as exc
	title := ""

If(!(InStr(title, "Minecraft"))) {
	return
}




; FUNCTIONS

OnGameMenu(){
; CoordMode "Pixel"
try
{
    if ImageSearch(&FoundX, &FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, "*n " "C:\Scripts\Hotkeys\Assets\GameMenu.bmp")
        return true
    else
        return false
}
catch as exc
    ; MsgBox "Could not conduct the search due to the following error:`n" exc.Message
	return false
}











; ---- NUMPAD ----


; Numpad0 -> F3+F4 (Gamemode switcher)
Numpad0::
{
Send "{F3 Down}{F4 Down}"
Sleep 400
}
Numpad0 Up::
{
Send "{F3 Up}{F4 Up}"
}
;; Numpad0





; Numpad1 -> F3 (Debug menu)
Numpad1::
{
Send "{F3 Down}"
}

Numpad1 Up::
{
Send "{F3 Up}"
}
;; numpad1 end






; Numpad2 -> F3+D (Clear chat history)
Numpad2::
{
; F3 + D
Send "{F3 Down}{D Down}"
Send "{F3 Up}{D Up}"

}
;; numpad2 End





; Numpad3 -> Quickly open world to LAN
Numpad3::
{
; Return if world is already open to LAN or playing multiplayer
title := WinGetTitle("A")
If(!(InStr(title, "Singleplayer"))) {
	return
}

Send "{Esc}"
Loop 7 {
	Send "{Tab}"
}


Send "{Enter}"
Loop 2 {
	Send "{Shift Down}{Tab Down}"
	Send "{Shift Up}{Tab Up}"
}
Send "{Enter}"
}
;; numpad3 end





; Numpad4 -> Enters command `/setblock <targeted_block> ` into chat
Numpad4::
{
Send "/"
Sleep 40
SendInput "setblock "

; Autocomplete coordinates
Loop 3 {
	Send "{Tab}"
	Send "{Tab}"
	Send "{Tab}"
}

Send " " ; Send space
}
;; numpad4 end






; Numpad5 -> Repeat last command/message
Numpad5::
{
Send "/"
Sleep 40

Send "{Up}"
Sleep 8
Send "{Enter}"
}
;; numpad5 end






; Numpad6 -> Runs command: `/kill `
Numpad6::
{
	Send "/"
	Sleep 40
	SendInput "kill"
	Send "{Enter}"
	Sleep 25

	; If respawn button is greyed out, wait
	if(PixelGetColor(1030, 434) = 0x2A2A2A) {
		Sleep 1000
		Send "{Tab}"
		Send "{Enter}"
	}
}
;; numpad6 end







Numpad7::F11
Numpad8::F1











; ---- OTHER HOTKEYS ----

; Alt+Y -> Tab + Enter (I use Alt+Y for clicking "respawn" on death screen)
!y::
{
; If respawn button is greyed out, wait
if(PixelGetColor(1030, 434) = 0x2A2A2A)
	Sleep 1000

; notgreyedout := false
; While notgreyedout {
; if(!PixelGetColor(1030, 434) = 0x2A2A2A)
	; notgreyedout := true

Send "{Tab}"
Send "{Enter}"
}

!n::
{
; If respawn button is greyed out, wait
if(PixelGetColor(1030, 434) = 0x2A2A2A)
	Sleep 1000

; Shift+Tab (Select "Title Screen")
Send "{Shift Down}{Tab Down}"
Send "{Shift Up}{Tab Up}"


Send "{Enter}"
Sleep 25

; Tab+Enter (Confirm)
Send "{Tab}"
Send "{Enter}"
}
;; Alt+Y end





; Automatically open the chat before Alt+Tabbing, instead of pausing the game (which is the default behaviour)
; $!Tab::
; {
; ; Ctrl + Backspace (Clear chat, to prevent accidentaly sending messages)
; Send "{Ctrl Down}{BackSpace Down}"
; Sleep 50
; Send "{Ctrl Up}{BackSpace Up}"

; ; Tab+Enter (Unpause, if paused)
; Send "{Tab}"
; Sleep 50
; Send "{Enter}"

; ; Open chat
; Send "t"

; ; Alt+Tab
; Send "{Alt Down}{Tab Down}"
; Sleep 50
; Send "{Alt Up}{Tab Up}"
; }
; alt+tab end



; RShift::
; {
; Send "{Esc}"

; ; Mods button
; Loop 5 {
	; Send "{Tab}"
; }

; Send "{Enter}"
; }





#HotIf
