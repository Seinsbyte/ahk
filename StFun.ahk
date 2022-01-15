; Remaps
Capslock::Esc
NumpadAdd::Capslock
+Space::Backspace

Numpad3::F13
Numpad4::F14
Numpad5::F15
Numpad6::F16
Numpad7::F17
Numpad8::F18
Numpad9::F19
Numpad0::F20
Numpad1::F21
Numpad2::F22
NumpadDot::F23


;BRAVE MAPS
#ifWinactive, ahk_class Chrome_WidgetWin_1

$Numpad3::Send ^l ;go to Address bar (a)
$Numpad4::Send ^w ; Close tab (w)
$Numpad5::Send ^h ;open hiStory (s)
$Numpad6::Send ^j ;open Downloads (d)
$Numpad7::Send ^t ;open new Tab (t)
$Numpad8::Send ^+{Tab} ;next tab
$Numpad9::Send ^{Tab} ;previous tab
$Numpad0::Send ^+t ;reopen last closed tab (q)


;Supermemo Maps
;#ifWinactive, ahk_class TElWind
#If WinActive("ahk_class TElWind") || WinActive("ahk_exe PluginHost.exe") || WinActive("ahk_class TContents")

$Numpad3::Send ^{F9} ;Escape into Emacs
$Numpad4::Send !c ;Go to position in tree
$Numpad5::Send !{PgUp} ;Go to previous position in tree 
$Numpad6::Send !{PgDn} ;Go to nextposition in tree 
$Numpad7::Send ^t ; Cycle between elements 
$Numpad8::Send !{F1} ; New Task
$Numpad9::Send !\ ;delete before cursor 
$Numpad0::Send ^d ;dismiss 
$Numpad1::Send ^+{Enter} ;All done  
$Numpad2::Send !x ;Show again (show a 2nd time)
$NumpadDot::Send !. ;delete  after cursor  
$NumpadEnter::Send !{F7} ; go to read point


;Windows Maps
#ifWinactive
$F1::toggleMaxWindow()
$F2::Send !{Tab}
$F3::Send #{Down}
$F4::Send !{F4}


$F8::launchOrSwitchEmacs()
$F9::launchOrSwitchBrave()
$F10::launchOrSwitchSupermem()



;;DEFUNS:
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
