#Requires AutoHotkey v2.0

; ----------
; Emulate macOS hot corners behaviour
;
; Alt + cursor at ↗️ ⇒ Lock Windows user session
; Alt + cursor at ↘️ ⇒ Show / Hide Desktop
; ----------

CoordMode "Mouse", "Screen"
SetTimer(CheckCorner, 50)

GetMouseMonitorInfo() {
    MouseGetPos &mx, &my

    monitorCount := MonitorGetCount()
    Loop monitorCount {
        i := A_Index
        MonitorGet i, &l, &t, &r, &b
        if (mx >= l && mx < r && my >= t && my < b) {
            position := ""
            threshold := 10

            if (my <= t + threshold) {
                position .= "top"
            } else if (my >= b - threshold) {
                position .= "bottom"
            }

            if (mx <= l + threshold) {
                position .= "left"
            } else if (mx >= r - threshold) {
                position .= "right"
            }

            return {
                index: i,
                left: l,
                top: t,
                right: r,
                bottom: b,
                width: r - l,
                height: b - t,
                mouse: {position: position, x: mx, y: my}
            }
        }
    }
    return false
}


CheckCorner() {
    info := GetMouseMonitorInfo()
    if (info) {
        ; Top Right corner
        if (info.mouse.position = "topright" && GetKeyState("Alt", "P")) {
            MouseMove A_ScreenWidth / 2, A_ScreenHeight / 2
            Sleep 150
            DllCall "LockWorkStation"
        }
        ; Bottom Right corner
        else if (info.mouse.position = "bottomright" && GetKeyState("Alt", "P")) {
            Send "#d"
        }
    }
}
