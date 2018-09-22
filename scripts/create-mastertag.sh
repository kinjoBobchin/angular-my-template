#!/bin/bash

NOW=$(date +'%Y_%m%d_%H%M')
BRANC_NAME=$(CIRCLE_BRANCH)
git tag master_$NOW_$BRANC_NAME && git push origin --tags
