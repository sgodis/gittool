#!/bin/bash
source conf.sh
if [ -n "$1" ]
then
	branch=$1
else
	echo "输入要切换的分支名称："
	read branch
fi
for floder in ${FLODERS[@]}
do
	if [ -d $ROOT/$floder ]
	then
		cd $ROOT/$floder
		git checkout $branch
	else
		echo "$ROOT/$floder is not a directory"
	fi
done
