; NOTE: This only works if you have the Proton Square userchrome.css style applied. I made these scripts specifically for MY workflow, and I could not be bothered to change the colors to make it compatibile with vanilla firefox.
; https://github.com/leadweedy/Firefox-Proton-Square

#SingleInstance Force
; CoordMode, Pixel, Screen
CoordMode, Mouse, Window

#IfWinActive ahk_exe Adobe Premiere Pro.exe

NumpadEnter::
CoordMode, pixel, Window
CoordMode, mouse, Window
CoordMode, Caret, Window
MouseGetPos, xposP, yposP ;------------------stores the cursor's current coordinates at X%xposP% Y%yposP%

;This (temporarily) blocks the mouse and keyboard from sending any information, which could interfere with the funcitoning of the script.
BlockInput, SendAndMouse
BlockInput, MouseMove
BlockInput, On
;The mouse will be unfrozen at the end of this function. Note that if you do get stuck while debugging this or any other function, CTRL SHIFT ESC will allow you to regain control of the mouse. You can then end the AHK script from the Task Manager.

SetKeyDelay, 0 ;NO DELAY BETWEEN STUFF sent using the "send"command! I thought it might actually be best to put this at "1," but using "0" seems to work perfectly fine.
; https://www.autohotkey.com/docs/commands/SetKeyDelay.htm


; SoundBeep, 500, 652


If WinExist("ahk_exe Audacity.exe") and Not WinActive ahk_exe Audacity.exe
{
WinActivate
} else {
Run, "C:\Program Files\Audacity\Audacity.exe"
WinWait, ahk_exe Audacity.exe
WinWaitActive, ahk_exe Audacity.exe,,0.5
Msgbox, aaa
}

Sleep 10

Send, ^a
Send, {Delete}

WinWaitActive No Audio Selected,,0.7
If WinActive("No Audio Selected")
	Send, {Enter}

Send, r


KeyWait, Space, D

MouseClick, Left, 148, 79,,0

Send, ^+e

WinWaitActive Export Audio

s := "0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z"

Loop, 3
   i .= s . ","

Sort, i, Random D,
i := SubStr(i, 1, 18)
i := StrReplace(i, ",")

SendInput, %i%
Send, {Enter}

WinWaitActive Warning,,0.2

If not ErrorLevel
{
Send, !n
WinWaitActive Export Audio
WinWaitClose, Export Audio
}

; Sleep 25

WinActivate, ahk_exe Adobe Premiere Pro.exe
Send, ^i
WinWaitActive Import
ControlFocus Edit2
SendInput, C:\Users\Admin\Music\Audacity
Sleep 25
Send {Enter}

ControlFocus Edit1
Sleep 25
SendInput, %i%
Send, {Enter}
WinWaitClose Import

; we're in the project panel already
Send, ^b
Sleep 5




if (A_CaretX = "")
{
;No Caret (blinking vertical line) can be found.

;The following loop is waiting until it sees the caret. THIS IS SUPER IMPORTANT, because Premiere is sometimes quite slow to actually select the find box, and if the function tries to proceed before that has happened, it will fail. This would happen to me about 10% of the time.
;Using the loop is also way better than just ALWAYS waiting 60 milliseconds like I was before. With the loop, this function can continue as soon as Premiere is ready.

;sleep 60 ;<—Use this line if you don't want to use the loop below. But the loop should work perfectly fine as-is, without any modification from you.

waiting2 = 0
loop
	{
	waiting2 ++
	sleep 33
	if (A_CaretX <> "")
		{
		; tooltip, CARET WAS FOUND
		break
		}
	if (waiting2 > 40)
		{
		; tooltip, FAIL - no caret found. `nIf your cursor will not move`, hit the button to call the preset() function again.`nTo remove this tooltip`, refresh the script using its icon in the taskbar.`n`nIt's possible Premiere tried to AUTOSAVE at just the wrong moment!
		;Note to self, need much better way to debug this than screwing the user. As it stands, that tooltip will stay there forever.
		;USER: Running the function again, or reloading the script, will remove that tooltip.
		;sleep 200
		;tooltip,
		sleep 20
		GOTO theEnding
		}
	}
sleep 1
}




Send, ^a
Sleep 20
SendInput, %i%
MouseMove, 82, 214


Click, Down
MouseMove, %xposP%, %yposP%


blockinput, MouseMoveOff ;returning mouse movement ability
BlockInput, off ;do not comment out or delete this line -- or you won't regain control of the keyboard!! However, CTRL ALT DELETE will still work if you get stuck!! Cool.

KeyWait, LButton, D


Click, Up

; MouseClickDrag, Left, , , %xposP%, %yposP%, 0 ;---clicks the left button down, drags this effect to the cursor's pervious coordinates and releases the left mouse button, which should be above a clip, on the TIMELINE panel.
sleep 5
MouseClick, middle, , , 1



theEnding:
return











#IfWinActive