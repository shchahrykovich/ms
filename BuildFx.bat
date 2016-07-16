@echo off
setlocal

echo Building CoreFx
cd dotnet\corefx

call build.cmd /t:Rebuild
