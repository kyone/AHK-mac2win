# AHK-mac2win
Bringing macOS keyboard shortcuts to Windows using AutoHotkey.

## Description
Does your job require you to use a Windows PC, but your muscle memory is stuck on macOS? That's sad. Same here.

These AutoHotkey scripts simulate a macOS keyboard environment on Windows. All hotkey triggers and actions are described directly in the `.ahk` files.

## Content

### [app-shortcuts.ahk](app-shortcuts.ahk)
Provides macOS-inspired keyboard shortcuts for standard Windows applications.

### [ignored-windows-shortcuts.ahk](ignored-windows-shortcuts.ahk)
Disables certain built-in Windows keyboard shortcuts that can get in the way.

### [macOS-accented-characters.ahk](macOS-accented-characters.ahk)
macOS makes typing accented characters super easy. It relies on "dead keys" to activate an accent mode, allowing you to mark the following character.

This script uses the `Win` key to activate the accent mode (similar to `Alt / Option` on a Mac). For example: pressing `Win + I` followed by `Shift + O` yields `Ô`.

It also loads the `mac-all-optioned-characters.ahk` script to handle the c-with-cedilla (ç) and the œ ligature.

### [mac-all-optioned-characters.ahk](mac-all-optioned-characters.ahk)
You may have serendipitously discovered that the macOS keyboard can type a wide variety of special characters. This is super handy for non-English-speaking users *– et ça c'est cool.*

It uses the `Win` key instead of the `Alt / Option` key. For example: `Win + J` yields `∆` – that's how you know [artists](https://en.wikipedia.org/wiki/Alt-J) don't use Windows.

Now you can replicate this behavior on your PC.

### [macOS-hot-corners.ahk](macOS-hot-corners.ahk)
Simulates macOS hot corners, triggering specific actions whenever your mouse cursor reaches one of the four corners of your screen.

### [macOS-navigation.ahk](macOS-navigation.ahk)
Lets you use the `Alt` key just like the `Command` key on macOS.

It simply replaces most `Ctrl`-based Windows shortcuts with `Alt`-based ones. For example: press `Alt + C` to copy (instead of `Ctrl + C`).

### [wording-shortcuts.ahk](wording-shortcuts.ahk)
Provides handy hotstrings to save you some precious keystrokes.