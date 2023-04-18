#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force
#NoTrayIcon

WM_MOUSEMOVE := 0x200
HiddenWindows := A_DetectHiddenWindows
DetectHiddenWindows, On
TrayTitle := "AHK_class Shell_TrayWnd"
ControlNN := "ToolbarWindow322"
IcSz := 24
Loop, 2
{
	ControlGetPos, xTray,yTray,wdTray,htTray, %ControlNN%, %TrayTitle%
	y := htTray - 10
	While (y > 0)
	{
		x := wdTray - IcSz/2
		While (x > 0)
		{
			point := (y << 16) + x
			PostMessage, %WM_MOUSEMOVE%, 0, %point%, %ControlNN%, %TrayTitle%
			x -= IcSz/2
		}
		y -= IcSz/2
	}
	TrayTitle := "AHK_class NotifyIconOverflowWindow"
	ControlNN := "ToolbarWindow321"
	IcSz := 32
}
DetectHiddenWindows, %HiddenWindows%
