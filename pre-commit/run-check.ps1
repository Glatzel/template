param([string[]]$files)
Set-Location $PSScriptRoot/..
$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
foreach ($f in $files) {
    pwsh -f $f
}
