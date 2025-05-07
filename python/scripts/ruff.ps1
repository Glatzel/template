Set-Location $PSScriptRoot
Set-Location ..
ruff format
ruff check --fix --show-fixes --exit-non-zero-on-fix
