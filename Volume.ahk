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

#End:: SoundSet, +1, , MUTE ; Toggle Mute
#PgUp::
	SoundSet, 0, , MUTE ; Unmute
	SoundSet, +1 ; Raise Volume
#PgDn::
	SoundSet, 0, , MUTE ; Unmute
	SoundSet, -1 ; Lower Volume