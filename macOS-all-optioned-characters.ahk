#Requires AutoHotkey v2.0

; qwerty ANSI layout
; ` 1 2 3 4 5 6 7 8 9 0 - =
; q w e r t y u i o p [ ] \
; a s d f g h j k l ; '
; z x c v b n m , . /

; option
; ` ¡ ™ £ ¢ ∞ § ¶ • ª º – ≠
; œ ∑ ´ ® † ¥ ¨ ˆ ø π “ ‘ «
; å ß ∂ ƒ © ˙ ∆ ˚ ¬ … æ
; Ω ≈ ç √ ∫ ˜ µ ≤ ≥ ÷

; option + shift
; ` ⁄ € ‹ › ﬁ ﬂ ‡ ° · ‚ — ±
; Œ „ ´ ‰ ˇ Á ¨ ˆ Ø ∏ ” ’ »
; Å Í Î Ï ˝ Ó Ô  Ò Ú Æ
; ¸ ˛ Ç ◊ ı ˜ Â ¯ ˘ ¿

;  is 🍏 logo

; ` 1 2 3 4 5 6 7 8 9 0 - =
#1:: Send "¡"
#2:: Send "™"
#3:: Send "£"
#4:: Send "¢"
#5:: Send "∞"
#6:: Send "§"
#7:: Send "¶"
#8:: Send "•"
#9:: Send "ª"
#0:: Send "º"
#-:: Send "–"
#=:: Send "≠"

#+1:: Send "⁄"
#+2:: Send "€"
#+3:: Send "‹"
#+4:: Send "›"
#+5:: Send "ﬁ"
#+6:: Send "ﬂ"
#+7:: Send "‡"
#+8:: Send "°"
#+9:: Send "·"
#+0:: Send "‚"
#+-:: Send "—"
#+=:: Send "±"

; q w e r t y u i o p [ ] \
#q:: Send "œ"
#w:: Send "∑"
#r:: Send "®"
#t:: Send "†"
#y:: Send "¥"
#o:: Send "ø"
#p:: Send "π"
#[:: Send "“"
#]:: Send "‘"
#\:: Send "«"

#+q:: Send "Œ"
#+w:: Send "„"
#+r:: Send "‰"
#+t:: Send "ˇ"
#+y:: Send "Á"
#+o:: Send "Ø"
#+p:: Send "∏"
#+[:: Send "”"
#+]:: Send "’"
#+\:: Send "»"

; a s d f g h j k l ; '
#a:: Send "å"
#s:: Send "ß"
#d:: Send "∂"
#f:: Send "ƒ"
#g:: Send "©"
#h:: Send "˙"
#j:: Send "∆"
#k:: Send "˚"
#l:: Send "¬"
#;:: Send "…"
#':: Send "æ"

#+a:: Send "Å"
#+s:: Send "Í"
#+d:: Send "Î"
#+f:: Send "Ï"
#+g:: Send "˝"
#+h:: Send "Ó"
#+j:: Send "Ô"
#+k:: Send ""
#+l:: Send "Ò"
#+;:: Send "Ú"
#+':: Send "Æ"

; z x c v b n m , . /
#z:: Send "Ω"
#x:: Send "≈"
#c:: Send "ç"
#v:: Send "√"
#b:: Send "∫"
#m:: Send "µ"
#,:: Send "≤"
#.:: Send "≥"
#/:: Send "÷"

#+z:: Send "¸"
#+x:: Send "˛"
#+c:: Send "Ç"
#+v:: Send "◊"
#+b:: Send "ı"
#+m:: Send "Â"
#+,:: Send "¯"
#+.:: Send "˘"
#+/:: Send "¿"

; Those are handled by macOS-QWERTY-accents.ahk
; #e:: Send "´"
; #+e:: Send "´"
; #u:: Send "¨"
; #+u:: Send "¨"
; #i:: Send "ˆ"
; #+i:: Send "ˆ"
; #n:: Send "˜"
; #!n:: Send "˜"