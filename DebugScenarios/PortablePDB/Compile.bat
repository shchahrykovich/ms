@echo off

setlocal 
set root_folder=%~dp0..\..

echo ===
echo Copy runtime
RD /S /Q %~dp0runtime
mkdir %~dp0runtime
xcopy /Y /S %root_folder%\dotnet\coreclr\bin\Product\Windows_NT.x64.Debug\*.* %~dp0runtime
del %~dp0runtime\*.ni.dll

echo ===
echo Compile app
"C:\Program Files\dotnet\sdk\1.0.0-preview4-004233\RunCsc.cmd" /nostdlib /noconfig ^
/r:%~dp0runtime\ref\mscorlib.dll ^
/debug:portable /embed /out:%~dp0runtime\App.exe %~dp0App.cs