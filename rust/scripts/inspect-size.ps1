$current_dir=Resolve-Path $PWD
Set-Location $PSScriptRoot
Set-Location ..
$ErrorActionPreference = 'Stop'

try {
    cargo bloat --profile dist --crates
}
catch {
    cargo install cargo-bloat
    cargo bloat --profile dist --crates
}

Set-Location $current_dir