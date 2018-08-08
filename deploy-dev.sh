#!/bin/bash

NOW=`date +'%Y%m%d%H%M'`

git tag dev_$NOW && git push origin --tags
echo "hello from " HEROKU_APP_NAME_DEV
