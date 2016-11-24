#!/bin/bash
source conf.sh
function merge() {
	# 进入工作目录
	cd $1
	# 更新待合并分支为最新
	git pull origin $2
	# 切换为主分支
	git checkout $3
	# 更新主分支为最新
	git pull origin $3
	# 合并分支到主分支
	git merge $2
	# push到远程分支
	git push origin $2
}
if [ -n "$1" -a -n "$2" ]
then
	dev=$1
	master=$2
# elif [ -n "$1" -a ! -n "$2" ]
# then
#     echo "参数个数错误"
else
	echo "输入被合并的分支名称："
	read dev
	echo "输入主分支名称："
	read master
fi
for floder in ${FLODERS[@]}
do
	if [ -d $ROOT/$floder ]
	then
		merge $ROOT/$floder $dev $master
	else
		echo "$1 is not a directory"
	fi
done
