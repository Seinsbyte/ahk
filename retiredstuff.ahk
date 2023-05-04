;;; Invert the number row:
$1:: Send {!}
$2:: Send {@}
$3:: Send {#}
$4:: Send {Backspace}
$5:: Send {`%}
$6:: Send {^}
$7:: Send {&}
$8:: Send {*}
$9:: Send {(}
$0:: Send {)}
$Backspace:: Send {~}
$~:: Send {$}
$!:: Send {1}
$@:: Send {2}
$#:: Send {3}
$$:: Send {4}
$%:: Send {5}
$^:: Send {6}
$&:: Send {7}
$*:: Send {8}
$(:: Send {9}
$):: Send {0}
$PgUp:: Send {\}
$RWin:: Send {AppsKey}

; Ctrl::Alt
; Alt::Ctrl
; Capslock::Esc
; Esc::Capslock


;;; Browser MAPS
#ifWinactive, ahk_class Chrome_WidgetWin_1
#ifWinactive, ahk_class MozillaWindowClass
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


;;; windows maps
; $F12:: ; (dont remember what this does)
; Send, ^{c}
; Send, ^+{c}
; return

;; this is an example of modes in ahk.
^!a::mode := !mode
^!d::Send, ^!{F4}
#If mode
^!d::SoundSet, +5

