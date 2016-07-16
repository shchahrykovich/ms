@echo off
setlocal

FOR /F "tokens=*" %%a in ('tlist -p windbg') do SET pid=%%a
start windbg.exe -WX -y %~dp0\runtime\PDB\ -p %pid%