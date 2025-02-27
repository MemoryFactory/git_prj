#!/bin/bash
github="origin"
gitee="gitee"
branch=$(git rev-parse --abbrev-ref HEAD) 

if [ x$1 != x ]; then
	para1=$1
else
	para1=""
fi

echo ": Start pulling..."
if [ "$para1" == "all" ]; then
	echo "> git pull $github $branch"
	while ! git pull $github $branch; do
		echo ": Pull $github failed, retrying in 5 seconds..."
		sleep 5
	done
	echo ": Pull $github successful"
	echo "> git pull $gitee $branch"
	while ! git pull $gitee $branch; do
		echo ": Pull $gitee failed, retrying in 5 seconds..."
		sleep 5
	done
	echo ": Pull $gitee successful"
elif [ "$para1" == "$github" ]; then
	echo "> git pull $github $branch"
	while ! git pull $github $branch; do
		echo ": Pull $github failed, retrying in 5 seconds..."
		sleep 5
	done
	echo ": Pull $github successful"
elif [ "$para1" == "$gitee" ]; then
	echo "> git pull $gitee $branch"
	while ! git pull $gitee $branch; do
		echo ": Pull $gitee failed, retrying in 5 seconds..."
		sleep 5
	done
	echo ": Pull $gitee successful"
elif [ "$para1" == "-h" ]; then
	echo "Usage: try-pull.sh [REMOTE]"
	echo ""
	echo "Without REMOTE, try pulling origin only"
	echo " REMOTE:"
	echo "  all: pull github first, and then gitee"
	echo "  github: pull github only"
	echo "  gitee: pull gitee only"
	echo "  -h: help message"
else
	echo "> git pull"
	while ! git pull; do
		echo ": Pull failed, retrying in 5 seconds..."
		sleep 5
	done
fi
echo ": Mission accomplish"
