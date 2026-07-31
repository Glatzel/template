# This File is automatically synchronized from https://github.com/Glatzel/template

set -eu

CARGO_MIRI_OPTIONS="${CARGO_MIRI_OPTIONS:-}"
CARGO_MIRI_ARGS="${CARGO_MIRI_ARGS:--D warnings}"

cargo +nightly miri test $CARGO_MIRI_OPTIONS -- $CARGO_MIRI_ARGS
