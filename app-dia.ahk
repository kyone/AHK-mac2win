; ----------
; Dia
;
; Alt + w ⇒ Close tab
; ----------

#HotIf WinActive("ahk_exe Dia.exe")

$!w:: {
    Send "^w"
}

$+!c:: {
    Send "^+c"
}

#HotIf