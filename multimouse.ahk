CoordMode, ToolTip, screen
CoordMode, Mouse, screen
CoordMode, Pixel, screen
#Persistent

;==============================================================================
;  simulated 2nd cursor, press F1 swap the positions of the two cursors
;==============================================================================

xloc := A_ScreenWidth/2
yloc := A_ScreenHeight/2
image = cursor.gif   ; <---- you must provide your own cursor image

; load the image and give it a unique name (not shown) so that it can be used later
SplashImage, %image%, B X%xloc% Y%yloc%,,, Cursor2
return

; in case of emergency, hit escape ;)
esc::exitapp
return


;=======================================================
; swap the positions of the cursors
;=======================================================

f9::
blockinput, on ; block keyboard & moouse during the swap

MouseGetPos, xpos, ypos
winmove, Cursor2,, %xpos%, %ypos%

MouseMove, xloc, yloc ,0
xloc := xpos
yloc := ypos

blockinput, off
return