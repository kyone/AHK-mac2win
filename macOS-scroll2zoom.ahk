#Requires AutoHotkey v2.0 64-bit
#SingleInstance Force
CoordMode "Mouse", "Screen"

; ----------
; Increase max hotkey triggerings: 1,000 per 2s
; ----------
A_MaxHotkeysPerInterval := 1000
A_HotkeyInterval := 2000

; ----------
; Settings
; ----------
STEP   := 1.15   ; zoom factor
MAXZ   := 10.0   ; maximum zoom
SMOOTH := 0.15   ; animation smoothness (the smaller the smoother)

RESET_ON_MONITOR_CHANGE := true ; reset zoom when mouse changes monitor

global target := 1.0, current := 1.0, zoomMonitor := 0

DllCall("LoadLibrary", "Str", "Magnification.dll", "Ptr")
if !DllCall("Magnification\MagInitialize")
{
    MsgBox "Unable to load `Magnification.dll`."
    ExitApp
}
OnExit(ResetZoom)
SetTimer Update, 10

#WheelDown::
{
    global target, zoomMonitor
    if (target = 1.0)
        zoomMonitor := MonitorFromMouse()  ; store original monitor position
    target := Min(target * STEP, MAXZ)
}

#WheelUp::
{
    global target
    target := Max(target / STEP, 1.0)
}

; Ctrl + double tap → Reset zoom
#RButton::
{
    global target, current
    target := 1.0
    current := 1.0
}

Update()
{
    global current, target, zoomMonitor
    static lastX := -1, lastY := -1, lastZ := 0

    MouseGetPos &mx, &my

    ; Reset when changing monitor
    if (RESET_ON_MONITOR_CHANGE && target > 1.0 && MonitorFromMouse() != zoomMonitor)
    {
        target := 1.0
        current := 1.0
    }

    if Abs(target - current) < 0.001
        current := target
    else
        current += (target - current) * SMOOTH

    if (current = lastZ && mx = lastX && my = lastY)
        return
    lastZ := current, lastX := mx, lastY := my

    ; Focus on mouse center
    ox := Round(mx * (1 - 1 / current))
    oy := Round(my * (1 - 1 / current))
    DllCall("Magnification\MagSetFullscreenTransform", "Float", current, "Int", ox, "Int", oy)
}

MonitorFromMouse()
{
    MouseGetPos &mx, &my
    Loop MonitorGetCount()
    {
        MonitorGet A_Index, &l, &t, &r, &b
        if (mx >= l && mx < r && my >= t && my < b)
            return A_Index
    }
    return 0
}

ResetZoom(*)
{
    DllCall("Magnification\MagSetFullscreenTransform", "Float", 1.0, "Int", 0, "Int", 0)
    DllCall("Magnification\MagUninitialize")
}