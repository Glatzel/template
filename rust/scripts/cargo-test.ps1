Set-Location $PSScriptRoot
Set-Location ..

cargo +nightly llvm-cov --no-report --all-features --workspace nextest
cargo +nightly llvm-cov --no-report --all-features --workspace --doc

if ( $env:CI ) {
    cargo +nightly llvm-cov report
    cargo +nightly llvm-cov report --lcov --output-path lcov.info
}
else {
    cargo +nightly llvm-cov report
}
