#!/bin/bash

NOW=$(date +'%Y%m%d%H%M')

git tag master_$NOW && git push origin --tags
echo "hello from hello.sh"
