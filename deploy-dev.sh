#!/bin/bash

NOW=$(date +'%Y_%m%d_%H%M')

git tag dev_$NOW && git push origin --tags
echo "hello from " HEROKU_APP_NAME_DEV
