; Explorer.ahk
; Makes Windows Explorer better
; (though it could still do with tabs...)

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force



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


; If File Explorer is the active window,
; execute these context-dependent commands first

#IfWinActive ahk_class CabinetWClass

; Win + H
; Toggle visibility of hidden files
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

; Win + S
; Open AppData\Roaming Folder
#a::
  NavigateTo(A_AppData)
return

; Win + S
; Open StartUp Folder
#s::
  NavigateTo(A_StartUp)
return

; Win + S
; Open Downloads Folder
#d::
  docs = %A_MyDocuments%
  dls = %docs%\..\Downloads
  NavigateTo(dls)
return

#IfWinActive