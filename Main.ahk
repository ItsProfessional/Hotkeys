#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
Menu, Tray, Icon, shell32.dll, 283


Run, Hub.ahk, %A_ScriptDir%
Run, Windows\CloseSearchWithWinKey.ahk
Run, Windows\EscapeToUnfocusAddressbar.ahk
Run, Windows\FirefoxBetterDragURLToAddressbar.ahk
Run, Windows\FullJumplistContextMenu.ahk
Run, Windows\NoStupidTXTExtension.ahk

; Run, Windows\Alt_menu_acceleration_DISABLER_using_F13.ahk
; Run, Windows\Both_Accelerated_Scrolling_1.3_AND_Cursor_click_visualizer-100UI.ahk
; Run, Windows\MButtonCollapseDownloadsBar.ahk
; Run, Windows\NoPlaceholderText_NewTextDocument.ahk
; Run, Windows\NoRenameConfirmation.ahk


Run, Premiere\PREMIERE_MOD_Right_click_timeline_to_move_playhead.ahk
Run, Premiere\YES_DELETE_EXISTING_KEYFRAMES.ahk

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


Reload ; reloads this script, the main.ahk which will reload all other scripts.


; here I tried to use the runme plugin for notepad++ for getting it to reload the current file dynamically, it does kind of work but its not reliable
; CoordMode, "Mouse", "Window"

; BlockInput, SendAndMouse
; BlockInput, MouseMove
; BlockInput, On

; MouseGetPos xpos, ypos

; MouseMove, 821, 63, 0
; Click, Left

; MouseMove, xpos, ypos, 0

; BlockInput MouseMoveOff
; BlockInput Off


; beep sounds
; Soundbeep, 1000, 500 ; the problem with this is that it pauses the script while beeping, which isn't that big of an issue, but I want to eliminate that completely using a seperate script.
Run, Utilities\Beep.ahk
return
