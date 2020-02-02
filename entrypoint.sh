#!/bin/sh -l

cd "$GITHUB_WORKSPACE"

ln -s /clang-format/clang-format${INPUT_CLANGFORMATVERSION} /usr/bin/clang-format

echo /run-clang-format.py -r --cli-args=\"${INPUT_CLIARGS}\" --exclude ${INPUT_EXCLUDE} --extensions ${INPUT_EXTENSIONS} ${INPUT_SOURCE}
/run-clang-format.py -r --cli-args=\"${INPUT_CLIARGS}\" --exclude ${INPUT_EXCLUDE} --extensions ${INPUT_EXTENSIONS} ${INPUT_SOURCE}
