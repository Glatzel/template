$clippy_args = $(yq '.inputs.args.default' "$PSScriptRoot/action.yml") -split ' '
cargo +stable clippy --fix $args -- $clippy_args
