@echo off
setlocal

echo Building CoreCLR
cd dotnet\coreclr
call build.cmd x64 debug clean skiptestbuild