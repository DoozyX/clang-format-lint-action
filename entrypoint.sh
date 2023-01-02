#!/bin/sh -l

cd "$GITHUB_WORKSPACE"

/run-clang-format.py "$@" 2>&1 \
    | reviewdog -efm="%f:%l: %m" -name="clang-format-cpplint"
