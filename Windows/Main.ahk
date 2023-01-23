#Requires AutoHotkey v2.0
; #NoTrayIcon
#SingleInstance Force

SetWorkingDir(A_WorkingDir)

#Include "NoAltMenuAcceleration.ahk"
; #Include "NoRenameConfirmation.ahk"
; #Include "MButtonCollapseDownloadsBar.ahk"
; #Include "EscapeToUnfocusAddressbar.ahk"



GroupAdd "Explorer", "ahk_class CabinetWClass"
GroupAdd "Explorer", "ahk_class ExploreWClass"
GroupAdd "Explorer", "ahk_class Progman"
GroupAdd "Explorer", "ahk_class WorkerW"
GroupAdd "Explorer", "ahk_class #32770"





; Unstick modifier keys
+NumpadSub::
{
Send("{LCtrl up}")
Send("{RCtrl up}")
Send("{RAlt up}")
Send("{RAlt up}")
Send("{LShift up}")
Send("{RShift up}")
}



; Script reloader
#HotIf WinActive("ahk_class Notepad++")
^r::
{
Send("^s")
Sleep 10
Soundbeep(1000, 500)
Reload
}
#HotIf

; Script reloader
#HotIf WinActive("ahk_exe Taskmgr.exe")
BackSpace::Delete
#HotIf



^#s::
!#s::
^!s::Run("C:\Program Files\Everything\Everything.exe") ; Open Everything Search with ^!s



; Alt+W -> Alt+F4
!w::
{
Send "!{f4}"
}


#HotIf WinActive("ahk_group Explorer")
;; Ctrl+N -> New folder (ctrl+shift+n)
^n::^+n
#HotIf

#HotIf WinActive("ahk_class Progman") ; Desktop
!F4::return ; No Alt+F4 shutdown dialog on desktop
!W::return ; No Alt+F4 shutdown dialog on desktop
#HotIf


#HotIf WinActive("ahk_exe firefox.exe")
;; Ctrl+Shift+N -> New Private Window (ctrl+shift+p)
^+n::^+p

; Hide YouTube controls with Ctrl+M (Note for this you need the "Hide YouTube™ Fullscreen Controls" extension and assign its shortcut to Ctrl+Shift+M
^m::^!+m
^+m::^m ; Remap original firefox ^m shortcut (mute) to ^+m

!h::!Home ; Redirect Alt+H to Alt+Home (Home button on tab bar)
!NumpadDiv::
{
Send "^l"
Sleep 10
Send "^c"
Send "+{F6}"
}

; ^j::
; {
; CoordMode("Pixel", "Window")
; CoordMode("Mouse", "Window")
; Color := PixelGetColor(10, -1)
; Msgbox Color
; MouseMove(10, 1)
; }
#HotIf






#HotIf WinActive("ahk_class Windows.UI.Core.CoreWindow")
$RButton:: ; Always use Shift + RButton when right clicking on jump lists
{
MouseGetPos ,,&id
Class := WinGetClass("ahk_id " . id)

If(InStr(WinGetTitle("A"), "Jump List for ") = 1 && Class = "Windows.UI.Core.CoreWindow") ; Check whether the active window is the jump lists window and whether currently hovering over it
{
	Send("+{RButton}")
}
Else
	Send("{RButton}")
}

; The following code is buggy and I'm too lazy to fix it
; LWin::
; RWin:: ; Close Search with Windows key
; {
; MouseGetPos ,,&id
; Class := WinGetClass("ahk_id " . id)

; If(WinGetTitle("A") = "Search" && Class = "Windows.UI.Core.CoreWindow") ; Check whether the active window is the jump lists window and whether currently hovering over it
; {
	; Send("{Esc}")
; }
; Else
	; Send(A_ThisHotkey)
; }
#HotIf


























; GroupAdd "Explorer", "ahk_class ExploreWClass"

; #HotIf WinActive("ahk_class #32770") && (WinActive("ahk_exe explorer.exe") Or WinActive("ahk_exe Taskmgr.exe"))
; $^o:: ; ^o to browse in the Run window
; {
; global Title := WinGetTitle("A")
; If(WinGetTitle("A") = "Run") ; Check whether the active window is the run window
; {
	; FocusedHwnd := ControlGetFocus("A")
	; FocusedClassNN := ControlGetClassNN(FocusedHwnd)
	
	; if(FocusedClassNN != "Button4" )
		; ControlFocus("Button4")
	
	; Send("{Space}")
	; ; Sleep 100
	
	
	; SetTimer(CheckTitle, 100)
; }
; Else
	; Send("^o")
; }
; #HotIf


; ranAlready := False
; CheckTitle()
; {
	; ; SoundBeep 480, 800
	
	; If(ranAlready && Title = "Run")
	; {
		; WinActivate("Run")
		; ControlFocus("Edit1", "Run")
		; SetTimer ,0
	; }
	
	
	
	; NewTitle := WinGetTitle("A")
	
	; if (NewTitle = Title)
		; return

	; global Title := NewTitle
	
	; if(!ranAlready)
		; global ranAlready := true
; }