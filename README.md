# clang-format lint action

This action checks if the source code matches the .clang-format file.

## Inputs

### `source`

Where the soruce files are located.
Default: '.' (current folder)
Example: './src'

### `exclude`

What folder should be exlcuded from format checking.
Default: 'none'
Example: './third_party'

### `extensions`

What extensions should be used from format checking.
Default: 'c,h,C,H,cpp,hpp,cc,hh,c++,h++,cxx,hxx'
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
    - uses: ./.github/actions/test-clang-format
      with:
        source: '.'
        exclude: './third_party'
        extensions: 'h,cpp'
```
