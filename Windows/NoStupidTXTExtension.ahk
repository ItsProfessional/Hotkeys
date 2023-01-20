#Requires Autohotkey v2.0-beta.1+
; #NoTrayIcon
#SingleInstance Force
pid2 := -1

Loop
{
	WinWait("ahk_class #32770")
	WinWaitActive("ahk_class #32770")
	If !WinActive("ahk_exe firefox.exe")
		Continue
	

	FocusedHwnd := ControlGetFocus("A")
	FocusedClassNN := ControlGetClassNN(FocusedHwnd)
	 
	global newpid := WinExist("A")
	if(newpid = pid2)
		continue
	global pid2 := WinExist("A")
		
	; if(FocusedClassNN = "Button2") {
	; ControlFocus("Button1")
	; }
	 
	 
	SendInput("^a")
	; Send("^c")

	; ClipWait ; optional

	; MyVar := %clipboard%
	 
	 
	OldClip := A_Clipboard
	A_Clipboard := ""
	Send("^a^c")
	ClipWait 1
	VarForClip := A_Clipboard

	; MsgBox(VarForClip)
	; Name := SubStr(VarForClip, 1, -4)
	; Extension := SubStr(VarForClip, -4)

	SplitPath(VarForClip,,,, &Name)
	SplitPath(VarForClip,,, &Extension)
	
	
	SplitPath(Name,,,, &Name2)
	If(Name != Name2 && Extension = "txt") {
		SplitPath(Name,,, &Extension2)
		Result := Name2 . "." . Extension2
		A_Clipboard := Result
		Send("^v")
	}
	
	Send("^a")
	
	A_Clipboard := OldClip
	
	
	
	
	
	
	Sleep 25
	Send("{Tab}")
	Send("{Right}")
	Sleep 25
	SendInput("All Files")
	Sleep 30
	Send("+{Tab}")
	
	
	
	
	
	WinWaitClose
}