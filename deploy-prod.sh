#!/bin/bash

git tag prod_v_201808071200 && git push origin --tags
echo "hello from deploy-prod.sh"
