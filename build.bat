@ECHO OFF

for /r %%i in (*.ahk) do (
	echo Closing %%~ni.exe
	taskkill /IM %%~ni.exe

	echo Compiling %%i to %%~ni.exe
	Ahk2Exe /in %%i /out %%~ni.exe

	echo Running %%~ni.exe
	start "" "%%~ni.exe"
)
