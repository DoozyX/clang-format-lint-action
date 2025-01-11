#!/bin/bash

# Default version
VERSION="18"

# Check if a version is provided as a command-line argument
if [ $# -eq 1 ]; then
    VERSION=$1
fi

# Read versions from versions.txt
declare -A VERSIONS
while IFS='=' read -r key value; do
    VERSIONS[$key]=$(echo $value | tr -d '\r' | sed 's/^=//')
done < versions.txt

# Use the detailed version if available
if [[ -n "${VERSIONS[$VERSION]}" ]]; then
    VERSION=${VERSIONS[$VERSION]}
fi

# Construct the download URL
URL="https://github.com/muttleyxd/clang-tools-static-binaries/releases/download/master-6fce707f/clang-format-${VERSION}_linux-amd64"

# Download the file
curl -L -o ./clang-format/clang-format-${VERSION} $URL

# Make the downloaded file executable
chmod +x ./clang-format/clang-format-${VERSION}

echo "Downloaded and made executable: clang-format-${VERSION}"