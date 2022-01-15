#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
SetDefaultMouseSpeed, 0
CoordMode, Mouse, Screen





;shifting
NumpadSub::
send,^+j
sleep,100
send,{ENTER}
return

;DONE!
;NumpadAdd::
;send,^+{ENTER}
;sleep,50
;send,{ENTER}
;sleep,50
;send,{ENTER}
;sleep,250
;send,^l
;return






;;;PRIORITIES

Numpad0::
{
send, !p
Random, OutputVar, 0.00,3.6076
send, %OutputVar%
send, {enter}
}
return

Numpad1::
{
send, !p
Random, OutputVar, 3.6077,8.4131
send, %OutputVar%
send, {enter}
}
return


Numpad2::
{
send, !p
Random, OutputVar, 8.4132,18.4917
send, %OutputVar%
send, {enter}
}
return

Numpad3::
{
send, !p
Random, OutputVar, 18.4918,28.0885
send, %OutputVar%
send, {enter}
}
return

Numpad4::
{
send, !p
Random, OutputVar, 28.0886,37.2103
send, %OutputVar%
send, {enter}
}
return

Numpad5::
{
send, !p
Random, OutputVar, 37.2104,46.24
send, %OutputVar%
send, {enter}
}
return

Numpad6::
{
send, !p
Random, OutputVar, 46.25,59.999
send, %OutputVar%
send, {enter}
}
return

Numpad7::
{
send, !p
Random, OutputVar, 60,70.5578
send, %OutputVar%
send, {enter}
}
return

Numpad8::
{
send, !p
Random, OutputVar, 70.5579,90.2474
send, %OutputVar%
send, {enter}
}
return

Numpad9::
{
send, !p
Random, OutputVar, 90.2474,99.99
send, %OutputVar%
send, {enter}
}
return

;;;;INTERVALS

^Numpad0::
{
send, !p
sleep,5
send, !i
sleep,5
send,1
send, {enter}
}
return

~^Numpad1::
{
send, !p
sleep,5
send, !i
sleep,5
Random, OutputVar, 4,7
send, %OutputVar%
send, {enter}
}
return

~^Numpad2::
{
send, !p
sleep,5
send, !i
sleep,5
Random, OutputVar, 10,18
send, %OutputVar%
send, {enter}
}
return

~^Numpad3::
{
send, !p
sleep,5
send, !i
sleep,5
Random, OutputVar, 17,23
send, %OutputVar%
send, {enter}
}
return

~^Numpad4::
{
send, !p
sleep,5
send, !i
sleep,5
Random, OutputVar, 26,35
send, %OutputVar%
send, {enter}
}
return

~^Numpad5::
{
send, !p
sleep,5
send, !i
sleep,5
Random, OutputVar, 58,67
send, %OutputVar%
send, {enter}
}
return

~^Numpad6::
{
send, !p
sleep,5
send, !i
sleep,5
Random, OutputVar, 89,97
send, %OutputVar%
send, {enter}
}
return

~^Numpad7::
{
send, !p
sleep,5
send, !i
sleep,5
Random, OutputVar, 153,171
send, %OutputVar%
send, {enter}
}
return

~^Numpad8::
{
send, !p
sleep,5
send, !i
sleep,5
Random, OutputVar, 344,377
send, %OutputVar%
send, {enter}
}
return

~^Numpad9::
{
send, !p
sleep,5
send, !i
sleep,5
Random, OutputVar, 708,733
send, %OutputVar%
send, {enter}
}
return
