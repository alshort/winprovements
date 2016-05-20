#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

programs := {GoogleDrive: "C:\Program Files (x86)\Google\Drive\googledrivesync.exe"
			,DropBox: "C:\Program Files (x86)\Dropbox\Client\Dropbox.exe"
			,Thunderbird: "Thunderbird"}
			
Sleep, 30 * 1000
Run, % programs["DropBox"]

Sleep, 115 * 1000
Run, % programs["GoogleDrive"]

Sleep, 135 * 1000
Run, % programs["Thunderbird"]

ExitApp