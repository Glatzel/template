Set-Location $PSScriptRoot
Set-Location ..

cargo update
try {
    cargo upgrade -i
}
catch {
    cargo install cargo-edit
    cargo upgrade -i
}
