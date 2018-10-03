#!/bin/bash

# create gittag ex. prod←←←issues/#322,#323,#324,_2018_0928
NOW=$(date +'%Y_%m%d')

# no_deployを含むタグの#numberだけを連結
for nodeploytag in $(git tag -l '*prod_no_deploy'); do                      # nodeploytag => #300_prod_no_deploy
  tagnumber=$( echo $nodeploytag | (sed 's/.*\(#[0-9]\{1,100\}\).*/\1/') ); # tagnumber => #300
  tagnumbers+="$tagnumber";                                                 # tagnumbers => #300,・・・
  git tag -d "${nodeploytag}";                                              # #300_prod_no_deployのタグをローカルで削除
  git push --delete origin "${nodeploytag}";                                # #300_prod_no_deployのタグを削除
done;

tag_name="prod←←←issues/${tagnumbers}_${NOW}";                              # echo $tag_name => prod←←←issues/#100,#101,#102,_2018_0928

git tag $tag_name && git push origin --tags
