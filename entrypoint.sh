#!/bin/sh -l

cd "$GITHUB_WORKSPACE"

REPO_FULLNAME=$(jq -r ".repository.full_name" "$GITHUB_EVENT_PATH")

echo "## Initializing git repo..."
git init
echo "### Adding git remote..."
git remote add origin https://x-access-token:$GITHUB_TOKEN@github.com/$REPO_FULLNAME.git
echo "### Getting branch"
BRANCH=${GITHUB_REF#*refs/heads/}
echo "### git fetch $BRANCH ..."
git fetch origin $BRANCH
echo "### Branch: $BRANCH (ref: $GITHUB_REF )"
git checkout $BRANCH
echo "## Configuring git author..."
git config --global user.email "robot@mymaskmovement.org"
git config --global user.name "Clang Robot"
# Ignore workflow files (we may not touch them)
git update-index --assume-unchanged .github/workflows/*

/run-clang-format.py "$@"

git commit -a -m "apply clang-format" || true
git push -u origin $BRANCH
