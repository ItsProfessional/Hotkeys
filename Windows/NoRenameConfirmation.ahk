#Requires Autohotkey v2.0-beta.1+
; #NoTrayIcon
#SingleInstance Force

Loop
{
 WinWait("Rename ahk_class #32770")
 WinActivate()
 ControlClick("Button1")
}
