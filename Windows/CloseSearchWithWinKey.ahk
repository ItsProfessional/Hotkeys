#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#NoTrayIcon
#InstallKeybdHook
#MaxHotkeysPerInterval 2000
Process, Priority, , H

#IfWinActive, ahk_class Windows.UI.Core.CoreWindow
$LWin::
$RWin:: ; Close Search with Windows key
{
	WinGetTitle, Title, A
	if(Title = "Search" or Title = "Start") ; Check whether the active window is the search window
	{
		WinClose, A
	}
	else
	{
		NewHotkey := "{" . StrReplace(A_ThisHotkey, "$", "") . "}"
		Send, %NewHotkey%
	}
}

#IfWinActive