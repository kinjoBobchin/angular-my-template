#!/bin/bash

# enviroment variables
NOW=$(date +'%Y_%m%d_%H%M')
BRANCH_NAME=${CIRCLE_BRANCH}
CIRCLE_TAG=${CIRCLE_TAG}

tag_name="${BRANCH_NAME}_${NOW}"
echo $tag_name
echo $CIRCLE_TAG
git tag $tag_name && git push origin --tags
