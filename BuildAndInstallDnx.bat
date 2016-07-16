@echo off
setlocal

echo Building DNX
cd aspnet\dnx
call build.cmd

:: echo Installing DNX
:: build.cmd dev-install