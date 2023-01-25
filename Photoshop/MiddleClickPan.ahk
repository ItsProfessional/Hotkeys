#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

; {SPACE}{MADD:-1,-1}{WAITMS:10}{MADD:1,1}{LMB}

#IfWinActive ahk_exe Photoshop.exe

MButton::
Send, {Space down}
MouseGetPos, xpos, ypos
MouseMove, -1, -1, 0, R
Sleep 5
MouseMove, xpos, ypos, 0
Send {LButton down}
Return

MButton up::
Send, {Space up}
Send, {LButton up}
Return