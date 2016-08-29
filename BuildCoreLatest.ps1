#!/usr/bin/powershell

Write-Output "Building CoreCLR"
cd "$PSScriptRoot\dotnet\coreclr"

if ( $IsLinux ) {  
    ."$PSScriptRoot\dotnet\coreclr\build.sh" x64 debug skiptests
} else {
    ."$PSScriptRoot\dotnet\coreclr\build.cmd" x64 debug skiptests
}