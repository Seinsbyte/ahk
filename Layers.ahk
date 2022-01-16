I_Icon = H:\programs\ahk\Icons\bluei.ico
C_Icon = H:\programs\ahk\Icons\greenc.ico  

Esc::
KeyDown := !KeyDown
If KeyDown
{
	SendInput {F24 down}
	Menu, Tray, Icon, %C_Icon%, 1   ;Changes menu tray icon
}
Else
{
	SendInput {F24 up}
	Menu, Tray, Icon, %I_Icon%, 1   ;Changes menu tray icon
}
Return

#if (getKeyState("F24")) ;

F24::return ;this line is mandatory for proper functionality

i::Up
j::Left
k::Down
l::Right
I::Up
J::Left
K::Down
L::Right

e::Send ^{Backspace}
r::Send ^{Del}
n::Send ^{f}
d::Send Backspace
z::Send ^{z}
x::Send ^{x}
c::Send ^{c}
v::Send ^{v}

u::Send ^{Left}
o::Send ^{Right}
+u::Send +^{Left}
+o::Send +^{Right}

y::Send ^{z}
h::Home
`;::End
Backspace::Backspace
