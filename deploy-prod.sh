#!/bin/bash

NOW=`date +'%Y%m%d%H%M'`

git tag prod_v_$NOW && git push origin --tags
echo "hello from deploy-prod.sh"
