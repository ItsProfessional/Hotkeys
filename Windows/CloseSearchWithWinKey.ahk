#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

#IfWinActive, ahk_class Windows.UI.Core.CoreWindow
$LWin::
$RWin:: ; Close Search with Windows key
{
	WinGetTitle, Title, A
	If(Title = "Search") ; Check whether the active window is the search window
	{
		WinClose, A
	}
	Else
		Send, A_PriorHotkey
}

#IfWinActive