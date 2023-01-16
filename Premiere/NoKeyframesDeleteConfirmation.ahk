#Requires AutoHotkey v2.0
; #NoTrayIcon
#SingleInstance Force
A_MaxHotkeysPerInterval := 2000
TraySetIcon("shell32.dll","303")

DetectHiddenText(true)

Loop
{
 WinWait("Warning ahk_exe Adobe Premiere Pro.exe")
 SendInput("{enter}")
}