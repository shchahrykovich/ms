@echo off
setlocal

set current_dir=%~dp0

cd %~dp0runtime

SET COMPLUS_LogEnable=1
SET COMPLUS_LogLevel=6
SET COMPLUS_LogToFile=1
SET COMPLUS_LogFile=%current_dir%\log.txt
SET COMPLUS_LogFacility=268436496

set build_dir=%CD%
start windbg.exe -WX -y %~dp0PDB\ -c "$$>a<%current_dir%\debuggee-script.txt %build_dir%" CoreRun.exe /d .\App.exe