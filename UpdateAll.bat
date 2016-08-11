@echo off

setlocal                                                                                    
set projects=(dotnet/coreclr dotnet/corefx dotnet/corefxlab dotnet/corert dotnet/cli microsoft/msbuild dotnet/dotnet-ci dotnet/buildtools dotnet/roslyn dotnet/llilc aspnet/dnx aspnet/KestrelHttpServer microsoft/microsoft-pdb microsoft/ChakraCore microsoft/clr-samples AdaptiveConsulting/Aeron.NET dotnet/symreader-portable dotnet/symstore dotnet/symreader dotnet/core-setup)

set gitex="C:\Program Files (x86)\Git\bin\git.exe"
if not exist %gitex% (
	set gitex="C:\Program Files\Git\bin\git.exe"
)


for %%p in %projects% do (
  if exist %%p (	
    echo Updating %%p
    cd %%p
    %gitex% pull 
    cd ..\..
  ) else (
    echo Creating %%p
    %gitex% clone https://github.com/%%p %%p
  )
  echo ===
)

set p=dotnet/coreclr-release/
if not exist %p% (	
  echo Creating %p%
  if exist dotnet/coreclr (
  	%gitex% clone dotnet/coreclr %p%
  )
)

cd %p%
%gitex% checkout abbb8f685929c7aeaa087dae46fedc1bc2af4b17