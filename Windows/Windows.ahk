GroupAdd, Explorer, ahk_class CabinetWClass
GroupAdd, Explorer, ahk_class ExploreWClass
GroupAdd, Explorer, ahk_class Progman
GroupAdd, Explorer, ahk_class WorkerW
GroupAdd, Explorer, ahk_class #32770


GroupAdd, Browser, ahk_exe chrome.exe
GroupAdd, Browser, ahk_exe brave.exe
GroupAdd, Browser, ahk_exe msedge.exe
GroupAdd, Browser, ahk_exe firefox.exe



; Unstick modifier keys
+NumpadSub::
Send, {LCtrl up}
Send, {RCtrl up}
Send, {RAlt up}
Send, {RAlt up}
Send, {LShift up}
Send, {RShift up}
Send, {F24 up}

Soundbeep, 800, 450
return

; Alt+W -> Alt+F4
!w::!F4


; everything
^#s::
!#s::
^!s::Run, C:\Program Files\Everything\Everything.exe ; Open Everything Search



#IfWinActive, ahk_exe Taskmgr.exe
BackSpace::Delete
#IfWinActive


#IfWinActive, ahk_exe notepad.exe
^y::^z
#IfWinActive


#IfWinActive, ahk_exe GeometryDash.exe
RButton::LButton
#IfWinActive




#IfWinActive, ahk_group Explorer
;; Ctrl+N -> New folder (ctrl+shift+n)
^n::^+n
#IfWinActive





#IfWinActive, ahk_class Progman ; Desktop
!F4::return ; No Alt+F4 shutdown dialog on desktop
!w::return ; No Alt+W shutdown dialog on desktop

; Make ctrl r (refresh) also work on the desktop
; Note: You can't just directly remap ^r to F5, since if we don't wait for the ^r to go up it may send ^F5 or something, and that will prevent it from working
^r::
keywait, %A_ThisHotkey%
Send, {F5}
return

#IfWinActive

#IfWinActive, ahk_exe firefox.exe
^+n::^+p
#IfWinActive


#IfWinActive, ahk_exe VSCodium.exe
$^+b::
; Check if window is windhawk
try {
	WinGetTitle, Title, A
} catch e
	Title := ""

If(!(InStr(title, "- Windhawk"))) {
	Send, ^+b
	return
}

Send, ^b
return
#IfWinActive





#IfWinActive, ahk_group Browser
;; Ctrl+Shift+N -> New Private Window (ctrl+shift+p)
^+p::^+n

; Hide YouTube controls with Ctrl+M (Note for this you need the "Hide YouTube™ Fullscreen Controls" extension and assign its shortcut to Ctrl+Shift+M
^m::^!+m
^+m:: ; Remap original ^m shortcut (mute) to ^+m
If WinActive("ahk_exe firefox.exe")
	Send, ^m
If WinActive("ahk_exe chrome.exe")
	Send, !+m ; Note, this shortcut does not exist by default in chrome. You'll have to install this extension: https://chrome.google.com/webstore/detail/mute-tab-shortcuts/opcjanmpjbdbdpnjfjbboacibokblbhl/related?hl=en
return


!h::!Home ; Redirect Alt+H to Alt+Home (Home button on tab bar)

; F1 to copy addressbar
F1::
Send, ^l
Sleep 10

Send, ^c

Send, +{F6}

return


#IfWinActive

; The following does not work, I'm still trying to find a fix for it
; #IfWinActive ahk_exe vmware.exe

; PrintScreen::Send, ^!+{Home} ; In VMware Workstation, the "PrintScreen" key by itself is reserved and cannot be overritten by ShareX, even if it is elevated. So I have Ctrl+Alt+Shift+Home is assigned to "Capture region" as an alternative to PrintScreen (which is my preferred capture region hotkey) and I just map it here.

; #IfWinActive

#IfWinActive ahk_exe cmd.exe

^w::Send, !{F4}

#IfWinActive
