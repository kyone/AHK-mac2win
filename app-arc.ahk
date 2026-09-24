; ----------
; Arc
;
; Alt + [ ⇒ Go back in history
; Alt + ] ⇒ Go forward in history
; Alt + Shift + C ⇒ Copy current page's URL
; Alt + Shift + [ ⇒ Previous tab
; Alt + Shift + ] ⇒ Next tab
; ----------

#HotIf WinActive("ahk_exe Arc.exe")

$!w:: {
    Send "^w"
}

$![:: {
    Send "!{Left}"
}

$!]:: {
    Send "!{Right}"
}

$!+c:: {
    Send "^+c"
}

$#!1:: {
    Send "^+-"
}

$#!2:: {
    Send "^+="
}

$!+]:: {
;    Send "^!{Down}"
}

$!+[:: {
;    Send "^!{Up}"
}

#HotIf