# clang-format lint action

This action checks if the source code matches the .clang-format file.

## Inputs

### `source`

Where the source files are located.\
Default: '.' (current folder)\
Example: './src' or 'src test examples' for multiple.

### `exclude`

What folder should be excluded from format checking.\
Default: 'none'\
Example: './third_party' or 'third_party exclude' for multiple.

Multiple exclude rules can also be put in a `.clang-format-ignore` file, which also supports comments.\
Example:
```
# ignore third_party code from clang-format checks
src/third_party/*
src/ignored/*
```

### `extensions`

What filename extensions should be used for format checking.\
Default: 'c,h,C,H,cpp,hpp,cc,hh,c++,h++,cxx,hxx'\
Example: 'cpp,h'

### `clangFormatVersion`

What clang-format version should be used.\
Available version are from 5 to 11.\
Default: 9\
Example: 11

### `style`

Style to use.\
Results in the appropriate --style parameter.\
Default: file\
Example: chromium

## Example usage

```yml
name: test-clang-format

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - uses: wmmc88/clang-format-lint-action@master
      with:
        source: '.'
        exclude: './third_party ./external'
        extensions: 'h,cpp'
        clangFormatVersion: 11
        style: chromium
```

## Run locally

Install Docker and then run:

```bash
docker build -t clang-format-lint github.com/DoozyX/clang-format-lint-action
```

When the image is built, run the linting:

```bash
docker run -it --rm --workdir /src -v $(pwd):/src clang-format-lint \
    --clang-format-executable /clang-format/clang-format9 -r --exclude .git *.h *.c *.hpp *.cpp
```
