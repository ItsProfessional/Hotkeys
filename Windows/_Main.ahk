; GROUPS

; Explorer
GroupAdd, Explorer, ahk_class CabinetWClass
GroupAdd, Explorer, ahk_class ExploreWClass
GroupAdd, Explorer, ahk_class Progman
GroupAdd, Explorer, ahk_class WorkerW
GroupAdd, Explorer, ahk_class #32770

; Browser
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




!q::!F4 ; Alt+f4
!d::!space ; Flow launcher

; Maximize/restore window
!f::
	IfWinActive ahk_class Shell_TrayWnd
		return
	WinGet, style, MinMax, A
	If (style = -1 or style = 0)
		WinMaximize, A
	Else
		WinRestore, A
return

; Center window
!c::
WinGetPos, , , WinWidth, WinHeight, A
WinMove, A,, (A_ScreenWidth - WinWidth) / 2, (A_ScreenHeight - WinHeight) / 2
return

; Command Prompt
!Enter::
#t::
^!t::Run, %ComSpec%, %UserProfile%

; Everything search
^!s::Run, C:\Program Files\Everything\Everything.exe

; Remap alt+# to win+#
!1::
!2::
!3::
!4::
!5::
!6::
!7::
!8::
!9::
!e:: ; for explorer
	KeyWait, %A_ThisHotkey%
	NewHotkey := StrReplace(A_ThisHotkey, "!", "#")
	Send, %NewHotkey%
return



;; macos hotkeys
; !left::
; !right::
	; KeyWait, %A_ThisHotkey%
	; NewHotkey := StrReplace(A_ThisHotkey, "!", "")
	; Send, ^{%NewHotkey%}
; return

; ^left::
	; KeyWait, %A_ThisHotkey%
	; NewHotkey := StrReplace(A_ThisHotkey, "^", "")
	; Send, {home}
; return

; ^right::
	; KeyWait, %A_ThisHotkey%
	; NewHotkey := StrReplace(A_ThisHotkey, "^", "")
	; Send, {end}
; return


; ctrl+grave is my clipboard manager (CopyQ). I cannot use win+v as a shortcut in its settings to override the default windows clipboard, when I still do press sometimes. So I map win+v to ctrl+grave which is my CopyQ hotkey to override the default windows clipboard.
#v::send, ^{Sc029} ; just #v::^` doesn't work for some reason







; Disable Alt+Esc as I press it by accident sometimes
!Esc::Suspend
!+Esc::Suspend

; Disable "office" hotkeys in windows: https://www.howtogeek.com/816348/did-you-know-shiftctrlaltwinl-opens-linkedin-on-windows
^!#+w::
^!#+t::
^!#+y::
^!#+o::
^!#+p::
^!#+d::
^!#+l::
^!#+x::
^!#+n::
^!#+Space::Suspend


; Disable feedback hub hotkey
#l::Suspend


; Remap capslock to escape
; CapsLock::Escape ; note: I moved this to sharpkeys
+CapsLock::CapsLock
+Esc::CapsLock ; I need this because of sharpkeys remapping capslock to escape
^+Esc::^+Esc ; the above lines mess up the ctrl+shift+esc hotkey that launches taskmgr, so I need to add this here




; Disable alt menu acceleration
; ~LAlt::Sendinput {Blind}{F13}
; ~RAlt::Sendinput {Blind}{F13}

; ~LAlt::
; Sendinput {Blind}{F19}
; KeyWait, LAlt
; return

; ~RAlt::
; Sendinput {Blind}{F19}
; KeyWait, RAlt
; return



; Individual program hotkeys
#IfWinActive, ahk_exe GeometryDash.exe
RButton::LButton ; Make right click also work in GD

#IfWinActive, - Windhawk ahk_exe VSCodium.exe
^+b::^b

#IfWinActive, ahk_exe firefox.exe ; Firefox specific hotkeys
^+n::^+p ; And also make ctrl+shift+n work in firefox aswell

#IfWinActive Settings ahk_exe Flow.Launcher.exe
Esc::Suspend ; Don't close flow launcher settings when clicking escape


#IfWinActive
#IfWinActive
#IfWinActive
#IfWinActive
; Individual program hotkeys END
#IfWinActive
#IfWinActive
#IfWinActive
#IfWinActive















; GROUPED PROGRAM HOTKEYS

#IfWinActive, ahk_group Explorer

!+enter::!enter ; Alt+shift+enter should open file properties dialog. I need this because I remapped alt+enter to launch cmd


#IfWinActive, ahk_class Progman ; Desktop
!F4::return ; No Alt+F4 shutdown dialog on desktop
!q::return ; No Alt+Q (which I remapped to Alt+F4) shutdown dialog on desktop

; Make Ctrl+R (refresh) also work on the desktop
^r::
	KeyWait, %A_ThisHotkey%
	Send, {F5} ; F5 also refreshes
return



#IfWinActive, ahk_group Browser
^+p:: ; Make ctrl+shift+n work in browsers other than firefox
If WinActive("ahk_exe firefox.exe")
	Send, ^+p ; do the default thing in firefox
Else
	Send, ^+n
return


!h::!Home ; Redirect Alt+H to Alt+Home (Home button

; Replicate linux-only hotkeys
^[::Send, !{Left}
^]::Send, !{Right}


; Hide YouTube controls with Ctrl+M (you need the "Hide YouTube™ Fullscreen Controls" extension with shortcut set as Ctrl+Alt+M)
^m::^!m

; Remap ^+m to original ^m shortcut (mute)
^+m::
	If WinActive("ahk_exe firefox.exe")
		Send, ^m
	If WinActive("ahk_exe chrome.exe")
		Send, !+m ; Note: You have to install this extension: https://chrome.google.com/webstore/detail/mute-tab-shortcuts/opcjanmpjbdbdpnjfjbboacibokblbhl/related?hl=en
return


!F1::send ^+{pgup} ;this will MOVE a tab to the left
!F2::send ^+{pgdn} ;this will MOVE a tab to the right.

F1::send ^+{tab} ;control shift tab, which goes to the next tab
F2::send ^{tab} ;control tab, which goes to the previous tab

F3::send ^w ;control w, which closes a tab
F4::send {mButton} ; middle mouse button, which opens a link in a new tab.


; F1 to copy addressbar
F5::
	Send, ^l ; Select address bar
	Sleep 10
	Send, ^c ; Copy
	Send, +{F6} ; Deselect address bar
return
















#IfWinActive
#IfWinActive
#IfWinActive
#IfWinActive
; GROUPED PROGRAM HOTKEYS END
#IfWinActive
#IfWinActive
#IfWinActive
#IfWinActive