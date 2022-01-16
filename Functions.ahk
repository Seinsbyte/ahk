; Remaps
Capslock::Esc
Esc::Capslock


;BRAVE MAPS
#ifWinactive, ahk_class Chrome_WidgetWin_1
                $F15::Send ^+{Tab} ;next tab
                $F16::Send ^{Tab} ;previous tab
                $F19::Send ^+t ;reopen last closed tab (q)
                $F20::Send ^w ; Close tab (w)
                $F21::Send ^l ;go to Address bar (a)
                $F22::Send ^h ;open hiStory (s)
                $F23::Send ^j ;open Downloads (d)
                Control & F7::Send ^t ;open new Tab (t)



;Supermemo Maps
;#ifWinactive, ahk_class TElWind
#If WinActive("ahk_class TElWind") || WinActive("ahk_exe PluginHost.exe") || WinActive("ahk_class TContents")

$F13::Send ^{F9} ;Escape into Emacs(Esc)
$F14::Send !c ;Go to position in tree (1)
$F15::Send !{PgUp} ;Go to previous position in tree (2)
$F16::Send !{PgDn} ;Go to nextposition in tree (3)
$F17::Send ^t ; Cycle between elements (4)
$F18::Send !{F1} ; New Task(5)
$F19::Send !\ ;delete before cursor (q)
$F20::Send !. ;delete  after cursor  (w)
$F21::Send ^+{Enter} ;All done  (a)
$F22::Send !x ;Show again (s)
$F23::Send ^d ;dismiss (d)



;Windows Maps
#ifWinactive
$F1::toggleMaxWindow()
$F2::Send !{Tab}
$F3::Send #{Down}
$F4::Send !{F4}


$F8::launchOrSwitchEmacs()
$F9::launchOrSwitchBrave()
$F10::launchOrSwitchSupermem()

RAlt & j::Send (){Left} ; insert paren, move cursor in between
RAlt & k::Send {{}{}}{Left} ; insert braces
RAlt & l::Send []{Left}     ; insert square brackets

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
