#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

#MaxHotkeysPerInterval 2000
Menu, Tray, Icon, shell32.dll, 303 ; this changes the tray icon to a little check mark!

;you know that extremely annoying dialouge box that says,
; "This action will delete existing keyframes. Do you want to continue?"
;Well, now you can auto-dismiss it. That's not as good as WIPING IT FROM THE FACE OF THE EARTH FOREVER, but it's at least a little better.
;If you know how to hack it so that there is effectively a "don't ask again" checkbox functionality... let me know.

DetectHiddenText, On

lol:
WinWait, Warning ahk_exe Adobe Premiere Pro.exe
sendinput, {enter}
sleep 100
goto lol


;ignore this code, I'm just keeping it here 'cause I might want it:

;ControlClick [, Control-or-Pos, WinTitle, WinText, WhichButton, ;ClickCount, Options, ExcludeTitle, ExcludeText]
;ControlClick, Button1, Symtrax Telnet, Do you want to end this session