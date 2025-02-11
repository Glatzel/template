Set-Location $PSScriptRoot
Set-Location ..

if ($env:CI) {
    cargo clippy --all-targets --all-features
}
else {
    & $PSScriptRoot/set-env.ps1
    cargo clippy --fix --all-targets --all-features 
}
