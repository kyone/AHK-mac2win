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
STEP   := 1.15   ; facteur de zoom par cran de molette
MAXZ   := 10.0   ; zoom maximum
SMOOTH := 0.15   ; douceur de l'animation (plus petit = plus doux)

global target := 1.0, current := 1.0

DllCall("LoadLibrary", "Str", "Magnification.dll", "Ptr")
if !DllCall("Magnification\MagInitialize")
{
    MsgBox "Impossible d'initialiser le zoom."
    ExitApp
}
OnExit(ResetZoom)
SetTimer Update, 10

^WheelDown::
{
    global target
    target := Min(target * STEP, MAXZ)
}

^WheelUp::
{
    global target
    target := Max(target / STEP, 1.0)
}

; Reset zoom with CTRL + Click
^RButton::
{
    global target
    target := 1.0
}

Update()
{
    global current, target
    static lastX := -1, lastY := -1, lastZ := 0

    if Abs(target - current) < 0.001
        current := target
    else
        current += (target - current) * SMOOTH

    MouseGetPos &mx, &my
    if (current = lastZ && mx = lastX && my = lastY)
        return
    lastZ := current, lastX := mx, lastY := my

    ; Garde le point sous la souris fixe et suit la souris quand on est zoomé
    ox := Round(mx * (1 - 1 / current))
    oy := Round(my * (1 - 1 / current))
    DllCall("Magnification\MagSetFullscreenTransform", "Float", current, "Int", ox, "Int", oy)
}

ResetZoom(*)
{
    DllCall("Magnification\MagSetFullscreenTransform", "Float", 1.0, "Int", 0, "Int", 0)
    DllCall("Magnification\MagUninitialize")
}