#!/bin/bash

# enviroment variables
NOW=$(date +'%Y_%m%d_%H%M')
BRANCH_NAME=${CIRCLE_BRANCH}

git tag $BRANCH_NAME_$NOW && git push origin --tags
