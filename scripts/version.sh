#!/bin/bash

# コミットコメントからversionを変更するシェル

CURRENT_PKG_VERSION=`node -pe 'require("./package.json").version'`
echo 変更前のバージョン$CURRENT_PKG_VERSION


# version変更ルール

##############################################
# + 1.0.0 ( npm version major --git-tag-version=false )
##############################################
# 下記以外の主要な変更をコマンドを用いて行う

##############################################
# + 0.1.0 ( npm version minor --git-tag-version=false )
##############################################
# feat: A new feature
# refactor: A code change that neither fixes a bug nor adds a feature
# perf: A code change that improves performance
# new: create a file
# delete: delete the file

##############################################
# + 0.0.1 ( npm version patch --git-tag-version=false )
##############################################
# fix: A bug fix
# chore: Changes to the build process or auxiliary tools and libraries such as documentation generation
# test: Adding missing or correcting existing tests
# docs: Documentation only changes
# style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
# package: update a package

##############################################
# + 0.0.0 ( npm version patch --allow-same-version=true )
##############################################
# プレフィクスなし

commit_log=$(git log master..HEAD --oneline | awk '{print $2}') # masterから最新のコミットまでのコミットログを取得し、コメントのみ抽出
# echo $commit_log
case $commit_log in
  *feat* | *refactor* | *perf* | *new* | *delete* |*fix* ) npm version minor --git-tag-version=false ;;
  *fix* | *chore* | *test* | *docs* | *style* | ^package* ) npm version patch --git-tag-version=false ;;
  * ) npm version patch --allow-same-version=true ;;
esac

CURRENT_PKG_VERSION=`node -pe 'require("./package.json").version'`
echo 変更後のバージョン$CURRENT_PKG_VERSION
