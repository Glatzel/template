param (
    [ValidateSet("dist", "release", "debug")]
    [string]$config = "debug",
    [switch]$clean
)

$current_dir=Resolve-Path $PWD
Set-Location $PSScriptRoot
Set-Location ..
$ErrorActionPreference = 'Stop'

Remove-Item ./bin -Recurse -Force -ErrorAction SilentlyContinue
New-Item ./bin -ItemType Directory

if ($clean) { cargo clean }
Write-Host "Build in $config mode."
if ($config -ne "debug") {
    cargo build --profile $config
}
else {
    cargo build
}

Copy-Item "target/$config/*.exe" ./bin

Set-Location $current_dir