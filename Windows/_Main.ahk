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



;; BEGIN HOTKEYS


; Unstick modifier keys. This really comes in handy when I mess something up while testing my ahk script sometimes
; The reason I have pagedown with all modifier possibilities remapped is because when a modifier is stuck, it'll be applied on pagedown. So I include all possibilities here, I don't really use pagedown anyway
	+PgDn::
	!PgDn::
	^PgDn::
	^+PgDn::
	^!PgDn::
	^!+PgDn::
	!+PgDn::
	#PgDn::
	#+PgDn::
	#!PgDn::
	#^PgDn::
	#^+PgDn::
	#^!PgDn::
	#^!+PgDn::
	#!+PgDn::
	PgDn::
		Send, {LCtrl up}
		Send, {RCtrl up}
		Send, {RAlt up}
		Send, {RAlt up}
		Send, {LShift up}
		Send, {RShift up}
		Send, {F24 up}
		Soundbeep, 800, 450
	return


; just some useful stuff
^!k::Run, C:\Program Files\AutoHotkey\WindowSpy.ahk

!+r:: ; Restart explorer
	WinGet, h, ID, ahk_class Progman
	PostMessage, 0x12, 0, 0, , ahk_id %h%	;wm_quit
	sleep, 25
	Run, explorer.EXE
return


!q::!F4 ; Alt+f4
!d::!space ; Flow launcher ;; I had this set to win+r before




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




; Minimize/restore window
	!m::
	If !lastWindow || !WinExist("ahk_id " lastWindow)
	   lastWindow:=WinExist("A")
	WinGet,MinMax,MinMax,ahk_id %lastWindow%
	If MinMax=-1
	   WinActivate, ahk_id %lastWindow%
	else WinMinimize, ahk_id %lastWindow%
Return




; Center window
!c::
	WinGetPos, , , WinWidth, WinHeight, A
	WinMove, A,, (A_ScreenWidth - WinWidth) / 2, (A_ScreenHeight - WinHeight) / 2
return


; Command Prompt
!+Enter::
#t::
^!t::Run, %ComSpec%, %UserProfile%



!o:: ; focus previous window
	winNumber := 0
	WinGet win, List
	
	Loop % win {
		WinGetTitle ttitle, % winTitle := "ahk_id " win%A_Index% ; Window title
		WinGet proc, ProcessName, %winTitle%                     ; Window process
		WinGetClass class, %winTitle%                            ; Window class
		winNumber += !(class ~= "i)Toolbar|#32770") && ttitle > ""
			&& (ttitle != "Program Manager" || proc != "Explorer.exe")
	} Until Min(2, win) = winNumber
	
	WinActivate % winTitle
return

