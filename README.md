# clang-format lint action

This action check if the source code matches the .clang-format file.

## Inputs

### `source`

**Required** Where the soruce files are located.

### `exclude`

What folder should be exlcuded from format checking.

### `extensions`

What extensions should be used from format checking.

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
        exclude: './src'
        extensions: 'cpp'
```
