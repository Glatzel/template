param ([switch]$update)

$ErrorActionPreference = "Stop"
$PSNativeCommandUseErrorActionPreference = $true
Set-Location $PSScriptRoot/..
New-Item ./pre-commit -ItemType Directory -ErrorAction SilentlyContinue
if ($update) {
    Remove-Item ./pre-commit -Recurse -Force -ErrorAction SilentlyContinue
    New-Item ./pre-commit -ItemType Directory -ErrorAction SilentlyContinue
    aria2c -c -x16 -s16 -Z -d ./pre-commit `
        "https://raw.githubusercontent.com/Glatzel/template/main//pre-commit/pixi.lock" `
        "https://raw.githubusercontent.com/Glatzel/template/main//pre-commit/pixi.toml" `
        "https://raw.githubusercontent.com/Glatzel/template/main//pre-commit/pre-commit.ps1" `
        "https://raw.githubusercontent.com/Glatzel/template/main//pre-commit/ruff.toml" `
        "https://raw.githubusercontent.com/Glatzel/template/main//pre-commit/rustfmt.toml"
    aria2c -c -x16 -s16 -d ./ https://raw.githubusercontent.com/Glatzel/template/main//.pre-commit-config.yaml
    exit 0
}
pixi install --manifest-path ./pre-commit/pixi.toml
pixi run --manifest-path ./pre-commit/pixi.toml pre-commit-run --color=always --show-diff-on-failure -v
