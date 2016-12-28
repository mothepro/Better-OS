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

#F2:: ; Mail
	Run, Outlook, , max
	; WinActivate, Inbox - Microsoft Outlook
	Return

#F3:: ; Chrome
	Run, "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe", , max
	Return

#F4:: ; Windows Explorer
	Run, explorer ;"%systemroot%\explorer.exe"
	Return

#F5:: ; Calculator
	Run, "C:\Windows\System32\calc.exe"
	Return

#F6:: ; Steam
	Run, "D:\Steam\Steam.exe"
	Return

#F7:: ; MightyText
	Run, "C:\Program Files (x86)\MightyText\MightyText.exe"
	Return
	
#F8:: ; KeePass
	Run, "C:\Program Files (x86)\KeePass Password Safe 2\KeePass.exe"
	Return

#F9:: ; SideSync
	Run, "C:\Program Files (x86)\Samsung\SideSync4\SideSync.exe"
	Return

; Must be run as admin
#Insert:: ; Enable Headphones
	Run, "C:\Program Files\devcon.exe" enable "HDAUDIO\FUNC_01&VEN_10EC&DEV_0892&SUBSYS_1043841B"
	Return

#Delete:: ; Disable Headphones
	Run, "C:\Program Files\devcon.exe" disable "HDAUDIO\FUNC_01&VEN_10EC&DEV_0892&SUBSYS_1043841B"
	Return

;;;;;;;;;;;;;;;;;;;
; Volume Controls ;
;;;;;;;;;;;;;;;;;;;

#End::Send {Volume_Mute}
#PgUp::Send {Volume_Up}
#PgDn::Send {Volume_Down}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Windows Virtual Desktops ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Move to next desktop
#`::
	; Doesnt work :(
	; Send, #{Tab}
	
	Send, +{F10}M{Enter}
	; Send, #^{Right} ; go to next desktop
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

#IfWinNotActive ahk_class ConsoleWindowClass

bAllowOverride := False

~LButton::
	GetKeyState, keystate, RButton
	If (keystate = "D")
	{
		SendInput {RButton Up}
		SendInput {Escape}
		SendInput +{insert}
		bAllowOverride := True
	}
	Return

RButton::
	GetKeyState, keystate, LButton
	If (keystate = "D")
	{
		SendInput {LButton Up}
		SendInput ^{insert}
		bAllowOverride := True
		Return
	}
	SendInput {RButton Down}
	Return

RButton Up::
	GetKeyState, keystate, LButton
	If (keystate = "D")
	{
		Return
	}
	If (bAllowOverride)
	{
		bAllowOverride := False
		Return
	}
	SendInput {RButton Up}
	Return
