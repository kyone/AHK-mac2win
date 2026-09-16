; ----------
; MS Outlook
; à la Apple Mail's shortcuts
; Alt + Shift + D ⇒ Send mail
; Alt + Shift + N ⇒ Synchronize inbox
; ----------

#HotIf WinActive("ahk_exe olk.exe")

$!+d:: {
    Send "^{Enter}"
}

!+n:: {
    Send "{F9}"
}

#HotIf