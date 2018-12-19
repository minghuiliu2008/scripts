#!/bin/bash
GREEN='\033[0;32m';
NC='\033[0m';

nameFromConfig=`git config --global user.name`;
echo Enter your git name [$nameFromConfig]:
read name
if [ -z "$name" ]
then
    name=${nameFromConfig}
fi
echo -e "Getting remote branshes of ${GREEN}${name}${NC} ..."
for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ai %ar by %an" $branch | head -n 1` \\t$branch; done | sort -r | grep "${name}" > branches.txt
echo -e "List of branches of ${GREEN}${name}${NC} now available at ${GREEN}branches.txt${NC} file."
cat branches.txt
