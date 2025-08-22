# This File is automatically synchronized from https://github.com/Glatzel/template

param($files)
if ($env:CI) {
    rustup toolchain install nightly --profile=minimal
    rustup component add rustfmt --toolchain nightly
}

$ROOT = git rev-parse --show-toplevel
Set-Location $ROOT
foreach ($file in $files) {
    $file=Resolve-Path $file
    Set-Location $file.Directory.ToString()
    Write-Output "Cargo fmt in: $pwd"
    cargo +nightly fmt --all
}
Set-Location $ROOT
