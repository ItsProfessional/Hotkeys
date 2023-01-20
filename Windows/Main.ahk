#Requires AutoHotkey v2.0
; #NoTrayIcon
#SingleInstance Force

SetWorkingDir(A_WorkingDir)
#Include "NoAltMenuAcceleration.ahk"
; #Include "NoRenameConfirmation.ahk"
; #Include "MButtonCollapseDownloadsBar.ahk"
; #Include "EscapeToUnfocusAddressbar.ahk"

; Alt+W -> Alt+F4
!w::
{
Send "!{f4}"
}

GroupAdd "Explorer", "ahk_class CabinetWClass"
GroupAdd "Explorer", "ahk_class ExploreWClass"
GroupAdd "Explorer", "ahk_class Progman"
GroupAdd "Explorer", "ahk_class WorkerW"
GroupAdd "Explorer", "ahk_class #32770"

#HotIf WinActive("ahk_group Explorer")
;; Ctrl+N -> New folder (ctrl+shift+n)
^n::^+n
#HotIf


#HotIf WinActive("ahk_exe firefox.exe")
;; Ctrl+Shift+N -> New Private Window (ctrl+shift+p)
^+n::^+p

; Hide controls with Ctrl+M
^m::^!+m
^+m::^m

; ^j::
; {
; SetTitleMatchMode "RegEx"
; var := WinGetTitle("YouTube\+\+$")
; msgbox(var)
; }


#HotIf