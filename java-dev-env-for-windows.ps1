If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")){   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}


$chocolateyBin = [Environment]::GetEnvironmentVariable("ChocolateyInstall", "Machine") + "\bin"
$cinst = "$chocolateyBin\cinst.exe"
$choco = "$chocolateyBin\choco.exe"
$Packages =  'git', 'cmder', 'nodejs', 'yarn',  'intellijidea-ultimate','sublimetext3', 'notepadplusplus',  'jdk8', 'jdk11', 'maven', 'robo3t', 'python', 'docker-desktop', 'slack'
if (-not (Test-Path $cinst) -or -not (Test-Path $choco)) {
    Write-Output "Chocolatey was not found at $chocolateyBin. Installing Chocolatey"
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
ForEach ($ChocolateyPackageId in $Packages){
    choco install $ChocolateyPackageId -y
}
