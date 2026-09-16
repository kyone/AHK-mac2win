; ----------
; SublimeText
;
; Alt + t ⇒ Quick open
; Win + alt + 2 ⇒ Split window in 2
; Win + alt + 1 ⇒ Close split window
; ----------

#HotIf WinActive("ahk_exe sublime_text.exe")

!t:: {
    Send "^p"
}

$#!2:: {
    Send "!+2"
}

$#!1:: {
    Send "!+1"
}

#HotIf