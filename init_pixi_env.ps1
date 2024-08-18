Set-Location -Path "$PSScriptRoot"
Set-Location -Path ".."
pixi clean
pixi update
pixi install --all
[void][System.Console]::ReadKey($true)