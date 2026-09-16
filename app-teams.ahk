; ----------
; MS Teams
;
; Alt + D ⇒ Mute (Google Meet macOS shortcut)
; ----------

#HotIf WinActive("ahk_exe ms-teams.exe")

$!d:: {
    Send "^+m"
}

#HotIf