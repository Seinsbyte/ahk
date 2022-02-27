#If WinActive("ahk_class TElWind") || WinActive("ahk_exe PluginHost.exe") || WinActive("ahk_class TContents")

F12::
ClipboardOld := ClipboardAll
Clipboard := ""
Send, q
Send, ^a
Send, ^c
clipboard := clipboard  ; Converts clipboard into plain text
cpa := Clipboard
RegExReplace(cpa,"\«","",count)
Clipboard := ClipboardOld
ClipboardOld := ""
Send, {Right}
Send, ^{Home}
Loop, %count%
{
    ClipboardOld := ClipboardAll
    Clipboard := ""
    InsertPoint := 0
    InsertPoint2 := 0
    ClipboardFirst := ""
        Length := 0
          Loop
    {
        Send, ^+{Right}
        A_Index2 := A_Index
        Send, ^c
        Sleep, 20
        Length := StrLen(Clipboard)
        InsertPoint := RegExMatch(Clipboard,"[\«]")
        ;MsgBox, InsertPoint %InsertPoint% ; for debugging
        If (InsertPoint = 0) 
        {
            If (A_Index2 >= 100)
            {
                break
            }
            continue
        }
        else
        {
            break
        }
    }
Send, {Right}
        Loop
    {
        Send, ^+{Right}
        A_Index2 := A_Index
        Send, ^c
        Sleep, 20
        Length := StrLen(Clipboard)
        InsertPoint := RegExMatch(Clipboard,"[\»]")
        ;MsgBox, InsertPoint %InsertPoint% ; for debugging
        If (InsertPoint = 0) 
        {
            If (A_Index2 >= 100)
            {
                break
            }
            continue
        }
        else
        {
            break
        }
    }
    ; Since we may overshoot the . or other special character by use of Ctrl + -> in Windows
    ; we have to Shift + <- back by how much we overshot
    If(InsertPoint > 0 && InsertPoint <> Length)
    {
     GoLeftBy := Length - InsertPoint
     Loop %GoLeftBy%
     {
        Send, +{Left}
     }
    }
        send !z
    Clipboard := ClipboardOld
    ClipboardOld := ""
}
return
