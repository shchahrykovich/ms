@echo off

setlocal                                                                                    

cd dotnet/coreclr-release/
call build.cmd x64 debug clean skiptestbuild
call build.cmd x64 release clean skiptestbuild