!`;:: ; alt+semicolon: clear all notifications		 
Send #n
Send {Tab}
Send {Tab} 
Send {Space} 
Send {Esc}
return




; Everything search
^!s::Run, C:\Program Files\Everything\Everything.exe




; Alt+{function key} -> Fn+{function key} (simulated)

; Brightness
!F2::AdjustScreenBrightness(-5)
!F3::AdjustScreenBrightness(5)

; Volume keys

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



; QUICK Remap alt+<x> to win+<x>
!1:: ;; win+number keys
!2::
!3::
!4::
!5::
!6::
!7::
!8::
!9:: ;; win+number keys END
!e:: ; for explorer
!s:: ; for windows search
!r:: ; win+r run dialog
!a:: ; action center
	KeyWait, %A_ThisHotkey%
	NewHotkey := StrReplace(A_ThisHotkey, "!", "#")
	Send, %NewHotkey%
return









; Manual, but somewhat compact remapping
; Note: the reason I use keywait in most of these hotkeys, is because just remapping using key_x::key_y doesn't work because the modifiers of key_x are held while the key_y is being pressed, if that makes sense

!n:: ; win+d -> minimize/restore all windows
	KeyWait, %A_ThisHotkey%
	; NewHotkey := StrReplace(A_ThisHotkey, "!", "#")
	Send, #d
return
!+n:: ; win+d -> minimize/restore all windows
	KeyWait, %A_ThisHotkey%
	Keywait, alt
	keywait, shift
	; NewHotkey := StrReplace(A_ThisHotkey, "!", "#")
	Send, #n
return
!p:: ; alt+p -> prtscr
	Keywait, alt
	; NewHotkey := StrReplace(A_ThisHotkey, "!", "#")
	Send, {PrintScreen}
return














; shutdown/logout/restart/etc tool

!+p::
    ih := InputHook()
    ih.KeyOpt("{All}", "ES")  ; End and Suppress
    ; Exclude the modifiers
    ih.KeyOpt("{LCtrl}{RCtrl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}", "-ES")
    ih.Start()
	ToolTip, Usage: (l) lock`, (e) logout`, (s) suspend`, (h) hibernate`, (r) reboot`, (Shift+s) shutdown
    ErrorLevel := ih.Wait()  ; Store EndReason in ErrorLevel
	result := ih.EndMods . ih.EndKey
	
	;set $mode_system System (l) lock, (e) logout, (s) suspend, (h) hibernate, (r) reboot, (Shift+s) shutdown (m) turn off monitor
	
    RegisteredHotkeys := { "l":"l", "e":"e", "s":"s", "h":"h", "r":"r", "m":"m"
		,">+s": "Shift+s", "<+s": "Shift+s"
		,">!>+p": "Alt+Shift+P", "<!<+p": "Alt+Shift+P", ">!<+p": "Alt+Shift+P", "<!>+p": "Alt+Shift+P"
		,"Escape": "Escape" }
	
	if(RegisteredHotkeys.HasKey(result)) {
		switch result {
			case "l":
				DllCall("LockWorkStation")
			
			case "e":
				Shutdown, 0+4 ; logoff+force
			
			case "s":
				; Suspend
				DllCall("PowrProf\SetSuspendState", "int", 0, "int", 1, "int", 1)
			
			case "h":
				; Hibernate
				DllCall("PowrProf\SetSuspendState", "int", 1, "int", 1, "int", 1)
			
			case "r":
				; Reboot
				Shutdown, 2+4 ; reboot+force
			
			case "m":
				; Turn off the monitor
				SendMessage, 0x0112, 0xF170, 2,, Program Manager  ; 0x0112 is WM_SYSCOMMAND, 0xF170 is SC_MONITORPOWER.
			
			case ">+s", "<+s":
				; Shutdown
				Shutdown, 1+4 ; shutdown+force
			
			case ">!>+p", "<!<+p", ">!<+p", "<!>+p", "Escape":
				; do nothing
			
			default:
				msgbox, Unhandled hotkey was pressed: %result% ; key combo is registered (in the array), but not processed in this switch statement
		}
		
		
		ToolTip, ; Clear usage tooltip set above
		
		
	} else {
		MsgBox, Unregistered hotkey was pressed: %result%
	}
return








; Hotkeys for launching programs

!+\::Run, %A_AppData%\Spotify\Spotify.exe
!+{::Run, %A_ProgramFiles%\Mozilla Firefox\firefox.exe
!+}:: ; localappdata doesn't exist as a variable in ahk for some reason
	EnvGet, A_LocalAppData, LocalAppData
	Run, %A_LocalAppData%\Discord\Update.exe --processStart Discord.exe
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
;#v::send, ^{Sc029} ; just #v::^` doesn't work for some reason





; Disable Alt+Esc as I press it by accident sometimes
!Esc::return
!+Esc::return

; I don't want this hotkey
#h::return

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
^!#+Space::return


; Disable feedback hub hotkey
#l::return


; Remap capslock to escape
; CapsLock::Escape ; note: I moved this to sharpkeys
+CapsLock::CapsLock
+Esc::CapsLock ; I need this because of sharpkeys remapping capslock to escape
^+Esc::^+Esc ; the above lines mess up the ctrl+shift+esc hotkey that launches taskmgr, so I need to add this here




; Disable alt menu acceleration
; ~LAlt::Sendinput {Blind}{F13}
; ~RAlt::Sendinput {Blind}{F13}

; ; ~LAlt::
; ; Sendinput {Blind}{F19}
; ; KeyWait, LAlt
; ; return

; ; ~RAlt::
; ; Sendinput {Blind}{F19}
; ; KeyWait, RAlt
; ; return



; Individual program hotkeys


;;; GD
#IfWinActive, ahk_exe GeometryDash.exe
RButton::LButton ; Make right click also work in GD

; for switching levels in the level selector
h::left
l::right

