#Requires AutoHotkey v2.0

; ----------
; Emulate macOS hot corners behaviour
;
; Alt + cursor at ↗️ ⇒ Lock Windows user session
; Alt + cursor at ↘️ ⇒ Show / Hide Desktop
; ----------

CoordMode "Mouse", "Screen"
SetTimer(CheckCorner, 50)

CheckCorner() {
    MouseGetPos &x, &y
    trigger := 10

    ; Top Right corner
    if (x >= A_ScreenWidth - trigger && y <= trigger && GetKeyState("Alt", "P")) {
        MouseMove A_ScreenWidth / 2, A_ScreenHeight / 2
        Sleep 150
        DllCall "LockWorkStation"
    }
    ; Bottom Right corner
    else if (x >= A_ScreenWidth - trigger && y >= A_ScreenHeight - trigger && GetKeyState("Alt", "P")) {
        Send "#d"
    }
}