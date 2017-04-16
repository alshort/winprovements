; Winprovements.ahk
; Common automation routines, hotkeys etc. I use to improve Windows
;
; Andrew Lamzed-Short

#NoEnv  ; Performance and compatibility for future AutoHotkey releases.
SendMode Input  ; Better speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Consistent starting directory.
#SingleInstance Force


; Configuration
Shortcuts := {PasswordSafe: "S:\KeePass Password Safe 2\KeePass.exe"
             ,Browser:      "Chrome"
             ,Explorer:     "Explorer"
             ,CtrlPnl:      "Control Panel"
             ,Editor:       "Notepad++"
             ,Email:        "Thunderbird"
			 ,Bash:         "bash.exe"
			 ,CMD:          "cmd.exe"}
             
global HeadsetVolume := 0
global Notifier := ""

; Load from configuration
global Config := "P:\global.ini"
IniRead, HeadsetVolume, %Config%, Headphones, Volume
IniRead, Notifier, %Config%, Notifications, Program             
			 

             
; +---------+
; | Startup |
; +---------+

SoundSet, 100



; +-----------------+
; | Program Hotkeys |
; +-----------------+
; ^ = Ctrl
; # = Win
; ! = Alt
; + = Shift

; Google Chrome
^#c::
  Run, % Shortcuts["Browser"]
return

; File Explorer
^#x::
  Run, % Shortcuts["Explorer"]
return

; Control Panel
^#!c::
  Run, % Shortcuts["CtrlPnl"]
return

; KeePass Password Bank
^#k::
  Run, % Shortcuts["PasswordSafe"]
return

; Notepad++
^#n::
  Run, % Shortcuts["Editor"]
return

; Thunderbird
^#!e::
  Run, % Shortcuts["Email"]
return


; Bash
^+#Space:: ;shell
  SetWorkingDir, P:\
  Run, % Shortcuts["Bash"]
  SetWorkingDir %A_ScriptDir% 
return

; CMD
^+#!Space:: ;shell
  Run, % Shortcuts["CMD"]
return

; Reload current script
^#w::
	Reload
return



; +---------------------+
; | Useful Key-Bindings |
; +---------------------+

#!h::
  ; Headphones toggle - use quieter settings
  SoundGet, CurrentVolume
  NewVolume := Floor(CurrentVolume) = 100 ? HeadsetVolume : 100
  SoundSet, %NewVolume%
  
  SendNotification("Volume", NewVolume)
return

; Win + Alt + Down
#!Down::WinMinimize, A ; Minimize active window



; Override Windows-default behaviours
#w::return
#f::return


; +-----------+
; | Functions |
; +-----------+
SendNotification(title, txt) {
	Run, %Notifier% -t %title% -m %txt%,,hide
	return
}


; +----------+
; | Includes |
; +----------+
#Include %A_ScriptDir%/Autocorrection.ahk
#Include %A_ScriptDir%/Explorer.ahk