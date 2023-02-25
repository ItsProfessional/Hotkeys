; NOTE: This only works if you have the Proton Square userchrome.css style applied. I made these scripts specifically for MY workflow, and I could not be bothered to change the colors to make it compatibile with vanilla firefox.
; https://github.com/leadweedy/Firefox-Proton-Square

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

CoordMode, Pixel, Screen

#IfWinActive ahk_class MozillaWindowClass

$^l::
WinGetPos, X, Y, W, H, A

finalY := Y - 32
finalX := X - 17
; Note: 10 has to be substracted first, to get accurate location (probably an ahk bug)

MouseGetPos, mouseX, mouseY

moreFinalX := finalX+700
moreFinalY := finalY+74

PixelGetColor, color, %moreFinalX%, %moreFinalY%, RGB
If(color = 0x0A84FF Or color = 0x42414D)
	Send, ^a
Else
	Send, ^l

return

$Esc::
WinGetPos, X, Y, W, H, A

finalY := Y - 32
finalX := X - 17
; Note: 10 has to be substracted first, to get accurate location (probably an ahk bug)

MouseGetPos, mouseX, mouseY

moreFinalX := finalX+700
moreFinalY := finalY+74

PixelGetColor, color, %moreFinalX%, %moreFinalY%, RGB
If(color = 0x0A84FF Or color = 0x42414D)
	Send, +{F6}
Else
	Send, {Esc}

return

#IfWinActive