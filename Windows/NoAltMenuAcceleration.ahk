#Requires AutoHotkey v2.0
; #NoTrayIcon
#SingleInstance Force
;TraySetIcon("shell32.dll","110")

InstallKeybdHook()
A_MaxHotkeysPerInterval := 2000
ProcessSetPriority("H")
SendMode("Input")

;These next two lines are very important. You have to change the "menu mask key" away from being CTRL, to something that won't result in cross-talk. Read this thread to learn the details: https://autohotkey.com/boards/viewtopic.php?f=76&t=57683
A_MenuMaskKey := "vk07"  ; vk07 is unassigned. 
#UseHook

~LAlt::
{
SendInput("{Blind}{sc0E9}")
KeyWait("LAlt") ; this wasit for the key to be RELEASED. So that it doesn't keep spamming SC0E9 (as seen from an AHK window Key history and script info... window.)
SendInput("{Blind}{sc0EA}")
return
}

~RAlt::
{
SendInput("{Blind}{sc0E9}")
KeyWait("RAlt") ; so that it doesn't keep spamming SC0E9
SendInput("{Blind}{sc0EA}")
return
}


Lalt & Ralt::Suspend() ; Toggle script by pressing Lalt + Ralt