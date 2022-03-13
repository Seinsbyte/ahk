;;; Remaps
$F7::Send +{F7}
$F15::Send ^{2} ; This is for deepl
; Ctrl::Alt
; Alt::Ctrl
; Capslock::Esc
; Esc::Capslock

; ; Invert the number row:
; $1:: Send {!}
; $2:: Send {@}
; $3:: Send {#}
; $4:: Send {Backspace}
; $5:: Send {`%}
; $6:: Send {^}
; $7:: Send {&}
; $8:: Send {*}
; $9:: Send {(}
; $0:: Send {)}

; $Backspace:: Send {~}
; $~:: Send {$}
; $!:: Send {1}
; $@:: Send {2}
; $#:: Send {3}
; $$:: Send {4}
; $%:: Send {5}
; $^:: Send {6}
; $&:: Send {7}
; $*:: Send {8}
; $(:: Send {9}
; $):: Send {0}

; LControl & RAlt::Alt 
$RWin:: Send {AppsKey}

;;; BRAVE MAPS
#ifWinactive, ahk_class Chrome_WidgetWin_1
$Numpad1::Send !{Left}
$Numpad2::Send !{Right}
$Numpad3::Send ^l ;go to Address bar (a)
$Numpad4::Send ^w ; Close tab (w)
$Numpad5::Send ^h ;open hiStory (s)
$Numpad6::Send ^j ;open Downloads (d)
$Numpad7::Send ^t ;open new Tab (t)
$Numpad8::Send ^+{Tab} ;next tab
$Numpad9::Send ^{Tab} ;previous tab
$Numpad0::Send ^+t ;reopen last closed tab (q)


;;; Supermemo Maps

#If WinActive("ahk_class TElWind") || WinActive("ahk_exe PluginHost.exe") || WinActive("ahk_class TContents") || WinActive("ahk_class TStats")

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
$Numpad4:: Send !c ;Go to position in tree
$Numpad5:: Send !{PgUp} ;Go to previous position in tree 
$Numpad6:: Send !{PgDn} ;Go to nextposition in tree 
$Numpad7::Send ^t ; Cycle between elements 
$Numpad8::Send !{F1} ; New Task
$Numpad9::Send !{Left} ;prev element 
$Numpad0::Send ^d ;dismiss 
$Numpad1::Send ^+{Enter} ;All done  
$NumpadAdd::Send ^{Up} ; goto parent
$NumpadDot::Send ^{F7} ;Set read point
$NumpadMult::Send !{F7} ; Go to read point
$NumpadDiv::Send !{F12} ; Go to read point
$NumpadEnter::
Send, !{Left}
Sleep, 150
Send, !{Right}
return
$XButton1::Send !x ; show again
$XButton2::Send !z ; Cloze

$F13::Send ^{F13}
$F14::    ;Change root concept
CoordMode, Mouse, Screen  
Mouseclick , Left, 1370, 333
KeyWait, Tab, D
Mouseclick, Left, 1906, 467
Mouseclick, Left, 1790, 464
WinActivate, ahk_class TElWind
return 
; $F16::Send ^{F16} ; being used for linking
; $F17::Send ^{F17} ; being used for linking
$F18::Send ^{F18}

; #If WinActive("ahk_class TContents")
; $i:: Send {Up}
; $k:: Send {Down}
; $u:: Send ^{Up}
; $o:: Send ^{Down}
; $9:: Send ^!{Enter}

#if WinActive("ahk_class TElWind")
; more intuitive inter-element linking, inspired by obsidian
; 1. go to the element you want to link to and press ctrl+alt+g
; 2. go to the element you want to have the hyperlink, select text and press ctrl+alt+k
$F16::
send ^g
WinWaitActive, ahk_class TInputDlg,, 0
send ^c{esc}
return

$F17::
ControlGetFocus, currentFocus, ahk_class TElWind
if (currentFocus != "Internet Explorer_Server2" && currentFocus != "Internet Explorer_Server1") {  ; not editing html
    return
}
element_number := RegExReplace(Clipboard, "^#")
hyperlink = SuperMemoElementNo=(%element_number%)
send ^k
WinWaitActive, ahk_class Internet Explorer_TridentDlgFrame,, 2  ; a bit more delay since everybody knows how slow IE can be
sendinput %hyperlink%
send {enter}
return

;;; Windows Maps
#ifWinactive
$F1::toggleMaxWindow()
$F2::Send !{Tab}
$F3::Send #{Down}
$F4::Send !{F4}
$F5::launchOrSwitchBrave()
$F6::launchOrSwitchSupermem()
; F7 opens launchy
$F8::switchToEmacs()
$F9::switchToExplorer()
; $F10::launchOrSwitchFoxit()
$F10::switchToFoxit()

;;; Emacs maps
#ifWinactive, ahk_class Emacs
; $Numpad0::Send ^d ; dismiss 
; $Numpad1::Send {Left} ;All done  
; $Numpad2::Send {Down} ;
; $Numpad3::
; SetKeyDelay, 5
; Send, {Space}
; Send, {;}
; $Numpad4::Send !c ;Go to position in tree
; $Numpad5::Send {Up} ;Go to previous position in tree 
; $Numpad6::Send !{PgDn} ;Go to nextposition in tree 
$Numpad7::
#IfWinExist ahk_class Qt5QWindowIcon
SetKeyDelay, 5
WinActivate, ahk_class Qt5QWindowIcon
Send, {Space}
WinActivate, ahk_class Emacs
; #IfWinExist ahk_class classFoxitReader
; SetKeyDelay, 5
; WinActivate, ahk_class classFoxitReader
; Send, {Space}
; WinActivate, ahk_class Emacs
Send, ^{g}
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
 WinActivate, ahk_class Chrome_WidgetWin_1
}
Else
{
 Run "C:\Program Files\BraveSoftware\Brave-Browser\Application\brave.exe"
}
Return
}


switchToEmacs(){
IfWinNotExist, ahk_class Emacs
  Run emacsclient --create-frame --alternate-editor=""
GroupAdd, taranemacses, ahk_class Emacs
if WinActive("ahk_exe emacs.exe")
	GroupActivate, taranemacses, r
else
	WinActivate ahk_class Emacs ;you have to use WinActivatebottom if you didn't create a window group.
}

; launchOrSwitchEmacs()
; {
; IfWinExist ahk_class Emacs
; {
;  WinActivate, ahk_class Emacs
; }
; Else
; {
;  Run emacsclient --create-frame --alternate-editor=""
; }
; Return
; }

launchOrSwitchSupermem()
{
IfWinExist ahk_exe sm18.exe
{
 WinActivate, ahk_exe sm18.exe
}
Else
{
 Run "c:/Users/ppeda/AppData/Local/SuperMemoAssistant/SuperMemoAssistant.exe"
}
Return
}

; This is a script that will always go to The last explorer window you had open.
; If explorer is already active, it will go to the NEXT last Explorer window you had open.
; CTRL Numpad2 is pressed with a single button stoke from my logitech G15 keyboard -- Macro key 17. 

switchToExplorer(){
IfWinNotExist, ahk_class CabinetWClass
	Run, explorer.exe
GroupAdd, taranexplorers, ahk_class CabinetWClass
if WinActive("ahk_exe explorer.exe")
	GroupActivate, taranexplorers, r
else
	WinActivate ahk_class CabinetWClass ;you have to use WinActivatebottom if you didn't create a window group.
}

switchToFoxit(){
IfWinNotExist, ahk_class classFoxitReader
   Run "c:/Program Files (x86)/FoxitPDFReader.exe"
GroupAdd, taranfoxits, ahk_class classFoxitReader
if WinActive("ahk_exe FoxitPDFReader.exe")
	GroupActivate, taranfoxits, r
else
	WinActivate ahk_class classFoxitReader ;you have to use WinActivatebottom if you didn't create a window group.
}

;Local Variables:
;    mode: outline-minor
;    outline-regexp:  ";;;"
;    End:

