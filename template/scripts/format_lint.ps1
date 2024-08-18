Set-Location -Path "$PSScriptRoot"
Set-Location -Path ".."
$Env:PYTHONPATH = "$PYTHONPATH;$PSScriptRoot/../src" 
pixi -q run ruff format
pixi -q run ruff check