#!/bin/bash

# create git tag ex. 「 pr_name←←←issues/#100-hogehoge_2018_0928 」 and 「 #100_no_deploy 」
NOW=$(date +'%Y_%m%d');                                                    # echo $NOW => "2018_0830"
pr_repo_name=$( git log --oneline --merges | awk '{print $7}' | head -1 ); # echo $pr_repo_name => CyberAgent/issues/#100-hogehoge
pr_name=${pr_repo_name#*/};                                                # echo $pr_name => issues/#100-hogehoge
issue_no=$( echo $pr_name | (sed 's/.*\(#[0-9]\{1,100\}\).*/\1/') );       # echo $issue_no => #100
tag_name="master←←←${pr_name}_${NOW}";                                     # echo $tag_name => master←←←issues/#100-hogehoge_2018_0928
dev_no_deploy_tag="${issue_no}_dev_no_deploy";                             # echo $no_deploy_tag => #100_dev_no_deploy
prod_no_deploy_tag="${issue_no}_prod_no_deploy";                           # echo $no_deploy_tag => #100_prod_no_deploy

git tag $tag_name && git tag $dev_no_deploy_tag && git tag $prod_no_deploy_tag && git push origin --tags;

