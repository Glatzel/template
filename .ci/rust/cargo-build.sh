#!/usr/bin/env sh

set -eu

CARGO_BUILD_OPTIONS="${CARGO_BUILD_OPTIONS:-}"

cargo build $CARGO_BUILD_OPTIONS 
