#!/bin/bash

NOW=`date +'%Y%m%d%H%M'`

git tag dev_v_$NOW && git push origin --tags
echo "hello from deploy-dev.sh"
