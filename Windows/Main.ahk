; #NoTrayIcon
#SingleInstance Force

; #Include %A_ScriptDir%\XYZ.ahk

GroupAdd, Explorer, ahk_class CabinetWClass
GroupAdd, Explorer, ahk_class ExploreWClass
GroupAdd, Explorer, ahk_class Progman
GroupAdd, Explorer, ahk_class WorkerW
GroupAdd, Explorer, ahk_class #32770



; Unstick modifier keys
+NumpadSub::
Send, {LCtrl up}
Send, {RCtrl up}
Send, {RAlt up}
Send, {RAlt up}
Send, {LShift up}
Send, {RShift up}
return

; Alt+W -> Alt+F4
!w::!F4



; Script reloader
; Note: For this to work, you need to install the "RunMe" plugin for Notepad++

$^r::
MouseGetPos,,, id
WinGetClass, Class, ahk_id %id%

If(!WinActive("ahk_class Notepad++") && Class != "Notepad++") ; Active or hovering over
{
	Send, ^r
	return
}

If(!WinActive("ahk_class Notepad++"))
	WinActivate, ahk_class Notepad++

WinWaitActive, ahk_class Notepad++


Send, ^s
Sleep 10

; Reload

CoordMode, "Mouse", "Window"

BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On

MouseGetPos xpos, ypos

MouseMove, 821, 63, 0
Click, Left

MouseMove, xpos, ypos, 0


BlockInput MouseMoveOff
BlockInput Off

Soundbeep, 1000, 500
return





#IfWinActive, ahk_exe Taskmgr.exe
BackSpace::Delete
#IfWinActive


^#s::
!#s::
^!s::Run, C:\Program Files\Everything\Everything.exe ; Open Everything Search with ^!s






#IfWinActive, ahk_group Explorer
;; Ctrl+N -> New folder (ctrl+shift+n)


#IfWinActive, ahk_class Progman ; Desktop
!F4::return ; No Alt+F4 shutdown dialog on desktop
!w::return ; No Alt+W shutdown dialog on desktop









#IfWinActive, ahk_exe firefox.exe
;; Ctrl+Shift+N -> New Private Window (ctrl+shift+p)
^+n::^+p




; Hide YouTube controls with Ctrl+M (Note for this you need the "Hide YouTube™ Fullscreen Controls" extension and assign its shortcut to Ctrl+Shift+M
^m::^!+m
^+m::^m ; Remap original firefox ^m shortcut (mute) to ^+m


!h::!Home ; Redirect Alt+H to Alt+Home (Home button on tab bar)




F1::
{
Send, ^l
Sleep 10
Send, ^c
Send, +{F6}
}
