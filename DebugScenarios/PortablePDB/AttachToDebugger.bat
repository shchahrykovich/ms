@echo off
setlocal

set current_dir=%~dp0

cd %~dp0runtime

set build_dir=%CD%

FOR /F "tokens=*" %%a in ('tlist -p windbg') do SET pid=%%a
start windbg.exe -WX -y %~dp0\runtime\PDB\ -c "$$>a<%current_dir%\debugger-script.txt %build_dir%" -p %pid%