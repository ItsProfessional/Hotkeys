#Requires AutoHotkey v2.0
; #NoTrayIcon
#SingleInstance Force

SetWorkingDir(A_WorkingDir)
#Include "NoAltMenuAcceleration.ahk"
; #Include "NoRenameConfirmation.ahk"
; #Include "MButtonCollapseDownloadsBar.ahk"

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

HotIfWinActive "ahk_group Explorer"
;; Ctrl+N -> New folder (ctrl+shift+n)
^n::
{
Send "^+n"
}