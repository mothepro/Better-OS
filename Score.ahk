SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force ; There's no reason to run this script more than once

EnvGet, File, USERPROFILE
File = %File%\stream_record.txt

WriteScores(File, 0, 0) ; Clear on load

^NumpadDiv:: ; Reset File
	WriteScores(File, 0, 0)
	Return

NumpadAdd:: ; Increment Wins
	Scores := ReadScores(File)
	WriteScores(File, Scores[1] + 1, Scores[2])
	Send, {+}
	Return

^NumpadAdd:: ; Decrement Wins
	Scores := ReadScores(File)
	WriteScores(File, Scores[1] - 1, Scores[2])
	Send, {+}
	Return

NumpadSub:: ; Increment Loses
	Scores := ReadScores(File)
	WriteScores(File, Scores[1], Scores[2] + 1)
	Send, -
	Return

^NumpadSub:: ; Decrement Loses
	Scores := ReadScores(File)
	WriteScores(File, Scores[1], Scores[2] - 1)
	Send, -
	Return

;;;;;;;;;;;
; Helpers ;
;;;;;;;;;;;

ReadScores(file)
{
	FileRead, Output, %file%
	StringSplit, Array, Output, -, %A_Space%
	Return [Array1, Array2]
}

WriteScores(file, wins, loses)
{
	wins := wins > 0 ? wins : 0
	loses := loses > 0 ? loses : 0
	FileDelete, %file%
	FileAppend, %wins% - %loses%, %file%
	FileSetAttrib, +H, %file%
}