#IfWinActive ;;; GD END








;;; VSCODIUM
app = %ProgramFiles%\Windhawk\UI\VSCodium.exe
#If WinActive("ahk_exe" app)
^+b::^b
#If ;;; VSCODIUM END



;;; FIREFOX
#IfWinActive, ahk_exe firefox.exe ; Firefox specific hotkeys
^+n::^+p ; And also make ctrl+shift+n work in firefox aswell
#IfWinActive ;;; FIREFOX END










;;; Flow Launcher SETTINGS
#IfWinActive Settings ahk_exe Flow.Launcher.exe ; flow launcher settings window
Esc::return ; Don't close flow launcher settings when clicking escape
#IfWinActive ;;; Flow Launcher SETTINGS END


;;; FLOW LAUNCHER POPUP (SEARCHER)
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

	if (text_selected) ; text_selected is set by OnClipboardChange (see at the bottom of this script, or use ctrl+f)
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

#IfWinActive ;;; FLOW LAUNCHER POPUP (SEARCHER)





; Individual program hotkeys END
#IfWinActive
#IfWinActive
#IfWinActive
#IfWinActive














; GROUPED PROGRAM HOTKEYS


;;; EXPLORER
#IfWinActive, ahk_group Explorer
	
	!+enter::!enter ; Alt+shift+enter should open file properties dialog. I need this because I remapped alt+enter to launch cmd

#IfWinActive ;;; EXPLORER END



#If WinActive("ahk_class Progman") || WinActive("ahk_exe regedit.exe") ; Desktop and regedit

	; Make Ctrl+R (refresh) also work on the desktop and regedit
	^r::
		KeyWait, %A_ThisHotkey%
		Send, {F5} ; F5 also refreshes
	return

#If ; DESKTOP AND REGEDIT END






#IfWinActive, ahk_class Progman ; Desktop

	!q:: ; alt+q is remapped to alt+f4 above
	!F4::return ; No Alt+F4 shutdown dialog on desktop

#IfWinActive ; DESKTOP END





;;;; HOTKEYS FOR ALL BROWSERS
#IfWinActive, ahk_group Browser


	; Make ctrl+shift+n work in browsers other than firefox
	^+p::
		If WinActive("ahk_exe firefox.exe")
			Send, %A_ThisHotkey% ; do the default thing in firefox
		Else
			Send, ^+n ; Send ctrl+shift+n (open new incognito/private window)
	return


	!h::!Home ; Remap Alt+H to Alt+Home (Go to newtab)


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


	^F1::send ^+{pgup} ;this will MOVE a tab to the left
	^F2::send ^+{pgdn} ;this will MOVE a tab to the right.

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




	;;;;; DESELECT HIGHLIGHTED TEXT
	^Esc::
	!Esc::

			PixelGetColor, color, 139, 47, RGB
			if(color != 0x2190A7 && color != 0x42414D) { ; the addressbar AND the search bar (it shows up when you start typing in the addressbar. EDIT: this hotkey is focused for firefox btw, not tested on chrome!!!) is focused
				ClipSaved := ClipboardAll ; save current clipboard
				clipboard := "" ; empty clipboard
				Send, ^c ; copy selected text (if selected)
				ClipWait, 0.01 ; wait for the clipboard to contain data
				
				if text_selected { ; text_selected is set by OnClipboardChange (see at the bottom of this script, or use ctrl+f)
					WinGetPos,,,Xmax,Ymax,A ; get active window size
					Ycenter := Ymax/2
					Send, {ALTDOWN}
					ControlClick, x10 y%Ycenter%, A ; this is the safest point, I think
					Send, {ALTUP}
				}

				; sleep, 100
				clipboard := ClipSaved ; restore original clipboard
				ClipSaved := "" ; free the memory in case the clipboard was very large
				
			}

	return




#IfWinActive
;;;; Hotkeys for ALL BROWSERS END





; GROUPED PROGRAM HOTKEYS END
#IfWinActive
#IfWinActive
#IfWinActive
#IfWinActive


































;;; FUNCTIONS, labels, miscellaneous stuff I would otherwise put at the top of the script, but I've put them here to not clutter te top of the script


OnClipboardChange:
if(A_EventInfo=1)
	text_selected := true
else
	text_selected := false
return


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

;;;;; RUNCMD END