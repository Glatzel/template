#!/usr/bin/env sh

set -eu

CARGO_MIRI_OPTIONS="${CARGO_MIRI_OPTIONS:-}"
CARGO_MIRI_ARGS="${CARGO_MIRI_ARGS:--D warnings}"

cargo +nightly miri test $CARGO_MIRI_OPTIONS -- $CARGO_MIRI_ARGS
