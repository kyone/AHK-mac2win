#Requires AutoHotkey v2.0

; ----------
; Win + ← ⇒ Jump to the previous word
; Win + → ⇒ Jump to the next word
; ----------
#Left::Send "^{Left}"
#Right::Send "^{Right}"

; ----------
; Win + Shift + ← ⇒ Select to the previous word
; Win + Shift + → ⇒ Select to the next word
; ----------
#+Left::Send "^+{Left}"
#+Right::Send "^+{Right}"

; ----------
; (left) Alt + ← ⇒ Jump to the beginning of the line
; (left) Alt + Shift + ← ⇒ Select to the beginning of the line
; ----------
<!Left:: Send "{Home}"
<!+Left:: Send "+{Home}"

; ----------
; (left) Alt + → ⇒ Jump to the end of the line
; (left) Alt + Shift + → ⇒ Select to the end of the line
; ----------
<!Right:: Send "{End}"
<!+Right:: Send "+{End}"

; ----------
; Ctrl + Win + ← ⇒ Jump to the beginning of the document
; Ctrl + Win + Shift + ← ⇒ Select to the beginning of the document
; ----------
^#Left::Send "^{Home}"
^#+Left::Send "^+{Home}"

; ----------
; Ctrl + Win + → ⇒ Jump to the end of the document
; Ctrl + Win + Shift + → ⇒ Select to the end of the document
; ----------
^#Right::Send "^{End}"
^#+Right::Send "^+{End}"

; ----------
; (left) Alt + C ⇒ Copy
; (left) Alt + V ⇒ Paste
; (left) Alt + X ⇒ Cut
; (left) Alt + A ⇒ Select All
; ----------
<!c:: Send "^c"
<!v:: Send "^v"
<!x:: Send "^x"
<!a:: Send "^a"

; ----------
; Win + Backspace ⇒ Delete previous word
; Win + Delete ⇒ Delete next word
; ----------
#Backspace::Send "^{Backspace}"
#Delete::Send "^{Delete}"

; ----------
; (left) Alt + Backspace ⇒ Delete the whole line
; ----------
<!Backspace:: Send "+{Home}{Backspace}"

; ----------
; (left) Alt + S ⇒ Save
; (left) Alt + Z ⇒ Undo
; (left) Alt + Shift + Z ⇒ Redo
; ----------
<!s:: Send "^s"
<!z:: Send "^z"
<!+z:: Send "^+z"

; ----------
; (left) Alt + N ⇒ New window
; (left) Alt + T ⇒ New tab
; ----------
<!n:: Send "^n"
<!+n:: Send "^+n"
<!t:: Send "^t"

; ----------
; (left) Alt + Q ⇒ Quit app
; ----------
<!q:: {
    Send "!{f4}"
}

; ----------
; (left) Alt + W ⇒ Close window
; ----------
<!w:: {
    ; Arc
    if (WinActive("ahk_exe Arc.exe")) {
        Send "^w"
    } else {
        Send "^{f4}"
    }
}

; ----------
; Navigate between tabs
;
; (right) Alt + Shift + [ ⇒ Previous tab
; (right) Alt + Shift + ] ⇒ Next tab
; ----------
!>+[:: {
    ; Term and Explorer
    if (WinActive("ahk_exe explorer.exe") || WinActive("ahk_exe WindowsTerminal.exe")) {
        Send "^{Tab}"
    } ; Arc
    ;else if (WinActive("ahk_exe Arc.exe")) {
    ;    Send "^!{Up}"
    ;}
    else {
        Send "^{PgUp}"
    }
}

!>+]:: {
    ; Term and Explorer
    if (WinActive("ahk_exe explorer.exe") || WinActive("ahk_exe WindowsTerminal.exe")) {
        Send "^+{Tab}"
    ;} ; Arc
    ;else if (WinActive("ahk_exe Arc.exe")) {
    ;    Send "^!{Down}"
    } else {
        Send "^{PgDn}"
    }
}

; ----------
; (left) Alt + F ⇒ Find
; ----------
<!f:: Send "^f"

; ----------
; (left) Alt + R ⇒ Refresh
; ----------
<!r:: Send "{f5}"

; ----------
; (left) Alt + , ⇒ Settings (for supporting apps)
; ----------
<!,:: Send "^,"

; ----------
; (left) Alt + L ⇒ URL bar
; ----------
<!l:: Send "^l"
