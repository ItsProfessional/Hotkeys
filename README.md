# Hotkeys
My AutoHotkey scripts

These scripts are configured such that the path of this README.md is: `C:\Hotkeys\README.md`

To install, run install.bat. This will create a task scheduler entry for `Main.ahk`, this is so because dropping it or creating a shortcut to it in the startup folder launches it as non-elevated, and if you make it run as elevated in that method it will show a UAC prompt every time you boot your system. The task schedule method removes all these issues.

The Main.ahk script executes the subscripts. I cannot just `#include` all of them as many of these scripts include continous loops which can stop execution of the central Main.ahk script if they are `#include`d.

`Main.ahk` executes all of the scripts, as well as `Hub.ahk`. `Hub.ahk` `#include`s the categorized main scripts, such as `C:\Hotkeys\Windows\Windows.ahk`

## Disclaimer
These scripts are written specifically for MY workflow. I will *not* be fixing issues that do not affect me. I will still be merging pull requests though.
