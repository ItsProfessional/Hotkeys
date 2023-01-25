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