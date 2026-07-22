; ----------
; Change the menu mask key to prevent random ghost triggering of the left Ctrl or Alt
; Another value could be "vkFF"
; ----------
A_MenuMaskKey := "vkE8"
~LAlt Up::Send "{Blind}{A_MenuMaskKey}"
~RAlt Up::Send "{Blind}{A_MenuMaskKey}"

#Include "macOS-navigation.ahk"
#Include "macOS-accented-characters.ahk"
#Include "ignored-windows-shortcuts.ahk"
#Include "macOS-hot-corners.ahk"
#Include "app-shortcuts.ahk"
#Include "wording-shortcuts.ahk"