@echo off

setlocal 
set root_folder=%~dp0..\..
set result_folder=%~dp0..\LastBuild

echo ===
echo Copy runtime
RD /S /Q %result_folder%
mkdir %result_folder%
xcopy /Y /S %root_folder%\dotnet\coreclr\bin\Product\Windows_NT.x64.Debug\*.* %result_folder%
del %result_folder%\*.ni.dll

echo ===
echo Index pdbs
set TERM=msys

cd %root_folder%\dotnet\coreclr\
FOR /f "tokens=*" %%G IN ('git log -1 --format^=%%H') DO (set git_commit="%%G")
cd %~dp0
echo %git_commit%                                              

powershell github-sourceindexer.ps1 -symbolsFolder '%result_folder%\PDB\' -gitHubUrl 'https://raw.githubusercontent.com/dotnet/coreclr' -commit %git_commit% -sourcesRoot '%~dp0..\..\dotnet\coreclr\' -dbgToolsPath 'C:\debuggers' -ignoreUnknown True