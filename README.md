# clang-format lint action

This action checks if the source code matches the .clang-format file.

## Inputs

### `source`

Where the source files are located.\
Default: '.' (current folder)\
Example: './src'

### `exclude`

What folder should be excluded from format checking.\
Default: 'none'\
Example: './third_party'

### `extensions`

What filename extensions should be used for format checking.\
Default: 'c,h,C,H,cpp,hpp,cc,hh,c++,h++,cxx,hxx'\
Example: 'cpp,h'

## Example usage

```yml
name: test-clang-format

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1
    - uses: DoozyX/clang-format-lint-action@v0.3.1
      with:
        source: '.'
        exclude: './third_party'
        extensions: 'h,cpp'
```
