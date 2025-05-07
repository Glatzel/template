param($name)
Set-Location $PSScriptRoot/..
foreach ($f in Get-ChildItem "**/scripts/$name.ps1" -Recurse) {
    pixi run --manifest-path ./pre-commit/pixi.toml pwsh -f $f
}
