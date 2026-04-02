#Requires AutoHotkey v2.0

; ----------
; Handling accented characters à la macOS (QWERTY-US layout).
;
; This uses the Windows key instead of the alt key...
; ... since it's located right at the option key place.
;
; Use a dead key to enter the accent mark, then press the letter you want to add the mark to.
;
; Eg: to write é, press `Win + e` to mark acute accent, then press `e`.
; ----------

; ----------
; Cédille and e-dans-l'o characters can be handled more easily
;
; Win + C ⇒ ç
; Win + Q ⇒ œ
; ----------
#c:: Send "ç"
#+c:: Send "Ç"
#q:: Send "œ"
#+q:: Send "Œ"
#+2:: Send "€"

global gCurrentAccent := ""

global gHandledAccents := Map("acute", Map("a","á", "e","é", "i","í", "o","ó", "u","ú", "y","ý", "A","Á", "E","É", "I","Í", "O","Ó", "U","Ú", "Y","Ý"),
                              "grave", Map("a","à", "e","è", "i","ì", "o","ò", "u","ù", "A","À", "E","È", "I","Ì", "O","Ò", "U","Ù"),
                               "circ", Map("a","â", "e","ê", "i","î", "o","ô", "u","û", "A","Â", "E","Ê", "I","Î", "O","Ô", "U","Û"),
                                "uml", Map("a","ä", "e","ë", "i","ï", "o","ö", "u","ü", "y","ÿ", "A","Ä", "E","Ë", "I","Ï", "O","Ö", "U","Ü", "Y","Ÿ"),
                              "tilde", Map("n","ñ", "N","Ñ"))

; ----------
; Hotkeys to activate the accented state – à la macOS's dead keys
;
; Win + ` + A ⇒ à
; Win + E + E ⇒ é
; Win + I + O ⇒ ô
; Win + U + I ⇒ ï
; Win + N + N ⇒ ñ
; ----------
#e:: global gCurrentAccent := "acute"      ; Win + e → acute accent
#`:: global gCurrentAccent := "grave"      ; Win + ` → grave accent
#i:: global gCurrentAccent := "circ"       ; Win + i → circonflex accent
#u:: global gCurrentAccent := "uml"        ; Win + u → umlaut accent
#n:: global gCurrentAccent := "tilde"      ; Win + n → tilde accent

; ----------
; Change InputLevel not to interfere with hotstrings
; ----------
#InputLevel 1
    ~a:: HandleLetter("a")
    ~e:: HandleLetter("e")
    ~i:: HandleLetter("i")
    ~n:: HandleLetter("n")
    ~o:: HandleLetter("o")
    ~u:: HandleLetter("u")
    ~y:: HandleLetter("y")
    ~c:: HandleLetter("c")

    ~+a:: HandleLetter("A")
    ~+e:: HandleLetter("E")
    ~+i:: HandleLetter("I")
    ~+N:: HandleLetter("N")
    ~+o:: HandleLetter("O")
    ~+u:: HandleLetter("U")
    ~+y:: HandleLetter("Y")
#InputLevel 0

; ----------
; Marking the characters according to the wanted accent
; ----------
HandleLetter(letter) {
    global gCurrentAccent, gHandledAccents

    if (gCurrentAccent = "") {
        ; No activated accent → let key pass with `~`
        return
    }

    ; Delete the pressed key which passed through (thanks to `~`)
    Send "{Blind}{Backspace}"

    out := letter
    try {
        out := gHandledAccents[gCurrentAccent][letter]
    }
    gCurrentAccent := ""
    SendText out
}
