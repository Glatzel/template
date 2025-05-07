param($name)
Set-Location $PSScriptRoot/..
foreach ($f in Get-ChildItem "**/scripts/$name.ps1") {
    pwsh -f $f
}