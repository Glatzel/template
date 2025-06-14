# This File is automatically syncronized from https://github.com/Glatzel/template

param($filter)
if (Test-Path $PSScriptRoot/setup.ps1) {
    &$PSScriptRoot/setup.ps1
}
$ROOT = git rev-parse --show-toplevel
Set-Location $PSScriptRoot/..
cargo bench --all -- $filter
Set-Location $PSScriptRoot
Set-Location $ROOT
