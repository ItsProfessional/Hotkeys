﻿; NOTE: This only works if you have the Proton Square userchrome.css style applied. I made these scripts specifically for MY workflow, and I could not be bothered to change the colors to make it compatibile with vanilla firefox.
; https://github.com/leadweedy/Firefox-Proton-Square

#SingleInstance Force
CoordMode, Pixel, Screen
; CoordMode, Mouse, Screen

#IfWinActive ahk_class MozillaWindowClass
Esc::
~^l::
WinGetPos, X, Y, W, H, A

finalY := Y - 32
finalX := X - 17
; Note: 10 has to be substracted first, to get accurate location (probably an ahk bug)

MouseGetPos, mouseX, mouseY

bottomLeftX := X
bottomRightX := X + W - 10
bottomY := Y+H

; if ((mouseX > bottomLeftX) && (mouseX < bottomRightX) && (mouseY < bottomY - 10) && (mouseY > (bottomY - 73))) {
	; ; PixelGetColor color, mouseX, mouseY, RGB
	; ; ToolTip, %color%
	; ; if(!(color = 0x303443)) {
		; ; return
	; ; }

    ; MouseMove, finalX, finalY, 0
	; Click
	; MouseMove, mouseX, mouseY, 0
; }

moreFinalX := finalX+700
moreFinalY := finalY+74
PixelGetColor, color, %moreFinalX%, %moreFinalY%, RGB
if(color = 0x0A84FF)
	Send, +{F6}


return
#IfWinActive