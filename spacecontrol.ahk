;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         cy18 <thecy18@gmail.com>
;
; An improved script to use space as modifier
; In normal cases, if space is pressed for more than 0.1 second, it becomes a modifier, this time could be modified in the script
; If no other keys are pressed during space is pressed, a space is output when space is released
; Severial tunes are made so that the script works well when typing in fast speed
; Note that repeating space no longer works

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

AnyKeyPressedOtherThanSpace(mode = "P") {
    keys = 1234567890-=qwertyuiop[]\asdfghjkl;'zxcvbnm,./
    Loop, Parse, keys
    {        
        isDown :=  GetKeyState(A_LoopField, mode)
        if(isDown)
            return True
    }   
    return False
}
 
Space Up::
    space_up := true
    Send, {F18}
    return
Space::
    if AnyKeyPressedOtherThanSpace(){
        SendInput, {Blind}{Space}
        Return
    }
    space_up := False
    inputed := False
    input, UserInput, L1 T0.1, {F18}
    if (space_up) {
        Send, {Blind}{Space}
        return
    }else if (StrLen(UserInput) == 1){
        Send, {Space}%UserInput%
        return
    }
    while true{
        input, UserInput, L1, {F18}
        if (space_up) {
            if (!inputed){
                Send, {Blind}{Space}
            }
            break
        }else if (StrLen(UserInput) == 1) {
            inputed := True
            StringLower, UserInput, UserInput
            if (UserInput == "Right")
                Send, {Blind}{Up}
            else
                Send, {Blind}{CtrlDown}%UserInput%{CtrlUp}
        }
    }
    return

