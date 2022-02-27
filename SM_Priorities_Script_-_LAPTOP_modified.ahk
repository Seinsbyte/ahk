;made by Naess from supermemo.wiki discord server, deep gratitude to him!
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

!::
{
send, !p
Random, OutputVar, 3.6077,8.4131
send, %OutputVar%
send, {enter}
}
return

@::
{
send, !p
Random, OutputVar, 8.4132,18.4917
send, %OutputVar%
send, {enter}
}
return

#::
{
send, !p
Random, OutputVar, 18.4918,28.0885
send, %OutputVar%
send, {enter}
}
return

Backspace::
{
send, !p
Random, OutputVar, 28.0886,37.2103
send, %OutputVar%
send, {enter}
}
return

%::
{
send, !p
Random, OutputVar, 37.2104,46.24
send, %OutputVar%
send, {enter}
}
return

^::
{
send, !p
Random, OutputVar, 46.25,57.7575
send, %OutputVar%
send, {enter}
}
return

&::
{
send, !p
Random, OutputVar, 57.7576,70.5578
send, %OutputVar%
send, {enter}
}
return

*::
{
send, !p
Random, OutputVar, 70.5579,90.2474
send, %OutputVar%
send, {enter}
}
return

(::
{
send, !p
Random, OutputVar, 90.2474,99.99
send, %OutputVar%
send, {enter}
}
return


)::
{
send, !p
Random, OutputVar, 0.00,3.6076
send, %OutputVar%
send, {enter}
}
return
}

#IfWinActive ahk_exe PluginHost.exe
0::setPriorityPDF(0.00,3.6076)
1::setPriorityPDF(3.6077,8.4131)
2::setPriorityPDF(8.4132,18.4917)
3::setPriorityPDF(18.4918,28.0885)
4::setPriorityPDF(28.0886,37.2103)
5::setPriorityPDF(37.2104,46.24)
6::setPriorityPDF(46.25,57.7575)
7::setPriorityPDF(57.7576,70.5578)
8::setPriorityPDF(70.5579,90.2474)
9::setPriorityPDF(90.2474,99.99)

setPriorityPDF(min, max) {
    send, !+x
    Random, OutputVar, %min%, %max%
    send, %OutputVar%
    send, {enter}
}
return
