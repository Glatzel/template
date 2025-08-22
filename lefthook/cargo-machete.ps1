# This File is automatically synchronized from https://github.com/Glatzel/template

param($files)
if(!files){exit 0}
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
$ROOT = git rev-parse --show-toplevel
Set-Location $ROOT
foreach ($file in $files) {
    $file=Resolve-Path $file
    Set-Location $file.Directory.ToString()
    Write-Output "Cargo machete in: $pwd"
    cargo machete
}
Set-Location $ROOT
