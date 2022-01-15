#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;keyhistory
;#InstallMouseHook
#installkeybdhook
SetNumLockState,On
SetNumLockState,AlwaysOn

SetScrollLockState,Off
SetScrollLockState,AlwaysOff
return
;

CapsLock::
	KeyWait, CapsLock
	If (A_PriorKey="CapsLock")
		SetCapsLockState, % GetKeyState("CapsLock","T") ? "Off" : "On"
Return

#If, GetKeyState("CapsLock", "P") ;Your CapsLock hotkeys go below

;i::+Tab
i::Up
j::Left
;k::Tab
k::Down
l::Right ;u::Send {Home}
u::-  ;o::Send {End}
;u::Send {End}
o::Run C:\A Steel Trap\Duo\best ahk\done\move_from_photos_to_end_of_title.ahk
;o::Send {End} ;p::Send {PgUp}
p::Run C:\A Steel Trap\Duo\best ahk\done\item_specifics.ahk  ;p::Send {Home}
[::Send {End}
]::Send {PgDn}
=::Send {PgUp}
`;::Send {BS}
Space::Send {Return}
0::Send {PgUp}
1::6
2::7
3::8
4::9
5::
SC029::-

WheelLeft::^PgUp
WheelRight::^PgDn
;XButton2::Home
;XButton1::End


sc045::Send {down 9}
Wheeldown::Down
Wheelup::Up
!m::Run C:\A Steel Trap\Duo\best ahk\search_master_list_box.ahk
^F7::Run C:\A Steel Trap \Duo\best ahk\close firefox tabs to the right.ahk
^PgUp::Run C:/A Steel Trap/Duo/best ahk/done/photo_gallery.ahk
^PgDn::Run C:/A Steel Trap/Duo/best ahk/done/photo_gallery_open_double_including_previous_photo.ahk
Numlock::Run C:\A Steel Trap\Duo\best ahk\6bitStart.ahk

LButton::Run C:\A Steel Trap\Duo\best ahk\activatesixbit.ahk
;RButton::Run C:\A Steel Trap\Duo\best ahk\ahk to do\clickdragphotos.ahk
RButton::Run C:\A Steel Trap\Duo\best ahk\done\organize_photo_order_click.ahk
MButton::Run C:\A Steel Trap\Duo\best ahk\done\organize_photo_order_shoes-dbltagmove_click.ahk
Enter::^v
PgUp::Volume_Up
PgDn::Volume_Down
Right::Media_Next
Left::Media_Prev
Down::Media_Play_Pause
q::y
;w::u
w::Run C:\A Steel Trap\Duo\best ahk\done\google.ahk
;e::i
e::!d
r::o
t::p
y::send t-strap `

;a::h
;s::j
;d::k
;f::l
a::Run C:\A Steel Trap\Duo\best ahk\done\firefox.ahk
s::f4
d::^w
f::^t


g::send t-shirt `
h::Run C:\A Steel Trap\Duo\best ahk\clickwind_pending_pics.ahk

z::b
x::n
c::m
v::send v-neck`  ;v::Run C:\A Steel Trap\Duo\best ahk\done\save_and_exit.ahk ;b::send pullover ` ;n::Run C:\A Steel Trap\Duo\best ahk\done\centermouse&click.ahk
b::send t-strap `
;n::Up
;n::+Tab
n::Send .5`
;m::Down
;m::Send {-}`
m::+Tab
;Send {-}`
;m::send {#}` ;Tab::Send {Tab 5}
;Tab::Send {Tab 3} ;
Tab::Run C:\A Steel Trap\Duo\best ahk\timenowdate.ahk
End::Run C:\A Steel Trap\Duo\best ahk\done\saveclose2.ahk
;^F11::Run C:\A Steel Trap\Duo\best ahk\ahk to do\clickwind_delete_photos.ahk
;,::Send .5`  ;,::Send {!}`  
,::Send /P`
.::Send .5`
;.::Run C:\A Steel Trap\Duo\best ahk\done\new_item.ahk
F12::Send e-mail address
/::Run C:\A Steel Trap\Duo\best ahk\done\saveclose2.ahk
;Backspace::Run C:\A Steel Trap\Duo\best ahk\ahk to do\clickdragphotos.ahk
Backspace::Run C:\A Steel Trap\Duo\best ahk\done\photo_gallery_close_all_photos.ahk
;Backspace::Run C:\A Steel Trap\Duo\best ahk\done\organize_photo_order_click.ahk
;Run C:\A Steel Trap\Duo\best ahk\music\copy.ahk
;Left::+Tab
;Delete::Run C:\A Steel Trap\Duo\best ahk\music\copy.ahk
^c::Run C:\A Steel Trap\Duo\best ahk\clickwind_pending_pics.ahk

