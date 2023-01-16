#Requires Autohotkey v2.0-beta.1+
; #NoTrayIcon
#SingleInstance Force

PID

Loop
{
try {
 WinWait("Confirm Save As")
 WinActivate()
 FocusedHwnd := ControlGetFocus("A")
 FocusedClassNN := ControlGetClassNN(FocusedHwnd)
 WinGet, newpid, PID, A
 if(FocusedClassNN = "Button2" & newpid != pid2) {
	ControlFocus("Button1")
	WinGet, pid2, PID, A
 }
 ; MsgBox 'Control with focus = {Hwnd: ' FocusedHwnd ', ClassNN: "'  '"}'
 }
}
