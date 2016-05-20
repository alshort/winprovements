#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

; Explorer.ahk
; Makes Windows Explorer so much better

GetActiveExplorerWindow() {
  static objShell := ComObjCreate("Shell.Application")
  WinHWND := WinActive("A")    ; Active window
  for Item in objShell.Windows
    if (Item.HWND = WinHWND)
      return Item        ; Return active window object
  return -1    ; No explorer windows match active window
}

NavigateTo(Path) {
  if (-1 != objIE := GetActiveExplorerWindow())
    objIE.Navigate(Path)
  else
    Run, % Path
}

#IfWinActive ahk_class CabinetWClass

#h::

  RegRead, HiddenFiles_Status, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden
  ;MsgBox, %HiddenFiles_Status%
  if (HiddenFiles_Status = 2) {
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1 
  } else {
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2 
  }
  Send, {F5}

return

#s::
  NavigateTo("C:\Users\Andrew L-S\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup")
return

#IfWinActive