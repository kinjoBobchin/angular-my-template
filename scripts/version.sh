#!/bin/bash

# コミットコメントからversionを変更するシェル

# ルール
# + 1.0.0 (npm version major)

# + 0.1.0
# feat: A new feature
# fix: A bug fix
# refactor: A code change that neither fixes a bug nor adds a feature
# perf: A code change that improves performance
# test: Adding missing or correcting existing tests
# chore: Changes to the build process or auxiliary tools and libraries such as documentation generation
# new: create a file

# + 0.0.1
# docs: Documentation only changes
# style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
# package: update a package
# delete: delete the file



CURRENT_PKG_VERSION=`node -pe 'require("./package.json").version'`
echo $CURRENT_PKG_VERSION

git log master...HEAD --oneline