;
ScrollLock::
	KeyWait, ScrollLock
	If (A_PriorKey="ScrollLock")
		SetScrollLockState, % GetKeyState("ScrollLock","T") ? "Off" : "On"
Return

#If, GetKeyState("ScrollLock", "P") ;Your ScrollLock hotkeys go below

;i::+Tab
i::s
a::Run C:\A Steel Trap\Duo\best ahk\done\new_item_clear_photos.ahk
s::Run C:\A Steel Trap\Duo\best ahk\done\organize_photo_order.ahk
;d::Run C:\A Steel Trap\Duo\best ahk\done\organize_photo_order_shoes-dbltagmove.ahk
Tab::f4
Numpad0::
Numpad1::
;Numpad2::Send {Down 9}
Numpad2::Tab
Numpad3::
Numpad4::Left
;Numpad5::Down
Numpad5::+Tab
Numpad6::Right
Numpad7::
Numpad8::Up
Numpad9::Run C:\A Steel Trap\Duo\best ahk\click_win_sold_items_search_when_shipping.ahk
NumpadEnter::
t::Send personal email`
;w::^w
w::^t
f::Run C:\A Steel Trap\Duo\best ahk\done\firefox.ahk
g::Run C:\A Steel Trap\Duo\best ahk\done\google.ahk



Up::Send {Up 5}
;

NumLock::
	KeyWait, NumLock
		
#If, GetKeyState("NumLock", "P")

Numpad0::Space
Numpad1::Run C:\A Steel Trap\Duo\best ahk\done\saveclose2.ahk
Numpad2::Tab
Numpad3::Send {Tab 6}
Numpad4::Left
;Numpad5::Run C:\A Steel Trap\Duo\best ahk\click_win_sold_items_search_when_shipping.ahk
Numpad5::+Tab
Numpad6::Right
Numpad7::Down
Numpad8::Send phone number`
NumpadDot::Run C:\A Steel Trap\Duo\best ahk\done\numpad_half.ahk
;NumpadSub::SC028  ;this is for the single quotation character
NumpadDiv::Run C:\A Steel Trap\Duo\best ahk\done\saveclose2.ahk
;NumpadMult::SC01A
NumpadMult::Run C:\A Steel Trap\Duo\best ahk\done\brackets.ahk
NumpadSub::SC01B
NumpadEnter::Space
Numpad9::Run C:\A Steel Trap\Duo\best ahk\done\numpad_quarter.ahk
NumpadAdd::Run C:\A Steel Trap\Duo\best ahk\done\99cents.ahk


e::+Tab
d::Tab
a::Run C:\A Steel Trap\Duo\best ahk\6bitStart.ahk
s::Run C:\A Steel Trap\Duo\best ahk\done\item_specifics.ahk
q::Run C:\A Steel Trap\Duo\best ahk\done\saveclose2.ahk
;f::Run C:\A Steel Trap\Duo\best ahk\done\add_single_listing.ahk
f::send c108`
d::Send Does not Apply`
c::Send logininfo{Tab}`
r::Run C:\A Steel Trap\Duo\best ahk\done\move_mouse_to_shipping.ahk
w::Run C:\A Steel Trap\Duo\best ahk\done\change_price.ahk
v::Run C:\A Steel Trap\Duo\best ahk\done\new_item.ahk
Tab::Send {Tab 5}
4::Send 14-14.5 - S mens `
5::Send 15-15.5 - M mens `
6::Send 16-16.5 - L mens `
7::Send 17-17.5 - XL mens `
8::Send 18-18.5 - 2XL mens `
Space::Send {Space 7}
t::Send otheremail`
i::+Tab
k::Tab
`;::Send {BS}
j::Send {Tab 7}

Return

;
