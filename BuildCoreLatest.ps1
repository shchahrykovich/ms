#!/usr/bin/powershell

Write-Output "Building CoreCLR"
cd "$PSScriptRoot\dotnet\coreclr"

if ( $IsLinux ) {  
    ."$PSScriptRoot\dotnet\coreclr\build.sh" x64 debug skiptests
} else {
    call build.cmd x64 debug skiptests
}