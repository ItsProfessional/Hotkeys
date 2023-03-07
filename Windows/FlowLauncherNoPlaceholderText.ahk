#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

Loop
{
	try {
		WinWaitActive, ahk_class HwndWrapper[Flow.Launcher`;`;1e547da7-cdbb-443b-b672-ef0f60ff5013]
		
		Send, ^a
		Send, ^{BackSpace}
		
		WinWaitClose
	}
}