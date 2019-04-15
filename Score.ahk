SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
#SingleInstance force ; There's no reason to run this script more than once

EnvGet, File, USERPROFILE
WFile = %File%\stream_record\wins.txt
LFile = %File%\stream_record\loses.txt
Files := []
Files.Push(File . "\stream_record\1.txt")
Files.Push(File . "\stream_record\2.txt")
Files.Push(File . "\stream_record\3.txt")
Files.Push(File . "\stream_record\4.txt")
Files.Push(File . "\stream_record\5.txt")
Files.Push(File . "\stream_record\6.txt")
Files.Push(File . "\stream_record\7.txt")
Files.Push(File . "\stream_record\8.txt")
Files.Push(File . "\stream_record\9.txt")

; Clear on load
FileCreateDir, %File%\stream_record
FileSetAttrib, +H, %File%\stream_record

WriteScores(WFile, 0)
WriteScores(LFile, 0)

^NumpadDiv:: ; Reset File
	WriteScores(WFile, 0)
	WriteScores(LFile, 0)
	Return

NumpadAdd:: ; Increment Wins
	WriteScores(WFile, Read(WFile) + 1)
	Send, {+}
	Return

^NumpadAdd:: ; Decrement Wins
	WriteScores(WFile, Read(WFile) - 1)
	Send, {+}
	Return

NumpadSub:: ; Increment Loses
	WriteScores(LFile, Read(LFile) + 1)
	Send, -
	Return

^NumpadSub:: ; Decrement Loses
	WriteScores(LFile, Read(LFile) - 1)
	Send, -
	Return

^#1:: Input(Files[1], 1)
^#2:: Input(Files[2], 2)
^#3:: Input(Files[3], 3)
^#4:: Input(Files[4], 4)
^#5:: Input(Files[5], 5)
^#6:: Input(Files[6], 6)
^#7:: Input(Files[7], 7)
^#8:: Input(Files[8], 8)
^#9:: Input(Files[9], 9)

;;;;;;;;;;;
; Helpers ;
;;;;;;;;;;;

Read(file)
{
	FileRead, ret, %file%
	Return ret
}

WriteScores(file, score)
{
	if score is integer
		score := score > 0 ? score : 0
	FileDelete, %file%
	FileAppend, %score%, %file%
}

Input(file, num)
{
	FileRead, placeholder, %file%
	InputBox, ret,, Text #%num%,, 170, 130, 50, 50,,, %placeholder%
	WriteScores(file, ret)
	Return ret
}