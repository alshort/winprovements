; Winprovements.ahk
; Common automation routines, hotkeys etc. I use to improve Windows
;
; Andrew Lamzed-Short

; AHK Cruft
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
             ,Email:        "Thunderbird"}
             
HeadsetVolume := 15
             
             
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



; +---------------------+
; | Useful Key-Bindings |
; +---------------------+

#!h::
  ; Headphones toggle - use quieter settings
  SoundGet, CurrentVolume
  NewVolume := Floor(CurrentVolume) = 100 ? HeadsetVolume : 100
  SoundSet, %NewVolume%
return

; Win + Alt + Down
#!Down::WinMinimize, A ; Minimize active window



; +----------------+
; | Typing-related |
; +----------------+
; Expansions
::afaik::as far as I know
::brb::Be right back!
::btw::by the way
::ttyl::Talk to you later!

; Autocorrection
::notepadd::notepad{+}{+}



; +----------------+
; | Helper Methods |
; +----------------+

; This is where I'd put my helper methods
; IF I HAD SOME.



; +----------+
; | Includes |
; +----------+
#Include %A_ScriptDir%/Explorer.ahk
