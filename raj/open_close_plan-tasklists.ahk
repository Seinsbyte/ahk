;script is meant to make it easy to open tasklists and plan no matter which workspace you're on or what application you're using
;to make it work, you need to have a separate exe named sm18j and have a separate collection you use for tasklists that opens it
;to make it work on all workspaces, from task view right click the sm collection and do "Show this window on all desktops"

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.

; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^SPACE::  Winset, Alwaysontop, , A



PrintScreen::
$!{DOWN}:
$AppsKey::
$!^p::
`::
F13::
DetectHiddenWindows, Off

if !WinExist("ahk_exe sm18j.exe") {
	run "C:\supermemo-collection\Journal.lnk"
}
else if WinActive("ahk_class TMsgDialog") {
	Send y
}
else if WinActive("ahk_class TPlanDlg") {
	Send {ESC}
}
else if WinActive("ahk_class TTaskManager") {
	Send {ESC}
	WinActivate ahk_exe sm18j.exe
	WinActivate ahk_class TElWind
	Send ^p
}
else if !WinActive("ahk_class TPlanDlg") {
	WinActivate ahk_exe sm18j.exe
	WinActivate ahk_class TElWind
	Send ^p
}
return

;opens tasklist globally, shortcut is f4 which you can modify
^AppsKey::
^PrintScreen::
!^t::
DetectHiddenWindows, Off

if !WinExist("ahk_exe sm18j.exe") {
	run "C:\supermemo-collection\Journal.lnk"
}
else if WinActive("ahk_class TMsgDialog") {
	Send y
}
else if WinActive("ahk_class TTaskManager") {
	Send {ESC}
}
else if WinActive("ahk_class TPlanDlg") {
	Send {ESC}
	WinActivate ahk_exe sm18j.exe
	WinActivate ahk_class TElWind
	Send {F4}{F4}
}
else if !WinActive("ahk_class TTaskManager") {
	
	WinActivate ahk_exe sm18j.exe
	WinActivate ahk_class TElWind
	Send {F4}{F4}
}
return

!PrintScreen::
!AppsKey::
!^s::
DetectHiddenWindows, Off

if !WinExist("ahk_exe sm18.exe") {
	run "C:\supermemo-collection\IR.lnk"
	
}
else if WinActive("ahk_exe sm18.exe") {
	;switchDesktopToLastOpened()
}

else if !WinActive("ahk_class TElWind") 
{
	WinActivate ahk_exe sm18.exe	
	WinActivate ahk_class TElWind
}
else if WinActive("ahk_exe sm18j.exe") 
{
	WinActivate ahk_exe sm18.exe	
	WinActivate ahk_class TElWind
}
return

+PrintScreen::
+AppsKey::
DetectHiddenWindows, Off
if !WinExist("ahk_exe msedge.exe") {
	run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"
	send !t
}
else if !WinActive("ahk_class msedge.exe") 
{
	WinActivate ahk_exe msedge.exe	
	send !t
}
return

$!+n::
WinActivate ahk_exe sm18.exe	
WinActivate ahk_class TElWind
send, !n
return






$!+1::                 ; Todo after IR
        winactivate ahk_class TElWind
        send, ^{g}
        send, 5712
        send, {Enter}
        return 


