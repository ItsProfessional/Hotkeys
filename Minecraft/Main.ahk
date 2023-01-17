#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 2

CoordMode "Pixel"

SetWorkingDir(A_WorkingDir)
#Include "AutoCobbleGENAfk.ahk"

#HotIf WinActive("ahk_class GLFW30")


; Check if window is actually minecraft
title := WinGetTitle("ahk_class GLFW30")
If(!(InStr(title, "Minecraft"))) {
	return
}




; FUNCTIONS

TabEnter() {
; If respawn button is greyed out, wait
; CoordMode("Pixel", "Screen")
if(PixelGetColor(1030, 434) = 0x2A2A2A)
	Sleep 1000

Send "{Tab}"
Sleep 100
Send "{Enter}"
}

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
Sleep 100
}
Numpad0 Up::
{
Send "{F3 Up}{F4 Up}"
}
;; numpad0 end





; Numpad1 -> F3 (Debug menu
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
Sleep 100
Send "{F3 Up}{D Up}"

}
;; numpad2 End





; Numpad3 -> Quickly open world to LAN
Numpad3::
{
; Return if world is already open to LAN or playing multiplayer
title := WinGetTitle("ahk_class GLFW30")
If(!(InStr(title, "Singleplayer"))) {
	return
}

Send "{Esc}"
Sleep 25
; CoordMode("Pixel", "Screen")

; MouseMove(1070, 450, 0)
; Click
; Sleep 100
; MouseMove(808, 980, 0)
; Click
Send "{Tab}"
Sleep 25
Send "{Tab}"
Sleep 25
Send "{Tab}"
Sleep 25
Send "{Tab}"
Sleep 25
Send "{Tab}"
Sleep 25
Send "{Tab}"
Sleep 25
Send "{Tab}"
Sleep 25

Send "{Enter}"
Sleep 25

Send "{Shift Down}{Tab Down}"
Sleep 25
Send "{Shift Up}{Tab Up}"

Send "{Shift Down}{Tab Down}"
Sleep 25
Send "{Shift Up}{Tab Up}"

Send "{Enter}"
Sleep 25
}
;; numpad3 end





; Numpad4 -> Enters command `/setblock <targeted_block> ` into chat
Numpad4::
{
; /setblock
Send "/"
Sleep 100
SendInput "setblock "
Sleep 50

; Autocomplete coordinates
Send "{Tab}"
Sleep 25
Send "{Tab}"
Sleep 25
Send "{Tab}"
Sleep 25


Send " " ; Send space
}
;; numpad4 end






; Numpad5 -> Repeat last command/message
Numpad5::
{
Send "/"
Sleep 100

Send "{Up}"
Sleep 50
Send "{Enter}"
}
;; numpad5 end






; Numpad6 -> Runs command: `/kill `
Numpad6::
{
Send "/"
Sleep 100
SendInput "kill"
Sleep 50


Send "{Enter}"
Sleep 25


TabEnter()
}
;; numpad6 end







Numpad7::
{
Result := OnGameMenu()
MsgBox(Result)
}











; ---- OTHER HOTKEYS ----

; Alt+Y -> Tab + Enter (I use Alt+Y for clicking "respawn" on death screen)
!y::
{
TabEnter()
}

!n::
{
; If respawn button is greyed out, wait
; CoordMode("Pixel", "Screen")
if(PixelGetColor(1030, 434) = 0x2A2A2A)
	Sleep 1000

; Shift+Tab (Select "Title Screen")
Send "{Shift Down}{Tab Down}"
Sleep 100
Send "{Shift Up}{Tab Up}"


Sleep 100
Send "{Enter}"
Sleep 1000

; Tab+Enter (Confirm)
Send "{Tab}"
Sleep 100
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
; Sleep 25
; Send "{Tab}"
; Sleep 25
; Send "{Tab}"
; Sleep 25
; Send "{Tab}"
; Sleep 25
; Send "{Tab}"
; Sleep 25
; Send "{Tab}"
; Sleep 25


; Send "{Enter}"
; Sleep 25
; }





#HotIf
