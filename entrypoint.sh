#!/bin/sh -l

cd "$GITHUB_WORKSPACE"
/run-clang-format.py -r --exclude ${INPUT_EXCLUDE} --extensions ${INPUT_EXTENSIONS} ${INPUT_SOURCE}
