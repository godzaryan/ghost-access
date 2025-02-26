@echo off
setlocal

set "batchPath=%~dp0"
set "batchName=%~nx0"
set "vbsFile=%temp%\%~n0_silent_run.vbs"

if "%~1"=="silent" goto silentExecution

echo Set objShell = CreateObject("Wscript.Shell") > "%vbsFile%"
echo objShell.Run """%batchPath%%batchName%"" silent", 0, False >> "%vbsFile%"

wscript "%vbsFile%" 
exit /b 0

:silentExecution
if exist "%vbsFile%" del "%vbsFile%"

:: Codes here
echo %batchPath% More text > "%batchPath%additional_output.txt"

endlocal
exit /b 0
