#!/bin/bash

# Default version(s)
VERSION="18"
MASTER_VERSION=""

# Read the master version from clang_tools_static_binaries_version.txt
if [ -f clang_tools_static_binaries_version.txt ]; then
    MASTER_VERSION=$(cat clang_tools_static_binaries_version.txt | tr -d '\r')
    if [ -z "$MASTER_VERSION" ]; then
        echo "Error: clang_tools_static_binaries_version.txt is empty."
        exit 1
    fi
else
    echo "Error: clang_tools_static_binaries_version.txt not found."
    exit 1
fi

# Check if a version is provided as a command-line argument
if [ $# -eq 1 ]; then
    VERSION=$1
fi

# Read versions from clang_versions.txt
declare -A VERSIONS
while IFS='=' read -r key value; do
    VERSIONS[$key]=$(echo $value | tr -d '\r' | sed 's/^=//')
done < clang_versions.txt


# Use the detailed version if available
if [[ -n "${VERSIONS[$VERSION]}" ]]; then
    VERSION=${VERSIONS[$VERSION]}
fi

# Construct the download URL
# Based on names like: clang-format-19_linux-amd64 from upstream
# Note: The version is hardcoded in the URL 'master-46b8640' will change, thus we make it a variable
URL="https://github.com/muttleyxd/clang-tools-static-binaries/releases/download/${MASTER_VERSION}/clang-format-${VERSION}_linux-amd64"

echo $URL

# Download the file
curl -L -o ./clang-format/clang-format-${VERSION} $URL

# Make the downloaded file executable
chmod +x ./clang-format/clang-format-${VERSION}

echo "Downloaded and made executable: clang-format-${VERSION}"