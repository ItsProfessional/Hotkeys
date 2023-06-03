#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#NoTrayIcon
#InstallKeybdHook
#MaxHotkeysPerInterval 2000
Process, Priority, , H

PIDs := []

Loop
{
	WinWait, ahk_class #32770
	WinWaitActive, ahk_class #32770
	
	If !WinActive("ahk_exe firefox.exe") && !WinActive("ahk_exe chrome.exe") && !WinActive("ahk_exe brave.exe") && !WinActive("ahk_exe msedge.exe")
		Continue
	
	 
	global NewPID := WinExist("A")
	HasPID := False
	For Value in PIDs
	{
		If(Value = NewPID)
			HasPID := True
	}
	if(HasPID)
		continue
	PIDs.Push([NewPID])
	
	
	
	ControlGetText, Text, Edit1, A

	SplitPath, Text,,,, Name
	SplitPath, Text,,, Extension

	
	SplitPath, Name,,,, NameWithoutSecondExtension ; Get name of the name (to check if the whole text has two extensions)
	
	HasMultipleExtensions := Name != NameWithoutSecondExtension
	If(HasMultipleExtensions && Extension = "txt") { ; The file has multiple extensions and the last extension is "txt"
		SplitPath, Name,,, RealExtensionNotTXT ; Get the 2nd last extension
		NewText := NameWithoutSecondExtension . "." . RealExtensionNotTXT ; <name without txt> and then a period (.) and then <2nd last extension>

		ControlSetText, Edit1, %NewText%, A
	}
	
	; Switch to a different control and then switch back to Edit1 (to select the text in Edit1, without pressing ^a, since that can cause issues sometimes)
	ControlFocus, ComboBox2
	ControlFocus, Edit1

	WinWaitClose
}