T;made by Naess from supermemo.wiki discord server, deep gratitude to him!
;this script makes it so that 1-9 keys on numpad correspond to different priorities, for more details check out https://github.com/rajlego/supermemo-ahk/blob/main/naess%20priorities%2010-25-2020.png?raw=true

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
CoordMode, Mouse, Screen
#SingleInstance, force
SetTitleMatchMode,2

GroupAdd, SuperMemo, ahk_class TBrowser ;Browser
GroupAdd, SuperMemo, ahk_class TContents ;Content Window (Knowledge Tree)
GroupAdd, SuperMemo, ahk_class TElWind ;Element window
GroupAdd, SuperMemo, ahk_class TSMMain ;Toolbar

#IfWinActive ahk_group SuperMemo
{
#If GetKeyState("CapsLock", "T")
0::
{
send, !p
Random, OutputVar, 0.00,3.6076
send, %OutputVar%
send, {enter}
}
return

1::
{
send, !p
Random, OutputVar, 3.6077,8.4131
send, %OutputVar%
send, {enter}
}
return

2::
{
send, !p
Random, OutputVar, 8.4132,18.4917
send, %OutputVar%
send, {enter}
}
return

3::
{
send, !p
Random, OutputVar, 18.4918,28.0885
send, %OutputVar%
send, {enter}
}
return

4::
{
send, !p
Random, OutputVar, 28.0886,37.2103
send, %OutputVar%
send, {enter}
}
return

5::
{
send, !p
Random, OutputVar, 37.2104,46.24
send, %OutputVar%
send, {enter}
}
return

6::
{
send, !p
Random, OutputVar, 46.25,57.7575
send, %OutputVar%
send, {enter}
}
return

7::
{
send, !p
Random, OutputVar, 57.7576,70.5578
send, %OutputVar%
send, {enter}
}
return

8::
{
send, !p
Random, OutputVar, 70.5579,90.2474
send, %OutputVar%
send, {enter}
}
return

9::
{
send, !p
Random, OutputVar, 90.2474,99.99
send, %OutputVar%
send, {enter}
}
return
}

#IfWinActive ahk_group SuperMemo
{
#If GetKeyState("CapsLock", "T")
!0::
{
    send, !+x
    sleep, 300
    Random, OutputVar, 0.00, 3.6076
    send, %OutputVar%
    send, {enter}
}
return

!1::
{
    send, !+x
    sleep, 300
    Random, OutputVar, 5, 10
    send, %OutputVar%
    send, {enter}
}
return

!2::
{
    send, !+x
    sleep, 300
    Random, OutputVar, 10, 20
    send, %OutputVar%
    send, {enter}
}
return

!3::
{
    send, !+x
    sleep, 300
    Random, OutputVar, 20, 30
    send, %OutputVar%
    send, {enter}
}
return

!4::
{
    send, !+x
    sleep, 300
    Random, OutputVar, 30, 40
    send, %OutputVar%
    send, {enter}
}
return

!5::
{
    send, !+x
    sleep, 300
    Random, OutputVar, 40, 50.24
    send, %OutputVar%
    send, {enter}
}
return

!6::
{
    send, !+x
    sleep, 300
    Random, OutputVar, 50, 60
    send, %OutputVar%
    send, {enter}
}
return

!7::
{
    send, !+x
    sleep, 300
    Random, OutputVar, 60.7576, 70.5578
    send, %OutputVar%
    send, {enter}
}
return

!8::
{
    send, !+x
    sleep, 300
    Random, OutputVar, 70.5579, 90.2474
    send, %OutputVar%
    send, {enter}
}
return

!9::
{
    send, !+x
    sleep, 300
    Random, OutputVar, 90.2474, 99.99
    send, %OutputVar%
    send, {enter}
}
return
}

#IfWinActive ahk_group SuperMemo
{
#If GetKeyState("CapsLock", "T")
~^0::
{
    send, !p
    sleep, 5
    send, !i
    sleep, 5
    send, 1
    send, {enter}
}
return

~^1::
{
    send, !p
    sleep, 5
    send, !i
    sleep, 5
    Random, OutputVar, 4, 7
    send, %OutputVar%
    send, {enter}
}
return

~^2::
{
    send, !p
    sleep, 5
    send, !i
    sleep, 5
    Random, OutputVar, 10, 18
    send, %OutputVar%
    send, {enter}
}
return

~^3::
{
    send, !p
    sleep, 5
    send, !i
    sleep, 5
    Random, OutputVar, 17, 23
    send, %OutputVar%
    send, {enter}
}
return

~^4::
{
    send, !p
    sleep, 5
    send, !i
    sleep, 5
    Random, OutputVar, 26, 35
    send, %OutputVar%
    send, {enter}
}
return

~^5::
{
    send, !p
    sleep, 5
    send, !i
    sleep, 5
    Random, OutputVar, 58, 67
    send, %OutputVar%
    send, {enter}
}
return

~^6::
{
    send, !p
    sleep, 5
    send, !i
    sleep, 5
    Random, OutputVar, 89, 97
    send, %OutputVar%
    send, {enter}
}
return

~^7::
{
    send, !p
    sleep, 5
    send, !i
    sleep, 5
    Random, OutputVar, 153, 171
    send, %OutputVar%
    send, {enter}
}
return

~^8::
{
    send, !p
    sleep, 5
    send, !i 
    sleep, 5
    Random, OutputVar, 344, 377
    send, %OutputVar%
    send, {enter}
}
return

~^9::
{
    send, !p
    sleep, 5 
    send, !i
    sleep, 5
    Random, OutputVar, 708, 733
    send, %OutputVar%
    send, {enter}
}
return
}

#If GetKeyState("CapsLock", "T")
1::Numpad1
2::Numpad2
3::Numpad3
4::Numpad4
5::Numpad5
6::Numpad6
7::Numpad7
8::Numpad8
9::Numpad9
0::Numpad0
