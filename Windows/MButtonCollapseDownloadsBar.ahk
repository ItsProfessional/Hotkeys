#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

CoordMode, Mouse, Screen
GroupAdd, ChromiumBrowser, ahk_exe chrome.exe
GroupAdd, ChromiumBrowser, ahk_exe brave.exe
GroupAdd, ChromiumBrowser, ahk_exe msedge.exe

#IfWinActive ahk_group ChromiumBrowser
~MButton::
WinGetPos, X, Y, W, H, A

finalY := Y + H - 10 - 32
finalX := X + W - 10 - 17
; Note: 10 has to be substracted first, to get accurate location (probably an ahk bug)

BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On

MouseGetPos, mouseX, mouseY

bottomLeftX := X
bottomRightX := X + W - 10
bottomY := Y+H

if ((mouseX > bottomLeftX) && (mouseX < bottomRightX) && (mouseY < bottomY - 10) && (mouseY > (bottomY - 73))) {
	; PixelGetColor color, mouseX, mouseY, RGB
	; ToolTip, %color%
	; if(!(color = 0x303443)) {
		; return
	; }

    MouseMove, finalX, finalY, 0
	Click
	MouseMove, mouseX, mouseY, 0
}

BlockInput MouseMoveOff
BlockInput Off

return

#IfWinActive