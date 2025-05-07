param([string[]]$files)
Set-Location $PSScriptRoot/..
foreach ($f in $files) {
    pixi run --manifest-path ./pre-commit/pixi.toml pwsh -f $f
}
