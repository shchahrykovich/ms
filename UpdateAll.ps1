#!/usr/bin/powershell

$projects = @("dotnet/coreclr", "dotnet/corefx", "dotnet/corefxlab", "dotnet/corert", 
              "dotnet/cli", "microsoft/msbuild", "dotnet/dotnet-ci", "dotnet/buildtools", 
              "dotnet/roslyn", "dotnet/llilc", "aspnet/dnx", "aspnet/KestrelHttpServer", 
              "microsoft/microsoft-pdb", "microsoft/ChakraCore", "microsoft/clr-samples", 
              "AdaptiveConsulting/Aeron.NET", "dotnet/symreader-portable", "dotnet/symstore", 
              "dotnet/symreader", "dotnet/core-setup", "PowerShell/PowerShell");

if ( $IsLinux ) {
    $gitex="git"
} else {
    $gitex="C:\Program Files (x86)\Git\bin\git.exe"
    if ( -not (Test-Path $gitex) ) {
	    $gitex="C:\Program Files\Git\bin\git.exe"
    }
}

# Clone repos
foreach($p in $projects)
{
    if ( Test-Path "$PSScriptRoot\$p" ) {
        Write-Output "Updating $p"
        cd "$PSScriptRoot/$p"
        .$gitex pull 
        cd $PSScriptRoot
    } else {
        Write-Output "Creating $p"
        .$gitex clone https://github.com/$p "$PSScriptRoot/$p"
    }
    Write-Output "==="
}


# Checkout releases
if ( -not $IsLinux ) {
    $releases = curl https://api.github.com/repos/dotnet/coreclr/tags | % { $_.Content } | ConvertFrom-Json
    $releases = $releases | ?{ $_.name.StartsWith("v") }
    foreach($r in $releases)
    {
        Write-Output "Updating $($r.name)"
        $path = "$PSScriptRoot/dotnet/coreclr-$($r.name)"
        if( -not(Test-Path $path) ) {
            .$gitex clone "$PSScriptRoot/dotnet/coreclr" $path
            cd $path
            .$gitex checkout $r.commit.sha
        }
        Write-Output "==="
    }
}
