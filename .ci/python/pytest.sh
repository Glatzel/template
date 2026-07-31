set -eu

if [ -z "${PIXI_ENVIRONMENT:-}" ]; then
    PIXI_ENVIRONMENT="default"
fi

DEFAULT_PYTEST_ARGS="
./tests
--color=yes
--cov
--cov-report term
--cov-report=xml:tests_report/coverage.xml
--cov-report=html:tests_report/htmlcov
--durations=10
--junitxml=junit.xml
--maxfail 0
--verbose
"

if [ -z "${PYTEST_ARGS:-}" ]; then
    PYTEST_ARGS="$DEFAULT_PYTEST_ARGS"
fi

# shellcheck disable=SC2086
pixi run -e "$PIXI_ENVIRONMENT" pytest $PYTEST_ARGS
