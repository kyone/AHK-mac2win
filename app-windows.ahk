; ----------
; Screen capture
;
; Alt + Shift + 4 ⇒ Screen capture
; ----------
!+4:: Run "ms-screenclip:"

; ----------
; Explorer app
;
; Alt + Shift + H ⇒ Open Home page à la macOS
; ----------
!+h:: Run "explorer.exe shell:Profile"

; ----------
; Media Keys
;
; Home ⇒ Previous track ⏮️
; End ⇒ Play / Pause    ⏯️
; Insert ⇒ Next track   ⏭️
; ----------
Home::Send "{Media_Prev}"
End::Send "{Media_Play_Pause}"
Ins::Send "{Media_Next}"

; ----------
; Explorer app
;
; Alt + Down ⇒ Open anything
; Alt + Shift + [ ⇒ Previous tab
; Alt + Shift + ] ⇒ Next tab
; ----------

#HotIf WinActive("ahk_exe explorer.exe")

!Down:: {
    Send "{Enter}"
}

!+[:: {
    Send "^{Tab}"
}

!+]:: {
    Send "^+{Tab}"
}

#HotIf

#HotIf WinActive("ahk_exe WindowsTerminal.exe")

!+[:: {
    Send "^{Tab}"
}

!+]:: {
    Send "^+{Tab}"
}

#HotIf