#IfWinActive ahk_exe PluginHost.exe
{
#If GetKeyState("CapsLock", "T")
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
}

setPriorityPDF(min, max) {
    send, !+x
    Random, OutputVar, %min%, %max%
    send, %OutputVar%
    send, {enter}
}
return

