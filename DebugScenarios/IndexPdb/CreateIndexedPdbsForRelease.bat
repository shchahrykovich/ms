@echo off

setlocal 
set root_folder=%~dp0..\..
set result_folder=%~dp0..\LastBuild

echo ===
echo Index pdbs
set TERM=msys

cd %root_folder%\dotnet\coreclr\
FOR /f "tokens=*" %%G IN ('git log -1 --format^=%%H') DO (set git_commit="%%G")
cd %~dp0

powershell %~dp0github-sourceindexer.ps1 -symbolsFolder '%result_folder%' -workingDir 'd:\a\_work\30\s\' -gitHubUrl 'https://raw.githubusercontent.com/dotnet/coreclr' -commit %git_commit% -sourcesRoot '%~dp0..\..\dotnet\coreclr\' -dbgToolsPath 'C:\debuggers' -ignoreUnknown True -Verbose