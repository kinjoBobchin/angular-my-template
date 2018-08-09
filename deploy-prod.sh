#!/bin/bash

NOW=$(date +'%Y_%m%d_%H%M')

git tag prod_$NOW && git push origin --tags
echo "hello from deploy-prod.sh"
