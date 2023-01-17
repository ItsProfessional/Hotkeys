#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 2

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
CoordMode("Pixel", "Screen")
if(PixelGetColor(1030, 434) = 0x2A2A2A)
	Sleep 1000

Send "{Tab}"
Sleep 100
Send "{Enter}"
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

; Numpad1 -> F3 (Debug menu
Numpad1::
{
Send "{F3 Down}"
Sleep 100
}

Numpad1 Up::
{
Send "{F3 Up}"
}



; Numpad2 -> F3+D (Clear chat history)
Numpad2::
{
Send "{F3 Down}{D Down}"
Sleep 100
Send "{F3 Up}{D Up}"
}


; Respawn script

; Strip mine script

; Numpad3 -> Quickly open world to LAN
Numpad3::
{
If(!(InStr(title, "SinglePlayer"))) {
	return
}

Send "{Escape}"
Sleep 100
CoordMode("Pixel", "Screen")
MouseMove(1070, 450, 0)
Click
Sleep 100
MouseMove(808, 980, 0)
Click
}


; Numpad4 -> Enters command `/setblock <targeted_block> ` into chat
Numpad4::
{
Send "/"
Sleep 100
SendInput "setblock "
Sleep 50

Send "{Tab}"
Sleep 25
Send "{Tab}"
Sleep 25
Send "{Tab}"
Sleep 25


Send " "
}


; Numpad5 -> Repeat last command/message
Numpad5::
{
Send "/"
Sleep 100

Send "{Up}"
Sleep 50
Send "{Enter}"
}

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



; Alt+Y -> Tab + Enter (I use Alt+Y for clicking "respawn" on death screen)
!y::
{
TabEnter()
}

!n::
{
; If respawn button is greyed out, wait
CoordMode("Pixel", "Screen")
if(PixelGetColor(1030, 434) = 0x2A2A2A)
	Sleep 1000

Send "{Shift Down}{Tab Down}"
Sleep 100
Send "{Shift Up}{Tab Up}"
Sleep 100
Send "{Enter}"
Sleep 1000

Send "{Tab}"
Sleep 100
Send "{Enter}"
}



; Automatically open the chat before Alt+Tabbing, instead of pausing the game (which is the default behaviour)
$!Tab::
{
Send "t"

Send "{Alt Down}{Tab Down}"
Sleep 100
Send "{Alt Up}{Tab Up}"
}




#HotIf