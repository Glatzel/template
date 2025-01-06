Set-Location $PSScriptRoot
Set-Location ..

cargo fmt
cargo clippy --fix --all-targets