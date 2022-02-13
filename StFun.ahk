;;; Remaps
$F15::Send ^{2}
; Ctrl::Alt
; Alt::Ctrl
Capslock::Esc
Esc::Capslock
F9::Send ~
F10::Send {^}
; LControl & RAlt::Alt

;;; BRAVE MAPS
#ifWinactive, ahk_class Chrome_WidgetWin_1
$Numpad3::Send ^l ;go to Address bar (a)
$Numpad4::Send ^w ; Close tab (w)
$Numpad5::Send ^h ;open hiStory (s)
$Numpad6::Send ^j ;open Downloads (d)
$Numpad7::Send ^t ;open new Tab (t)
$Numpad8::Send ^+{Tab} ;next tab
$Numpad9::Send ^{Tab} ;previous tab
$Numpad0::Send ^+t ;reopen last closed tab (q)


;;; Supermemo Maps

#If WinActive("ahk_class TElWind") || WinActive("ahk_exe PluginHost.exe") || WinActive("ahk_class TContents")

$Numpad2:: ; This is for adding a new topic to a specific concept 
SetKeyDelay, 100
Send, {Alt down}n{Alt up}
Send, {Ctrl down}{Shift down}p{Shift up}{Ctrl up}
Send, {Alt down}g{Alt up}
return
$Numpad3:: ;Escape into Emacs
Send, ^{F9}
Sleep, 250
; WinActivate, ahk_class ConsoleWindowClass
; Send, #{Down}
WinMinimize, ahk_class ConsoleWindowClass
; WinMinimize, ahk_exe emacsclient.exe
WinActivate, ahk_class Emacs
CoordMode, Mouse, Screen  
MouseMove, 1050,580
Winmove, ahk_class Emacs,,560,349,1024,450
; Sleep, 250
; MouseMove, 1050,580
return
$Numpad4::Send !c ;Go to position in tree
$Numpad5::Send !{PgUp} ;Go to previous position in tree 
$Numpad6::Send !{PgDn} ;Go to nextposition in tree 
$Numpad7::Send ^t ; Cycle between elements 
$Numpad8::Send !{F1} ; New Task
$Numpad9::Send !{Left} ;prev element 
$Numpad0::Send ^d ;dismiss 
$Numpad1::Send ^+{Enter} ;All done  
; $NumpadAdd::Send !x ;Show again (add to list)
$NumpadAdd::Send ^{Up}
$NumpadDot::Send ^{F7} ;Set read point
$NumpadMult::Send !{F7} ; Go to read point
$NumpadDiv::Send !{F12} ; Go to read point
$NumpadEnter::Send !z ; Cloze
$XButton1::Send !x ; show again
$XButton2::Send !z ; Cloze

$F13::Send ^{F13}
$F14::Send ^{F14}
$F16::Send ^{F16}
$F17::Send ^{F17}
$F18::Send ^{F18}

F12::    ; This function makes clozes out of some predefined pair
ClipboardOld := ClipboardAll
Clipboard := ""
Send, q
Send, ^a
Send, ^c
clipboard := clipboard  ; Converts clipboard into plain text
cpa := Clipboard
RegExReplace(cpa,"\«","",count)
Clipboard := ClipboardOld
ClipboardOld := ""
Send, {Right}
Send, ^{Home}
Loop, %count%
{
	ClipboardOld := ClipboardAll
	Clipboard := ""
	InsertPoint := 0
	InsertPoint2 := 0
	ClipboardFirst := ""
        Length := 0
          Loop
	{
		Send, ^+{Right}
		A_Index2 := A_Index
		Send, ^c
		Sleep, 20
		Length := StrLen(Clipboard)
		InsertPoint := RegExMatch(Clipboard,"[\«]")
        ;MsgBox, InsertPoint %InsertPoint% ; for debugging
		If (InsertPoint = 0) 
        {
            If (A_Index2 >= 100)
            {
                break
            }
            continue
        }
        else
        {
			break
        }
	}
Send, {Right}
        Loop
	{
		Send, ^+{Right}
		A_Index2 := A_Index
		Send, ^c
		Sleep, 20
		Length := StrLen(Clipboard)
		InsertPoint := RegExMatch(Clipboard,"[\»]")
        ;MsgBox, InsertPoint %InsertPoint% ; for debugging
		If (InsertPoint = 0) 
        {
            If (A_Index2 >= 100)
            {
                break
            }
            continue
        }
        else
        {
			break
        }
	}
    ; Since we may overshoot the . or other special character by use of Ctrl + -> in Windows
    ; we have to Shift + <- back by how much we overshot
    If(InsertPoint > 0 && InsertPoint <> Length)
    {
     GoLeftBy := Length - InsertPoint
     Loop %GoLeftBy%
     {
        Send, +{Left}
     }
    }
        send !z
	Clipboard := ClipboardOld
	ClipboardOld := ""
}
return

;;; Windows Maps
#ifWinactive
$F1::toggleMaxWindow()
$F2::Send !{Tab}
$F3::Send #{Down}
$F4::Send !{F4}
$F5::launchOrSwitchBrave()
$F6::launchOrSwitchSupermem()
; Using f5 and f6 in emacs
; F7 opens launchy
$F8::launchOrSwitchEmacs()


;;; Emacs maps
#ifWinactive, ahk_class Emacs
; $Numpad0::Send ^d ; dismiss 
; $Numpad1::Send {Left} ;All done  
; $Numpad2::Send {Down} ;
; $Numpad3::Send {Right} ;Escape into Emacs
; $Numpad4::Send !c ;Go to position in tree
; $Numpad5::Send {Up} ;Go to previous position in tree 
; $Numpad6::Send !{PgDn} ;Go to nextposition in tree 
$Numpad7::
SetKeyDelay, 5
WinActivateBottom, ahk_class Qt5QWindowIcon
Send, {Space down}{Space up}
WinActivateBottom, ahk_class Emacs
return
; $Numpad8::Send !{F1} ; New Task
; $Numpad9::Send !{Left} ;prev element 
; $NumpadAdd::Send !x ;Show again (add to list)
; $NumpadDot::Send ^{F7} ;Set read point
; $NumpadMult::Send !{F7} ; Go to read point
; $NumpadDiv::Send !{F12} ; Go to read point
; $NumpadEnter::Send !z ; Cloze

;;; DEFUNS

; toggle maximize/restore current window
; Version 2021-02-21, 2021-05-26
; http://xahlee.info/mswin/autohotkey_toggle_maximize_window.html
toggleMaxWindow()
{
  WinGet, WinState, MinMax, A
  if (WinState = 1)
  {
    WinRestore, A
  }
  else
  {
    WinMaximize, A
  }
}

; launch or switch to Firefox
; http://xahlee.info/mswin/autohotkey_switch_launch_app.html
; version 2021-02-21
launchOrSwitchBrave()
{
IfWinExist ahk_class Chrome_WidgetWin_1
{
 WinActivateBottom, ahk_class Chrome_WidgetWin_1
}
Else
{
 Run "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
}
Return
}

launchOrSwitchEmacs()
{
IfWinExist ahk_class Emacs
{
 WinActivateBottom, ahk_class Emacs
}
Else
{
 Run emacsclient --create-frame --alternate-editor=""
}
Return
}

launchOrSwitchSupermem()
{
IfWinExist ahk_class TElWind
{
 WinActivateBottom, ahk_class TElWind
}
Else
{
 Run "c:/Users/ppeda/AppData/Local/SuperMemoAssistant/SuperMemoAssistant.exe"
}
Return
}

;Local Variables:
;    mode: outline-minor
;    outline-regexp:  ";;;"
;    End:
