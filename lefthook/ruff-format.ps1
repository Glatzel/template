# This File is automatically synchronized from https://github.com/Glatzel/template

if (-not $args) { exit 0 }
&$PSScriptRoot/setup.ps1
ruff format --force-exclude --exit-non-zero-on-format $args
