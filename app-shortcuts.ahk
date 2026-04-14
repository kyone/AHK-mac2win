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
; Alt + Shift + H ⇒ Open Home page
; Alt + Down ⇒ Open anything
; ----------
!+h:: Run "explorer.exe"
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
;
; Alt + Shift + D ⇒ Send mail (Apple Mail shortcut)
; ----------
$!+d:: {
    if WinActive("ahk_exe olk.exe") {
        Send "^{Enter}"
    } else {
        Send "!+d"
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