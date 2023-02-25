#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

#MaxThreadsPerHotkey 2

CoordMode "Pixel"


#If WinActive("ahk_class GLFW30") || WinActive("ahk_class ApplicationFrameWindow")

; Check if window is actually minecraft
try {
	WinGetTitle, Title, A
} catch e
	Title := ""

If(!(InStr(title, "Minecraft"))) {
	return
}


~Del::

ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *n C:\Hotkeys\Assets\SelectWorld.png
if (ErrorLevel = 0)
{
	Loop 5
		Send, {Tab}
		Send, {Space}
		
		Sleep, 100
		
		Send, {Tab}
		Send, {Space
}

return



; ---- NUMPAD ----




; NumpadEnd::
; Numpad1::



; Numpad2 -> F3+D (Clear chat history)
NumpadDown::
Numpad2::
; F3 + D
Send, {F3 Down}{D Down}
Send, {F3 Up}{D Up}
return





; Numpad3 -> Quickly open world to LAN
NumpadPgdn::
Numpad3::
; Return if world is already open to LAN or playing multiplayer
WinGetTitle, Title, A
If !InStr(Title, "Singleplayer")
	return

Send, {Esc}

; Select "Open to LAN"
Loop, 7
	Send, {Tab}
Send, {Enter}

; Enable "Allow Cheats"
Loop, 2
	Send, {Tab}
Send, {Enter}

; Click "Start LAN World"
Loop, 3 ; 3 because we have to go back 2 buttons first, since we went 2 buttons forward just previously
	Send, {Shift Down}{Tab}{Shift Up}
Send, {Enter}

return







; Numpad4 -> Enters command `/setblock <targeted_block> ` into chat
NumpadLeft::
Numpad4::
Send, "/"
Sleep, 40
SendInput, "setblock "

; Autocomplete coordinates
Loop, 3 {
	Send, {Tab}
	Send, {Tab}
	Send, {Tab}
}

Send, {Space}
return





; Numpad5 -> Repeat last command/message
NumpadClear::
Numpad5::
{
Send, "/"
Sleep, 40

Send, {Up}
Sleep, 8
Send, {Enter}
}




; Numpad6 -> Runs command: `/kill `
NumpadRight::
Numpad6::
{
	Send, "/"
	Sleep, 40
	SendInput "kill"
	Send, {Enter}
	Sleep, 25

	; If respawn button is greyed out, wait
	PixelGetColor, color, 1030, 434
	if(color = 0x2A2A2A) {
		Sleep, 1000
		Send, {Tab}
		Send, {Enter}
	}
}



NumpadHome::
Numpad7::
Send, {F3 down}a{F3 up}
Sleep 45
return


q::1 ; I have 1 assigned to "hotbar slot 1", and want to use q for it but doing that doesn't allow pressing it to move item from creative inventory to hotbar slot 1, thus this line




; Alt+Y -> Tab + Enter (I use Alt+Y for clicking "respawn" on death screen)
!y::
{
; If respawn button is greyed out, wait
PixelGetColor, color, 1030, 434
if(color = 0x2A2A2A)
	Sleep, 1000

; notgreyedout := false
; While notgreyedout {
; if(!PixelGetColor(1030, 434) = 0x2A2A2A)
	; notgreyedout := true

Send, {Tab}
Send, {Enter}
}



!n::
{
; If respawn button is greyed out, wait
PixelGetColor, color, 1030, 434
if(color = 0x2A2A2A)
	Sleep, 1000

; Shift+Tab (Select "Title Screen")
Send, {Shift Down}{Tab Down}
Send, {Shift Up}{Tab Up}


Send, {Enter}
Sleep, 25

; Tab+Enter (Confirm)
Send, {Tab}
Send, {Enter}
}



; Automatically open the chat before Alt+Tabbing, instead of pausing the game (which is the default behaviour)
; $!Tab::
; {
; ; Ctrl + Backspace (Clear chat, to prevent accidentaly sending messages)
; Send, "{Ctrl Down}{BackSpace Down}"
; Sleep, 50
; Send, "{Ctrl Up}{BackSpace Up}"

; ; Tab+Enter (Unpause, if paused)
; Send, "{Tab}"
; Sleep, 50
; Send, "{Enter}"

; ; Open chat
; Send, "t"

; ; Alt+Tab
; Send, "{Alt Down}{Tab Down}"
; Sleep, 50
; Send, "{Alt Up}{Tab Up}"
; }
; alt+tab end



; RShift::
; {
; Send, "{Esc}"

; ; Mods button
; Loop 5 {
	; Send, "{Tab}"
; }

; Send, "{Enter}"
; }