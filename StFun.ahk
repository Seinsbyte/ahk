;;; Remaps

ScrollLock::
Send {ScrollLock}
mode := !mode ;; this is an example of modes in ahk.
return

ringS := "ß"
send, %ringS%
return

^F6::
Send ^c                       ; For best compatibility: SendPlay
Clipboard := StrReplace(Clipboard, "ſ","s")
Clipboard := StrReplace(Clipboard, "ey","ei")
Clipboard := StrReplace(Clipboard, "¬ ","")
StringReplace, Clipboard, Clipboard, `r`n,%A_Space%, All
launchOrSwitchDeepl()
WinWaitActive, DeepL
; CoordMode, Mouse, Screen  
Mouseclick , Left, 400, 210
; Sleep 1000
Send ^a
Send ^v
return

#v::                            ; Text–only paste from ClipBoard
   Clip0 = %ClipBoardAll%
   ClipBoard = %ClipBoard%       ; Convert to text
Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
   Send ^v                       ; For best compatibility: SendPlay
   Sleep 50                      ; Don't change clipboard while it is pasted! (Sleep > 0)
   ClipBoard = %Clip0%           ; Restore original ClipBoard
   VarSetCapacity(Clip0, 0)      ; Free memory
Return

;;; Browser MAPS
#If mode && WinActive("ahk_class MozillaWindowClass") ; WinActive ("ahk_class Chrome_WidgetWin_1")
$a::Send ^l ;go to Address bar (a)
$t::Send ^t ; view a new *t*ab,  
$s::Send ^h ;open hiStory (s)
$d::Send ^+{Tab} ;next tab
$f::Send ^{Tab} ;previous tab
$g::Send ^w ; Close tab (g)
$b::Send ^+t ; *b*ack last closed tab
$r::Send ^j ;open Downloads
#If

;;; Supermemo Maps

#If mode && WinActive("ahk_exe sm18.exe")
; || WinActive("ahk_class TElWind") || WinActive("ahk_exe PluginHost.exe") || WinActive("ahk_class TContents") || WinActive("ahk_class TStats")
$$::
Send {AppsKey} ;will change the hook
Send {c}
Send {e}
Sleep, 400
Send {Enter}
return
$!::
Send !{\}
Send {Enter}
return
$?::
Send !{.}
Send {Enter}
return
$a:: Send !c ; *A*im at position in tr
$s:: Send ^t ; Cycle between elements 
$d:: Send !{PgUp} ;Go to previous position in tree 
$f:: Send !{PgDn} ;Go to nextposition in tree 
$g::
Send ^+{Enter} ; *G*ot it all done
Send {Enter}
Send {Enter}
return
; qwert
$q::Send ^{F7} ;Set read point q
$w::Send !{F7} ; Go to read point w
$e::Send !{Left} ;prev element ; 1 x marks the previous
$r::Send !{Right} ;prev element ; 2 x marks the previous
$t:: 
Send +^{end} ; ' makes cloZe until end of file and marks as done
Send !z
Sleep, 500
Send ^+{Enter} ;All done
Sleep, 400
Send ^+{Enter}
Sleep, 500
Send ^+{Enter}
return
; $F21::Send ^{Up} ; goto parent
$z:: Send !z
$x:: Send !{x}
$c:: Send ^{c}
$v:: Send ^{v}
#If

;;; Windows Maps
#ifWinactive
$F1::toggleMaxWindow()
$F2::Send !{Tab}
$F3::Send #{Down}
$F4::Send !{F4}
; $F5::launchOrSwitchBrave()
; $F5::launchOrSwitchFirefox()
$F5::launchOrSwitchEdge()
$F6::launchOrSwitchSupermem()
; F7 opens launchy
; $F8::switchToEmacs()
$F7::launchOrSwitchEagle()
$F8::launchOrSwitchVSCode()
; $F9::switchToFoxit()
#If mode
$<::switchToExplorer()
$>::Send {F13}
#If

;;; Emacs maps
#ifWinactive, ahk_class Emacs
$Numpad7::
; #IfWinExist ahk_class AcrobatSDIWindow
; SetKeyDelay, 5
; WinActivate, ahk_class AcrobatSDIWindow
; Send, {Space}
; WinActivate, ahk_class Emacs
; Send, ^{g}
#IfWinExist ahk_class Qt5QWindowIcon
SetKeyDelay, 5
WinActivate, ahk_class Qt5QWindowIcon
Send, {Space}
WinActivate, ahk_class Emacs
#IfWinExist ahk_class classFoxitReader
SetKeyDelay, 5
WinActivate, ahk_class classFoxitReader
Send, {Space}
WinActivate, ahk_class Emacs
Send, ^{g}
return
#If

;;; TreeSheets maps

;;; Send original key when 'mode' is not true
#If !mode
*~$*:: ; wildcard to capture all keys
return
#If



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

; launch or switch to Edge
; http://xahlee.info/mswin/autohotkey_switch_launch_app.html
; version 2021-02-21
launchOrSwitchEdge()
{
IfWinExist ahk_exe msedge.exe
{
 WinActivate, ahk_exe msedge.exe
}
Else
{
 Run ""C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
}
Return
}

; launch or switch to Firefox
; http://xahlee.info/mswin/autohotkey_switch_launch_app.html
; Version 2021-02-21 2022-01-19
launchOrSwitchFirefox()
{
if WinExist("ahk_class MozillaWindowClass")
{
WinActivateBottom, ahk_class MozillaWindowClass
}
Else
{
 Run "C:\Program Files\Mozilla Firefox\firefox.exe"
}
Return
}

launchOrSwitchVSCode()
{
if WinExist("ahk_exe Code.exe")
{
WinActivateBottom, ahk_exe Code.exe
}
Else
{
 Run "C:\Program Files\Microsoft VS Code\Code.exe"
}
Return
}

launchOrSwitchEagle()
{
if WinExist("ahk_exe Eagle.exe")
{
WinActivateBottom, ahk_exe Eagle.exe
}
Else
{
 Run "D:\OneDrive\Eagle\Eagle.exe"
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
 Run "C:\SuperMemo\sm18.exe"
}
Return
}

launchOrSwitchDeepl()
{
IfWinExist ahk_class HwndWrapper[DeepL.exe;;089bbf13-7ece-44c0-baa9-d55b7b996262]
{
 WinActivate, ahk_class HwndWrapper[DeepL.exe;;089bbf13-7ece-44c0-baa9-d55b7b996262]
}
Else
{
 Run "C:\Users\ppeda\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\DeepL"
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
