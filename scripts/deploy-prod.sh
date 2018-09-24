#!/bin/bash

NOW=$(date +'%Y_%m%d_%H%M')
BRANCH_NAME=${CIRCLE_BRANCH}
git tag prod_$NOW && git push origin --tags
echo $BRANCH_NAME
