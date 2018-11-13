#!/bin/bash

# コミットコメントからversionを変更するシェル

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
# + 0.0.0 ( npm version patch)
##############################################
# プレフィクスなし

CURRENT_PKG_VERSION=`node -pe 'require("./package.json").version'`
echo 変更前のバージョン$CURRENT_PKG_VERSION

commit_log=$(git log master..HEAD --oneline | awk '{print $2}') # masterから最新のコミットまでのコミットログを取得し、コメントのみ抽出
# echo $commit_log
case $commit_log in
  *feat* | *refactor* | *perf* | *new* | *delete* ) npm version minor ;;
  *fix* | *chore* | *test* | *docs* | *style* | *package* ) npm version patch ;;
  * ) echo "今回、バージョン変更はなしです";;
esac

CURRENT_PKG_VERSION=`node -pe 'require("./package.json").version'`
echo 変更後のバージョン$CURRENT_PKG_VERSION

# タグが10個以上生成されたら、古いタグを削除
PKG_VERSIONS=$(git tag -l [0-9]*.[0-9]*.[0-9]*) # 1.0.0, 1.12.2, 12.0.12 ・・・
PKG_VERSIONS_ARRAY=($PKG_VERSIONS)              # 個数を計算するために、配列に入れる
PKG_VERSIONS_COUNT=${#PKG_VERSIONS_ARRAY[@]}    # 配列の個数をカウント

if [ $PKG_VERSIONS_COUNT -gt 10 ]; then
  OLDEST_PKG_VERSIONS_TAG=$(git tag -l [0-9]*.[0-9]*.[0-9]* | sort -n | head -n 1) # 一番古いタグを取り出す
  git tag -d "${OLDEST_PKG_VERSIONS_TAG}";                                              # 一番古いタグをローカルで削除
  git push --delete origin "${OLDEST_PKG_VERSIONS_TAG}";                                # 一番古いタグをリモートでも削除
  echo "一番古い${OLDEST_PKG_VERSIONS_TAG}を削除しました"
fi
