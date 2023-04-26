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

^!k::Run, C:\Program Files\AutoHotkey\WindowSpy.ahk

^!#i::
WinGet, h, ID, ahk_class Progman
PostMessage, 0x12, 0, 0, , ahk_id %h%	;wm_quit
sleep, 25
Run, explorer.EXE
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
!s:: ; for windows search
	KeyWait, %A_ThisHotkey%
	NewHotkey := StrReplace(A_ThisHotkey, "!", "#")
	Send, %NewHotkey%
return

; Volume keys
; The reason I don't just send "{Volume_Mute}", etc. is because they show a windows 11 popup, which is annoying

^!NumpadMult::
!F6::SoundSet, +1,, Mute ; {Volume_Mute}


^!NumpadSub::
!F7::SoundSet, -3 ; {Volume_Down}


^!NumpadAdd::
!F8::SoundSet, +3 ; {Volume_Up}

; Media Keys: These don't show any popups, so I just send those keys normally
^!Space::
!F9::Send       {Media_Play_Pause}

^!Left::
!F10::Send      {Media_Prev}

^!Right::
!F11::Send      {Media_Next}

; !F12::
; wifi_name := "Wi-Fi"
; wifi_status := RunCMD("netsh interface show interface name=""" wifi_name """")
; Run % "netsh interface set interface name=""" wifi_name """ admin=" (InStr(wifi_status, "Disabled") ? "EN" : "DIS" "ABLED"),, Hide
; return














; Brightness keys
; gist.github.com/krrr/3c3f1747480189dbb71f

!F2::AdjustScreenBrightness(-5)
!F3::AdjustScreenBrightness(5)

AdjustScreenBrightness(step) {
    service := "winmgmts:{impersonationLevel=impersonate}!\\.\root\WMI"
    monitors := ComObjGet(service).ExecQuery("SELECT * FROM WmiMonitorBrightness WHERE Active=TRUE")
    monMethods := ComObjGet(service).ExecQuery("SELECT * FROM wmiMonitorBrightNessMethods WHERE Active=TRUE")
    minBrightness := 5  ; level below this is identical to this

    for i in monitors {
        curt := i.CurrentBrightness
        break
    }
    if (curt < minBrightness)  ; parenthesis is necessary here
        curt := minBrightness
    toSet := curt + step
    if (toSet > 100)
        return
    if (toSet < minBrightness)
        toSet := minBrightness
        
    

    for i in monMethods {
        i.WmiSetBrightness(1, toSet)
        break
    }
}









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

; I don't want this hotkey
#h::Suspend

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

; for switching levels in the level selector
h::left
l::right



app = %ProgramFiles%\Windhawk\UI\VSCodium.exe
#If WinActive("ahk_exe" app)
^+b::^b
#If




#IfWinActive, ahk_exe firefox.exe ; Firefox specific hotkeys
^+n::^+p ; And also make ctrl+shift+n work in firefox aswell



#IfWinActive Settings ahk_exe Flow.Launcher.exe ; flow launcher settings window
Esc::Suspend ; Don't close flow launcher settings when clicking escape


#IfWinActive Flow.Launcher ahk_exe Flow.Launcher.exe ; flow launcher prompt

; if already in a flow launcher prompt, select all when pressing alt d again instead of closing the prompt
$!d:: ; I have !d remapped to !space above
$!space::
keywait, %a_thishotkey%



; check if text already selected
ClipSaved := ClipboardAll ; save current clipboard
clipboard := "" ; empty clipboard
Send, ^c ; copy selected text (if selected)
ClipWait, 0.01 ; wait for the clipboard to contain data	

if (text_selected)
{
	send, {esc} ; send !{space} doesn't work for some reason
	return
}



send, ^a

ClipSaved := ClipboardAll ; save current clipboard
clipboard := "" ; empty clipboard
Send, ^c ; copy selected text (if selected)
ClipWait, 0.01 ; wait for the clipboard to contain data	

if (clipboard = "") {
	Send, {ALTDOWN}
	send, {space}
	Send, {ALTUP}
}


; sleep, 100
clipboard := ClipSaved ; restore original clipboard
ClipSaved := "" ; free the memory in case the clipboard was very large



return




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

#If WinActive("ahk_class Progman") || WinActive("ahk_exe regedit.exe") ; Desktop and regedit
; Make Ctrl+R (refresh) also work on the desktop and regedit
^r::
	KeyWait, %A_ThisHotkey%
	Send, {F5} ; F5 also refreshes
return
#If






#IfWinActive, ahk_class Progman ; Desktop
!F4::return ; No Alt+F4 shutdown dialog on desktop
!q::return ; No Alt+Q (which I remapped to Alt+F4) shutdown dialog on desktop


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


; F5 to copy addressbar
F5::
	Send, ^l ; Select address bar
	Sleep 10
	Send, ^c ; Copy
	Send, {F6} ; Deselect address bar
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








OnClipboardChange:
if(A_EventInfo=1)
	text_selected := true
else
	text_selected := false
return




















; RunCMD

RunCMD(CmdLine, WorkingDir:="", Codepage:="CP0", Fn:="RunCMD_Output") {  ;         RunCMD v0.94        
Local         ; RunCMD v0.94 by SKAN on D34E/D37C @ autohotkey.com/boards/viewtopic.php?t=74647                                                             
Global A_Args ; Based on StdOutToVar.ahk by Sean @ autohotkey.com/board/topic/15455-stdouttovar

  Fn := IsFunc(Fn) ? Func(Fn) : 0
, DllCall("CreatePipe", "PtrP",hPipeR:=0, "PtrP",hPipeW:=0, "Ptr",0, "Int",0)
, DllCall("SetHandleInformation", "Ptr",hPipeW, "Int",1, "Int",1)
, DllCall("SetNamedPipeHandleState","Ptr",hPipeR, "UIntP",PIPE_NOWAIT:=1, "Ptr",0, "Ptr",0)

, P8 := (A_PtrSize=8)
, VarSetCapacity(SI, P8 ? 104 : 68, 0)                          ; STARTUPINFO structure      
, NumPut(P8 ? 104 : 68, SI)                                     ; size of STARTUPINFO
, NumPut(STARTF_USESTDHANDLES:=0x100, SI, P8 ? 60 : 44,"UInt")  ; dwFlags
, NumPut(hPipeW, SI, P8 ? 88 : 60)                              ; hStdOutput
, NumPut(hPipeW, SI, P8 ? 96 : 64)                              ; hStdError
, VarSetCapacity(PI, P8 ? 24 : 16)                              ; PROCESS_INFORMATION structure

  If not DllCall("CreateProcess", "Ptr",0, "Str",CmdLine, "Ptr",0, "Int",0, "Int",True
                ,"Int",0x08000000 | DllCall("GetPriorityClass", "Ptr",-1, "UInt"), "Int",0
                ,"Ptr",WorkingDir ? &WorkingDir : 0, "Ptr",&SI, "Ptr",&PI)  
     Return Format("{1:}", "", ErrorLevel := -1
                   ,DllCall("CloseHandle", "Ptr",hPipeW), DllCall("CloseHandle", "Ptr",hPipeR))

  DllCall("CloseHandle", "Ptr",hPipeW)
, A_Args.RunCMD := { "PID": NumGet(PI, P8? 16 : 8, "UInt") }      
, File := FileOpen(hPipeR, "h", Codepage)

, LineNum := 1,  sOutput := ""
  While (A_Args.RunCMD.PID + DllCall("Sleep", "Int",0))
    and DllCall("PeekNamedPipe", "Ptr",hPipeR, "Ptr",0, "Int",0, "Ptr",0, "Ptr",0, "Ptr",0)
        While A_Args.RunCMD.PID and (Line := File.ReadLine())
          sOutput .= Fn ? Fn.Call(Line, LineNum++) : Line

  A_Args.RunCMD.PID := 0
, hProcess := NumGet(PI, 0)
, hThread  := NumGet(PI, A_PtrSize)

, DllCall("GetExitCodeProcess", "Ptr",hProcess, "PtrP",ExitCode:=0)
, DllCall("CloseHandle", "Ptr",hProcess)
, DllCall("CloseHandle", "Ptr",hThread)
, DllCall("CloseHandle", "Ptr",hPipeR)

, ErrorLevel := ExitCode

Return sOutput  
}
