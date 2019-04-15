;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         Maurice Prosper <maurice.prosper@ttu.edu>
;
; This script is useful on keyboards without volume controls
;

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force ; There's no reason to run this script more than once

;;;;;;;;;;;;;;;;;;;;;;;;
; First Set of Control ;
;;;;;;;;;;;;;;;;;;;;;;;;

#F1:: ; Sleep
	DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
	Return

#F2:: ; Calculator
	Run, "C:\Windows\System32\calc.exe"
	Return

#F3:: ; Chrome
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe", , max
	Return

#F5:: ; Discord
	Run, "C:\Users\test\AppData\Local\Discord\app-0.0.298\Discord.exe"
	Return

#F6:: ; Battle.Net
	Run, "C:\Program Files (x86)\Overwatch\Overwatch Launcher.exe"
	Return

#F7:: ; Steam
	Run, "D:\Steam\Steam.exe"
	Return

#F8:: ; KeePass
	Run, "C:\Program Files (x86)\KeePass Password Safe 2\KeePass.exe"
	Return

#NumpadDiv:: ; Open Score Program
	Run, "C:\Program Files\Streamlabs OBS\Streamlabs OBS.exe"
	Run, "C:\Users\test\Projects\Tools\AutoHotKey\Score.exe"

	Return

^!d:: ; Stay on Top = ctrl + alt + d
	Winset, Alwaysontop, , A
	Return

;;;;;;;;;;;;;;;;;;
; Sound Controls ;
;;;;;;;;;;;;;;;;;;

#End:: SoundSet +1, , mute
#PgUp::SoundSet +1
#PgDn::SoundSet -1
#Home::SoundSet 1, Microphone, mute ; Mute Mic

; DISABLED DEVICES MUST BE VISIBLE IN "Playback Devices".
#Insert:: ; Enable Headphones
	Run, mmsys.cpl
	WinWait, Sound
	SendInput, {Down}{AppsKey}{Down}{Down}{Enter}{Enter}
	return

#Delete:: ; Disable Headphones
	Run, mmsys.cpl
	WinWait, Sound
	SendInput, {Down}{AppsKey}{Down}{Down}{Down}{Enter}{Enter}
	return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Windows Virtual Desktops ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Move to next desktop
#`::
	; Doesnt work :(
	; SendInput, #{Tab}
	
	SendInput, +{F10}M{Enter}
	; SendInput, #^{Right} ; go to next desktop
	Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; @link https://autohotkey.com/board/topic/44064-copy-on-select-implementation/      ;
;                                                                                    ;
; Copy    Drag and Select with the LEFT Mouse Button, and while holding it,          ;
;         click the RIGHT Mouse Button to copy the selected text/folders/files etc.  ;
;                                                                                    ;
; Paste   Right Click where the contents need to be pasted,                          ;
;         and while holding the RIGHT Mouse Button,                                  ;
;         LEFT Click to paste the items in the clipboard.                            ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; #IfWinNotActive ahk_class ConsoleWindowClass
; #IfWinNotActive Overwatch

; bAllowOverride := False

; ~LButton::
; 	GetKeyState, keystate, RButton
; 	If (keystate = "D")
; 	{
; 		SendInput {RButton Up}
; 		SendInput {Escape}
; 		SendInput +{insert}
; 		bAllowOverride := True
; 	}
; 	Return

; RButton::
; 	GetKeyState, keystate, LButton
; 	If (keystate = "D")
; 	{
; 		SendInput {LButton Up}
; 		SendInput ^{insert}
; 		bAllowOverride := True
; 		Return
; 	}
; 	SendInput {RButton Down}
; 	Return

; RButton Up::
; 	GetKeyState, keystate, LButton
; 	If (keystate = "D")
; 	{
; 		Return
; 	}
; 	If (bAllowOverride)
; 	{
; 		bAllowOverride := False
; 		Return
; 	}
; 	SendInput {RButton Up}
; 	Return

; #g::
; 	Run % "http://www.google.com/search?q=" . GetSelectedText()
; 	return

; XButton1 & MButton::
; 	selection := GetSelectedText()
; 	len := StrLen(selection)
; 	Click
; 	Send % selection
; 	Send, {Shift down}{Left %len%}{Shift up}
; 	Return

; GetSelectedText() {
; 	tmp = %ClipboardAll% ; save clipboard
; 	Clipboard := "" ; clear clipboard
; 	Send, ^{Insert} ; simulate Ctrl+C (=selection in clipboard)
; 	ClipWait, 1 ; wait until clipboard contains data
; 	selection = %Clipboard% ; save the content of the clipboard
; 	Clipboard = %tmp% ; restore old content of the clipboard
; 	return (selection = "" ? Clipboard : selection)
; }