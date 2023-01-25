#SingleInstance Force
#MaxThreadsPerHotkey 2

Toggle := false

^j::
global Toggle := !Toggle
While Toggle
{
	If WinActive("ahk_class GLFW30") {
		CoordMode, "Pixel", "Screen"
		PixelGetColor, color, 1857, 420
		If(color = 0xDDDDDD){
			if GetKeyState("LButton")
				Send "{LButton Up}"
		} Else {
			if !GetKeyState("LButton")
				Send "{LButton Down}"
		}
	}
}
return