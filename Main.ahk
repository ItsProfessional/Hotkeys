#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, shell32.dll, 283
#InstallKeybdHook
#MaxHotkeysPerInterval 2000
Process, Priority, , H
SendMode Input

;These next two lines are very important. You have to change the "menu mask key" away from being CTRL, to something that won't result in cross-talk. Read this thread to learn the details: https://autohotkey.com/boards/viewtopic.prhp?f=76&t=57683
#MenuMaskKey vk07 ; vk07 is unassigned.
#UseHook



; Main subscripts
Run, Hub.ahk, %A_ScriptDir%



; WINDOWS SCRIPTS

; Makes pressing the win key close windows search, instead of reopening the start menu
Run, Windows\CloseSearchWithWinKey.ahk

; Makes pressing escape unfocus the search bar, if it is focused in firefox. Just like chromium browsers
Run, Windows\EscapeToDefocusAddressbarFirefox.ahk

; Deselect text, if selected
; Run, Windows\EscapeToDeselectTextInBrowser.ahk

; Make it so that when you drag a link to the addressbar, it'll set the addressbar content to that. This happens by default in chromium-based browsers, but in firefox, it just goes to that link. This fixes that
; Run, Windows\FirefoxBetterDragURLToAddressbar.ahk

; My mouse has started double clicking. As annoying as it is, I'm trying out a software solution by using AHK to add a debounce time, to fix this. I will have to replace this mouse though, at some point, which sucks.
Run, Windows\MouseDebounce.ahk
; Run, Windows\BuggyMouse.ahk

; When right-clicking items in the jumplist, always emulate shift+right-click. This adds options like "Open file location", making things more convenient
Run, Windows\FullJumplistContextMenu.ahk

; Removes the extra ".txt" extension when downloading things in browsers (in chrome atleast). Without this, *.bat files would sometimes be downloaded as *.bat.txt
Run, Windows\NoStupidTXTExtension.ahk

; Disable ".txt" extension when creating a new text document
; Run, Windows\NoPlaceholderText_NewTextDocument.ahk

; Auto-confirm the "Are you sure you want to rename the file extension?" popup
; Run, Windows\NoRenameConfirmation.ahk



; PREMIERE PRO SCRIPTS
; Allows right-clicking the timeline to move playhead
; Run, Premiere\RightClickTimelineToMovePlayhead.ahk
; Run, Premiere\AutoConfirmDeleteKeyframes.ahk

; PHOTOSHOP SCRIPTS
Run, Photoshop\MButtonPanning.ahk
Run, Photoshop\PhotoshopHoldUndo.ahk






; Script reloader
; TODO: Fix this bug: Currently, if you spam ctrl+r too fast it'll release the ctrl key automatically for some reason which makes it just send r as a letter to notepad++.

$^r::
MouseGetPos,,, id
WinGetClass, Class, ahk_id %id%

If(!WinActive("ahk_class Notepad++") && Class != "Notepad++") ; If not active or hovering over, send normal key and return
{
	Send, ^r
	return
}

If(!WinActive("ahk_class Notepad++"))
	WinActivate, ahk_class Notepad++
WinWaitActive, ahk_class Notepad++


Send, ^s ; save current file in notepad++
Sleep 10




SetTitleMatchMode, 2
SetTitleMatchMode, slow
#WinActivateForce
DetectHiddenWindows On

; Close all ahk scripts (except this one)
Process,Exist
OWN_ID=%ErrorLevel%

Loop
{
	Process, Exist, AutoHotkey.exe
	processId=%ErrorLevel%
	
	If processId = %lastId%
		break
	IfEqual, processId, 0, Break
	
	If OWN_ID != %processId%
		Process, Close, %processId%
	
	lastId = %processId%
}

sleep 100

Reload ; reloads this script, the main.ahk. which will reload all other scripts.
Run, Utilities\Beep.ahk ; beep sound


return
