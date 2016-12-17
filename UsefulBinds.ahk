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

#End:: SoundSet, +1, , MUTE ; Toggle Mute

#PgUp::
	SoundSet, +1 ; Raise Volume
	SoundSet, 0, , MUTE ; Unmute
	Return

#PgDn::
	SoundSet, 0, , MUTE ; Unmute
	SoundSet, -1 ; Lower Volume
	Return

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
	