#!/bin/bash

CURRENT_PKG_VERSION=`node -pe 'require("./package.json").version'`
echo $CURRENT_PKG_VERSION

git log master...HEAD --oneline
