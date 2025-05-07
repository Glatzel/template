param([string[]]$files)
Set-Location $PSScriptRoot/..
foreach ($f in $files) {
    pwsh -f $f
}
