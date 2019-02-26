$Packages =  'git','cmder','intellijidea-ultimate','sublimetext3','notepadplusplus','python'
if (-not (Test-Path $cinst) -or -not (Test-Path $choco)) {
    Write-Output "Chocolatey was not found at $chocolateyBin. Installing Chocolatey"
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
ForEach ($ChocolateyPackageId in $Packages)
{
    choco install $ChocolateyPackageId -y
}
