SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force ; There's no reason to run this script more than once

EnvGet, File, USERPROFILE
File = %File%\stream_record.txt

ReadScores(file)
{
	FileRead, Output, %file%
	StringSplit, Array, Output, -, %A_Space%
	Return [Array1, Array2]
}

WriteScores(file, wins, loses)
{
	FileDelete, %file%
	FileAppend, %wins% - %loses%, %file%
	FileSetAttrib, +H, %file%
}

^NumpadDiv:: ; Reset File
	WriteScores(File, 0, 0)
	Return

NumpadAdd:: ; Increment Wins
	Scores := ReadScores(File)
	WriteScores(File, Scores[1] + 1, Scores[2])
	Return

NumpadSub:: ; Increment Loses
	Scores := ReadScores(File)
	WriteScores(File, Scores[1], Scores[2] + 1)
	Return

^NumpadAdd:: ; Decrement Wins
	Scores := ReadScores(File)
	WriteScores(File, Scores[1] - 1, Scores[2])
	Return

^NumpadSub:: ; Decrement Loses
	Scores := ReadScores(File)
	WriteScores(File, Scores[1], Scores[2] - 1)
	Return
