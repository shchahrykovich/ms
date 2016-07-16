@echo off
setlocal

set current_dir=%~dp0

cd %~dp0runtime

set build_dir=%CD%
start windbg.exe -WX -y %~dp0PDB\ -c "$$>a<%current_dir%\load-script.txt %build_dir%" CoreRun.exe /d .\App.exe