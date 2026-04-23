#Requires AutoHotkey v2.0

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
; Alt + Down ⇒ Open anything
; ----------
!+h:: Run "explorer.exe shell:Profile"
!Down:: {
    if WinActive("ahk_exe explorer.exe") {
        Send "{Enter}"
    } else {
        Send "!{Down}"
    }
}

; ----------
; MS Teams
;
; Alt + D ⇒ Mute (Google Meet macOS shortcut)
; ----------
$!d:: {
    if WinActive("ahk_exe ms-teams.exe") {
        Send "^+m"
    } else {
        Send "!d"
    }
}

; ----------
; MS Outlook
; à la Apple Mail's shortcuts
; Alt + Shift + D ⇒ Send mail
; Alt + Shift + N ⇒ Synchronize inbox
; ----------
$!+d:: {
    if WinActive("ahk_exe olk.exe") {
        Send "^{Enter}"
    } else {
        Send "!+d"
    }
}

!+n:: {
    if WinActive("ahk_exe olk.exe") {
        Send "{F9}"
    } else {
        Send "^+n"
    }
}

; ----------
; Arc
;
; Alt + [ ⇒ Go back in history
; Alt + ] ⇒ Go forward in history
; Alt + Shift + C ⇒ Copy current page's URL
; ----------
$![:: {
    if WinActive("ahk_exe Arc.exe") {
        Send "!{Left}"
    } else {
        Send "!["
    }
}

$!]:: {
    if WinActive("ahk_exe Arc.exe") {
        Send "!{Right}"
    } else {
        Send "!]"
    }
}

$!+c:: {
    if WinActive("ahk_exe Arc.exe") {
        Send "^+c"
    } else {
        Send "!+c"
    }
}

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