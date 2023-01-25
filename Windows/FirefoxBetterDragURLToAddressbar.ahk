; Note: You have to install this userscript for this script to work
; https://pastebin.com/a3qXjyzt

#SingleInstance Force

#IfWinActive, ahk_class MozillaWindowClass
~LButton::
Sleep, 500
If !GetKeyState("LButton", P)
	return

KeyWait, LButton, U

CoordMode, Mouse, Window
MouseGetPos, xpos, ypos
If(xpos >= 249 && ypos >= 43 && ypos <= 67)
{
	OldClipboard := Clipboard
	WinGetTitle, BrowserTabTitle
	Loop, Parse, BrowserTabTitle, §
	If (A_Index==2)
	Clipboard := A_LoopField
	
	Send, {Esc}
	Send, ^l
	Sleep 100
	Send, ^a^v
	Sleep 100
	Clipboard := OldClipboard
}
return