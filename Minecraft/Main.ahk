#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 2

SetWorkingDir(A_WorkingDir)
#Include "AutoCobbleGENAfk.ahk"

#HotIf WinActive("ahk_class GLFW30")

title := WinGetTitle("ahk_class GLFW30")
; msgbox(title)

If(!(InStr(title, "Minecraft"))) {
	return
}


; Numpad0 -> F3+F4
Numpad0::
{
Send "{F3 Down}{F4 Down}"
Sleep 100
}
Numpad0 Up::
{
Send "{F3 Up}{F4 Up}"
}


Numpad1:: ; F3
{
Send "{F3 Down}"
Sleep 100
}
Numpad1 Up::
{
Send "{F3 Up}"
}

Numpad2:: ; F3+D
{
Send "{F3 Down}{D Down}"
Sleep 100
Send "{F3 Up}{D Up}"
}


; Open to lan script

; Respawn script

; Strip mine script

Numpad3::
{
Send "{Escape}"
Sleep 100
CoordMode("Pixel", "Screen")
MouseMove(1070, 450, 0)
Click
Sleep 100
MouseMove(808, 980, 0)
Click
}

Numpad4::
{
Send "/"
Sleep 100
Send "setblock "
Sleep 50

Send "{Tab}"
Sleep 25
Send "{Tab}"
Sleep 25
Send "{Tab}"
Sleep 25


Send " "
}

Numpad5::
{
Send "/"
Sleep 100

Send "{Up}"
Sleep 50
Send "{Enter}"
}


!y::
{
Send "{Tab}"
Sleep 100
Send "{Enter}"
}

$!Tab::
{
Send "t"

Send "{Alt Down}{Tab Down}"
Sleep 100
Send "{Alt Up}{Tab Up}"
}




#HotIf