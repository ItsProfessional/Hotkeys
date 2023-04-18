#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
#NoTrayIcon

GroupAdd, AdobeMMButton, ahk_exe Photoshop.exe
GroupAdd, AdobeMMButton, ahk_exe InDesign.exe
GroupAdd, AdobeMMButton, ahk_exe Illustrator.exe
GroupAdd, AdobeMMButton, ahk_exe AcroRD32.exe
GroupAdd, AdobeMMButton, ahk_exe Acrobat.exe
GroupAdd, AdobeMMButton, ahk_exe Muse.exe
;for every Adobe app where you want to use this trick


; If window is Adobe, Use middle button as an equivalent of hand tool
#IfWinActive ahk_group AdobeMMButton
MButton::
    Send {Space Down}{LButton Down}
    Keywait, MButton
    Send {LButton Up}{Space Up}
Return
#IfWinActive
