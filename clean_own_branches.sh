#!/bin/bash

# read branches file
branches=$(<branches.txt)

# pick only branch name
awk -F"\torigin/" '{print $NF}' branches.txt branches_trancated.txt

# Make it a space seperated single line 
awk '$1=$1' ORS=' ' branches_trancated.txt > branches_space.txt

# cleanup
rm -f branches.txt branches_trancated.txt

branches=$(<branches_space.txt)

echo ${branches_space}

#delete remote branches as well as prune from local 
for branch in $branches
do
    git push origin --delete $branch
done
git remote prune origin

rm branches_space.txt;
