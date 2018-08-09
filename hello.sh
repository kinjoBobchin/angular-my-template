#!/bin/bash

NOW=$(date +'%Y_%m%d_%H%M')

git tag master_$NOW && git push origin --tags
echo "hello from hello.sh"
