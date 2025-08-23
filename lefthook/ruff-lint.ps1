# This File is automatically synchronized from https://github.com/Glatzel/template

if (-not $args) { exit 0 }
&$PSScriptRoot/setup.ps1
ruff check --fix --show-fixes --exit-non-zero-on-fix --force-exclude $args 
