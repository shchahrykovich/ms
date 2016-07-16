@echo off

setlocal 
set root_folder=..\..

echo ===
echo Copy runtime
RD /S /Q runtime
mkdir runtime
xcopy /Y /S %root_folder%\dotnet\coreclr\bin\Product\Windows_NT.x64.Debug\*.* .\runtime
del .\runtime\*.ni.dll

echo ===
echo Compile app
"C:\Program Files (x86)\MSBuild\14.0\Bin\csc.exe" /nostdlib /noconfig /r:runtime\ref\mscorlib.dll /debug /out:runtime\StackOverflowException.exe StackOverflowException.cs