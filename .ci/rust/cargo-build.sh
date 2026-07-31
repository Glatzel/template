#!/usr/bin/env sh

set -eu

CARGO_BUILD_OPTIONS="${CARGO_BUILD_OPTIONS:-}"

cargo +nightly build $CARGO_BUILD_OPTIONS 
