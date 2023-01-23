; NOTE: This only works if you have the Proton Square userchrome.css style applied. I made these scripts specifically for MY workflow, and I could not be bothered to change the colors to make it compatibile with vanilla firefox.
; https://github.com/leadweedy/Firefox-Proton-Square

#SingleInstance Force
CoordMode, Pixel, Screen

#IfWinActive ahk_exe Taskmgr.exe

$LButton::
CoordMode Pixel
ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight,*n C:\Scripts\Hotkeys\Assets\OpenResourceMonitorTaskmgr.png
If(ErrorLevel != 0)
{
	SendInput, {LButton}
	goto theEnd
}


if (A_ThisHotkey = A_PriorHotkey and A_TimeSincePriorHotkey < 600)
{
    ; Found
	; Do nothing (so the widget mode doesn't open)
}
else
	SendInput, {LButton}


theEnd:
Return

^j::
; MouseClick Left
; Sleep 458
; MouseClick Left




















return

#IfWinActive