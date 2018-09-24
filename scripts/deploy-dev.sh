#!/bin/bash

# enviroment variables
NOW=$(date +'%Y_%m%d_%H%M')
BRANCH_NAME=${CIRCLE_BRANCH}

tag_name="${BRANCH_NAME}_${NOW}"
git tag $tag_name && git push origin --tags
