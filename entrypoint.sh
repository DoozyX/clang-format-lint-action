#!/bin/sh -l

cd "$GITHUB_WORKSPACE"

ln -s /clang-format/clang-format${INPUT_CLANGFORMATVERSION} /usr/bin/clang-format
/run-clang-format.py -r --exclude ${INPUT_EXCLUDE} --extensions ${INPUT_EXTENSIONS} ${INPUT_SOURCE}
