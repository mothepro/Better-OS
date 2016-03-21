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

#F1:: DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0) ; Sleep

#F3:: ; Mail
Run, Outlook, , max
; WinActivate, Inbox - Microsoft Outlook
Return