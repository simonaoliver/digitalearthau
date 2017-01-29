#!/usr/bin/env bash
# Convenience script for running Travis-like checks.

set -eu
set -x

py_files=$(find scripts -name '*.py')

pylint -j 2 --reports no datacubenci ${py_files}
# 'continuation line' has too many spurious errors.
pep8 --ignore=E122 --max-line-length 120 datacubenci ${py_files}

# Users can specify extra folders as arguments.
py.test -r sx --durations=5 datacubenci ${py_files} $@
