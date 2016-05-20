#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

shortcuts := {Vim:      "C:\Program Files (x86)\Vim\vim74\gvim.exe"
             ,Todo:     "C:\Program Files (x86)\Hughesoft\todotxt.net\todotxt.exe"
             ,KeePass:  "S:\KeePass Password Safe 2\KeePass.exe"
             ,Chrome:   "Chrome"
             ,Explorer: "Explorer"
             ,CtrlPnl:  "Control Panel"
             ,NotepadPP:"Notepad++"}

; +----------------+
; | Helper Methods |
; +----------------+



; +-------------------+
; | Program shortcuts |
; +-------------------+

; Vim
^#v:: ; Ctrl + Win + v
  Run, % shortcuts["Vim"]
return

; Google Chrome
^#c:: ; Ctrl + Win + c
  Run, % shortcuts["Chrome"]
return

; File Explorer
^#x:: ; Ctrl + Win + x
  Run, % shortcuts["Explorer"]
return

; Control Panel
^#!c:: ; Ctrl + Win + Alt + c
  Run, % shortcuts["CtrlPnl"]
return

; todo.txt
^#t:: ; Ctrl + Win + t
  Run, % shortcuts["Todo"]
  Sleep, 500
  
  ; Reposition in bottom-right corner
  WinGetPos,,, width, height, todotxt.net
  WinGetPos,,,, tray_height, ahk_class Shell_TrayWnd
  WinMove, todotxt.net,, A_ScreenWidth - width, A_ScreenHeight - height - tray_height
return

; KeePass Password Bank
^#k::
  Run, % shortcuts["KeePass"]
return

; Notepad++
^#n::
  Run, % shortcuts["NotepadPP"]
return

^#!e:: ; Email
  Run, Thunderbird
return


; +---------------------+
; | Useful Key-Bindings |
; +---------------------+

#!h::
  ; Headphones toggle - use quieter settings
  SoundGet, volume
  NewVolume := Floor(volume) = 100 ? 20 : 100
  SoundSet, %NewVolume%
return


; +----------+
; | Includes |
; +----------+
#Include Autocorrection.ahk
#Include Twitch.ahk
#Include Explorer.ahk