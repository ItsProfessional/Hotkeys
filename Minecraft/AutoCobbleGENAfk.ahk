#Requires AutoHotkey v2.0
#SingleInstance Force
#MaxThreadsPerHotkey 2

Toggle := false

^j::
{
	global Toggle := !Toggle
	While Toggle
	{
		HotIfWinActive "ahk_class GLFW30" 
		{
			CoordMode("Pixel", "Screen")
			If(PixelGetColor(1857, 420) = 0xDDDDDD){
			
				if GetKeyState("LButton")
					Send "{LButton Up}"

			} Else {
				if !GetKeyState("LButton")
					Send "{LButton Down}"
			}
		}
	}
}