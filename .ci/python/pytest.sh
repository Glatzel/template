#!/usr/bin/env sh

set -eu

PIXI_ENVIRONMENT=${PIXI_ENVIRONMENT:-default}


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

PYTEST_ARGS=${PYTEST_ARGS:-"$DEFAULT_PYTEST_ARGS"}

# shellcheck disable=SC2086
pixi run -e "$PIXI_ENVIRONMENT" pytest $PYTEST_ARGS
