; Winprovements.ahk
; Autocorrection and hotstring expansions
;
; Andrew Lamzed-Short

; AHK Cruft
#NoEnv  ; Performance and compatibility for future AutoHotkey releases.
SendMode Input  ; Better speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Consistent starting directory.
#SingleInstance Force


; Expansions
::afaik::as far as I know
::Afaik::As far as I know

::brb::be right back
::Brb::Be right back!

::btw::by the way
::Btw::By the way

::ttyl::Talk to you later!

; Corrections
::notepadd::notepad{+}{+}