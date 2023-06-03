#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#NoTrayIcon
#InstallKeybdHook
#MaxHotkeysPerInterval 2000
Process, Priority, , H

GroupAdd Explorer, ahk_class CabinetWClass
GroupAdd Explorer, ahk_class ExploreWClass
GroupAdd Explorer, ahk_class Progman
GroupAdd Explorer, ahk_class WorkerW
GroupAdd Explorer, ahk_class #32770

F2Pressed := False

Loop
{
	try {
		WinWaitActive, ahk_group Explorer
		ControlGetFocus, FocusedClassNN, A

		if(FocusedClassNN = "Edit1") {
			global F2Pressed
			If(!F2Pressed)
			{
				ControlGetText, Text, Edit1, A
				
				If(Text = "New Text Document.txt" Or RegExMatch(Text, "New Text Document \([0-9]+\)\.txt"))
					ControlSetText, Edit1,, A
			}
			
			Loop {
				ControlGetFocus, FocusedClassNN, A
				if(FocusedClassNN != "Edit1")
					break
			}
			

			F2Pressed := False
		}
	}
}

~F2::
global F2Pressed := True
return






; Control_GetClassNN(hWnd, hCtrl ) { ; SKAN: www.autohotkey.com/forum/viewtopic.php?t=49471
	; WinGet, CH, ControlListHwnd, ahk_id %hWnd%
	; WinGet, CN, ControlList, ahk_id %hWnd%
	; LF:= "`n",  CH:= LF CH LF, CN:= LF CN LF,  S:= SubStr( CH, 1, InStr( CH, LF hCtrl LF ) )
	; StringReplace, S, S,`n,`n, UseErrorLevel
	; StringGetPos, P, CN, `n, L%ErrorLevel%
	; Return SubStr( CN, P+2, InStr( CN, LF, 0, P+2 ) -P-2 )
; }